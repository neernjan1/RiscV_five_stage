.section .text
.globl _start

_start:

################################################
# I2C regression test.
#
# Exercises the I2C master (rtl/i2c/apb_i2c.sv, OpenCores-derived) end to
# end through PLIC: configure the core, issue a START+WRITE command,
# take the resulting "transfer done" interrupt via PLIC source 3 -> the
# core's meip -> a real trap_taken redirect, claim+complete at the PLIC,
# then cleanly issue STOP with interrupts masked so it doesn't re-trap.
#
# There is no real I2C slave on tb.v's simulated bus (see tb.v's i2c_scl/
# i2c_sda comment) -- SCL/SDA loop back through a modeled pull-up with
# nothing else ever pulling the line low, and with none of the
# clock-stretching delay a real slave would add. That combination races
# ahead of the core's own SDA input synchronizer (cSDA/fSDA/sSDA in
# i2c_master_bit_ctrl.sv) during the START condition, so the core
# deterministically reports arbitration-lost (STATUS.AL) rather than a
# clean ACK/NACK on this bus -- expected here, and reproducible run to
# run. This test is checking that the core's own command/status/
# interrupt sequencing works end to end, not that a real device acks.
#
# I2C register map (rtl/i2c/apb_i2c.sv, offset = PADDR[5:2]):
#   +0x00  CLK_PRESCALER
#   +0x04  CTRL      bit7=EN bit6=IEN
#   +0x08  RX
#   +0x0C  STATUS    bit7=RxACK bit6=busy bit5=AL bit1=TIP bit0=IF
#   +0x10  TX
#   +0x14  CMD       bit7=STA bit6=STO bit5=RD bit4=WR bit3=ACK bit0=IACK
#
# PLIC register map / source numbering: see plic_test.s's header comment.
#   source 3 = i2c_interrupt (see rtl/top/soc_top.v's PLIC section)
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x20 = 1        (ISR ran)
#   x22 = 3         (claimed PLIC source id -- must be source 3, i2c)
#   x24 = 0x21       (STATUS at claim time: AL=1 (see note above), IF=1,
#                     RxACK=0, TIP=0)
################################################

I2C_BASE     = 0x40004000
PRESCALE_OFF = 0x00
CTRL_OFF     = 0x04
RX_OFF       = 0x08
STATUS_OFF   = 0x0C
TX_OFF       = 0x10
CMD_OFF      = 0x14

PLIC_BASE    = 0x40005
PRIO3_OFF    = 0x00C
ENABLE0_OFF  = 0x084
THRESH0_OFF  = 0x08C
CLAIM0_OFF   = 0x094

la    x1, isr_handler
csrrw x0, mtvec, x1          # Direct mode: all traps land at isr_handler

addi  x20, x0, 0             # x20 = 0: ISR has not run yet

# ---- Configure PLIC: source 3 (i2c) enabled at target 0, threshold 0 ----
lui   x5, PLIC_BASE           # x5 = PLIC base (0x40005000)

addi  x6, x0, 1
sw    x6, PRIO3_OFF(x5)      # priority[3] = 1 (any value > threshold)
addi  x0, x0, 0

addi  x6, x0, 0x8            # bit3 = enable source 3 for target 0
sw    x6, ENABLE0_OFF(x5)
addi  x0, x0, 0

sw    x0, THRESH0_OFF(x5)    # threshold = 0: let any nonzero-priority through
addi  x0, x0, 0

# ---- Enable core-level interrupts: mstatus.MIE, mie.MEIE ----
addi  x7, x0, 0x8            # mstatus.MIE (bit 3)
csrrw x0, mstatus, x7

li    x7, 0x800               # mie.MEIE (bit 11)
csrrw x0, mie, x7

# ---- Configure I2C: fastest prescaler, core enabled, interrupts enabled ----
li    x8, I2C_BASE

sw    x0, PRESCALE_OFF(x8)   # prescale = 0 (fastest SCL toggle for sim)
addi  x0, x0, 0

addi  x9, x0, 0xC0            # CTRL.EN=1, CTRL.IEN=1
sw    x9, CTRL_OFF(x8)
addi  x0, x0, 0

addi  x10, x0, 0xA0           # address byte to send (7'h50, W)
sw    x10, TX_OFF(x8)
addi  x0, x0, 0

addi  x11, x0, 0x90           # CMD.STA=1, CMD.WR=1 -> start + write TX byte
sw    x11, CMD_OFF(x8)
addi  x0, x0, 0

spin:
beq   x20, x0, spin          # wait for the ISR to set x20 = 1

# Mask further interrupts before issuing STOP -- STOP also raises
# "transfer done" and would otherwise re-trap into the ISR.
csrrw x0, mstatus, x0        # mstatus.MIE = 0

addi  x12, x0, 0x40           # CMD.STO=1 -> stop condition
sw    x12, CMD_OFF(x8)
addi  x0, x0, 0

done:
beq   x0, x0, done

isr_handler:

# Claim at the PLIC: read CLAIM/COMPLETE (target 0) -> claimed source id.
lui   x21, PLIC_BASE
lw    x22, CLAIM0_OFF(x21)   # x22 = claimed source id (expect 3)
addi  x0, x0, 0

# Snapshot I2C status (RxACK/TIP/IF) at claim time.
li    x23, I2C_BASE
lw    x24, STATUS_OFF(x23)   # x24 = status (expect 0x80: RxACK=1, TIP=0)
addi  x0, x0, 0

# Clear the core's own interrupt flag (CMD.IACK), so it stops asserting
# i2c_interrupt once we unmask.
addi  x25, x0, 0x01
sw    x25, CMD_OFF(x23)
addi  x0, x0, 0

# Complete at the PLIC: write the claimed id back.
sw    x22, CLAIM0_OFF(x21)
addi  x0, x0, 0

addi  x20, x0, 1             # mark: ISR ran

mret
