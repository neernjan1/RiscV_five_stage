#ifndef UART_DRIVER_H
#define UART_DRIVER_H

// Bring the UART to a known baud/frame configuration. divisor is the
// raw 16-bit DLL/DLM value (not a baud rate); 2 is the value
// tests/directed/uart_test.s and plic_test.s already exercise. RX/TX
// interrupts are left disabled (IER = 0) -- an application that wants
// them turns the relevant IER bit on itself.
void uart_init(unsigned int divisor);

int  uart_tx_empty(void);
int  uart_rx_ready(void);
void uart_putc(char c);   // blocks until uart_tx_empty()
char uart_getc(void);     // blocks until uart_rx_ready()

#endif // UART_DRIVER_H
