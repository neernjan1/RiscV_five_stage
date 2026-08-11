ENTRY(_start)

MEMORY {
    /* Must match link.ld / rtl/IF/instruction_memory.v's imem[0:1023]
       exactly, so Spike and RTL place everything at identical addresses. */
    IMEM (rx)  : ORIGIN = 0x80000000, LENGTH = 4k
    DMEM (rwx) : ORIGIN = 0x80010000, LENGTH = 16k   /* changed from 0x80001000 to 0x80010000 */
}

SECTIONS {

    .text :
    {
        . = ALIGN(4);
        KEEP(*(.init))
        *(.text .text.*)
        . = ALIGN(4);
    } > IMEM

    /* Read-only, stays resident in IMEM -- no relocation needed. */
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata .rodata.*)
        . = ALIGN(4);
    } > IMEM

    /* VMA in DMEM (writable), LMA staged in IMEM; crt0 copies
       LMA -> VMA before main(). _data_load_start is the LMA. */
    .data :
    {
        . = ALIGN(4);
        _data_start = .;
        *(.data .data.*)
        *(.sdata .sdata.*)
        . = ALIGN(4);
        _data_end = .;
    } > DMEM AT> IMEM
    _data_load_start = LOADADDR(.data);

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