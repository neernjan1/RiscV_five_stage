.section .text
.globl _start

_start:

################################################################
# SPI interrupt regression test.
#
# Exercises the SPI -> PLIC source 5 -> meip path end to end: the same
# SPI read transaction spi_read.s drives (CLKDIV/COMMAND/ADDRESS/
# SPILEN/SPIDUM, then START READ) but instead of polling STATUS for
# the idle bit, this test lets the transaction's own completion pulse
# do the work -- apb_spi_master.sv's controller asserts `eot` for one
# cycle exactly when the transaction returns to IDLE (see
# spi_master_controller.sv's DATA_RX/WAIT_EDGE states), which feeds
# events_o[1] -> PLIC source 5 -> target 0's eip line -> core's meip
# (mip.MEIP) -> trap_controller -> a real trap_taken redirect. The ISR
# claims + completes the interrupt at the PLIC, then drains RXFIFO ->
# mret.
#
# events_o[1] (`eot`) is wired unconditionally -- it isn't gated by
# SPI's own INTCFG.spi_int_en (that gate only applies to events_o[0],
# the FIFO-threshold event) -- so no SPI-side interrupt-enable register
# needs configuring here, only PLIC's per-source enable and the core's
# mie/mstatus. Because `eot` is a single-cycle pulse rather than a
# held level (unlike gpio_irq_test.s's level-high source), it has
# already deasserted well before the ISR reaches its PLIC-complete
# write, so there's no re-trap-on-complete risk here and nothing needs
# to be masked before completing.
#
# tb.v's SPI flash model always drives 0xB9 back on MISO (see
# slave_data in tb.v, also relied on by spi_read.s/spi_test3.s), so
# the byte the ISR drains from RXFIFO is deterministic.
#
# PLIC register map / source numbering: see plic_test.s's header comment.
#   source 4 = spi_events[0] (tx/rx FIFO-threshold event, not used here)
#   source 5 = spi_events[1] (end-of-transfer -- exercised by this test)
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x20 = 1        (ISR ran)
#   x22 = 5         (claimed PLIC source id -- must be source 5, spi eot)
#   x24 = 0xb9       (byte drained from SPI's RXFIFO inside the ISR)
################################################################

SPI_BASE     = 0x40003        # for `lui` (upper-20 bits); shifted left 12 by lui
CLKDIV_OFF   = 0x4
SPICMD_OFF   = 0x8
SPIADR_OFF   = 0xC
SPILEN_OFF   = 0x10
SPIDUM_OFF   = 0x14
CSREG_OFF    = 0x0
RXFIFO_OFF   = 0x20

PLIC_BASE    = 0x40005
PRIO5_OFF    = 0x014
ENABLE0_OFF  = 0x084
THRESH0_OFF  = 0x08C
CLAIM0_OFF   = 0x094

la    x1, isr_handler
csrrw x0, mtvec, x1          # Direct mode: all traps land at isr_handler

addi  x20, x0, 0             # x20 = 0: ISR has not run yet

# ---- Configure PLIC: source 5 (spi eot) enabled at target 0, threshold 0 ----
lui   x5, PLIC_BASE           # x5 = PLIC base (0x40005000)

addi  x6, x0, 1
sw    x6, PRIO5_OFF(x5)      # priority[5] = 1 (any value > threshold)
addi  x0, x0, 0

addi  x6, x0, 0x20           # bit5 = enable source 5 for target 0
sw    x6, ENABLE0_OFF(x5)
addi  x0, x0, 0

sw    x0, THRESH0_OFF(x5)    # threshold = 0: let any nonzero-priority through
addi  x0, x0, 0

# ---- Enable core-level interrupts: mstatus.MIE, mie.MEIE ----
addi  x7, x0, 0x8            # mstatus.MIE (bit 3)
csrrw x0, mstatus, x7

li    x7, 0x800               # mie.MEIE (bit 11)
csrrw x0, mie, x7

# ---- Configure SPI for a read transaction (same as spi_read.s) ----
lui   x2, SPI_BASE

addi  x3, x0, 4
sw    x3, CLKDIV_OFF(x2)     # CLKDIV = 4
addi  x0, x0, 0

lui   x3, 0xA5000
sw    x3, SPICMD_OFF(x2)     # COMMAND = 0xA5
addi  x0, x0, 0

lui   x3, 0x12340
sw    x3, SPIADR_OFF(x2)     # ADDRESS = 0x12340000
addi  x0, x0, 0

lui   x3, 0x80
addi  x3, x3, 0x708
addi  x3, x3, 0x100
sw    x3, SPILEN_OFF(x2)     # SPILEN = 0x00080808
addi  x0, x0, 0

addi  x3, x0, 0
sw    x3, SPIDUM_OFF(x2)     # SPIDUM = 0
addi  x0, x0, 0

addi  x3, x0, 0x101
sw    x3, CSREG_OFF(x2)      # START READ (RD=1, CS0=1) -> eot fires on completion
addi  x0, x0, 0

spin:
beq   x20, x0, spin          # wait for the ISR to set x20 = 1

done:
beq   x0, x0, done

isr_handler:

# Claim at the PLIC: read CLAIM/COMPLETE (target 0) -> claimed source id.
lui   x21, PLIC_BASE
lw    x22, CLAIM0_OFF(x21)   # x22 = claimed source id (expect 5)
addi  x0, x0, 0

# Drain the byte at the SPI (also matches spi_read.s's RXFIFO read).
lui   x23, SPI_BASE
lw    x24, RXFIFO_OFF(x23)   # x24 = received byte (expect 0xb9)
addi  x0, x0, 0

# Complete at the PLIC: write the claimed id back.
sw    x22, CLAIM0_OFF(x21)
addi  x0, x0, 0

addi  x20, x0, 1             # mark: ISR ran

mret
