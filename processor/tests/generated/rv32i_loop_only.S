.section .text
.globl _start
_start:

        li x1,0
        li x2,0
        li x3,0
        li x4,0
        li x5,0
        li x6,0
        li x7,0
        li x8,0
        li x9,0
        li x10,0
        li x11,0
        li x12,0
        li x13,0
        li x14,0
        li x15,0
        li x16,0
        li x17,0
        li x18,0
        li x19,0
        li x20,0
        li x21,0
        li x22,0
        li x23,0
        li x24,0
        li x25,0
        li x26,0
        li x27,0
        li x28,0
        li x29,0
        li x30,0
        li x31,0

                      slt         s8, s8, s9
                  ori         zero, a6, -1552
                  bltu        a6, s6, 14f
                  andi        t3, a0, -1775
                  sltiu       s2, t1, -1432
                  add         a7, s9, s1
                  sra         a5, ra, t6
                  slt         ra, t5, a6
                  ori         s9, t4, -1183
                  srli        s2, tp, 22
                  sra         a6, a5, t5
                  sub         a6, s1, s2
                  add         s5, t4, a4
14:               sub         s2, tp, t2
                  xor         s10, t6, s2
                  srl         a5, s5, a3
                  lui         s7, 761860
                  nop
                  slt         zero, a3, zero
                  ori         zero, a6, -1793
                  add         zero, s2, s7
                  beq         a5, s1, 34f
                  bne         t6, a6, 35f
                  sltu        s8, s8, zero
                  slti        t1, s10, -1817
                  xor         s2, zero, t4
                  auipc       a7, 573538
                  srli        a2, a4, 4
                  bne         t4, s1, 32f
                  slt         t5, t3, s6
                  srli        a4, a2, 23
32:               add         s8, s4, t5
                  srai        zero, s7, 28
34:               add         s3, t5, s8
35:               lui         s2, 694242
                  bgeu        a7, sp, 40f
                  or          zero, t3, a1
                  ori         a5, s3, -1760
                  addi        zero, s6, 1788
40:               ori         s0, s11, 452
                  auipc       a0, 365431
                  srli        a4, t3, 24
                  bgeu        a5, t3, 56f
                  lui         zero, 916473
                  ori         s7, a0, 483
                  auipc       t5, 476863
                  addi        a1, t2, 1038
                  sll         s2, s4, s0
                  addi        s5, ra, -1520
                  xor         a4, a7, t4
                  add         s2, ra, a5
                  bltu        t5, a5, 69f
                  nop
                  bgeu        t1, s9, 73f
                  slli        zero, t3, 18
56:               lui         sp, 144671
                  slli        s10, s8, 28
                  blt         s6, s10, 65f
                  xor         zero, a6, t5
                  blt         t1, t0, 65f
                  sub         a5, s11, t5
                  add         s6, s2, s7
                  beq         t5, t2, 76f
                  slti        a3, a6, 439
65:               sltu        zero, s5, t1
                  bltu        a5, a4, 81f
                  sll         a3, t3, t4
                  add         t3, s5, a6
69:               bgeu        s4, t6, 79f
                  slt         s6, sp, s2
                  addi        a3, s8, -1495
                  slti        s6, a3, -2027
73:               xori        s3, t0, -638
                  sll         t3, zero, s6
                  lui         a2, 124457
                  slti        zero, ra, -951
                  bge         zero, s8, 94f
                  add         s7, t6, s5
main_0_0_t:       xori        a1, s1, -1717
                  sra         zero, s0, a2
                  sltu        zero, zero, zero
                  auipc       s7, 499743
                  sll         t3, zero, s6
                  addi        zero, s9, 757
                  bltu        t3, s4, main_0_0_t
                  addi        zero, s4, -956
                  slt         s8, t3, t2
                  sll         a0, sp, t2
                  andi        a4, zero, -8
main_0_1_t:       or          t1, a5, a4
                  xor         t2, t3, s5
                  sltu        ra, a3, a6
                  slti        a1, a0, 606
                  andi        a5, t6, -592
                  bgeu        zero, zero, 93f
                  bge         zero, s8, 94f
                  slti        zero, t3, -1444
                  add         a2, a6, a6
                  slt         zero, s9, s0
                  beq         t5, sp, main_0_1_t
                  ori         t4, s5, 1669
                  and         gp, s6, s5
                  sll         zero, s1, s2
76:               andi        t0, gp, 1675
                  bgeu        t6, s11, 83f
                  sltiu       s5, s8, -177
79:               bne         a0, a4, 82f
                  srai        s6, s1, 25
81:               bltu        s6, t0, 84f
82:               or          t5, t3, s8
83:               slli        t4, s10, 28
84:               sltiu       zero, t5, 1068
                  sltiu       s2, t6, 1367
                  xori        ra, a3, -1962
                  xor         zero, s10, t4
                  and         s3, sp, t3
                  lui         t3, 960340
                  bne         a6, t2, 99f
                  slt         a4, s9, s6
                  srli        s8, s7, 24
93:               and         a3, t4, s1
94:               or          a6, a5, s9
                  bltu        a6, ra, 100f
                  srai        s4, gp, 6
                  sltu        sp, t0, s7
                  add         a2, s3, sp
99:               add         t5, zero, s11
100:              or          sp, a6, s0
                  add         a6, s0, t0
                  andi        t3, s7, 635
                  srl         t2, ra, s5
                  slt         s2, a4, t6
                  add         s4, s4, s3
                  xori        s10, zero, -1449
                  auipc       ra, 181313
                  slli        a2, a6, 18
                  add         s3, s10, t3
                  bne         s8, gp, 113f
                  or          s2, t4, s4
                  xori        s6, t3, 1865
113:              nop
                  ori         a7, gp, -1725
                  xori        t4, t2, -916
                  slt         a3, a5, s11
                  beq         a0, s3, 137f
                  andi        a0, tp, 1303
                  and         zero, s6, t3
                  bne         t5, s10, 131f
                  slti        t3, a7, -1901
                  xor         s4, s1, t3
                  beq         t3, zero, 127f
                  bgeu        s10, s11, 127f
                  sll         s5, a5, a6
                  nop
127:              sub         s6, s5, tp
                  andi        zero, a4, -2008
                  nop
                  ori         t5, zero, 8
                  auipc       s8, 556197
                  bne         zero, tp, 132f
                  slli        zero, s10, 18
main_1_0_t:       sltu        s3, zero, ra
                  beq         zero, zero, 143f
                  ori         t5, zero, 8
                  or          a0, t1, gp
                  bgeu        t5, a7, main_1_0_t
                  nop
                  slti        s1, t5, 1265
131:              srai        s10, a1, 14
132:              beq         t2, s4, 143f
                  slt         a4, a5, s5
                  beq         gp, s7, 142f
                  bne         a0, t5, 143f
                  slt         zero, a5, tp
137:              add         gp, t3, a4
                  bne         s4, s9, 143f
                  srli        a6, gp, 8
                  srl         s5, s10, t5
                  slti        a3, s1, -766
142:              slti        a4, s1, 301
143:              and         s5, ra, s6
                  la x31, test_done
                  jalr x0, x31, 0
                  li gp, 1


test_done:
    beq x0, x0, test_done
