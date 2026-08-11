ENTRY(_start)

MEMORY {
    /* 1024 x 32-bit words -- must match rtl/IF/instruction_memory.v's
       imem[0:1023] array exactly. .rodata lives here permanently
       (read in place over the new imem data port) and .data is staged
       here at its LMA so crt0 can copy it into DMEM at boot. */
    IMEM (rx)  : ORIGIN = 0x80000000, LENGTH = 4k
    DMEM (rwx) : ORIGIN = 0x80010000, LENGTH = 16k   /*  FIXED */
}

SECTIONS {

    .text :
    {
        . = ALIGN(4);
        KEEP(*(.init))
        *(.text .text.*)
        . = ALIGN(4);
    } > IMEM

    /* Read-only, so it never needs relocating -- stays in IMEM at
       runtime and is read directly over imem's data port. */
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata .rodata.*)
        . = ALIGN(4);
    } > IMEM

    /* Runs (VMA) out of DMEM since it's writable, but its initial
       values are staged (LMA) in IMEM right after .rodata; crt0 copies
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