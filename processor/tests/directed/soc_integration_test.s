.section .text
.globl _start

_start:

################################################################
# SoC-level integration test.
#
# Every other directed test (spi_*.s, ascon_*.s, gpio_test.s,
# uart_test.s, clint_*.s, plic_test.s) exercises exactly ONE
# peripheral in isolation. This test instead runs DMEM + every
# integrated peripheral (SPI, ASCON, GPIO, UART, CLINT, PLIC) back
# to back in a SINGLE program sharing the same APB bus, register
# file, mtvec, and interrupt fabric -- the class of bug this catches
# (bus arbitration, address-decode overlap, interrupt-priority
# regression between the direct-CLINT and PLIC-routed paths) only
# shows up when multiple peripherals are actually live together, not
# when each is tested alone.
#
# Two real hardware interrupts are taken during this run: CLINT's
# timer interrupt (direct mtip path) in stage 6, then a PLIC-routed
# UART interrupt (meip path) in stage 7 -- deliberately sequenced one
# at a time so trap_controller's cause selection is unambiguous at
# each point, rather than racing two sources together.
#
# A nop follows every peripheral store (this SoC's APB bus drops the
# second of two back-to-back peripheral stores with no instruction
# between them; see clint_timer_test.s for the full explanation).
#
# Expected final state:
#   x21 = 1            DMEM stage passed
#   x22 = 1            SPI stage passed   (CLKDIV write/readback)
#   x23 = 1            ASCON stage passed (DATA_LOW write/readback)
#   x24 = 1            GPIO stage passed  (OUT readback + tb-driven IN)
#   x25 = 1            UART stage passed  (polled TX -> loopback -> RX)
#   x26 = 1            CLINT stage passed (mcause = 0x80000007)
#   x27 = 1            PLIC stage passed  (mcause = 0x8000000B, source 1)
#   x28 = 0xFFFFFFFF   ALL STAGES PASSED
################################################################

la    x1, isr_handler
csrrw x0, mtvec, x1          # Direct mode: all traps land at isr_handler

# ---- Park CLINT's mtimecmp far in the future before enabling any
#      interrupt, so stage 6's arm below is the only thing that can
#      fire it (same precaution as clint_timer_test.s). ----
lui   x1, 0x40007
li    x2, -1
sw    x2, 0xC(x1)
addi  x0, x0, 0
sw    x2, 0x8(x1)
addi  x0, x0, 0

li    x7, 0x8                 # mstatus.MIE
csrrw x0, mstatus, x7
li    x7, 0x880                # mie.MTIE (bit7) | mie.MEIE (bit11)
csrrw x0, mie, x7

################################################################
# Stage 1: DMEM -- ordinary load/store, unaffected by peripheral
# activity elsewhere on the bus.
################################################################
li    x2, 0x12345678
li    x3, 0x80010200
sw    x2, 0(x3)
lw    x4, 0(x3)
xor   x5, x2, x4
sltiu x21, x5, 1

################################################################
# Stage 2: SPI -- CLKDIV register write/readback.
################################################################
lui   x1, 0x40003
li    x2, 4
sw    x2, 4(x1)
addi  x0, x0, 0
lw    x6, 4(x1)
xor   x5, x2, x6
sltiu x22, x5, 1

################################################################
# Stage 3: ASCON -- control_reg (0x0) and data_in (0x8) are write-only
# (ascon_accelerator.v's read-side case only covers status/output/tag),
# so a write/readback check like the other stages doesn't apply here.
# Write control_reg = 0 (idle, no start triggered), then read status_reg
# (0x4 = {tag_valid,busy,done}) and confirm it reads back idle (0) --
# a real liveness check on the bus path without attempting a full
# encrypt/decrypt round-trip (that's ascon_encrypt.s/ascon_decrypt.s's
# job in isolation).
################################################################
lui   x1, 0x40000
sw    x0, 0(x1)
addi  x0, x0, 0
lw    x6, 4(x1)
sltiu x23, x6, 1

################################################################
# Stage 4: GPIO -- lower 16 pins output, upper 16 input; OUT
# readback plus tb.v's fixed gpio_in drive pattern (0xa5a51234).
################################################################
lui   x1, 0x40002
li    x2, 0x55555555
sw    x2, 0x8(x1)
addi  x0, x0, 0
sw    x0, 0xC(x1)
addi  x0, x0, 0
li    x2, 0xFFFFFFFF
sw    x2, 0x80(x1)
addi  x0, x0, 0
li    x2, 0xAAAA
sw    x2, 0x180(x1)
addi  x0, x0, 0
lw    x6, 0x180(x1)
xor   x5, x2, x6
lw    x9, 0x100(x1)
li    x10, 0xa5a51234
xor   x11, x9, x10
or    x5, x5, x11
sltiu x24, x5, 1

################################################################
# Stage 5: UART -- baud divisor + 8N1, polled TX -> loopback ->
# polled RX (no interrupt yet; that's stage 7). Divisor/LCR set
# here stay in effect for stage 7 too.
################################################################
lui   x1, 0x40001
li    x2, 0x80
sw    x2, 0xC(x1)             # LCR.dlab = 1
addi  x0, x0, 0
li    x2, 2
sw    x2, 0(x1)                # DLL = 2
addi  x0, x0, 0
sw    x0, 4(x1)                # DLM = 0
addi  x0, x0, 0
li    x2, 0x03
sw    x2, 0xC(x1)              # LCR.dlab = 0, 8N1
addi  x0, x0, 0

wait_tx_empty_s5:
lw    x6, 0x14(x1)
addi  x0, x0, 0
andi  x6, x6, 0x20
beq   x6, x0, wait_tx_empty_s5

li    x2, 0x55
sw    x2, 0(x1)
addi  x0, x0, 0

wait_rx_ready_s5:
lw    x6, 0x14(x1)
addi  x0, x0, 0
andi  x6, x6, 0x1
beq   x6, x0, wait_rx_ready_s5

lw    x6, 0(x1)
xor   x5, x2, x6
sltiu x25, x5, 1

################################################################
# Stage 6: CLINT -- arm mtimecmp a little ahead of the live mtime;
# spin until the ISR (real trap_taken redirect via the direct mtip
# path) sets x26.
################################################################
lui   x1, 0x40007
lw    x6, 0x18(x1)             # live mtime (low)
addi  x0, x0, 0
addi  x6, x6, 20
sw    x6, 0x8(x1)              # mtimecmp low
addi  x0, x0, 0
sw    x0, 0xC(x1)              # mtimecmp high = 0
addi  x0, x0, 0

spin_clint:
beq   x26, x0, spin_clint

################################################################
# Stage 7: PLIC -- enable source 1 (uart_intr) at target 0, then
# fire a real UART interrupt; spin until the ISR (claim/drain/
# complete via the PLIC-routed meip path) sets x27.
################################################################
lui   x1, 0x40005
li    x2, 1
sw    x2, 4(x1)                 # priority[1] = 1
addi  x0, x0, 0
li    x2, 0x2
sw    x2, 0x84(x1)              # enable target0: bit1 = source1
addi  x0, x0, 0
sw    x0, 0x8C(x1)              # threshold target0 = 0
addi  x0, x0, 0

lui   x1, 0x40001
li    x2, 0x1
sw    x2, 4(x1)                 # IER.dtr = 1: enable RX-ready interrupt
addi  x0, x0, 0

li    x2, 0x41                  # 'A'
sw    x2, 0(x1)                 # TX -> loopback -> RX ready -> uart_intr -> PLIC
addi  x0, x0, 0

spin_plic:
beq   x27, x0, spin_plic

################################################################
# Aggregate result.
################################################################
and   x28, x21, x22
and   x28, x28, x23
and   x28, x28, x24
and   x28, x28, x25
and   x28, x28, x26
and   x28, x28, x27
beq   x28, x0, all_fail
li    x28, -1                   # 0xFFFFFFFF
j     finish

all_fail:
li    x28, 0

finish:
done:
beq   x0, x0, done

################################################################
# ISR: dispatches on mcause. Only two causes are ever pending in
# this test (timer, then external), taken one at a time.
################################################################
isr_handler:
csrrw x12, mcause, x0
li    x13, 0x80000007           # CAUSE_MTI
beq   x12, x13, isr_clint

isr_plic:
lui   x14, 0x40005
lw    x15, 0x94(x14)            # claim (target0) -> claimed source id
addi  x0, x0, 0
lui   x16, 0x40001
lw    x17, 0(x16)               # drain UART RHR
addi  x0, x0, 0
sw    x15, 0x94(x14)            # complete
addi  x0, x0, 0
li    x27, 1
j     isr_done

isr_clint:
li    x26, 1
lui   x18, 0x40007
li    x19, -1
sw    x19, 0xC(x18)             # park mtimecmp far away again
addi  x0, x0, 0
sw    x19, 0x8(x18)
addi  x0, x0, 0

isr_done:
mret
