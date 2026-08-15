#include "plic_driver.h"
#include "soc_regs.h"

// See rtl/plic/apb_plic_wrapper.sv for the full absolute-address
// translation table (also documented in plic_test.s's header comment).
#define PLIC_ENABLE0_OFF 0x084
#define PLIC_THRESH0_OFF 0x08C
#define PLIC_CLAIM0_OFF  0x094
#define PLIC_MAX_SOURCE  30u   // sources 1..30; source 0 is reserved/tied-0

void plic_init(void)
{
    unsigned int src;

    for (src = 1; src <= PLIC_MAX_SOURCE; src++) {
        MMIO_WRITE32(PLIC_BASE + 4u * src, 0);
    }

    MMIO_WRITE32(PLIC_BASE + PLIC_ENABLE0_OFF, 0);
    MMIO_WRITE32(PLIC_BASE + PLIC_THRESH0_OFF, 0);
}

void plic_enable_source(unsigned int source, unsigned int priority)
{
    unsigned int cur;

    MMIO_WRITE32(PLIC_BASE + 4u * source, priority);

    cur = MMIO_READ32(PLIC_BASE + PLIC_ENABLE0_OFF);
    MMIO_WRITE32(PLIC_BASE + PLIC_ENABLE0_OFF, cur | (1u << source));
}

void plic_disable_source(unsigned int source)
{
    unsigned int cur = MMIO_READ32(PLIC_BASE + PLIC_ENABLE0_OFF);
    MMIO_WRITE32(PLIC_BASE + PLIC_ENABLE0_OFF, cur & ~(1u << source));
}

unsigned int plic_claim(void)
{
    return MMIO_READ32(PLIC_BASE + PLIC_CLAIM0_OFF);
}

void plic_complete(unsigned int source)
{
    MMIO_WRITE32(PLIC_BASE + PLIC_CLAIM0_OFF, source);
}
