#include "uart_driver.h"
#include "soc_regs.h"

// See tests/directed/uart_test.s / plic_test.s for the register map
// and this exact bring-up sequence, already proven end to end.
#define UART_THR_RHR_OFF 0x0
#define UART_IER_DLM_OFF 0x4
#define UART_LCR_OFF     0xC
#define UART_LSR_OFF     0x14

#define UART_LCR_DLAB    0x80
#define UART_LCR_8N1     0x03

#define UART_LSR_TX_EMPTY 0x20
#define UART_LSR_RX_READY 0x01

void uart_init(unsigned int divisor)
{
    // LCR.dlab = 1: remap THR/IER to DLL/DLM for divisor programming.
    MMIO_WRITE32(UART_BASE + UART_LCR_OFF, UART_LCR_DLAB);

    MMIO_WRITE32(UART_BASE + UART_THR_RHR_OFF, divisor & 0xFFu);
    MMIO_WRITE32(UART_BASE + UART_IER_DLM_OFF, (divisor >> 8) & 0xFFu);

    // LCR.dlab = 0, 8N1: back to normal THR/RHR/IER access.
    MMIO_WRITE32(UART_BASE + UART_LCR_OFF, UART_LCR_8N1);
}

int uart_tx_empty(void)
{
    return (MMIO_READ32(UART_BASE + UART_LSR_OFF) & UART_LSR_TX_EMPTY) != 0;
}

int uart_rx_ready(void)
{
    return (MMIO_READ32(UART_BASE + UART_LSR_OFF) & UART_LSR_RX_READY) != 0;
}

void uart_putc(char c)
{
    while (!uart_tx_empty()) {}
    MMIO_WRITE32(UART_BASE + UART_THR_RHR_OFF, (unsigned char)c);
}

char uart_getc(void)
{
    while (!uart_rx_ready()) {}
    return (char)MMIO_READ32(UART_BASE + UART_THR_RHR_OFF);
}
