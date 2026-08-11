.section .init
.globl _start

_start:
    la sp, _stack_top
    jal ra, main

trap:
    j trap