.section .text
.globl _start

_start:

################################################
# CLINT timer-interrupt regression test.
#
# 1) Park mtimecmp far in the future so no spurious IRQ fires early.
# 2) Point mtvec at isr_handler, enable mie.MTIE + mstatus.MIE.
# 3) Read the live mtime, arm mtimecmp a little ahead of it.
# 4) Spin until the ISR (entered via a real trap_taken redirect) sets
#    x2 nonzero and returns via mret.
#
# A nop follows every peripheral store below -- this SoC's APB bus drops
# the second of two back-to-back peripheral stores with no instruction
# between them (a pre-existing timing quirk; see the existing spi_read.s/
# spi_write.s tests, which follow the same convention after every store).
#
# Expected final state:
#   x2 = 1               (ISR ran)
#   x8 = 0x80000007       (mcause: machine timer interrupt, read in the ISR)
#   x2 stays 1 afterwards (ISR parks mtimecmp again before mret, so it
#                          doesn't immediately re-trap and keeps spinning
#                          uneventfully in the "done" loop)
################################################

CLINT_BASE = 0x40007
MTIMECMP_LOW_OFF  = 0x8
MTIMECMP_HIGH_OFF = 0xC
MTIME_LOW_OFF     = 0x18

la    x1, isr_handler
csrrw x0, mtvec, x1          # Direct mode: all traps land at isr_handler

addi  x2, x0, 0              # x2 = 0: ISR has not run yet

lui   x5, CLINT_BASE         # x5 = CLINT base (0x40007000)

# Park mtimecmp far in the future first, so enabling the interrupt below
# can't fire on stale/default register contents.
addi  x7, x0, -1             # 0xFFFFFFFF
sw    x7, MTIMECMP_HIGH_OFF(x5)
addi  x0, x0, 0
sw    x7, MTIMECMP_LOW_OFF(x5)
addi  x0, x0, 0

addi  x3, x0, 0x80           # mie.MTIE (bit 7)
csrrw x0, mie, x3

addi  x4, x0, 0x8            # mstatus.MIE (bit 3)
csrrw x0, mstatus, x4

# Arm a near-future compare value: current mtime + a small delta. The
# delta must stay small -- the testbench's fixed simulation window is
# 30us and mtime ticks roughly once per 160ns, so budget accordingly.
lw    x6, MTIME_LOW_OFF(x5)
addi  x0, x0, 0
addi  x6, x6, 20
sw    x6, MTIMECMP_LOW_OFF(x5)
addi  x0, x0, 0
sw    x0, MTIMECMP_HIGH_OFF(x5)
addi  x0, x0, 0

spin:
beq   x2, x0, spin

done:
beq   x0, x0, done

isr_handler:
addi  x2, x0, 1              # mark: ISR ran
csrrw x8, mcause, x0          # x8 = mcause (write to mcause is a no-op)

# Acknowledge: park mtimecmp far in the future again so mtip deasserts
# and mret doesn't immediately re-trap into this same ISR.
lui   x9, CLINT_BASE
addi  x10, x0, -1
sw    x10, MTIMECMP_HIGH_OFF(x9)
addi  x0, x0, 0
sw    x10, MTIMECMP_LOW_OFF(x9)
addi  x0, x0, 0

mret
