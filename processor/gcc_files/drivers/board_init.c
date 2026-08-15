#include "uart_driver.h"
#include "gpio_driver.h"
#include "spi_driver.h"
#include "clint_driver.h"
#include "plic_driver.h"

// Real board_init(), overriding crt0.S's weak no-op default. crt0.S
// calls board_init() after zeroing .bss and before main(); run.sh
// links this file (and the rest of gcc_files/drivers/) into every C
// build, so this non-weak definition is what actually runs.
//
// Brings every peripheral to a known, safe, interrupt-quiet state:
//   - UART:  baud divisor + 8N1 (tests/directed/uart_test.s's config)
//   - GPIO:  every pin INPUT_ONLY, input synchronizers enabled
//   - SPI:   CLKDIV programmed, no transaction started
//   - CLINT: mtimecmp parked far in the future, msip cleared
//   - PLIC:  every source disabled, threshold at its most-permissive
//            value
//
// Deliberately does NOT touch mstatus.MIE/mie, and does NOT call
// plic_enable_source() for anything -- enabling interrupts is an
// application decision, not a board bring-up one. An application that
// wants a given peripheral's interrupt still calls
// plic_enable_source() and sets mie/mstatus itself, exactly like
// every tests/directed/*_irq_test.s already does by hand.
//
// Only wired into the RTL-only build (run.sh), not run_assembly.sh's
// Spike side -- Spike has no model of these peripherals (see
// run_assembly.sh's README note), so real MMIO writes to their
// addresses would fault there.
void board_init(void)
{
    uart_init(2);
    gpio_init();
    spi_init(4);
    clint_init();
    plic_init();
}
