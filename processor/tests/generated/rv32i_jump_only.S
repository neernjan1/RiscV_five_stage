.section .text
.globl _start
_start:

                  bgeu        a3, s5, 12f
                  nop
                  srl         a4, sp, s10
                  addi        gp, t5, 843
                  add         s5, s6, a6
                  lui         a0, 159921
                  sll         zero, s1, a4
                  beq         s5, a7, 12f
                  bgeu        s0, ra, 12f
                  xor         s11, t6, t3
                  andi        a6, t1, -403
main_0:           jal         s8, 2f
0:                jal         t6, 10f
1:                jal         ra, 22f
2:                jal         s3, 18f
3:                jal         ra, 13f
4:                jal         s0, 3b
5:                jal         ra, 19f
6:                jal         ra, 0b
7:                jal         ra, 17f
8:                jal         ra, 4b
9:                jal         ra, 20f
10:               jal         s5, 11f
11:               jal         ra, 25f
12:               jal         s9, 7b
13:               jal         t0, 6b
14:               jal         ra, 8b
15:               jal         gp, 16f
16:               jal         a0, 23f
17:               jal         t6, 14b
18:               jal         ra, 1b
19:               jal         ra, 21f
20:               jal         ra, 24f
21:               jal         ra, 15b
22:               jal         ra, 5b
23:               jal         t3, 9b
24:               jal         ra, 12b
25:               ori         t0, s9, 177
12:               auipc       a2, 645414
                 jal x0, test_done 
                  li gp, 1


test_done:
    beq x0, x0, test_done
