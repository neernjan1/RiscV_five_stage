.section .text
.globl _start

_start:

################################################
# CLINT software-interrupt (IPI) regression test.
#
# Mirrors clint_timer_test.s but drives the interrupt via CLINT's msip
# register instead of mtimecmp, exercising the mie.MSIE / mip.MSIP path
# and the CAUSE_MSI (0x80000003) priority-selection case in
# trap_controller.sv.
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x2 = 1               (ISR ran)
#   x8 = 0x80000003        (mcause: machine software interrupt)
################################################

CLINT_BASE = 0x40007
MSIP_0_OFF = 0x20

la    x1, isr_handler
csrrw x0, mtvec, x1

addi  x2, x0, 0              # x2 = 0: ISR has not run yet

lui   x5, CLINT_BASE

addi  x3, x0, 0x8            # mie.MSIE (bit 3)
csrrw x0, mie, x3

addi  x4, x0, 0x8            # mstatus.MIE (bit 3)
csrrw x0, mstatus, x4

# Trigger the software interrupt.
addi  x6, x0, 1
sw    x6, MSIP_0_OFF(x5)
addi  x0, x0, 0

spin:
beq   x2, x0, spin

done:
beq   x0, x0, done

isr_handler:
addi  x2, x0, 1              # mark: ISR ran
csrrw x8, mcause, x0          # x8 = mcause (write to mcause is a no-op)

# Acknowledge: clear msip so mret doesn't immediately re-trap.
lui   x9, CLINT_BASE
sw    x0, MSIP_0_OFF(x9)
addi  x0, x0, 0

mret
