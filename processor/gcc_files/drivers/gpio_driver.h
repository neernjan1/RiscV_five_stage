#ifndef GPIO_DRIVER_H
#define GPIO_DRIVER_H

// Reset every pin to INPUT_ONLY and enable every pin's input
// synchronizer. Safe baseline: nothing drives a level onto a shared
// pin before the application picks its own directions, and GPIO_IN
// reads something meaningful (synchronized, not raw/metastable) from
// the first read. An application that wants output pins calls
// gpio_set_mode() itself, same as tests/directed/gpio_test.s does by
// hand.
void gpio_init(void);

#define GPIO_MODE_INPUT_ONLY   0x0u
#define GPIO_MODE_OUTPUT_ACTIVE 0x1u
#define GPIO_MODE_OPEN_DRAIN0  0x2u
#define GPIO_MODE_OPEN_DRAIN1  0x3u

// pin: 0..31. mode: one of the GPIO_MODE_* values above.
void gpio_set_mode(unsigned int pin, unsigned int mode);

// Read-modify-write GPIO_OUT: only bits set in mask are touched.
void gpio_write(unsigned int mask, unsigned int value);

// Raw GPIO_IN (all 32 pins' synchronized input value).
unsigned int gpio_read(void);

#endif // GPIO_DRIVER_H
