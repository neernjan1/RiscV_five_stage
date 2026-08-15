#include "gpio_driver.h"
#include "soc_regs.h"

// See rtl/gpio/pkg/gpio_reg_pkg.sv for the full register map.
#define GPIO_MODE_0_OFF 0x8    // pins 0-15,  2 bits each
#define GPIO_MODE_1_OFF 0xC    // pins 16-31, 2 bits each
#define GPIO_EN_OFF     0x80
#define GPIO_IN_OFF     0x100
#define GPIO_OUT_OFF    0x180

void gpio_init(void)
{
    MMIO_WRITE32(GPIO_BASE + GPIO_MODE_0_OFF, 0x00000000u);
    MMIO_WRITE32(GPIO_BASE + GPIO_MODE_1_OFF, 0x00000000u);
    MMIO_WRITE32(GPIO_BASE + GPIO_EN_OFF, 0xFFFFFFFFu);
    MMIO_WRITE32(GPIO_BASE + GPIO_OUT_OFF, 0x00000000u);
}

void gpio_set_mode(unsigned int pin, unsigned int mode)
{
    unsigned int off   = (pin < 16) ? GPIO_MODE_0_OFF : GPIO_MODE_1_OFF;
    unsigned int shift = (pin % 16) * 2;
    unsigned int cur   = MMIO_READ32(GPIO_BASE + off);

    cur &= ~(0x3u << shift);
    cur |= (mode & 0x3u) << shift;

    MMIO_WRITE32(GPIO_BASE + off, cur);
}

void gpio_write(unsigned int mask, unsigned int value)
{
    unsigned int cur = MMIO_READ32(GPIO_BASE + GPIO_OUT_OFF);
    MMIO_WRITE32(GPIO_BASE + GPIO_OUT_OFF, (cur & ~mask) | (value & mask));
}

unsigned int gpio_read(void)
{
    return MMIO_READ32(GPIO_BASE + GPIO_IN_OFF);
}
