.section .text
.globl _start

_start:

################################################
# PLIC external-interrupt regression test.
#
# Exercises the full external-interrupt path end to end: UART RX-data-
# ready (a real peripheral event, via the existing TX->RX loopback also
# used by uart_test.s) -> PLIC source 1 -> PLIC target 0's eip line ->
# core's meip (mip.MEIP) -> trap_controller -> real trap_taken redirect
# -> ISR claims + completes the interrupt at the PLIC, then drains the
# byte at the UART -> mret.
#
# PLIC register map, as translated by rtl/plic/apb_plic_wrapper.sv onto
# plic_top's compact in-block offsets (see that file for the full
# absolute-address translation table):
#   +0x000 + 4*src   PRIORITY[src]      (src=1..30; src=0 reserved/tied-0)
#   +0x080           PENDING            (bit k = source k)
#   +0x084           ENABLE target 0    (bit k = source k)
#   +0x08C           THRESHOLD target 0
#   +0x094           CLAIM/COMPLETE target 0 (read = claim, write = complete)
#
# Source numbering (see rtl/top/soc_top.v's PLIC section):
#   source 1 = uart_intr        (exercised by this test)
#   source 2 = gpio_global_irq  (wired, not exercised here)
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x20 = 1        (ISR ran)
#   x22 = 1        (claimed PLIC source id -- must be source 1, uart)
#   x24 & 0xFF = 0x41   ('A', drained from UART's RHR inside the ISR)
################################################

PLIC_BASE    = 0x40005
PRIO1_OFF    = 0x004
ENABLE0_OFF  = 0x084
THRESH0_OFF  = 0x08C
CLAIM0_OFF   = 0x094

UART_BASE    = 0x40001000
THR_RHR_OFF  = 0x0
IER_DLM_OFF  = 0x4
LCR_OFF      = 0xC
LSR_OFF      = 0x14

la    x1, isr_handler
csrrw x0, mtvec, x1          # Direct mode: all traps land at isr_handler

addi  x20, x0, 0             # x20 = 0: ISR has not run yet

# ---- Configure PLIC: source 1 (uart) enabled at target 0, threshold 0 ----
lui   x5, PLIC_BASE           # x5 = PLIC base (0x40005000)

addi  x6, x0, 1
sw    x6, PRIO1_OFF(x5)      # priority[1] = 1 (any value > threshold)
addi  x0, x0, 0

addi  x6, x0, 0x2            # bit1 = enable source 1 for target 0
sw    x6, ENABLE0_OFF(x5)
addi  x0, x0, 0

sw    x0, THRESH0_OFF(x5)    # threshold = 0: let any nonzero-priority through
addi  x0, x0, 0

# ---- Enable core-level interrupts: mstatus.MIE, mie.MEIE ----
addi  x7, x0, 0x8            # mstatus.MIE (bit 3)
csrrw x0, mstatus, x7

li    x7, 0x800               # mie.MEIE (bit 11)
csrrw x0, mie, x7

# ---- Configure UART (same steps as uart_test.s) and enable its RX-ready
#      interrupt (IER bit0, "dtr" in this core's field naming) ----
li    x8, UART_BASE

addi  x13, x0, 0x80
sw    x13, LCR_OFF(x8)       # LCR.dlab = 1: remap THR/IER to DLL/DLM
addi  x0, x0, 0

addi  x14, x0, 2
sw    x14, THR_RHR_OFF(x8)   # DLL = 2
addi  x0, x0, 0
sw    x0, IER_DLM_OFF(x8)    # DLM = 0
addi  x0, x0, 0

addi  x9, x0, 0x03
sw    x9, LCR_OFF(x8)        # LCR.dlab = 0, 8N1: back to normal THR/RHR/IER
addi  x0, x0, 0

addi  x9, x0, 0x1
sw    x9, IER_DLM_OFF(x8)    # IER.dtr = 1: enable RX-data-ready interrupt
addi  x0, x0, 0

wait_tx_empty:
lw    x10, LSR_OFF(x8)
addi  x0, x0, 0
andi  x11, x10, 0x20
beq   x11, x0, wait_tx_empty

addi  x12, x0, 0x41          # 'A'
sw    x12, THR_RHR_OFF(x8)   # TX -> loopback -> RX ready -> uart_intr -> PLIC
addi  x0, x0, 0

spin:
beq   x20, x0, spin          # wait for the ISR to set x20 = 1

done:
beq   x0, x0, done

isr_handler:

# Claim at the PLIC: read CLAIM/COMPLETE (target 0) -> claimed source id.
lui   x21, PLIC_BASE
lw    x22, CLAIM0_OFF(x21)   # x22 = claimed source id (expect 1)
addi  x0, x0, 0

# Drain the byte at the UART (also clears the UART's own rxdr latch).
li    x23, UART_BASE
lw    x24, THR_RHR_OFF(x23)  # x24 = received byte (expect 0x41)
addi  x0, x0, 0

# Complete at the PLIC: write the claimed id back.
sw    x22, CLAIM0_OFF(x21)
addi  x0, x0, 0

addi  x20, x0, 1             # mark: ISR ran

mret
