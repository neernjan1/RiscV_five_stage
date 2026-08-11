ENTRY(_start)

SECTIONS {
    . = 0x80000000;

    .text : {
        . = ALIGN(4);
        *(.init)
        *(.text*)
        . = ALIGN(4);
    }

    .rodata : {
        . = ALIGN(4);
        *(.rodata*)
        . = ALIGN(4);
    }

    .data : {
        . = ALIGN(4);
        _data_start = .;
        *(.data*)
        . = ALIGN(4);
        _data_end = .;
    }

    .bss : {
        . = ALIGN(4);
        _bss_start = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _bss_end = .;
    }

    /* Stack */
    .stack (NOLOAD) : {
        . = ALIGN(16);
        _stack_bottom = .;
        . = . + 1024;   /* 1KB stack */
        _stack_top = .;
    }
}