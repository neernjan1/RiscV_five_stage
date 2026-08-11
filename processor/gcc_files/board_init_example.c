// board_init_example.c -- TEMPLATE, not compiled by default.
//
// crt0.S calls a weak board_init() after zeroing .bss and before main().
// The default (in crt0.S itself) is a no-op. To actually bring up a
// peripheral at boot, copy the pattern below into a real .c file that IS
// part of the build (e.g. add it alongside tst.c in run.sh's C-file
// case) -- a non-weak board_init() defined there will override crt0.S's
// default via normal linker weak-symbol resolution, no crt0.S changes
// needed.
//
// This file only shows UART, since that's the one already exercised and
// proven correct end-to-end by tests/directed/uart_test.s (baud divisor,
// LCR, 8N1). The same register-access pattern (base address + nop after
// every store, per this SoC's back-to-back-store bus quirk -- see
// clint_timer_test.s) extends to GPIO/SPI/CLINT/PLIC init the same way;
// they're left out here rather than included as untested boilerplate.

#define UART_BASE   ((volatile unsigned int *)0x40001000)
#define THR_RHR_OFF 0
#define IER_DLM_OFF 1   // word index (offset 0x4 / 4)
#define LCR_OFF     3   // word index (offset 0xC / 4)

void board_init(void)
{
    // LCR.dlab = 1: remap THR/IER to DLL/DLM for divisor programming.
    UART_BASE[LCR_OFF] = 0x80;

    // Divisor = 2 -> {DLM,DLL}-1 = 1 (valid; obi_uart_baudgen treats a
    // divisor of 0 as invalid and never toggles).
    UART_BASE[THR_RHR_OFF] = 2;   // DLL
    UART_BASE[IER_DLM_OFF] = 0;   // DLM

    // 8N1, LCR.dlab = 0: back to normal THR/RHR/IER access.
    UART_BASE[LCR_OFF] = 0x03;
}
