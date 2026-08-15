#ifndef PLIC_DRIVER_H
#define PLIC_DRIVER_H

// Disable every source, clear every priority, set threshold to its
// most-permissive value (0). Defensive baseline before the
// application enables exactly the sources it wants.
void plic_init(void);

// source: 1..30 (register-visible numbering -- see plic_test.s's
// header comment for this SoC's source assignment: 1=uart, 2=gpio,
// 3=i2c, 4/5=spi). priority: any nonzero value clears PLIC's default
// threshold of 0.
void plic_enable_source(unsigned int source, unsigned int priority);
void plic_disable_source(unsigned int source);

// Target 0's claim/complete register (read = claim, write = complete).
unsigned int plic_claim(void);
void plic_complete(unsigned int source);

#endif // PLIC_DRIVER_H
