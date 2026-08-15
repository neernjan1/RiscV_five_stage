.section .text
.globl _start

_start:

################################################################
# GPIO interrupt regression test.
#
# Exercises the GPIO -> PLIC source 2 -> meip path end to end: a
# level-high interrupt on pin 16 (an upper-16 "input" pin, per
# gpio_test.s's mode split) -> gpio_global_irq -> PLIC source 2 ->
# target 0's eip line -> core's meip (mip.MEIP) -> trap_controller ->
# a real trap_taken redirect -> ISR claims + completes the interrupt
# at the PLIC, then disables the pin's level-high enable so it doesn't
# immediately re-trap (tb.v drives gpio_in as a fixed, never-toggling
# pattern -- see gpio_test.s -- so the level condition never clears on
# its own; the source must be masked, not waited out) -> mret.
#
# tb.v drives a fixed pattern on the external gpio_in port (see
# gpio_test.s): 0xA5A5_1234. Bit 16 of that pattern is 1, so enabling
# GPIO_INTRPT_LVL_HIGH_EN[16] fires the moment it's unmasked -- no
# edge is needed (and none would ever come; the pattern never
# toggles), which is exactly why this is a level, not edge, interrupt
# test. gpio_input_stage.sv samples gpio_in[idx] directly regardless
# of that pin's GPIO_MODE (input/output), so the pin's mode setting
# below is documentation of intent, not a functional requirement.
#
# GPIO register map (rtl/gpio/pkg/gpio_reg_pkg.sv):
#   +0x00C  GPIO_MODE_1          (pins 16-31, 2 bits each)
#   +0x080  GPIO_EN              (per-pin input-synchronizer enable)
#   +0x100  GPIO_IN              (synchronized input value)
#   +0x480  INTRPT_LVL_HIGH_EN   (per-pin level-high interrupt enable)
#
# PLIC register map / source numbering: see plic_test.s's header comment.
#   source 2 = gpio_global_irq (see rtl/top/soc_top.v's PLIC section)
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x20 = 1        (ISR ran)
#   x22 = 2         (claimed PLIC source id -- must be source 2, gpio)
#   x24 = 1          (bit 16 of GPIO_IN, read in the ISR: confirms pin
#                     16 -- the pin that was actually unmasked -- is
#                     the one reading high)
################################################################

GPIO_BASE      = 0x40002000
MODE_1_OFF     = 0xC
EN_OFF         = 0x80
IN_OFF         = 0x100
LVL_HIGH_EN_OFF = 0x480

PLIC_BASE    = 0x40005
PRIO2_OFF    = 0x008
ENABLE0_OFF  = 0x084
THRESH0_OFF  = 0x08C
CLAIM0_OFF   = 0x094

la    x1, isr_handler
csrrw x0, mtvec, x1          # Direct mode: all traps land at isr_handler

addi  x20, x0, 0             # x20 = 0: ISR has not run yet

# ---- Configure PLIC: source 2 (gpio) enabled at target 0, threshold 0 ----
lui   x5, PLIC_BASE           # x5 = PLIC base (0x40005000)

addi  x6, x0, 1
sw    x6, PRIO2_OFF(x5)      # priority[2] = 1 (any value > threshold)
addi  x0, x0, 0

addi  x6, x0, 0x4            # bit2 = enable source 2 for target 0
sw    x6, ENABLE0_OFF(x5)
addi  x0, x0, 0

sw    x0, THRESH0_OFF(x5)    # threshold = 0: let any nonzero-priority through
addi  x0, x0, 0

# ---- Enable core-level interrupts: mstatus.MIE, mie.MEIE ----
addi  x7, x0, 0x8            # mstatus.MIE (bit 3)
csrrw x0, mstatus, x7

li    x7, 0x800               # mie.MEIE (bit 11)
csrrw x0, mie, x7

# ---- Configure GPIO: pin 16 input, its synchronizer enabled, its
#      level-high interrupt unmasked (this is what actually fires it) ----
li    x8, GPIO_BASE

sw    x0, MODE_1_OFF(x8)     # pins 16-31 = INPUT_ONLY (mode 2'b00)
addi  x0, x0, 0

li    x9, 0xFFFFFFFF
sw    x9, EN_OFF(x8)         # enable all 32 pins' input synchronizers
addi  x0, x0, 0

li    x10, 0x00010000        # bit16 = 1
sw    x10, LVL_HIGH_EN_OFF(x8)  # unmask pin 16's level-high interrupt ->
addi  x0, x0, 0                  # fires immediately, gpio_in[16] is already 1

spin:
beq   x20, x0, spin          # wait for the ISR to set x20 = 1

done:
beq   x0, x0, done

isr_handler:

# Claim at the PLIC: read CLAIM/COMPLETE (target 0) -> claimed source id.
lui   x21, PLIC_BASE
lw    x22, CLAIM0_OFF(x21)   # x22 = claimed source id (expect 2)
addi  x0, x0, 0

# Confirm which pin is actually driving the interrupt.
li    x23, GPIO_BASE
lw    x6, IN_OFF(x23)        # x6 = GPIO_IN
addi  x0, x0, 0
srli  x24, x6, 16
andi  x24, x24, 1            # x24 = bit16 of GPIO_IN (expect 1)

# Mask pin 16's level-high interrupt so completing at the PLIC doesn't
# immediately re-trap -- gpio_in[16] never deasserts on its own (tb.v's
# pattern is fixed for the whole run), so the source itself must be
# silenced before completing, the same way clint_timer_test.s parks
# mtimecmp far in the future before its own mret.
sw    x0, LVL_HIGH_EN_OFF(x23)
addi  x0, x0, 0

# Complete at the PLIC: write the claimed id back.
sw    x22, CLAIM0_OFF(x21)
addi  x0, x0, 0

addi  x20, x0, 1             # mark: ISR ran

mret
