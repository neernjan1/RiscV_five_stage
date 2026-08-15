#include "spi_driver.h"
#include "soc_regs.h"

// See rtl/spi/spi_master_apb_if.sv for the full register map.
#define SPI_CSREG_OFF  0x0
#define SPI_CLKDIV_OFF 0x4
#define SPI_SPICMD_OFF 0x8
#define SPI_SPIADR_OFF 0xC
#define SPI_SPILEN_OFF 0x10
#define SPI_SPIDUM_OFF 0x14
#define SPI_RXFIFO_OFF 0x20

#define SPI_CSREG_START_READ 0x101u  // RD=1, CS0=1
#define SPI_STATUS_IDLE      0x1u

void spi_init(unsigned int clkdiv)
{
    MMIO_WRITE32(SPI_BASE + SPI_CLKDIV_OFF, clkdiv);
    MMIO_WRITE32(SPI_BASE + SPI_SPIDUM_OFF, 0);
}

unsigned int spi_read_byte(unsigned int cmd, unsigned int addr)
{
    MMIO_WRITE32(SPI_BASE + SPI_SPICMD_OFF, cmd);
    MMIO_WRITE32(SPI_BASE + SPI_SPIADR_OFF, addr);
    MMIO_WRITE32(SPI_BASE + SPI_SPILEN_OFF, 0x00080808u);
    MMIO_WRITE32(SPI_BASE + SPI_CSREG_OFF, SPI_CSREG_START_READ);

    while ((MMIO_READ32(SPI_BASE + SPI_CSREG_OFF) & SPI_STATUS_IDLE) == 0) {}

    return MMIO_READ32(SPI_BASE + SPI_RXFIFO_OFF);
}
