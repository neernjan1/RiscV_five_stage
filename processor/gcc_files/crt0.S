.section .init
.globl _start

_start:
    la    sp, _stack_top

    # Copy .data's initial values from their load address in IMEM
    # (_data_load_start, see gcc_files/link.ld) to their run address in
    # DMEM (_data_start.._data_end), e.g. tst.c's
    # `volatile int arr[16] = {16,3,...}`. Needs instruction_memory's
    # read-only data port (rtl/IF/instruction_memory.v) wired into the
    # load/store bus via addr_decoder's sel_imem -- without that, this
    # loop reads garbage/zeros instead of the initializer values.
    la    t0, _data_load_start
    la    t1, _data_start
    la    t2, _data_end
data_copy_loop:
    bge   t1, t2, data_copy_done
    lw    t3, 0(t0)
    sw    t3, 0(t1)
    addi  t0, t0, 4
    addi  t1, t1, 4
    j     data_copy_loop
data_copy_done:

    # Zero .bss. link.ld defines _bss_start/_bss_end (both word-aligned),
    # and a C global with no initializer (e.g. tst.c's `volatile int
    # result;`) is only guaranteed to read back as zero if something
    # actually clears it -- nothing else in this flow does.
    la    t0, _bss_start
    la    t1, _bss_end
bss_clear_loop:
    bge   t0, t1, bss_clear_done
    sw    zero, 0(t0)
    addi  t0, t0, 4
    j     bss_clear_loop
bss_clear_done:

    # Optional peripheral bring-up hook, for future use. Weak so this
    # build links the no-op default below; a future C file can define its
    # own non-weak board_init() (same name, no args/return) to override
    # it with real driver setup -- see gcc_files/board_init_example.c for
    # a template.
    call  board_init

    jal   ra, main

trap:
    j     trap

.weak board_init
board_init:
    ret
