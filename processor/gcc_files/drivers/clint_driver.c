#include "clint_driver.h"
#include "soc_regs.h"

// See rtl/CLINT/rtl/clint.sv for the full register map. Only context
// 0's registers are used -- this is a single-hart design (context 1
// exists in the vendored IP but nothing wires a second hart to it).
#define CLINT_MSIP_0_OFF        0x20
#define CLINT_MTIMECMP_LOW_OFF  0x8
#define CLINT_MTIMECMP_HIGH_OFF 0xC
#define CLINT_MTIME_LOW_OFF     0x18

void clint_init(void)
{
    MMIO_WRITE32(CLINT_BASE + CLINT_MTIMECMP_HIGH_OFF, 0xFFFFFFFFu);
    MMIO_WRITE32(CLINT_BASE + CLINT_MTIMECMP_LOW_OFF, 0xFFFFFFFFu);
    MMIO_WRITE32(CLINT_BASE + CLINT_MSIP_0_OFF, 0);
}

unsigned int clint_get_mtime(void)
{
    return MMIO_READ32(CLINT_BASE + CLINT_MTIME_LOW_OFF);
}

void clint_arm_timer(unsigned int delta_ticks)
{
    unsigned int target = clint_get_mtime() + delta_ticks;

    MMIO_WRITE32(CLINT_BASE + CLINT_MTIMECMP_LOW_OFF, target);
    MMIO_WRITE32(CLINT_BASE + CLINT_MTIMECMP_HIGH_OFF, 0);
}

void clint_trigger_ipi(void)
{
    MMIO_WRITE32(CLINT_BASE + CLINT_MSIP_0_OFF, 1);
}

void clint_clear_ipi(void)
{
    MMIO_WRITE32(CLINT_BASE + CLINT_MSIP_0_OFF, 0);
}
