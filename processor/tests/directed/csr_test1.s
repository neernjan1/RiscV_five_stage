.section .text
.globl _start

_start:

addi x1,x0 , 0x100
addi x0, x0 ,0
addi x0, x0 ,0



csrrw x2, mtvec, x1

csrrw x3, mtvec, x0

done:
beq x0,x0,done
