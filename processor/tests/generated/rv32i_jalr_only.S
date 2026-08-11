.section .text
.globl _start

_start:

    la t0, L1
    jalr x0, t0, 0

L1:
    la t1, L2
    jalr x0, t1, 0

L2:
    la t2, L3
    jalr x0, t2, 0

L3:
    la t3, L4
    jalr x0, t3, 0

L4:
    la t4, L5
    jalr x0, t4, 0

L5:
    la t5, done
    jalr x0, t5, 0

done:
    li gp,1

hang:
    beq x0,x0,hang