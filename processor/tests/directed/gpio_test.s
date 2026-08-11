.section .text
.globl _start

_start:

################################################
# GPIO regression test.
#
# Configures the lower 16 pins as outputs (GPIO_MODE_0 = 2'b01 repeated),
# the upper 16 as inputs (GPIO_MODE_1 = 0), enables all 32 pins' input
# synchronizers (GPIO_EN), writes a known pattern to GPIO_OUT, then reads
# both GPIO_OUT (register round-trip) and GPIO_IN (should reflect the
# fixed pattern tb.v drives on the top-level gpio_in port).
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x9  = 0x0000aaaa   (GPIO_OUT read back)
#   x10 = 0xa5a51234   (GPIO_IN, matches tb.v's fixed drive pattern)
################################################

GPIO_BASE   = 0x40002000
MODE_0_OFF  = 0x8
MODE_1_OFF  = 0xC
EN_OFF      = 0x80
IN_OFF      = 0x100
OUT_OFF     = 0x180

li    x5, GPIO_BASE

# Lower 16 pins = OUTPUT_ACTIVE (mode 2'b01, repeated 16x).
li    x6, 0x55555555
sw    x6, MODE_0_OFF(x5)
addi  x0, x0, 0

# Upper 16 pins = INPUT_ONLY (mode 2'b00).
sw    x0, MODE_1_OFF(x5)
addi  x0, x0, 0

# Enable all 32 pins' input synchronizers.
li    x7, 0xFFFFFFFF
sw    x7, EN_OFF(x5)
addi  x0, x0, 0

# Drive a known pattern on the (lower-16, output-mode) pins.
li    x8, 0x0000AAAA
sw    x8, OUT_OFF(x5)
addi  x0, x0, 0

lw    x9, OUT_OFF(x5)
addi  x0, x0, 0

lw    x10, IN_OFF(x5)
addi  x0, x0, 0

done:
beq   x0, x0, done
