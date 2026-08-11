ENTRY(_start)

MEMORY {
    IMEM (rx)  : ORIGIN = 0x80000000, LENGTH = 4k
    DMEM (rwx) : ORIGIN = 0x80001000, LENGTH = 16k   /* ✅ FIXED */
}

SECTIONS {

    .text :
    {
        . = ALIGN(4);
        KEEP(*(.init))
        *(.text .text.*)
        . = ALIGN(4);
    } > IMEM

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata .rodata.*)
        . = ALIGN(4);
    } > DMEM

    .data :
    {
        . = ALIGN(4);
        _data_start = .;
        *(.data .data.*)
        *(.sdata .sdata.*) 
        . = ALIGN(4);
        _data_end = .;
    } > DMEM

    .bss :
    {
        . = ALIGN(4);
        _bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(4);
        _bss_end = .;
    } > DMEM

    .stack (NOLOAD) :
    {
        . = ALIGN(16);
        _stack_bottom = .;
        . = . + 512; 
        _stack_top = .;
    } > DMEM
}