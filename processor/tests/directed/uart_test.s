.section .text
.globl _start

_start:

################################################
# UART loopback regression test.
#
# tb.v wires uart_tx straight back to uart_rx (external loopback), so a
# transmitted byte should come back through the real TX and RX framing
# logic, not just an internal register round-trip.
#
# Register map (16550A-compatible):
#   +0x00 THR (write) / RHR (read)      -- DLL when LCR.dlab=1
#   +0x04 IER                            -- DLM when LCR.dlab=1
#   +0x0C LCR
#   +0x14 LSR  -- bit0 data_ready, bit5 thr_empty
#
# obi_uart_baudgen computes divisor = {DLM,DLL} - 1 and treats a result of
# 0 as invalid (never generates a baud edge) -- the reset default DLL=1,
# DLM=0 hits exactly that, so the TX FSM never starts without an explicit
# divisor write first. LCR.dlab=1 temporarily remaps THR/IER to DLL/DLM
# for that write, per standard 16550A convention.
#
# A nop follows every peripheral store (see clint_timer_test.s for why).
#
# Expected final state:
#   x12 & 0xFF = 0x41  ('A', received back through the loopback)
################################################

UART_BASE   = 0x40001000
THR_RHR_OFF = 0x0
IER_DLM_OFF = 0x4
LCR_OFF     = 0xC
LSR_OFF     = 0x14

li    x5, UART_BASE

# Access DLL/DLM: LCR.dlab=1 (bit7), remap THR/IER offsets.
li    x13, 0x80
sw    x13, LCR_OFF(x5)
addi  x0, x0, 0

# Divisor = 2 -> {DLM,DLL}-1 = 1 (valid, fast for simulation).
li    x14, 2
sw    x14, THR_RHR_OFF(x5)
addi  x0, x0, 0
sw    x0, IER_DLM_OFF(x5)
addi  x0, x0, 0

# 8N1: word_len=2'b11 (8 bits), stop_bits=0 (1 stop bit), no parity,
# dlab=0 (back to normal THR/RHR access).
li    x6, 0x03
sw    x6, LCR_OFF(x5)
addi  x0, x0, 0

wait_tx_empty:
lw    x7, LSR_OFF(x5)
addi  x0, x0, 0
andi  x8, x7, 0x20
beq   x8, x0, wait_tx_empty

li    x9, 0x41        # 'A'
sw    x9, THR_RHR_OFF(x5)
addi  x0, x0, 0

wait_rx_ready:
lw    x10, LSR_OFF(x5)
addi  x0, x0, 0
andi  x11, x10, 0x1
beq   x11, x0, wait_rx_ready

lw    x12, THR_RHR_OFF(x5)

done:
beq   x0, x0, done
