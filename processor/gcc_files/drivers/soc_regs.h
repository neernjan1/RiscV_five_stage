// soc_regs.h -- peripheral base addresses and the MMIO access macros
// every driver in this directory is built on.
//
// See rtl/top/soc_top.v for the address map these bases come from.

#ifndef SOC_REGS_H
#define SOC_REGS_H

typedef volatile unsigned int reg32_t;

// This SoC's APB bus silently drops the second of two back-to-back
// peripheral-register stores issued with no instruction between them
// (see rtl/apb/stall_controller.v / apb_master.v -- a pre-existing
// timing quirk in the bus, not something worked around at the RTL
// level; every hand-written test under tests/directed/ inserts a nop
// after each peripheral store for the same reason -- see
// clint_timer_test.s's header comment). MMIO_WRITE32/MMIO_READ32 bake
// that nop in so every driver in this directory gets it automatically
// instead of relying on whatever the compiler happens to schedule
// next.
#define MMIO_WRITE32(addr, val)                        \
    do {                                                \
        *(reg32_t *)(addr) = (val);                     \
        __asm__ volatile("nop");                         \
    } while (0)

#define MMIO_READ32(addr)                               \
    __extension__ ({                                     \
        unsigned int _mmio_v = *(reg32_t *)(addr);        \
        __asm__ volatile("nop");                           \
        _mmio_v;                                            \
    })

#define ASCON_BASE 0x40000000u
#define UART_BASE  0x40001000u
#define GPIO_BASE  0x40002000u
#define SPI_BASE   0x40003000u
#define I2C_BASE   0x40004000u
#define PLIC_BASE  0x40005000u
#define CLINT_BASE 0x40007000u

#endif // SOC_REGS_H
