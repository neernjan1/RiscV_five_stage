#ifndef CLINT_DRIVER_H
#define CLINT_DRIVER_H

// Park mtimecmp far in the future and clear msip. Same precaution
// tests/directed/clint_timer_test.s and soc_integration_test.s take
// before enabling mie.MTIE/MSIE, so nothing fires on stale/default
// register contents before the application arms its own timer or IPI.
void clint_init(void);

unsigned int clint_get_mtime(void);

// Arms mtimecmp at (current mtime + delta_ticks). Doesn't touch
// mie/mstatus -- the application enables mie.MTIE itself when ready.
void clint_arm_timer(unsigned int delta_ticks);

void clint_trigger_ipi(void);
void clint_clear_ipi(void);

#endif // CLINT_DRIVER_H
