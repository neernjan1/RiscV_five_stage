#ifndef SPI_DRIVER_H
#define SPI_DRIVER_H

// Program CLKDIV and clear SPIDUM. Doesn't touch SPICMD/SPIADR/SPILEN
// or start a transaction -- an application sets those and calls
// spi_read_byte() (or drives CSREG itself) when it actually wants a
// transfer.
void spi_init(unsigned int clkdiv);

// Blocking single read transaction: program cmd/addr, start (RD=1,
// CS0=1), poll STATUS.idle, return the byte drained from RXFIFO. This
// is exactly the sequence tests/directed/spi_read.s / spi_test3.s
// exercise by hand.
unsigned int spi_read_byte(unsigned int cmd, unsigned int addr);

#endif // SPI_DRIVER_H
