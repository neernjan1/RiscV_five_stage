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

                  sltu         t3, s6, a4
                  la           s11, sub_4
                  auipc        s4, 631347
                  sll          a2, t3, t6
                  addi         s11, s11, 604
main_j4:          jalr         ra, s11, -604
                  la           a6, region_1+52161
                  la           a7, region_0+3757
                  sb           t0, 150(a6)
                  lbu          s0, -136(a7)
                  sb           tp, -20(a6)
                  lh           a1, -121(a6)
                  lbu          t4, -1330(a7)
                  lb           gp, -542(a7)
                  lb           a5, 203(a7)
                  sb           t6, 159(a6)
                  lh           s3, -1009(a7)
                  lh           t2, -1435(a7)
                  sb           s11, 96(a6)
                  lbu          t4, -805(a7)
                  lbu          s0, -108(a6)
                  sb           t0, -1734(a7)
main_13:          jal          ra, 22f
0:                jal          t1, 10f
1:                jal          a4, 9f
2:                jal          a2, 5f
3:                jal          ra, 6f
4:                jal          t1, 21f
5:                jal          a5, 13f
6:                jal          ra, 14f
7:                jal          t1, 1b
8:                jal          t1, 20f
9:                jal          gp, 12f
10:               jal          a0, 23f
11:               jal          ra, 17f
12:               jal          ra, 8b
13:               jal          t2, 0b
14:               jal          ra, 4b
15:               jal          ra, 11b
16:               jal          ra, 2b
17:               jal          ra, 3b
18:               jal          tp, 7b
19:               jal          t1, 15b
20:               jal          t6, 19b
21:               jal          sp, 16b
22:               jal          t1, 18b
23:               jal          ra, 24f
24:               jal          s2, 25f
25:               and          sp, s2, s2
                  la           s11, region_0+3353
                  lbu          t1, 121(s11)
                  la           ra, region_1+64017
                  sb           t0, 15(ra)
                  lhu          s5, -15(s11)
                  lbu          a7, -8(ra)
                  lw           t2, 67(s11)
                  lb           s10, 116(s11)
                  lbu          s3, -14(ra)
                  lb           a4, 2(ra)
                  lbu          a4, 182(s11)
                  sb           t0, 16(ra)
                  sb           s1, -237(s11)
                  la           sp, region_0+3279
                  sra          t4, a4, a2
                  srai         t1, s10, 7
                  sh           a6, 11(sp)
                  lb           a2, -4(sp)
                  sb           s7, -2(sp)
                  lbu          s9, -11(sp)
                  lb           t1, 15(sp)
                  srai         t4, s3, 24
                  sb           a3, 8(sp)
                  lb           tp, -9(sp)
                  addi         gp, t3, -1401
                  slli         t1, t0, 14
                  lhu          a1, 11(sp)
                  xor          a1, tp, s4
                  xori         a6, s7, -732
                  lui          s0, 693312
                  sltu         s3, s3, sp
                  sb           s7, -6(sp)
                  srl          tp, t1, sp
                  lh           zero, -13(sp)
                  lbu          a5, 8(sp)
                  lb           a4, -8(sp)
                  la           s3, region_0+3181
                  lb           t6, -40(s3)
                  lbu          s9, 64(s3)
                  add          a5, s9, s11
                  lw           s1, 11(s3)
                  lb           t6, -25(s3)
                  sb           s0, 53(s3)
                  xor          s11, t6, s0
                  srai         s9, t6, 3
                  srl          a5, s0, s0
                  sltu         t6, a5, a5
                  lb           s11, -40(s3)
                  lbu          s1, 6(s3)
                  slli         s11, s1, 19
                  sb           s1, -12(s3)
                  auipc        s9, 735418
                  sltiu        s1, a5, 296
                  xor          t6, s1, a5
                  andi         t6, s1, -450
                  sltiu        a5, s9, -889
                  srli         a5, s0, 3
                  sra          s1, a5, t6
                  lw           s11, 47(s3)
                  sra          s0, a5, t6
                  lh           s9, -29(s3)
                  lbu          s9, 56(s3)
                  lbu          s0, 53(s3)
                  srl          a5, t6, s1
                  sltiu        s0, t6, -1132
                  lbu          s0, -34(s3)
                  la           s3, region_1+51202
                  la           t6, region_1+1976
                  lw           s2, 1922(s3)
                  lb           s11, 767(s3)
                  la           t5, region_1+39035
                  la           s4, region_1+49588
                  sw           s7, -1655(t5)
                  sb           a7, 748(t5)
                  lb           t1, 11(t6)
                  lb           s2, -231(s4)
                  lbu          t1, 1642(t5)
                  lbu          t4, -839(s3)
                  lb           sp, 42(t6)
                  sw           t2, -1587(t5)
                  lb           s8, 133(s4)
                  sb           s6, -1395(s3)
                  lbu          a3, 900(s3)
                  sh           s9, -1465(t5)
                  sb           s6, 285(s3)
                  lbu          t4, 26(t6)
                  lbu          s9, -1773(s3)
                  lb           s9, -1270(s3)
                  lh           tp, -1705(t5)
                  lw           t3, 32(t6)
                  lb           t1, -47(t6)
                  lbu          s5, 1123(s3)
                  sh           s8, 0(s4)
                  sh           s4, 1598(s3)
                  lb           zero, -3(t6)
                  sw           s7, -16(s4)
                  lbu          t3, -830(t5)
                  lhu          a4, -238(s4)
                  addi         s3, zero, -10
                  sltu         s5, a7, t3
                  sub          s0, a2, a3
                  lui          a5, 182701
                  sltiu        s1, a0, -255
                  sra          t2, tp, s4
                  xor          zero, a2, t1
                  addi         s4, zero, -12
                  add          a3, t3, a2
                  nop
                  sltiu        gp, sp, -668
                  sltiu        a4, t2, 1149
                  or           s11, s9, s9
                  sra          s0, t4, s2
main_37_0_t:      andi         s2, a7, 1065
                  addi         s3, s3, -4
                  srli         a3, s11, 5
                  bge          s3, s4, main_37_0_t
                  slti         t5, tp, -1289
                  la           s10, region_1+7719
                  la           a5, region_1+18053
                  lw           s9, 45(s10)
                  lb           a3, 785(a5)
                  lbu          ra, 33(s10)
                  sh           s7, -39(s10)
                  la           a6, region_1+21573
                  sb           zero, -1510(a5)
                  sb           s10, 298(a5)
                  lhu          a1, 1(a6)
                  lh           t3, 51(s10)
                  lb           a4, 2018(a5)
                  sb           gp, -443(a5)
                  lbu          t3, 22(a6)
                  lhu          s11, -27(s10)
                  lb           s8, 10(a6)
                  lb           t6, 1141(a5)
                  lb           ra, 34(a6)
                  lhu          ra, 21(s10)
                  lbu          s11, -9(s10)
                  sb           t1, 4(a6)
                  lb           a7, 55(s10)
                  sw           s6, 915(a5)
                  lhu          a2, 35(a6)
                  lbu          s4, 32(s10)
                  lh           t2, 1329(a5)
                  lhu          s4, -777(a5)
                  lb           tp, 64(a6)
                  sw           s6, -5(a6)
                  lbu          gp, -62(s10)
                  sb           s1, 1114(a5)
                  la           a6, region_0+2005
                  andi         a4, t3, -506
                  auipc        gp, 837369
                  add          s10, t3, t3
                  sb           a4, 108(a6)
                  lb           s10, 224(a6)
                  lb           t3, -150(a6)
                  lbu          t3, 232(a6)
                  lh           t3, 253(a6)
                  lw           s10, 51(a6)
                  lb           s8, 62(a6)
                  lbu          a4, -44(a6)
                  lui          s10, 543884
                  and          gp, s10, s8
                  sltiu        gp, s8, 1521
                  sb           a3, -97(a6)
                  sltiu        t3, t3, 1464
                  lbu          gp, -94(a6)
                  lh           s8, -123(a6)
                  lb           t3, -228(a6)
                  add          s8, t3, gp
                  andi         t3, gp, 279
                  ori          s8, a4, 1433
                  lbu          gp, 236(a6)
                  lhu          gp, -203(a6)
                  lbu          s8, 97(a6)
                  sb           a4, 39(a6)
                  and          s10, a4, gp
                  lhu          a4, -155(a6)
                  sll          a3, gp, gp
                  or           s8, t3, a4
                  sb           s10, 248(a6)
                  auipc        s8, 123666
                  srai         gp, a4, 21
                  sb           s8, -93(a6)
                  la           t1, region_0+694
                  la           t3, region_0+2808
                  la           s11, region_0+4022
                  la           s5, region_0+2195
                  sb           s9, -2(s5)
                  lbu          a3, 126(t1)
                  lbu          tp, 11(s11)
                  sh           a0, -6(t3)
                  la           t6, region_0+1237
                  sb           gp, -8(s5)
                  lb           tp, -689(t1)
                  lb           ra, -9(s11)
                  sb           t3, 9(t3)
                  lh           a1, -29(t6)
                  lbu          s3, 327(t1)
                  sb           a4, -15(t3)
                  lbu          ra, -3(t6)
                  lb           s0, 15(t3)
                  lb           tp, 13(s11)
                  sb           t5, 381(t1)
                  lb           t2, -591(t1)
                  lbu          s10, 5(s5)
                  lb           sp, 28(t6)
                  lhu          s0, 244(t1)
                  sb           t0, 4(s11)
                  lhu          a3, -13(s5)
                  sb           zero, -11(s11)
                  lb           s4, 11(t3)
                  sb           tp, 4(s5)
                  lhu          ra, -264(t1)
                  lbu          ra, -52(t6)
                  lhu          a7, 6(t3)
                  lbu          ra, -2(s11)
                  sb           s8, 44(t6)
main_10:          jal          ra, 1f
0:                jal          ra, 10f
1:                jal          ra, 19f
2:                jal          ra, 24f
3:                jal          ra, 27f
4:                jal          a6, 17f
5:                jal          t4, 29f
6:                jal          ra, 9f
7:                jal          ra, 3b
8:                jal          ra, 13f
9:                jal          t1, 25f
10:               jal          s9, 28f
11:               jal          ra, 6b
12:               jal          t1, 15f
13:               jal          ra, 0b
14:               jal          ra, 20f
15:               jal          t1, 5b
16:               jal          ra, 14b
17:               jal          ra, 8b
18:               jal          ra, 7b
19:               jal          t1, 12b
20:               jal          ra, 4b
21:               jal          ra, 26f
22:               jal          gp, 21b
23:               jal          t6, 11b
24:               jal          ra, 30f
25:               jal          ra, 18b
26:               jal          ra, 2b
27:               jal          ra, 22b
28:               jal          ra, 23b
29:               jal          ra, 16b
30:               auipc        t3, 428010
main_14:          jal          ra, 9f
0:                jal          ra, 14f
1:                jal          ra, 5f
2:                jal          ra, 8f
3:                jal          ra, 2b
4:                jal          gp, 15f
5:                jal          t1, 16f
6:                jal          ra, 0b
7:                jal          sp, 10f
8:                jal          ra, 11f
9:                jal          t1, 7b
10:               jal          t1, 3b
11:               jal          ra, 12f
12:               jal          ra, 4b
13:               jal          t1, 6b
14:               jal          ra, 1b
15:               jal          ra, 13b
                  la           a7, region_0+1733
                  la           s10, region_1+57180
                  lb           zero, -4(a7)
                  lhu          s9, -102(s10)
                  lbu          s3, 16(a7)
                  sb           t6, 1678(s10)
                  sb           a6, 3(a7)
                  sb           gp, -1647(s10)
                  lhu          s8, -330(s10)
                  lb           s8, -16(a7)
                  lbu          s8, -15(a7)
                  lhu          a1, 1982(s10)
                  lbu          t4, 0(a7)
                  lw           a2, -384(s10)
                  lbu          s5, 10(a7)
                  lbu          gp, 1605(s10)
                  lbu          s11, -1(a7)
                  sb           gp, 63(s10)
                  lhu          s4, -15(a7)
                  la           sp, region_1+49498
                  lbu          s10, -1(sp)
                  ori          s10, s10, 1014
                  sb           s8, 63(sp)
                  sb           a1, 25(sp)
                  slt          a3, s3, a2
                  lh           s3, -40(sp)
                  sb           a3, 43(sp)
                  lb           a2, -64(sp)
                  sb           s10, 39(sp)
                  sw           a1, 46(sp)
                  lbu          a1, 43(sp)
                  lh           s3, -26(sp)
                  srl          s8, a2, s8
                  lb           s8, -4(sp)
                  slli         s10, s8, 14
                  and          s10, a3, s3
                  lb           a1, 55(sp)
                  lbu          a2, 33(sp)
                  lh           s3, -36(sp)
                  lb           s8, -55(sp)
                  auipc        a3, 918006
                  lb           a3, 27(sp)
                  lhu          s10, -40(sp)
                  lui          s3, 59870
                  auipc        a1, 189120
                  lh           s10, 56(sp)
                  srli         a2, s8, 23
                  lbu          a3, 59(sp)
                  sh           a3, 62(sp)
                  lh           a2, -46(sp)
                  lbu          s3, 19(sp)
                  sb           a1, -63(sp)
                  sra          a3, a3, s10
                  lb           a3, 62(sp)
                  la           s4, region_0+3233
                  slti         t4, s7, 1520
                  sh           ra, -775(s4)
                  srli         s9, t6, 2
                  auipc        s10, 144904
                  sw           s9, 819(s4)
                  and          s0, ra, s6
                  slli         s0, s4, 12
                  addi         s0, s5, 155
                  lbu          s1, -660(s4)
                  sll          s10, sp, zero
                  sb           a3, -682(s4)
                  sw           s3, -277(s4)
                  sltiu        a7, zero, 573
                  lbu          a3, -814(s4)
                  and          a5, s6, s1
                  lui          s9, 165592
                  sh           zero, -1915(s4)
                  lbu          s5, 456(s4)
                  sltiu        t2, a6, 145
                  lbu          t6, -1731(s4)
                  srl          t3, a4, a4
                  lh           s11, -605(s4)
                  lh           s8, -1921(s4)
                  auipc        s0, 855214
                  add          sp, t1, tp
                  lui          t2, 430372
                  andi         t4, a7, -918
                  lb           a1, -839(s4)
                  sh           s7, -779(s4)
                  lbu          s9, -1766(s4)
                  lbu          s2, -456(s4)
                  lb           a4, -948(s4)
                  slt          a2, a1, a3
                  sll          s11, a7, zero
                  sb           t5, -1640(s4)
                  srl          tp, a0, zero
                  slt          a3, a2, a7
                  lhu          s2, -355(s4)
                  sb           t1, 206(s4)
                  lbu          a7, -318(s4)
                  addi         a4, zero, -2
                  addi         t1, zero, 19
main_34_0_t:      slt          a5, s7, s7
                  addi         a4, a4, 2
                  bltu         a4, t1, main_34_0_t
                  la           a3, region_0+1187
                  andi         t3, a2, -285
                  sb           a1, -15(a3)
                  xori         zero, s1, -708
                  lb           t5, -22(a3)
                  sb           t6, -22(a3)
                  lb           s4, -22(a3)
                  lbu          s9, -22(a3)
                  sb           s8, -152(a3)
                  sb           s5, 240(a3)
                  sh           tp, 117(a3)
                  sw           a5, 145(a3)
                  lbu          s5, 145(a3)
                  slti         a5, sp, 1168
                  lb           a1, 249(a3)
                  ori          t3, s11, -996
                  lb           t1, 0(a3)
                  lbu          s8, -106(a3)
                  sb           a0, -35(a3)
                  la           s11, region_1+51787
                  sb           s7, -242(s11)
                  sll          t1, s5, s0
                  lb           s4, -94(s11)
                  sub          s0, a6, s1
                  auipc        a1, 639694
                  nop
                  and          s9, s2, a6
                  lb           s4, -17(s11)
                  lb           s9, -240(s11)
                  srai         s9, t6, 17
                  auipc        s9, 774464
                  sh           s1, -225(s11)
                  addi         a6, s8, -389
                  lb           t4, -24(s11)
                  sra          s9, s7, s2
                  xor          a4, a4, ra
                  lb           a7, -60(s11)
                  sb           s11, 126(s11)
                  sub          s10, s6, s6
                  addi         t2, s10, -1179
                  lui          a1, 791316
                  sltiu        t6, s4, -441
                  lb           t2, 0(s11)
                  slt          s10, a7, t5
                  sw           s3, -247(s11)
                  srl          t4, a7, a3
                  xor          s10, zero, a5
                  sltiu        s9, a4, -1511
                  slt          t6, s3, ra
                  or           s2, t5, s6
                  srai         a4, t0, 15
                  lb           a1, 188(s11)
                  lb           a6, -69(s11)
                  la           s0, region_1+54076
                  lbu          s3, -54(s0)
                  andi         t6, a0, 1414
                  lbu          zero, -8(s0)
                  lbu          a2, -59(s0)
                  xori         a2, a2, -1083
                  lb           zero, 44(s0)
                  lui          zero, 420272
                  lbu          a0, 47(s0)
                  sra          t6, t6, s3
                  auipc        t6, 1013639
                  add          a0, tp, tp
                  lb           tp, 35(s0)
                  srl          a0, zero, tp
                  lb           zero, -15(s0)
                  lbu          tp, 17(s0)
                  add          a2, tp, a2
                  lbu          a2, 53(s0)
                  auipc        s3, 120136
                  lb           t6, -24(s0)
                  sh           s3, -6(s0)
                  lbu          a0, -11(s0)
                  sb           a0, 13(s0)
                  auipc        s3, 524035
                  sw           s3, -16(s0)
                  lh           zero, 14(s0)
                  lb           tp, -26(s0)
                  sw           a0, 64(s0)
                  slli         a2, a0, 6
                  sub          a0, tp, s3
                  slli         a2, t6, 15
                  sb           s3, -39(s0)
                  lh           t6, -54(s0)
                  lui          a2, 272200
                  auipc        a2, 562182
                  nop
                  lb           zero, 59(s0)
                  lb           zero, -63(s0)
                  srl          t6, zero, tp
                  ori          s3, tp, 1065
                  lbu          s3, 1(s0)
                  slti         tp, tp, 1945
                  sb           t6, -9(s0)
                  srai         a2, tp, 2
                  andi         s3, s3, 1291
                  lb           a0, -17(s0)
                  add          a2, zero, zero
                  lb           zero, -11(s0)
main_8:           jal          ra, 4f
0:                jal          ra, 1f
1:                jal          t3, 8f
2:                jal          ra, 6f
3:                jal          s1, 0b
4:                jal          ra, 7f
5:                jal          ra, 15f
6:                jal          t1, 17f
7:                jal          gp, 10f
8:                jal          ra, 16f
9:                jal          ra, 12f
10:               jal          gp, 3b
11:               jal          tp, 14f
12:               jal          t1, 11b
13:               jal          t2, 9b
14:               jal          ra, 2b
15:               jal          ra, 13b
16:               jal          ra, 5b
17:               sltu         t3, a1, s6
                  la           tp, region_0+1476
                  sltiu        t5, s2, -628
                  lb           s2, -13(tp)
                  slt          t4, t5, t5
                  slli         t5, a3, 16
                  lbu          t5, -13(tp)
                  lbu          t2, -60(tp)
                  slli         s2, t2, 31
                  lbu          a2, -25(tp)
                  lb           t4, 3(tp)
                  sh           t2, -36(tp)
                  sb           a3, -37(tp)
                  sh           t5, -18(tp)
                  slti         a2, a3, -1997
                  lbu          t4, 3(tp)
                  lbu          a3, -58(tp)
                  addi         s2, a2, 1146
                  auipc        a3, 134545
                  lb           t4, -4(tp)
                  sb           a3, -10(tp)
                  slt          t5, a3, a3
                  andi         a3, t4, 1749
                  lb           t5, 25(tp)
                  ori          t2, t2, -33
                  sb           t2, -54(tp)
                  sh           s2, -44(tp)
                  sll          t5, t2, t4
                  lb           s2, 23(tp)
                  lhu          s2, 12(tp)
                  xori         t2, s2, -1383
                  sh           t4, -22(tp)
                  sb           a3, -44(tp)
                  lbu          s2, 7(tp)
                  andi         a3, s2, 319
                  lb           s2, -37(tp)
                  lb           s2, -41(tp)
                  sra          s2, a3, t4
                  lbu          a3, -1(tp)
                  sb           t5, 3(tp)
                  sh           t2, -58(tp)
                  lbu          a3, 35(tp)
                  sub          s2, a3, t5
                  srl          t5, s2, s2
                  lbu          t4, -23(tp)
                  lbu          a2, -57(tp)
                  lh           a3, -48(tp)
                  la           ra, region_0+2660
                  lhu          s11, 472(ra)
                  la           s9, region_1+22109
                  lh           gp, -241(s9)
                  sb           sp, -137(s9)
                  lbu          s10, 225(ra)
                  sh           a0, 233(s9)
                  sb           a3, -1322(ra)
                  lb           s10, 240(s9)
                  sb           t4, 1255(ra)
                  lh           gp, 235(s9)
                  lb           s5, -417(ra)
                  lhu          s1, -55(s9)
                  sh           t4, 266(ra)
                  lbu          a6, -26(ra)
                  lbu          t2, 197(s9)
                  sb           gp, -176(s9)
                  la           sp, region_1+9629
                  lb           t1, -12(sp)
                  nop
                  sltiu        s0, a0, 1670
                  lb           s11, -12(sp)
                  sll          ra, t1, s5
                  lb           s10, -12(sp)
                  slti         s5, s7, -471
                  lb           a3, -12(sp)
                  lbu          a1, -12(sp)
                  sb           s2, -12(sp)
                  slt          s9, a2, a6
                  slti         a2, ra, 1884
                  lb           gp, -12(sp)
                  sb           s0, -12(sp)
                  lb           s11, -12(sp)
                  lb           s3, -12(sp)
                  lb           zero, -12(sp)
                  la           sp, region_0+3576
                  lhu          s10, -38(sp)
                  or           t6, t3, t3
                  srli         ra, t6, 9
                  sb           t0, -14(sp)
                  sb           s7, -11(sp)
                  lbu          s0, 2(sp)
                  andi         s4, sp, -578
                  lbu          a3, 34(sp)
                  sltu         s3, t2, a7
                  sh           zero, 30(sp)
                  lb           s4, -6(sp)
                  lh           a7, -60(sp)
                  sb           s5, -46(sp)
                  sb           s9, -9(sp)
                  srai         t4, a5, 0
                  sltiu        t3, s3, -1741
                  slti         a7, t6, 1668
                  lb           t5, -3(sp)
                  sh           ra, 30(sp)
                  lh           a0, 6(sp)
                  add          s2, ra, a1
                  srai         a7, t1, 13
                  lbu          gp, 23(sp)
                  sb           s11, -24(sp)
                  lhu          a3, 38(sp)
                  la           a4, region_0+606
                  la           t2, region_1+45002
                  sw           s2, 18(a4)
                  sb           a3, 181(t2)
                  lb           t6, -73(a4)
                  lb           a5, 123(t2)
                  sh           t4, -104(a4)
                  lbu          t5, 221(t2)
                  lbu          a7, 199(a4)
                  lbu          s3, -145(a4)
                  lb           ra, 145(t2)
                  lbu          a6, -84(a4)
                  sh           t0, 214(t2)
                  sh           t0, -186(a4)
                  lbu          s9, 83(a4)
                  lb           t4, -224(t2)
                  sb           t0, -136(t2)
                  lbu          a7, -117(a4)
                  sb           s0, -105(t2)
                  addi         sp, zero, -9
                  lui          s3, 758524
                  srl          s3, s2, s2
                  addi         t2, zero, 15
main_36_1_t:      addi         t1, s7, 1685
                  sll          a4, s8, t4
                  and          a3, a1, s2
                  addi         sp, sp, 1
                  andi         a1, zero, 342
                  addi         s1, zero, -2
                  or           a2, s2, a2
                  addi         s5, zero, -17
                  sltiu        a5, t3, -1310
main_36_0_t:      addi         s11, s5, 5
                  andi         t5, s11, -400
                  srli         s0, s10, 17
                  addi         s1, s1, -3
                  and          gp, t3, t2
                  bge          s1, s5, main_36_0_t
                  or           s4, a7, s0
                  bne          sp, t2, main_36_1_t
                  auipc        t1, 211038
main_11:          jal          ra, 4f
0:                jal          ra, 13f
1:                jal          t1, 15f
2:                jal          ra, 10f
3:                jal          ra, 7f
4:                jal          ra, 0b
5:                jal          ra, 20f
6:                jal          ra, 1b
7:                jal          t1, 6b
8:                jal          ra, 17f
9:                jal          ra, 18f
10:               jal          a3, 5b
11:               jal          ra, 16f
12:               jal          t1, 2b
13:               jal          t1, 11b
14:               jal          t1, 12b
15:               jal          ra, 8b
16:               jal          ra, 9b
17:               jal          ra, 14b
18:               jal          t1, 19f
19:               jal          ra, 3b
20:               xori         t1, ra, -841
                  la           s0, region_0+2636
                  la           t1, region_1+61688
                  lw           a7, -1340(s0)
                  lhu          zero, 222(t1)
                  lb           tp, -1424(s0)
                  sb           s1, 143(t1)
                  lbu          a5, 366(s0)
                  lb           s4, 250(t1)
                  lb           a7, -1197(s0)
                  lbu          zero, 211(t1)
                  lb           a2, -53(t1)
                  lbu          zero, 857(s0)
                  lh           a0, -1228(s0)
                  la           a5, region_1+57918
                  la           s1, region_1+55550
                  sh           tp, -1816(a5)
                  lw           t6, -98(s1)
                  sh           a2, -238(s1)
                  sb           s1, -1376(a5)
                  lb           s8, 1677(a5)
                  lb           tp, -233(s1)
                  sb           sp, 144(s1)
                  lb           a6, 195(a5)
                  lh           s0, -158(s1)
                  sb           tp, 135(s1)
                  sh           s1, 1244(a5)
                  sh           a5, -1720(a5)
                  lbu          t6, 99(s1)
                  lbu          s5, -685(a5)
                  lbu          a3, 0(s1)
                  addi         a7, zero, 3
                  nop
                  add          a2, sp, s1
                  sub          s4, a3, s1
                  addi         s5, zero, -16
main_32_1_t:      xori         t3, t1, -1951
                  sltiu        t1, s4, -1006
                  addi         a7, a7, -3
                  and          a4, sp, s0
                  addi         ra, zero, -2
                  addi         s1, zero, 2
                  nop
main_32_0_t:      sltiu        s11, tp, -1214
                  addi         ra, ra, 1
                  nop
                  auipc        t1, 548492
                  sltu         t5, a1, s1
                  slti         a1, a1, -725
                  sltu         a4, a4, tp
                  slt          a3, s0, a0
                  bltu         ra, s1, main_32_0_t
                  auipc        a4, 559967
                  bge          a7, s5, main_32_1_t
                  srl          zero, zero, s11
                  la           sp, region_0+3338
                  andi         a6, a7, -1043
                  srli         t5, t5, 0
                  lbu          t4, 141(sp)
                  slti         s9, a6, 1946
                  lh           a6, 150(sp)
                  lbu          ra, 152(sp)
                  srli         t3, ra, 28
                  slti         gp, t6, 1131
                  sltiu        a4, t4, -1795
                  srai         s2, s8, 12
                  lbu          s1, -107(sp)
                  lb           a5, -180(sp)
                  add          a4, s3, s2
                  slti         s11, sp, -309
                  slti         t6, gp, 1741
                  lh           s2, -130(sp)
                  auipc        t3, 301645
                  sub          a7, a3, a4
                  xori         s10, a6, -684
                  slti         a1, s11, -1441
                  sh           zero, -154(sp)
                  srli         ra, s0, 20
                  add          a6, s8, gp
                  lb           t4, 245(sp)
                  andi         t6, ra, -1808
                  sb           gp, -172(sp)
                  sll          t6, s0, tp
                  sra          t2, s7, s2
                  slli         s9, s1, 23
                  add          gp, a4, a7
                  lb           t6, -47(sp)
                  xori         s2, t3, -1641
                  sb           gp, -169(sp)
                  sb           zero, 109(sp)
                  la           s2, region_1+6008
                  lh           s1, 12(s2)
                  lb           ra, -49(s2)
                  sb           a2, -21(s2)
                  la           s8, region_0+3498
                  lb           zero, 40(s2)
                  sb           s1, 16(s8)
                  sb           s5, 30(s2)
                  lbu          s0, -8(s8)
                  lbu          t4, 16(s8)
                  sb           a0, -1(s8)
                  lbu          a0, 51(s2)
                  sb           s4, -6(s8)
                  sb           t0, 24(s2)
                  lhu          s10, -30(s2)
                  addi         t3, zero, 0
                  or           t1, tp, t1
                  addi         a0, zero, -18
                  sra          a2, s10, t3
                  srli         a2, t1, 18
                  ori          s2, s5, 1647
main_39_0_t:      xor          ra, a5, s6
                  slli         a2, a7, 30
                  addi         t3, t3, -3
                  addi         s11, s3, -818
                  sltu         s8, t4, zero
                  slt          a4, t3, s11
                  bne          t3, a0, main_39_0_t
                  addi         a4, zero, 1
                  addi         s8, zero, 6
                  lui          s11, 435643
main_38_1_t:      ori          s0, s8, -118
                  addi         a4, a4, 3
                  addi         t6, zero, -3
                  addi         a7, zero, 17
main_38_0_t:      and          t3, t1, t2
                  addi         t6, t6, 2
                  beq          t6, a7, main_38_0_t
                  xori         s0, s8, 547
                  blt          a4, s8, main_38_1_t
                  la           t4, region_0+3959
                  la           a2, region_1+15556
                  lb           a0, -15(t4)
                  sb           zero, 15(a2)
                  sb           s5, -9(a2)
                  lb           s8, 10(t4)
                  lhu          t5, 5(t4)
                  sb           a2, -11(a2)
                  lbu          s9, 8(t4)
                  lb           s5, -16(a2)
                  sb           t2, 5(t4)
                  lb           a4, 15(a2)
                  lb           s5, 11(a2)
                  lb           tp, 11(a2)
                  la           s8, region_0+3067
                  lbu          s0, 670(s8)
                  lbu          s2, 670(s8)
                  auipc        a0, 542483
                  auipc        a2, 968423
                  lb           a2, 670(s8)
                  lbu          a5, 670(s8)
                  lbu          s10, 670(s8)
                  lbu          s4, 670(s8)
                  lb           a7, 670(s8)
                  lb           a4, 670(s8)
                  srli         a0, t6, 18
                  lb           a2, 670(s8)
                  sb           s0, 670(s8)
                  sb           ra, 670(s8)
                  lb           sp, 670(s8)
main_12:          jal          ra, 15f
0:                jal          ra, 4f
1:                jal          ra, 18f
2:                jal          ra, 6f
3:                jal          ra, 0b
4:                jal          t1, 12f
5:                jal          t1, 7f
6:                jal          ra, 5b
7:                jal          t1, 16f
8:                jal          a7, 17f
9:                jal          t1, 14f
10:               jal          t1, 9b
11:               jal          a7, 10b
12:               jal          a1, 11b
13:               jal          t1, 2b
14:               jal          ra, 1b
15:               jal          ra, 8b
16:               jal          t1, 3b
17:               jal          t1, 13b
                  addi         t4, zero, -5
                  ori          a4, s3, -2000
                  andi         t3, s11, 1214
                  srl          a5, s4, zero
                  addi         s8, zero, -15
main_33_0_t:      nop
                  slt          s4, a1, a2
                  sra          gp, a5, a5
                  addi         t4, t4, -10
                  sltiu        t3, a3, 280
                  sll          tp, a5, t1
                  and          s2, s2, t2
                  nop
                  bne          t4, s8, main_33_0_t
                  sra          sp, t1, s10
                  la           s3, region_0+25
                  sh           s0, 7(s3)
                  sra          a4, s7, a3
                  sb           ra, 7(s3)
                  lb           a0, 7(s3)
                  xori         a4, t0, 1821
                  slti         s0, t6, -1121
                  and          a1, t5, t6
                  lhu          zero, 7(s3)
                  lw           a1, 7(s3)
                  slt          s4, s1, a4
                  addi         a4, tp, -677
                  slt          s2, gp, t0
                  lh           t5, 7(s3)
                  lw           s5, 7(s3)
                  lh           sp, 7(s3)
                  lb           a3, 7(s3)
                  lbu          s8, 7(s3)
                  la           a2, region_0+2495
                  la           sp, region_0+906
                  lbu          a3, -11(sp)
                  la           t4, region_0+2500
                  sb           t2, -1784(a2)
                  sb           sp, 180(a2)
                  lbu          ra, 11(t4)
                  lbu          a4, -195(sp)
                  sb           a2, -108(a2)
                  lbu          t3, 39(t4)
                  lbu          s4, -904(a2)
                  sb           s3, -7(t4)
                  lb           gp, 968(a2)
                  lbu          t3, -87(sp)
                  sb           a6, -1603(a2)
                  lbu          s3, 177(sp)
                  sw           t6, -1279(a2)
                  lb           a7, -1438(a2)
                  lbu          t1, 73(sp)
                  lbu          t6, -136(sp)
                  sb           t3, -9(t4)
                  sb           s3, 644(a2)
                  lhu          zero, -68(sp)
                  lbu          t3, -7(t4)
                  lb           s8, 178(sp)
main_15:          jal          ra, 15f
0:                jal          ra, 1f
1:                jal          ra, 11f
2:                jal          t1, 13f
3:                jal          ra, 17f
4:                jal          gp, 5f
5:                jal          ra, 3b
6:                jal          t1, 18f
7:                jal          ra, 10f
8:                jal          s4, 0b
9:                jal          t1, 19f
10:               jal          ra, 2b
11:               jal          gp, 6b
12:               jal          ra, 4b
13:               jal          t1, 14f
14:               jal          t1, 16f
15:               jal          t1, 12b
16:               jal          tp, 21f
17:               jal          a6, 9b
18:               jal          t1, 20f
19:               jal          t5, 8b
20:               jal          ra, 7b
21:               srai         sp, t4, 16
                  la           t2, region_1+28096
                  sb           a2, -13(t2)
                  addi         s2, s2, -1994
                  or           s11, a2, a2
                  sb           a0, 15(t2)
                  lhu          a0, 12(t2)
                  sltiu        s5, a2, -1743
                  sb           a0, -8(t2)
                  add          a0, a0, s3
                  srl          s11, s5, s3
                  lbu          s11, -8(t2)
                  lb           a0, -16(t2)
                  lh           a2, 4(t2)
                  lhu          s11, 10(t2)
                  sb           s5, -7(t2)
                  sb           s3, -1(t2)
                  sb           s3, 1(t2)
                  sub          a2, a0, a2
                  slli         s3, a2, 22
                  sb           s3, -6(t2)
                  xor          s2, a2, a2
                  sb           s5, 15(t2)
                  sb           s11, 6(t2)
                  sw           a2, -12(t2)
                  la           sp, region_0+128
                  lb           s0, 1(sp)
                  lb           t6, 14(sp)
                  sb           s4, 134(sp)
                  sltiu        s9, s2, -264
                  sb           t6, -90(sp)
                  sb           gp, 152(sp)
                  sb           s11, 255(sp)
                  sra          s4, t2, a5
                  sb           gp, -86(sp)
                  slli         s10, s3, 1
                  sb           s6, 149(sp)
                  lbu          s5, 185(sp)
                  sb           s3, 255(sp)
                  lb           tp, 113(sp)
                  slt          gp, t6, a0
                  lh           t3, 178(sp)
                  sb           a1, 141(sp)
                  lbu          t1, 161(sp)
                  lb           t2, 81(sp)
                  sb           s10, 23(sp)
                  sub          t2, s5, ra
                  lb           a2, 127(sp)
                  lbu          t3, -109(sp)
                  sll          s3, a4, t5
                  slti         s3, t4, 1570
                  sh           a7, 22(sp)
                  srl          t4, a7, a7
                  srai         a5, s11, 13
                  ori          a4, t6, -1899
                  lb           t3, 54(sp)
                  lbu          t6, 127(sp)
                  xori         s5, s1, 1907
                  add          t6, s5, s1
                  lb           s11, -59(sp)
                  slt          s1, s10, t1
                  lb           t4, 154(sp)
                  sb           t1, 93(sp)
                  lb           t1, 6(sp)
                  lw           a1, 132(sp)
                  addi         t5, zero, -10
                  addi         a5, zero, -16
main_35_0_t:      andi         t3, a4, -1182
                  addi         t5, t5, -3
                  bne          t5, a5, main_35_0_t
                  or           s9, s3, t5
                  la           a3, region_0+1078
                  la           sp, region_0+610
                  la           a1, region_0+4052
                  la           s4, region_0+3880
                  lb           t1, -1460(a1)
                  lbu          s8, -1831(a1)
                  lb           a5, -955(a1)
                  lb           s0, -15(a3)
                  la           a2, region_0+1734
                  lb           t3, -13(a3)
                  lh           s11, 860(sp)
                  lbu          s10, -649(a1)
                  lb           s10, -15(a2)
                  sb           a2, -3(a3)
                  lb           s8, -28(s4)
                  lbu          s11, 1476(sp)
                  sb           t4, 14(a3)
                  sb           a0, -1182(a1)
                  lb           t5, 506(sp)
                  lbu          tp, 25(s4)
                  sb           s6, 1863(sp)
                  sb           t6, -3(a2)
                  sw           a7, 1922(sp)
                  lbu          tp, -1196(a1)
                  lb           a0, 735(sp)
                  sb           a3, 37(s4)
                  lh           a6, 42(s4)
                  lbu          a4, 4(s4)
                  sb           ra, -225(a1)
                  lbu          s3, -1(a3)
                  lhu          s10, 164(sp)
                  lh           s0, 14(a3)
                  sb           t4, -55(s4)
                  sb           s5, -1687(a1)
                  lh           tp, -8(a2)
                  lh           a6, 0(a3)
                  lhu          t1, -32(s4)
                  lbu          tp, 5(a3)
                  lbu          a4, -23(s4)
                  sb           s9, -9(a3)
                  lb           t3, -11(a2)
                  lb           s1, -1851(a1)
                  sb           t4, 47(a2)
                  lb           t4, 9(a3)
                  sb           s6, -13(s4)
                  lbu          t3, -515(a1)
                  la           a5, region_1+19440
                  lb           zero, 1446(a5)
                  lb           s8, 1446(a5)
                  sh           a5, 1446(a5)
                  lh           t6, 1446(a5)
                  ori          s9, s10, -110
                  sb           s3, 1446(a5)
                  lbu          s3, 1446(a5)
                  lh           s5, 1446(a5)
                  lhu          a2, 1446(a5)
                  lbu          gp, 1446(a5)
                  lh           s3, 1446(a5)
                  lb           s1, 1446(a5)
                  lh           a2, 1446(a5)
                  sb           s3, 1446(a5)
                  sb           t2, 1446(a5)
                  lhu          a2, 1446(a5)
                  sb           sp, 1446(a5)
                  la           s10, region_0+1285
                  lb           ra, 46(s10)
                  lbu          gp, 50(s10)
                  sb           s2, 50(s10)
                  lb           gp, 50(s10)
                  lb           t2, -3(s10)
                  lb           s5, -3(s10)
                  addi         t5, s9, -887
                  lb           t6, 7(s10)
                  lhu          a5, 7(s10)
                  lh           s9, 7(s10)
                  srai         zero, s11, 7
                  lhu          s2, 7(s10)
                  lh           s8, 7(s10)
main_9:           jal          ra, 22f
0:                jal          ra, 9f
1:                jal          ra, 6f
2:                jal          ra, 11f
3:                jal          ra, 7f
4:                jal          a0, 16f
5:                jal          ra, 12f
6:                jal          t1, 18f
7:                jal          ra, 20f
8:                jal          ra, 5b
9:                jal          ra, 10f
10:               jal          ra, 21f
11:               jal          ra, 3b
12:               jal          ra, 2b
13:               jal          s10, 19f
14:               jal          ra, 23f
15:               jal          t1, 13b
16:               jal          ra, 8b
17:               jal          ra, 0b
18:               jal          t1, 15b
19:               jal          a2, 17b
20:               jal          t1, 1b
21:               jal          t1, 14b
22:               jal          t1, 4b
23:               srli         a6, t5, 9
                  la           s2, region_0+3519
                  la           a7, region_0+2386
                  lb           s9, 7(s2)
                  la           a4, region_0+1145
                  sb           a6, -31(a7)
                  la           t1, region_0+2217
                  lb           s1, 4(s2)
                  sb           ra, -12(t1)
                  lbu          s5, 7(s2)
                  sb           s0, -61(a4)
                  lbu          gp, 2(s2)
                  sh           t6, 44(a7)
                  lh           s0, -15(t1)
                  lb           s3, -34(a4)
                  sb           t1, -29(a7)
                  lbu          s1, -4(a4)
                  lb           t3, -12(a7)
                  sb           t1, 2(t1)
                  lb           s9, -40(a7)
                  lb           t5, -3(a4)
                  lw           zero, -38(a7)
                  lbu          s5, -11(s2)
                  sb           t3, 40(a4)
                  sh           s2, 11(t1)
                  sb           a0, 12(a4)
                  sb           s1, -11(t1)
                  lbu          a0, -14(s2)
                  lb           s1, 27(a7)
                  sb           t2, -33(a4)
                  sb           a5, -16(t1)
                  lb           s9, 45(a7)
                  sb           s4, -51(a4)
                  lh           t3, 29(a4)
                  lb           a3, 2(s2)
                  sb           s9, 15(s2)
                  lb           t3, 16(t1)
                  la           t2, region_0+527
                  la           a4, region_0+3799
                  sh           s0, 59(t2)
                  la           tp, region_0+2412
                  la           t3, region_0+346
                  lb           s10, -10(t2)
                  la           a6, region_0+3825
                  sb           a1, -173(a6)
                  lb           s8, 14(t3)
                  lbu          t4, 32(tp)
                  lb           s8, 41(tp)
                  lbu          sp, 65(a6)
                  lh           t6, -98(t3)
                  lb           a0, 80(a6)
                  lbu          t4, 8(t3)
                  lbu          s3, -2(t2)
                  sb           a4, -14(a4)
                  lb           a0, 51(t2)
                  sb           t2, 6(a4)
                  lhu          s9, 48(tp)
                  lbu          t4, -247(t3)
                  sh           a1, 15(t2)
                  sh           a3, 194(tp)
                  lhu          s1, -104(t3)
                  lbu          s0, -2(a4)
                  lb           s5, 68(a6)
                  lb           sp, -12(a4)
                  lb           t5, -57(t2)
                  lb           s4, 165(t3)
                  sb           tp, 42(t2)
                  sb           a4, -8(t2)
                  lb           s11, 177(tp)
                  lb           sp, -1(a4)
                  lhu          t6, 104(t3)
                  lbu          s8, -68(a6)
                  lbu          zero, -19(t3)
                  lb           sp, 17(t2)
                  lb           zero, -58(tp)
                  sw           s0, 59(a6)
                  lhu          a5, -36(tp)
                  lbu          sp, -4(a4)
                  lb           a0, 165(tp)
                  la           t6, region_1+17146
                  lh           sp, 240(t6)
                  lbu          sp, 118(t6)
                  xor          a2, a3, sp
                  ori          a3, s4, -1772
                  lb           a2, -118(t6)
                  lhu          a1, 132(t6)
                  nop
                  nop
                  xor          a1, a1, a2
                  sb           a2, -57(t6)
                  nop
                  sb           s4, 93(t6)
                  lbu          sp, -141(t6)
                  sb           t1, -61(t6)
                  ori          sp, sp, -193
                  lb           a1, 229(t6)
                  lbu          s4, 102(t6)
                  la           s1, region_0+870
                  lbu          s0, -5(s1)
                  xor          a1, a7, zero
                  lw           s11, -190(s1)
                  lbu          s3, -71(s1)
                  slti         sp, t0, 1768
                  sb           s3, 228(s1)
                  sub          s8, a4, a0
                  lw           gp, 170(s1)
                  add          tp, tp, a5
                  sb           s2, 181(s1)
                  srl          t2, a5, s9
                  and          t1, a6, t6
                  sltu         s10, t5, a7
                  sb           s10, -135(s1)
                  lh           t3, -24(s1)
                  srl          s0, a1, s2
                  lb           a0, -248(s1)
                  lh           t5, 208(s1)
                  lbu          s2, 227(s1)
                  slt          s2, sp, t2
                  lb           sp, 96(s1)
                  lbu          t4, 87(s1)
                  lb           a1, 58(s1)
                  lb           t3, -29(s1)
                  lb           s11, 187(s1)
                  lbu          s2, 155(s1)
                  lb           t6, 65(s1)
                  srl          t3, s5, s2
                  sltu         s0, s3, t1
                  sw           s9, 62(s1)
                  or           t5, s5, t2
                  lui          a5, 688099
                  lbu          t4, 65(s1)
                  lw           a0, -46(s1)
                  lw           sp, 178(s1)
                  lui          zero, 190691
                  lhu          s2, 162(s1)
                  lbu          t6, 225(s1)
                  lbu          a4, -87(s1)
                  sh           s5, -62(s1)
                  lbu          zero, 87(s1)
                  sb           a1, -96(s1)
                  la           sp, region_0+2453
                  lbu          a7, 1(sp)
                  nop
                  andi         gp, t5, 541
                  lb           a3, -4(sp)
                  sb           a6, -12(sp)
                  lh           t6, 3(sp)
                  lbu          s8, 8(sp)
                  srl          a0, s0, a4
                  sra          s1, a2, zero
                  lb           t6, -14(sp)
                  lb           s10, 16(sp)
                  sh           s7, 13(sp)
                  lbu          s0, -11(sp)
                  ori          a2, s10, 1127
                  sb           a5, -13(sp)
                  lb           a4, -3(sp)
                  sb           t1, -11(sp)
                  xori         ra, s2, -803
                  lbu          gp, -4(sp)
                  add          a1, s3, zero
                  sw           t2, -1(sp)
                  andi         s4, s11, 647
                  srl          s1, gp, t0
                  lb           a4, 4(sp)
                  xor          a7, t6, s7
                  lbu          a4, 12(sp)
                  srai         a2, s11, 2
                  lui          s1, 361643
                  bge          t6, s7, 9f
                  auipc        t6, 53201
                  bltu         ra, s8, 12f
                  xor          a2, s7, t5
                  slti         s0, s9, 1893
                  xori         s3, a0, -899
                  beq          t0, gp, 9f
                  sra          s0, a3, a0
12:               slti         s8, a2, 481
                  srai         s0, s1, 6
                  srli         ra, ra, 12
                  beq          t5, zero, 36f
                  or           t6, a5, a4
                  sub          a0, s11, a6
                  and          s8, ra, sp
                  or           zero, s5, a5
                  bltu         t4, t2, 32f
                  blt          a4, sp, 32f
                  srl          a3, s5, gp
                  nop
                  addi         t2, s8, 1935
                  or           s8, a4, zero
                  nop
                  sltiu        gp, s2, -772
                  sll          s4, a1, s6
                  or           t5, t0, a4
                  slt          s0, s2, s7
                  slli         a7, t2, 12
                  bltu         t5, s4, 49f
                  sll          sp, a4, s10
                  sub          ra, s7, t2
                  slt          s3, s6, t3
                  bltu         s3, t3, 61f
                  and          s5, a1, ra
49:               ori          a1, a0, 265
                  ori          s1, s5, -1157
                  or           t1, gp, t2
                  srl          s8, zero, a2
                  bltu         a6, a2, 64f
                  nop
                  srai         s1, a3, 13
                  andi         ra, t4, 2042
                  slli         s3, s2, 19
                  beq          ra, a4, 73f
61:               bne          s8, s10, 66f
64:               blt          s9, a4, 77f
66:               xor          t6, a1, a2
                  slt          t1, s9, t0
                  ori          s1, sp, -521
                  bge          a2, zero, 76f
                  or           s1, sp, a6
                  sltu         s11, a7, s10
73:               beq          a6, sp, 75f
77:               sltiu        a1, tp, 939
                  xor          t2, s0, t6
                  beq          s3, s6, 84f
                  sra          t5, zero, t2
                  sltiu        a5, a2, 1823
                  bne          t3, tp, 95f
84:               or           s1, t5, t5
                  beq          a7, s4, 94f
                  addi         sp, s11, 119
                  auipc        t3, 833074
                  and          t1, t4, t6
94:               ori          s3, s2, 1010
95:               srai         t1, s5, 30
                  nop
                  sll          a5, s1, s9
                  nop
                  slli         s3, a5, 16
                  bltu         a5, a7, 115f
                  beq          s10, s2, 107f
                  bltu         s9, a6, 111f
107:              bne          t0, t3, 111f
                  ori          s10, s8, 806
                  and          a4, sp, a7
                  xor          t2, ra, a0
                  la           a3, sub_4
                  sltiu        s3, a4, -1537
                  add          t5, ra, t6
                  andi         a6, a2, -1031
                  addi         a3, a3, -244
                  bltu         ra, s10, main_j5
                  auipc        a1, 466711
main_j5:          jalr         ra, a3, 244
                  blt          t1, t4, 129f
                  andi         s3, ra, 41
115:              sltu         a2, s2, s0
                  srli         a3, a2, 23
                  srli         t3, a3, 26
                  and          a0, s5, gp
                  auipc        ra, 518697
                  sltu         t4, s4, t6
                  bne          s9, zero, 123f
123:              ori          zero, s7, -530
                  blt          a4, gp, 130f
                  slt          a3, t0, a5
                  slti         a0, a5, -1907
                  bltu         sp, t2, 129f
129:              nop
130:              bne          s7, zero, 136f
                  and          t2, s4, t0
                  srl          t2, ra, t0
                  blt          a1, ra, 141f
                  nop
                  bltu         s8, a4, 151f
141:              slt          sp, gp, ra
                  or           s4, s5, t2
                  sra          t6, s6, a3
                  sll          s8, a6, a0
                  add          t1, a1, t0
                  bne          s2, t2, 164f
                  bge          a1, t5, 150f
                  slt          s8, a6, a5
                  xor          s8, sp, a1
                  auipc        s2, 45773
                  xor          a2, t6, s5
                  sltiu        s8, a1, -146
                  xori         s0, t2, -45
                  xor          a6, gp, t5
                  slli         t5, a5, 16
                  srli         a7, gp, 5
164:              auipc        t1, 998979
                  and          ra, t0, gp
                  slt          s3, t6, t0
                  xori         s9, zero, 456
                  sra          t5, t5, s0
                  nop
                  slti         s10, s11, -1790
                  sltiu        gp, tp, 275
                  sra          a0, t3, a6
                  xor          t1, a1, gp
                  addi         a2, s1, -1013
                  sltu         a7, a5, a6
                  bgeu         s7, a3, 182f
                  xori         a2, s4, 285
                  sll          a5, t2, s6
                  sra          ra, tp, t2
182:              bge          a3, s8, 183f
183:              blt          a7, a1, 191f
                  slt          a0, ra, s10
                  xori         tp, t5, 1137
                  sll          ra, s7, a3
                  bgeu         s7, zero, 195f
                  nop
191:              beq          a4, t4, 199f
                  beq          t6, s6, 210f
                  slti         gp, s5, -1359
                  srl          s0, s11, t6
                  nop
                  sltiu        a5, s0, -1764
                  bgeu         s3, a4, 210f
                  beq          s2, s6, 203f
                  sltu         s2, a1, t3
                  bge          t3, t6, 209f
                  sra          tp, s1, ra
                  sll          s4, a3, ra
209:              blt          s10, a2, 216f
210:              slti         t1, sp, -1832
                  blt          zero, t6, 222f
                  slti         s2, zero, -1293
216:              bltu         gp, zero, 218f
                  bge          s9, sp, 218f
218:              sub          a1, s2, s6
                  blt          t0, s2, 226f
                  xori         a2, s10, -245
                  ori          t1, s2, 158
222:              andi         sp, a1, 697
                  beq          s7, a6, 239f
                  sltiu        zero, t5, 1399
                  sra          t3, a5, s0
226:              or           a5, a1, s3
                  srai         t5, a5, 6
                  and          t2, t6, a3
                  sub          tp, t1, t0
                  ori          t2, t6, 1215
                  srai         s10, s7, 0
                  slti         s1, s11, 779
                  slli         s5, a4, 3
                  slli         s8, a3, 5
                  xori         s1, s1, 1415
                  bne          t3, a2, 243f
                  xor          tp, s0, s7
243:              sltu         a1, sp, t0
                  addi         s3, s2, 217
                  bge          tp, sp, 250f
                  sltiu        s3, t1, 437
                  sub          a5, a5, a0
250:              bge          sp, s5, 264f
                  slti         ra, s7, -1033
                  sltiu        a5, s1, 2010
                  bge          a4, zero, 255f
                  add          a6, s8, a1
                  sub          a4, a0, a0
                  srli         t5, tp, 5
                  bgeu         tp, a0, 264f
                  sll          zero, s4, t0
                  srli         s10, s7, 6
                  bne          a4, t2, 271f
264:              bgeu         a6, a4, 277f
                  sltu         t6, s10, gp
                  sll          t6, a3, s3
                  srl          a5, t1, s5
                  or           t2, sp, ra
                  sub          s9, t1, s10
271:              lui          t1, 943249
                  nop
                  srli         s3, a7, 12
                  sll          a7, s10, t5
277:              sltu         s10, zero, s7
                  xori         a5, s2, -466
                  bne          a4, s1, 284f
                  lui          s10, 679945
                  sub          a0, a6, t2
284:              sltu         a7, a0, a6
                  nop
                  addi         s11, s0, 780
                  sra          a4, ra, s1
                  bge          t6, s10, 300f
                  ori          t6, a6, -1223
                  auipc        a5, 338792
                  srai         s0, a4, 10
                  slti         s10, s5, 1593
                  srli         a0, a3, 19
                  slt          a4, a4, s11
                  slt          s3, t6, t3
                  auipc        s9, 707300
                  sltiu        a1, s1, 1050
                  srli         ra, t2, 27
                  addi         sp, t6, -1646
                  slt          a0, a0, zero
                  slli         t6, s2, 6
                  sltu         zero, s3, s11
                  srl          s11, a3, a5
                  slti         sp, t6, 860
                  bgeu         a2, sp, 319f
                  bltu         sp, t6, 328f
                  bne          a2, a4, 318f
                  andi         s9, a2, -1597
                  slti         s5, s5, 1909
                  beq          gp, t5, 328f
                  beq          s3, s3, 320f
                  bne          ra, s5, 330f
318:              slti         gp, s9, -1943
319:              sltiu        a3, s8, 1465
320:              lui          s9, 277153
                  sll          a1, a3, a3
                  or           a4, a1, t5
                  sltiu        a3, s8, 4
                  auipc        s11, 316109
328:              nop
330:              or           zero, ra, s0
                  andi         a4, sp, -526
                  sltiu        t4, s3, 1375
                  la           s5, sub_1
                  slt          t3, s4, s4
                  sub          s11, a1, a4
                  addi         s2, s7, 952
                  addi         s5, s5, 908
                  bne          a3, a4, main_j2
                  slli         s11, s10, 2
main_j2:          jalr         ra, s5, -908
                  srli         gp, t1, 17
                  sltu         a7, a4, s5
                  sub          s3, s1, s1
                  bgeu         a4, s9, 342f
                  slt          s10, tp, t1
                  addi         a4, a7, 265
                  addi         sp, t6, -27
                  slti         s8, t3, -242
                  lui          a4, 887610
                  slti         ra, a0, 1556
                  sll          a1, s11, sp
                  sll          tp, a1, t6
                  srl          s2, s1, s3
                  xor          s11, s10, s4
                  slli         s4, s8, 8
                  srai         s4, t0, 18
                  blt          s6, t2, 371f
                  sub          t2, a5, s3
                  slt          t5, sp, s7
                  sltiu        s3, a0, 1511
                  beq          t2, a7, 370f
                  nop
                  beq          a2, a7, 385f
                  sub          zero, a1, a7
                  sltu         ra, s6, s1
370:              xori         a6, a6, 1241
371:              bltu         s3, t2, 381f
                  bgeu         s1, gp, 379f
                  sub          zero, t2, a1
                  bge          a5, s5, 383f
                  auipc        zero, 202869
                  sll          t5, ra, s0
379:              auipc        t4, 709642
                  sltiu        s9, s2, -601
                  la           sp, region_0+1214
                  slli         s2, s7, 7
                  sb           a1, 1656(sp)
                  sb           t3, 1459(sp)
                  lb           gp, 1459(sp)
                  lb           a6, 1339(sp)
                  lb           a3, 991(sp)
                  sb           s10, 991(sp)
                  sb           t1, 991(sp)
                  add          s9, a7, sp
                  lbu          t6, -535(sp)
                  lb           gp, -535(sp)
                  auipc        a2, 909653
                  sltiu        t2, s5, 846
                  lbu          s10, -535(sp)
                  lb           a4, 1741(sp)
381:              and          tp, s10, ra
                  slti         t1, sp, -669
383:              nop
                  srai         s8, a7, 30
                  sll          t3, s9, t2
                  andi         ra, a3, -969
                  srli         a0, s2, 5
                  xor          s11, s5, s5
                  or           t3, t6, t5
                  sltiu        s10, t3, 1570
                  auipc        t5, 94677
                  slti         a6, ra, 668
                  ori          t3, s8, 360
                  sub          sp, a2, t5
                  sll          a2, s8, tp
                  xori         t5, s5, -1544
                  bge          ra, t5, 409f
                  srai         s5, s0, 19
                  sll          zero, s0, a2
                  lui          t3, 887043
                  bge          t2, gp, 420f
                  ori          s1, a2, 1642
                  slt          s1, s0, s2
                  srl          sp, a7, s5
                  addi         a4, s0, 378
                  auipc        s10, 1021746
                  xori         gp, a2, -259
                  bgeu         s10, s2, 416f
                  srl          t4, a7, a7
                  andi         a5, s1, -1277
                  slti         gp, sp, -1459
416:              srai         a5, t6, 21
                  sll          t2, a0, t1
                  bltu         a5, a2, 420f
                  nop
420:              xor          t6, a5, s3
                  auipc        s11, 768037
                  or           s5, s2, a2
                  beq          a0, a1, 428f
                  slt          a0, a1, a4
                  bltu         s5, t3, 437f
                  sll          t4, tp, s6
                  slt          gp, s6, t0
428:              auipc        s11, 686835
                  xori         s11, t4, -749
                  bgeu         a1, s4, 443f
                  sra          a5, s11, a2
                  slli         t6, t3, 3
                  sll          s11, s0, gp
                  or           zero, a0, a2
                  and          s4, a2, a3
437:              lui          a3, 93473
                  and          zero, t4, s1
                  srl          a1, t0, s0
                  blt          a1, s10, 457f
                  auipc        t2, 523500
443:              or           s1, s3, t2
                  nop
                  ori          s0, s0, -1994
                  slti         a4, a6, -843
                  xor          s9, a7, ra
                  sltu         s2, s5, s2
                  and          s1, ra, s7
                  xori         t6, s1, 980
                  addi         a1, a7, 1733
                  sll          s10, a3, s11
                  slti         s1, s5, -1922
                  bgeu         s9, a2, 457f
                  or           s8, a5, t2
                  sub          s4, a2, t2
                  sra          a6, a5, s5
                  bltu         zero, a5, 467f
                  xori         zero, s2, -921
                  addi         a7, sp, 1364
                  and          sp, t0, s2
                  slli         gp, a6, 24
467:              xor          s9, a6, t1
                  nop
                  sltiu        s5, a7, -2012
                  sltu         tp, s8, a4
                  and          t6, s8, a1
                  andi         a7, s1, 793
                  bge          s10, t5, 483f
                  sll          sp, t5, s2
                  nop
                  slt          a1, s6, a1
                  srl          a0, a1, s6
483:              srai         s2, t0, 3
                  andi         tp, gp, -204
                  ori          s3, s1, -787
                  auipc        s4, 705119
                  srli         t1, a2, 23
                  xori         t6, t2, 686
                  srli         zero, zero, 14
                  addi         s9, s7, 1424
                  sltu         t4, a5, sp
                  slli         a0, s5, 14
                  srai         a0, s10, 30
                  srli         s2, s2, 10
                  bltu         s7, s3, 502f
                  slti         gp, zero, 1270
                  bltu         s2, t2, 502f
                  xor          s10, t0, s7
                  or           a1, s7, tp
                  bltu         s4, s11, 511f
                  slt          gp, s10, gp
                  sra          s8, s8, t6
                  addi         t2, s9, -993
511:              ori          s10, s3, 852
                  addi         s0, tp, 675
                  sub          s4, zero, gp
                  srli         a0, t5, 24
                  bltu         s1, s6, 523f
                  slli         t5, t0, 10
                  srli         s8, s7, 17
                  sltiu        s0, a0, -594
523:              sra          s2, t6, ra
                  sll          s4, gp, t1
                  and          t5, s10, a0
                  bne          t6, s4, 544f
                  srai         t6, tp, 21
                  ori          s8, s4, 1827
                  or           a0, s5, ra
                  bne          s3, s10, 536f
536:              slli         a2, t3, 8
                  srl          s5, a6, s6
                  sub          a6, s11, t5
                  srl          a3, t1, gp
                  sltiu        s11, s3, 403
                  slli         a3, s9, 7
544:              srli         a6, a5, 15
                  add          a2, a7, a0
                  and          a1, s5, tp
                  srli         t2, gp, 6
                  sub          a1, t3, a1
                  srai         t4, zero, 6
                  srl          t6, s2, s3
                  bltu         a2, s7, 562f
                  sltiu        t3, s4, 1461
                  sra          a1, a3, a1
                  lui          a0, 975118
                  bltu         a1, zero, 566f
                  xor          a0, s7, a6
                  sltu         s10, gp, s0
562:              srl          s0, t0, s2
                  nop
                  addi         t6, a1, 1354
                  and          s3, sp, tp
                  bgeu         s7, s8, 573f
                  sub          a6, s9, s0
                  nop
                  bltu         s8, t5, 584f
                  sub          t4, s5, t2
                  slt          a0, s8, s4
573:              sll          zero, a0, gp
                  auipc        a6, 18607
                  ori          t2, a7, 1389
                  slli         s10, t6, 1
                  slli         t4, t6, 0
                  slli         a2, s7, 30
                  bltu         t6, t5, 586f
586:              slti         s2, gp, -232
                  auipc        ra, 485541
                  add          a1, t2, tp
                  beq          s9, sp, 591f
591:              bltu         tp, a0, 600f
                  bgeu         s11, a6, 605f
                  nop
                  add          s1, gp, a7
                  bltu         s9, a0, 610f
                  xor          s3, a7, tp
                  slti         t5, s6, -883
                  lui          s2, 170108
600:              xori         a2, a1, 893
                  sub          a4, s7, a1
                  xori         s4, t3, 556
                  andi         a6, a4, 1810
605:              ori          s8, zero, -390
                  xori         s2, s11, 396
                  slli         s9, a3, 3
610:              sll          a6, tp, s0
                  sll          s8, a2, s11
                  xori         tp, s9, -1266
                  sltiu        a0, a7, -1954
                  add          s3, s4, sp
                  sltu         s3, a6, a3
                  bgeu         s1, t2, 635f
                  lui          s10, 766178
                  sltu         t4, gp, a5
                  xori         a0, a0, -1337
                  add          s2, a4, t4
                  and          t3, s3, s11
                  bne          s7, s8, 635f
                  sra          a2, t1, t2
                  bne          t3, a1, 634f
                  srai         s0, s11, 28
                  xori         s10, a4, 1304
                  addi         t5, a6, -177
634:              bne          s10, s7, 642f
635:              xori         ra, tp, -1545
                  and          a7, ra, a1
                  ori          s0, s0, -444
                  sll          a1, s0, t6
                  beq          s4, tp, 643f
                  addi         s0, t5, -529
                  and          tp, a1, tp
642:              sub          a7, zero, s1
643:              sltu         t4, s10, a2
                  sra          t2, s3, s9
                  auipc        a7, 674955
                  addi         s5, s8, 851
                  addi         a6, s2, -2048
                  lui          a6, 464509
                  nop
                  addi         s4, s1, -1926
                  bltu         s10, t4, 663f
                  or           s3, s1, s0
                  ori          t3, gp, 1056
                  srli         a5, zero, 0
                  bge          t5, t2, 663f
                  xor          a6, s5, a1
                  bltu         t1, a3, 666f
                  blt          s5, a1, 668f
                  srli         a6, t4, 7
663:              bge          a5, t5, 664f
664:              and          tp, t4, t0
                  and          s8, s1, sp
666:              bne          zero, s1, 670f
                  and          s8, s5, s6
668:              bltu         a3, s1, 681f
                  slti         t1, s2, -1203
                  sll          t3, s9, t3
                  slt          s3, sp, ra
                  sra          zero, gp, a1
                  beq          a6, t1, 676f
                  srli         a3, t1, 16
                  srli         s5, t5, 29
                  bge          s5, a2, 687f
                  slt          a0, s1, a6
681:              xori         s9, zero, -909
                  ori          a1, s4, -671
                  srli         a1, a2, 30
                  auipc        a4, 656357
                  sltu         s0, a6, a4
                  and          s5, a5, t6
                  xor          s8, a4, t6
                  bne          ra, a0, 700f
                  sltu         s1, s7, a1
                  xori         a0, s0, 1647
                  slti         s4, s7, 1760
700:              beq          t2, a5, 711f
                  bgeu         s7, a2, 703f
703:              addi         s1, sp, 801
                  srai         t1, t5, 10
                  srli         gp, t0, 22
                  slti         a0, sp, -898
                  ori          s3, s9, -604
                  auipc        a1, 537148
711:              srli         s1, t5, 22
                  sll          ra, s9, a6
                  blt          s6, tp, 718f
718:              auipc        s1, 653581
                  lui          s5, 544634
                  andi         a0, gp, -1271
                  srli         t2, ra, 24
                  xor          zero, t2, s5
                  andi         a0, t5, 1708
                  lui          s5, 642699
                  add          s8, s5, s1
                  ori          t3, t2, 1960
                  sltu         s11, t4, s11
                  bne          s7, a1, 734f
                  srli         s1, gp, 28
                  sll          t6, t5, a5
734:              sub          s9, s11, s9
                  slli         t4, ra, 20
                  slti         t5, tp, 695
                  sltiu        t6, s7, -1312
                  slt          t1, a2, a7
                  ori          a0, s5, -151
                  slt          a6, a2, t6
                  srai         t5, t3, 5
                  bne          s0, t6, 748f
                  srli         zero, s8, 22
748:              xor          a6, ra, t5
                  slt          t3, zero, a7
                  srl          tp, a4, a3
                  sltiu        s2, t1, -2004
                  srai         t5, a7, 19
                  beq          a4, t6, 755f
                  bne          t1, t4, 761f
                  addi         t1, s0, 448
                  auipc        s5, 849518
                  and          a1, s4, tp
                  xori         a0, a5, 34
761:              sltiu        a2, s5, -1375
                  slli         tp, a6, 15
                  bne          zero, t5, 781f
                  sra          gp, a3, t5
                  xor          a4, s8, s9
                  xori         a2, t2, -339
                  sub          s10, s10, a0
                  srl          s3, s9, sp
                  srl          a4, a7, a5
                  ori          t6, a4, 79
                  and          s4, a3, s5
                  or           a2, t3, ra
                  sub          s0, gp, a7
                  bltu         a2, a4, 788f
                  and          t3, s9, a3
                  sltiu        s0, ra, 1904
                  slt          s4, s1, s2
                  slli         s0, a2, 7
                  blt          sp, a2, 786f
781:              srli         s1, s2, 24
                  bne          tp, a4, 787f
                  bltu         s9, s7, 802f
                  srli         tp, s4, 22
786:              andi         a0, s3, -731
                  bge          a5, t5, 809f
                  srli         a5, s2, 4
                  sltiu        s1, t0, 172
                  and          t2, sp, a5
                  blt          gp, a2, 809f
                  ori          s3, t1, 1633
                  slt          t1, s3, t3
                  bge          t0, s0, 807f
802:              or           sp, t5, a3
                  blt          s3, s4, 810f
                  beq          a5, s10, 815f
                  slti         s11, s10, -70
809:              sll          sp, t0, zero
810:              auipc        ra, 721096
                  slti         sp, tp, -1687
                  blt          s8, s6, 827f
                  sll          t5, s9, a7
815:              sll          a7, t6, gp
                  sub          s10, a6, t0
                  sltiu        a6, gp, -324
                  sltu         gp, s11, s8
                  xor          t2, tp, t4
                  andi         ra, a4, 415
                  srai         sp, s5, 5
                  bgeu         s10, t3, 826f
                  or           s0, s4, a5
                  andi         a0, a1, -754
826:              xori         tp, t2, 1016
827:              ori          a6, t0, -180
                  lui          a2, 649761
                  srl          t6, s7, s9
                  slti         s2, s4, 1223
                  srl          a6, tp, a4
                  slti         t3, s1, -1444
                  bgeu         a0, a7, 850f
                  bge          t4, a5, 845f
                  xori         s3, a1, -1903
                  bgeu         a1, s8, 845f
                  auipc        t1, 524340
                  slti         ra, a0, -475
                  srai         s11, s6, 2
                  slti         a5, a5, -1875
                  bne          t0, s5, 848f
845:              ori          zero, s0, 738
848:              ori          sp, tp, -1162
                  bne          ra, s7, 859f
850:              nop
                  sub          s4, a2, a6
                  add          s0, ra, zero
                  srl          t3, a0, t1
                  srli         ra, t3, 4
                  and          a3, ra, t6
                  bge          a6, gp, 864f
859:              srli         t3, s1, 25
                  nop
                  srl          s11, t5, s7
864:              auipc        ra, 410273
                  bne          t1, s4, 872f
                  sltu         t1, a5, t5
                  xori         t1, s5, 430
                  bge          t0, sp, 884f
                  auipc        a7, 646201
                  andi         a3, s3, 933
                  lui          a1, 792183
872:              add          s1, ra, t4
                  beq          a5, s4, 874f
                  sll          s8, t1, s7
                  xori         s0, s7, -1138
                  bgeu         s9, t5, 884f
                  addi         a5, sp, -1219
                  sra          a2, s8, t5
                  bgeu         s2, s3, 896f
                  ori          s8, gp, -1224
                  slli         t3, s6, 26
                  ori          sp, s1, 827
                  bltu         zero, s11, 895f
                  srl          t4, s1, a3
                  xori         s8, s1, 1573
                  sra          s8, t2, a7
                  ori          a4, a6, -1894
895:              auipc        a2, 631580
                  add          s9, a6, s5
                  lui          ra, 153563
                  srli         s10, a4, 14
                  xor          a3, s5, a4
                  bgeu         t4, a0, 908f
                  bltu         a7, gp, 907f
                  bgeu         s7, t0, 908f
908:              sub          t4, s8, a3
                  and          tp, t4, t1
                  beq          a0, s2, 911f
911:              andi         s4, t2, 325
                  andi         a4, t4, 429
                  nop
                  slli         s1, t1, 29
                  ori          gp, a5, 382
                  bge          t3, a6, 934f
                  auipc        t5, 864684
                  sltu         s0, gp, t5
                  sll          zero, a5, s3
                  blt          s11, t5, 925f
                  addi         a3, a7, 1851
                  beq          s8, t1, 932f
                  sll          a1, s5, tp
                  la           a6, sub_2
                  lui          a7, 376096
                  srai         zero, a3, 0
                  nop
                  nop
                  xori         s1, s9, 99
                  auipc        a0, 236089
                  addi         a6, a6, 789
                  sra          t6, a0, tp
main_j3:          jalr         ra, a6, -788
925:              slt          s3, t3, s3
                  xor          s10, t2, t4
                  and          sp, t0, s1
                  sra          t3, a5, t4
                  slt          s11, s11, a7
                  nop
                  slt          a4, a0, a3
                  lui          t6, 205779
                  bgeu         a5, a4, 945f
                  sll          s8, a3, ra
                  srl          s8, t3, a3
                  sub          s2, s0, a3
                  blt          a2, s8, 954f
                  bne          s10, s8, 943f
                  addi         tp, t1, 1683
945:              sltu         s3, zero, t5
                  slli         gp, a2, 1
                  slti         ra, s3, 45
                  bge          sp, a3, 960f
                  or           zero, s2, a4
                  and          s11, s7, s10
                  bge          s10, zero, 956f
                  sra          t4, t6, gp
954:              slli         a0, tp, 1
                  slt          a3, zero, a1
956:              andi         zero, s5, -1259
                  srl          tp, a1, t4
                  and          t2, a1, t1
                  or           s0, s9, s9
                  sltiu        tp, gp, 1831
                  slti         t4, t3, 1003
                  bne          tp, t2, 980f
                  ori          s3, s10, -1750
                  srl          t2, s4, s4
                  nop
                  slli         s10, s1, 24
                  beq          s0, s7, 979f
979:              andi         sp, zero, 810
980:              srai         a3, a4, 19
                  lui          s0, 881236
                  sub          a1, s5, a0
                  srli         s1, ra, 12
                  lui          a5, 286260
                  xor          a3, s4, gp
                  lui          a3, 511057
                  sll          t1, a5, s6
                  andi         s8, s4, -50
                  bltu         t4, s3, 1008f
                  lui          s8, 389243
                  sltiu        s2, a2, -766
                  beq          t5, a6, 1006f
                  slt          s8, tp, s7
                  auipc        s9, 380182
                  nop
                  srl          a6, a2, a7
                  beq          zero, s9, 1009f
                  bne          s1, s10, 1008f
                  xor          t5, a1, s9
                  sltiu        t3, gp, 1150
                  bgeu         sp, s9, 1006f
                  andi         ra, tp, -1986
1006:             sltiu        s9, a7, 1678
                  bgeu         s5, t4, 1010f
1009:             blt          s8, a0, 1015f
1010:             bge          a4, tp, 1017f
                  srai         s1, t6, 17
                  nop
                  sltu         a6, a0, tp
                  xori         s10, a0, -180
1015:             bltu         a4, s3, 1023f
                  and          s3, a4, t0
1017:             srli         s11, a7, 14
                  and          s0, s1, t1
                  srl          zero, a1, a3
                  addi         s3, t5, 687
                  bge          t6, s8, 1035f
1023:             addi         s5, a2, 32
                  sltiu        s3, s5, -124
                  bne          t2, ra, 1039f
                  sltiu        s2, s9, -736
                  bge          t4, s5, 1033f
                  xori         zero, zero, 1957
                  blt          zero, t0, 1039f
1033:             xori         a6, a1, -647
                  addi         a2, a6, 794
1035:             add          a0, s3, s5
                  and          s3, ra, s6
                  xori         s2, s10, -1053
                  bne          a4, t3, 1042f
1039:             slli         t6, s3, 13
                  xor          s3, s2, a6
                  srli         a7, s11, 15
                  slli         s0, gp, 11
                  sub          t5, a3, a0
                  sub          zero, s11, s11
                  sltiu        a7, a7, -1056
                  beq          zero, a2, 1053f
                  nop
                  or           gp, a2, a1
                  sra          t3, zero, s8
                  srl          gp, a2, s11
1053:             addi         a1, s3, -42
                  srai         s4, gp, 27
                  sll          t4, s0, t4
                  srli         a0, t0, 3
                  sra          t4, t4, s10
                  sra          s3, zero, ra
                  xori         s11, a2, -1844
                  beq          t3, s6, 1065f
1065:             srai         s8, a0, 9
                  bltu         a5, a5, 1083f
                  auipc        t4, 646194
                  slti         a6, s5, 369
                  auipc        s1, 365246
                  addi         a6, t6, -122
                  bge          t2, a5, 1083f
                  sltu         tp, a3, s10
                  and          s10, a3, s3
                  blt          a5, t1, 1082f
                  addi         t3, t2, 807
                  lui          a5, 805342
                  blt          zero, ra, 1093f
                  auipc        s9, 333013
                  andi         a5, a1, -973
1082:             srli         s9, s7, 15
1083:             srai         tp, a5, 22
                  xori         ra, tp, 2039
                  sltiu        a2, ra, 1932
                  addi         t5, t3, 1770
                  xor          t4, a2, sp
                  sltiu        s2, s1, 412
                  slli         a0, t5, 16
                  srl          s11, ra, s11
                  addi         s10, s8, -926
1093:             beq          a1, t4, 1098f
                  beq          a7, ra, 1096f
                  slt          a6, s11, a7
1096:             addi         a0, s4, 384
                  srl          a7, ra, s1
1098:             bne          s10, gp, 1108f
                  nop
                  bgeu         s4, a1, 1107f
                  ori          s2, s10, 153
                  bgeu         s0, s8, 1105f
1105:             bge          s3, t6, 1123f
1107:             bne          s2, tp, 1115f
1108:             srai         tp, s11, 7
                  beq          ra, s11, 1123f
                  srli         a5, t6, 22
                  bne          s8, s1, 1113f
1113:             andi         s1, t1, -1892
                  xori         s2, a6, -679
1115:             bltu         a4, s0, 1119f
                  lui          a6, 1028871
                  addi         t1, sp, -119
                  sll          t3, t6, a7
1119:             nop
                  lui          s2, 573731
                  nop
                  or           a0, a7, a1
1123:             nop
                  add          gp, a6, ra
                  blt          s7, a6, 1144f
                  bgeu         a7, t3, 1133f
                  andi         a7, gp, -1389
                  bltu         s9, s7, 1136f
                  slti         s5, s4, 1273
                  srai         s8, sp, 11
                  slt          s1, a2, zero
1136:             srl          a4, s8, s7
                  auipc        a3, 1039059
                  xor          sp, a1, t3
                  blt          s0, t0, 1147f
                  beq          s3, s4, 1146f
                  srai         t6, s3, 31
1146:             or           s3, a3, zero
1147:             bge          a7, t4, 1160f
                  blt          a5, a0, 1155f
                  slli         t1, t6, 5
                  sra          a0, s11, s4
                  lui          s2, 787599
                  bgeu         ra, a2, 1160f
                  srl          t1, s0, tp
                  srl          a5, a6, a5
                  srl          gp, a3, a7
                  sra          s9, s8, s6
                  srli         s0, a4, 19
1160:             slti         zero, a3, 1538
                  lui          s3, 790722
                  ori          a5, a5, 498
                  srli         a6, a3, 28
                  or           a2, a2, a2
                  sra          t4, t1, s5
                  add          zero, a1, t0
                  slli         sp, a0, 29
                  bne          s0, a4, 1182f
                  and          zero, s1, a1
                  auipc        a2, 326265
                  bltu         a5, s8, 1175f
                  sll          s1, t2, s8
                  sltiu        s9, s6, -1795
                  beq          a2, t3, 1182f
1175:             beq          a5, zero, 1176f
                  beq          t3, a2, 1190f
                  bltu         a3, s2, 1180f
1180:             add          s2, zero, zero
                  bne          s9, s3, 1187f
                  slti         sp, s5, -387
                  slti         a5, s3, -122
                  slt          s0, s10, s0
1187:             add          t3, a2, s4
                  bge          t2, s10, 1196f
                  addi         s4, s7, 953
1190:             sltiu        s9, a5, 1879
                  srli         ra, a4, 22
                  blt          t2, s2, 1201f
                  andi         a6, t0, 1279
                  auipc        ra, 847767
                  bge          s11, t6, 1205f
1196:             bge          t6, s11, 1212f
                  or           a2, s7, s6
                  andi         t3, zero, 40
                  srl          s2, a3, s9
1201:             beq          a0, t2, 1203f
                  sltu         t3, s1, s4
1203:             srli         t3, t6, 25
                  xori         a6, a4, -1024
                  or           s3, s6, a5
                  srai         ra, s7, 8
                  andi         t4, a2, 938
                  blt          s9, gp, 1227f
                  and          a4, t2, a6
1212:             sra          s1, a2, a6
                  srli         a2, t5, 23
                  bltu         a4, s2, 1225f
                  or           sp, s2, a3
                  srli         ra, t2, 17
                  bgeu         a0, t0, 1219f
1219:             or           t3, t4, s6
                  sltu         a0, s8, a6
                  andi         a4, a6, 372
                  bltu         s3, a2, 1229f
                  bge          t2, t2, 1236f
1225:             sltiu        tp, a0, 1516
1227:             lui          t2, 818541
                  blt          t1, sp, 1236f
                  addi         s5, s10, 1334
                  bgeu         sp, a1, 1234f
                  add          t3, sp, a0
                  slli         gp, t6, 25
1234:             or           t1, t5, t3
                  srli         s11, zero, 18
1236:             slli         s2, a4, 4
                  srl          a2, tp, t3
                  lui          t3, 966041
                  sltiu        s4, sp, 464
                  and          t5, gp, t6
                  ori          a4, s7, -1525
                  beq          t4, s7, 1249f
                  bge          tp, t4, 1252f
                  ori          tp, t6, 1566
                  auipc        a2, 374793
                  ori          tp, tp, 766
1249:             addi         a5, a4, -1868
                  blt          ra, a1, 1255f
1252:             sra          s11, t6, s5
                  bne          zero, s1, 1261f
                  bltu         s8, a6, 1261f
1255:             srl          t3, s4, a1
                  andi         s5, gp, 1926
                  srai         t4, s0, 0
1261:             srli         t2, a7, 23
                  addi         a5, s2, 1244
                  bge          s4, a1, 1275f
                  sll          t3, s5, t5
                  sltiu        t5, a1, 1284
                  nop
                  ori          a0, zero, 1022
                  bgeu         t2, s11, 1278f
                  sltu         t2, sp, t5
                  sltiu        s2, a5, -370
                  or           t1, s7, s10
                  slti         a4, t0, -50
1275:             sll          s3, t4, s3
                  addi         a6, t2, 966
                  or           s8, a4, a5
1278:             nop
                  sltu         t5, t4, a7
                  lui          t5, 1031814
                  slti         tp, gp, -1777
                  blt          t2, t0, 1284f
                  sub          a5, a2, ra
1284:             or           a3, t0, a1
                  bne          ra, s3, 1286f
1286:             andi         s3, a1, 1915
                  sra          a5, s2, ra
                  sub          s3, ra, s0
                  ori          s0, s7, -1567
                  sltiu        s0, s2, 1857
                  sra          a0, t6, a7
                  sltiu        sp, a2, -628
                  sub          s10, s6, t6
                  addi         zero, zero, 27
                  or           s4, s6, t2
                  bge          s5, s3, 1311f
                  srai         s0, s5, 15
                  srai         t6, t1, 28
                  sub          t1, s11, a1
                  or           a1, s6, s9
                  bne          ra, s5, 1305f
                  beq          a6, a6, 1314f
1305:             and          a7, ra, t0
                  sub          a3, ra, s8
                  addi         s3, a3, 326
                  sll          s10, s4, a4
                  srli         s9, ra, 20
1311:             slli         t5, t6, 7
                  addi         a5, s5, 877
1314:             srl          s0, a6, a6
                  slli         sp, s1, 5
                  addi         t5, t4, 1576
                  bne          a6, s10, 1326f
                  bne          s2, ra, 1327f
                  lui          s4, 701464
                  bgeu         s11, s5, 1333f
                  bge          a3, sp, 1338f
1326:             srli         t6, s10, 10
1327:             sltiu        t1, t0, -1212
                  or           a6, a5, s4
                  andi         ra, t2, -977
                  xor          tp, t5, s2
1333:             sltu         t1, s1, gp
                  blt          t5, s0, 1351f
                  blt          ra, t5, 1337f
1337:             srl          tp, s2, s3
1338:             srai         ra, s1, 31
                  slli         t6, s4, 27
                  slt          s0, s8, t6
                  nop
                  srli         ra, a5, 23
                  slti         a3, gp, -459
                  xori         t3, a6, 1708
                  bge          t2, s10, 1351f
1351:             bltu         a4, s8, 1352f
1352:             sub          t6, t2, s3
                  sltu         a6, s1, t2
                  auipc        tp, 183975
                  srai         gp, s4, 19
                  bge          s10, s0, 1374f
                  and          a2, s10, s3
                  bgeu         s7, s8, 1371f
                  srai         s9, ra, 26
                  add          t1, s7, t0
                  blt          t6, sp, 1367f
                  ori          t4, s6, -1122
                  srai         a1, t4, 10
                  sll          zero, s6, s0
                  bgeu         a3, t2, 1370f
                  andi         s0, a7, -1548
1367:             add          a6, t1, t6
                  ori          s9, a4, -1597
                  srl          t3, t3, s11
1371:             srl          a1, s0, a7
                  sltiu        a2, s1, -817
                  bgeu         t1, a5, 1391f
1374:             xori         t2, s9, -1191
                  add          t2, t5, s11
                  add          s4, s10, a0
                  sltu         a6, a5, sp
                  srl          a1, a5, t2
                  addi         a4, s1, -127
                  slli         t5, zero, 20
                  bltu         s1, gp, 1392f
                  nop
                  lui          s4, 34662
                  bge          t4, gp, 1398f
                  lui          t4, 380566
1391:             bgeu         s9, s0, 1395f
                  auipc        a3, 558398
                  addi         t1, a5, 1164
                  bgeu         sp, a1, 1402f
                  bltu         s9, a2, 1413f
                  bne          gp, s5, 1407f
                  slti         zero, t0, -1426
1402:             bltu         a0, zero, 1408f
                  add          s8, t2, zero
                  auipc        a2, 831245
                  blt          gp, a2, 1418f
                  add          s8, zero, t1
1407:             bne          a5, s2, 1425f
1408:             andi         s4, gp, 683
                  xor          a4, s3, a7
                  srl          zero, s6, a5
                  lui          a5, 601245
                  srl          tp, t5, t1
1413:             lui          a5, 172530
                  xori         s10, a3, 1727
                  srai         a2, sp, 19
                  addi         a6, zero, 772
1418:             bge          s7, a4, 1425f
                  bge          s4, s11, 1424f
                  sll          t4, t0, s8
                  bgeu         s7, zero, 1430f
1424:             sll          sp, a6, s3
1425:             ori          s4, s8, -1964
                  slt          s0, a4, s1
                  addi         sp, t3, 468
                  slti         tp, s10, -1549
1430:             addi         t3, t1, 1469
                  and          a1, a7, t0
                  addi         a7, t3, -855
                  xori         s11, gp, -264
                  addi         a4, a1, 330
                  bne          a1, a6, 1441f
                  xori         tp, a2, -61
                  andi         t2, s4, -1759
                  bne          zero, sp, 1450f
                  or           a0, a0, t0
1441:             sub          t3, t0, zero
                  srli         a2, t6, 11
                  bge          gp, tp, 1446f
1446:             xori         t4, s11, -1190
                  bltu         t5, t3, 1456f
                  lui          sp, 255625
1450:             beq          tp, t3, 1458f
                  beq          zero, s5, 1457f
                  blt          t0, t1, 1466f
                  sll          a6, sp, a7
                  srai         a3, t4, 5
                  addi         s5, s1, 323
1458:             xor          gp, gp, t6
                  blt          zero, a1, 1461f
                  bge          a6, t2, 1468f
1461:             sltiu        t2, s10, 1831
                  add          a2, a5, a6
                  bge          s4, s5, 1464f
1464:             sltiu        t4, s7, 356
                  sltu         t1, s3, s6
1466:             lui          a2, 489014
1468:             andi         a7, a5, 702
                  and          s11, tp, gp
                  sltu         t4, s3, zero
                  slti         a0, t2, 671
                  andi         sp, s4, 444
                  sub          sp, s0, zero
                  add          a7, t1, sp
                  andi         t6, a3, 545
                  add          s8, zero, s8
                  srai         ra, a6, 19
                  bge          t2, s4, 1489f
                  slti         a2, ra, 1195
                  bge          a7, t0, 1494f
                  beq          s10, t0, 1486f
                  beq          a6, a0, 1488f
                  blt          t2, a2, 1501f
1486:             srai         a2, s1, 31
1488:             bne          t4, s2, 1493f
1489:             addi         s8, t5, 1616
                  xor          tp, ra, a7
                  blt          a4, a2, 1502f
                  beq          ra, ra, 1510f
                  bge          s1, t1, 1513f
1501:             slli         t1, s2, 12
                  addi         sp, t5, 1554
                  srl          a5, a4, s5
                  srai         a4, s4, 20
                  slli         a0, s11, 11
                  beq          s9, s4, 1513f
1510:             beq          a3, s4, 1511f
                  sra          tp, tp, a7
1513:             bgeu         sp, s11, 1515f
                  xor          ra, s11, t1
                  srai         t2, t0, 28
                  ori          s5, a5, -544
                  slli         tp, a4, 1
                  sub          t2, a6, t4
                  srai         a2, zero, 25
                  srli         t2, t4, 12
                  nop
                  bne          t4, s2, 1544f
                  srai         t3, t3, 11
                  xori         s5, t5, 1603
                  and          t5, ra, s9
                  andi         ra, t0, -1105
                  xori         s1, a7, -1782
                  sltiu        s4, a4, 1376
                  slt          a3, a5, t5
                  sll          s8, t5, a5
                  and          gp, s9, s6
                  sll          t5, t6, a6
                  lui          tp, 82934
                  bge          s1, a0, 1545f
                  blt          s0, s9, 1550f
                  bltu         a6, a5, 1544f
1544:             xori         t4, ra, 1672
                  xori         ra, t5, -403
                  sll          t1, sp, gp
                  bltu         gp, t5, 1556f
                  slt          s9, t1, s1
                  beq          t0, s6, 1565f
                  beq          t6, a1, 1569f
                  addi         s3, t6, 283
                  srli         s0, s7, 5
1556:             addi         sp, s7, 40
                  sll          a2, s8, s10
                  blt          s4, a3, 1576f
                  xor          s8, s11, t4
                  or           t4, a4, a2
                  beq          a3, t1, 1562f
1562:             beq          t5, t0, 1567f
                  sll          sp, t2, a5
                  lui          gp, 918658
1565:             xor          sp, s4, a4
                  bge          s1, s8, 1573f
1567:             sltiu        a4, a7, 203
                  xor          s3, s11, t5
1569:             ori          tp, a3, 253
                  srai         t6, t4, 30
                  srl          a6, s8, s1
                  bne          zero, ra, 1579f
1573:             beq          zero, a2, 1581f
                  bgeu         a7, tp, 1586f
                  sra          a5, s4, s3
1576:             srli         a7, s4, 24
                  andi         a5, t4, -1972
                  andi         tp, s9, 588
1579:             lui          a6, 941847
                  srl          t1, a3, s4
1581:             xor          s5, s6, s3
                  slti         t6, t6, -1816
                  slli         s5, s11, 21
                  or           t3, a4, a7
                  or           t6, a6, t3
                  srli         t6, s10, 18
                  bne          zero, s6, 1602f
                  bltu         s0, t1, 1596f
                  bne          t1, a4, 1604f
                  auipc        s10, 568481
                  xor          s4, tp, t6
                  bgeu         s0, a2, 1597f
1596:             add          s4, t5, t1
1597:             add          s1, t0, s1
                  beq          t6, ra, 1612f
                  ori          s5, tp, -1132
                  sltu         a2, t1, sp
                  andi         zero, a6, -1875
                  bgeu         s8, t4, 1608f
1604:             slt          a3, s2, s4
                  slti         a7, s2, -640
                  ori          a4, s3, 851
                  ori          t2, s2, 2043
1608:             auipc        s1, 216458
                  srai         a1, s6, 6
                  bltu         s6, s5, 1618f
1612:             sltiu        zero, t1, -317
                  slt          t3, a4, t0
                  bltu         a0, a6, 1620f
                  bne          a2, a0, 1627f
                  auipc        sp, 282896
                  bne          s9, t1, 1625f
                  srai         t4, t6, 4
                  slli         s10, s10, 4
                  bgeu         a0, s10, 1626f
1625:             bne          gp, s1, 1643f
1626:             bgeu         s11, s4, 1627f
                  sub          a7, a6, a7
                  sra          s2, s8, gp
                  nop
                  sltu         t5, s9, gp
                  sra          a1, a1, s9
                  slt          tp, s4, s3
                  sll          a4, s10, a6
                  or           ra, a6, t2
                  ori          s4, a3, 1440
                  xor          a2, t4, s4
                  bltu         s0, s1, 1642f
                  bne          s4, t3, 1649f
1642:             xor          t2, a1, a3
1643:             nop
                  andi         a5, zero, -939
                  srli         gp, t3, 2
                  or           s5, t3, sp
                  andi         s11, s5, 1738
1649:             bne          s8, s11, 1657f
                  andi         t1, a1, 1139
                  slti         s11, a1, -1264
                  sub          t6, s2, s5
                  slli         t6, t5, 26
                  bltu         t1, t1, 1658f
                  xor          a7, s1, gp
                  sra          ra, a3, a3
1657:             addi         a4, ra, -972
                  slt          t4, s3, t3
                  addi         a5, s8, -1927
                  andi         s8, a0, -1243
                  slt          a7, s8, gp
                  srl          tp, s3, a6
                  lui          a6, 1012704
                  sll          s9, t1, a1
                  nop
                  and          s9, s0, t2
                  slti         s0, gp, -1943
                  addi         a2, gp, -770
                  blt          zero, t2, 1689f
                  and          s9, s6, s6
                  beq          s4, t0, 1680f
1680:             andi         a5, a5, 1065
                  bltu         gp, ra, 1696f
                  slt          t5, t5, a6
                  bge          a2, s0, 1689f
                  xor          a1, s10, a0
                  add          s3, s8, s8
                  bne          s5, t2, 1694f
                  or           t1, s4, s1
1689:             andi         a4, sp, -610
                  beq          a1, t6, 1710f
                  slti         s4, t6, 398
1694:             and          t6, s11, s9
                  sub          t4, s9, tp
                  lui          tp, 203959
                  srl          t2, s11, t5
                  sll          t4, s2, s11
                  bge          a5, s2, 1706f
                  bge          s0, t2, 1709f
                  slli         s11, s7, 26
                  andi         s0, t6, -345
1706:             srl          t1, s1, s6
                  addi         a5, a4, 1638
1709:             add          s5, s7, s3
1710:             sra          s9, sp, tp
                  lui          s1, 80290
                  sll          a5, t5, t1
                  add          a5, a3, a2
                  slti         t1, a7, 1460
                  sltiu        t1, a0, 307
                  sltiu        sp, s4, -85
                  sll          s2, t6, a5
                  andi         t6, s8, -1220
                  beq          s10, a2, 1730f
                  blt          s3, t4, 1741f
                  add          a0, s9, s9
                  and          s5, s6, a5
                  bne          t0, s9, 1732f
                  srli         zero, t2, 26
1730:             addi         t4, s8, 1889
1732:             auipc        t6, 319493
                  sltiu        t1, t0, -1852
                  xori         s10, t0, 16
                  sltiu        a6, s1, 1267
                  slt          s9, s0, zero
1741:             srl          tp, tp, sp
                  slt          a1, s5, t2
                  slt          t5, t1, s6
                  blt          s5, s9, 1761f
                  and          a5, a2, t3
                  and          tp, t2, s2
                  blt          s6, t6, 1759f
                  or           a2, s9, t3
                  xor          zero, a1, s4
                  sll          sp, a7, t5
                  beq          s1, s1, 1768f
                  srai         sp, a0, 20
                  bge          t3, a5, 1770f
                  xor          gp, t6, a0
1759:             add          t3, a7, s5
                  slli         a4, sp, 22
1761:             slt          t2, a2, s10
                  srai         gp, t6, 31
                  sra          s10, a4, t2
                  ori          s2, sp, 1596
                  sub          a0, t0, zero
                  beq          tp, s7, 1770f
1768:             nop
                  bltu         gp, sp, 1774f
1770:             andi         s11, s9, 1407
                  srl          s9, t4, a7
1774:             ori          zero, t4, -449
                  andi         a3, a6, -1974
                  or           gp, t5, t0
                  xori         s4, a2, 805
                  ori          s10, s4, -336
                  srli         t6, s7, 27
                  la           a6, region_0+3856
                  sh           s6, 34(a6)
                  sh           t4, 64(a6)
                  sh           s1, 64(a6)
                  lh           t1, 14(a6)
                  srai         s8, a1, 24
                  lbu          a5, -14(a6)
                  sh           tp, -14(a6)
                  sh           t1, -46(a6)
                  lhu          a3, 30(a6)
                  lhu          s9, 30(a6)
                  sh           a6, 30(a6)
                  sb           t0, 30(a6)
                  sb           t6, 30(a6)
                  lbu          ra, -27(a6)
                  lbu          s10, 31(a6)
                  sb           a6, -57(a6)
                  sb           a5, 7(a6)
                  and          a0, s5, t5
                  xor          tp, a0, t5
                  nop
                  srl          tp, a0, gp
                  slli         tp, s3, 11
                  add          a2, zero, t4
                  la           s4, sub_3
                  slti         ra, t0, -72
                  lui          a6, 1003330
                  sub          s11, t1, t6
                  ori          a7, s9, 1833
                  addi         s4, s4, -779
                  bgeu         s8, ra, main_j1
                  sltu         t1, zero, t3
                  nop
main_j1:          jalr         ra, s4, 779
                  blt          a4, zero, 1792f
                  xori         t3, t0, -78
                  sub          s9, a0, s9
                  sll          a0, a0, s3
                  bgeu         s5, a7, 1799f
1792:             bltu         s2, a2, 1793f
                  bne          t1, a7, 1809f
                  sltu         s4, t0, a6
                  srl          ra, a7, s7
                  sll          s5, sp, s11
1799:             xori         s10, t0, -435
                  bne          t1, s10, 1810f
                  addi         tp, s6, -941
                  addi         s10, a2, -2015
                  addi         s3, t4, 250
                  beq          tp, a1, 1808f
                  auipc        a4, 334094
1808:             nop
                  srai         s5, t5, 15
                  ori          a5, s1, 515
                  bne          s6, s0, 1820f
                  and          s8, t5, a4
                  or           s8, s7, s4
                  xori         t5, s0, -262
                  slti         a3, a7, 678
                  slti         a2, tp, -1828
1820:             bgeu         t6, s7, 1822f
                  andi         t5, s10, 244
1822:             sltiu        tp, t5, -545
                  sra          s4, t3, t2
                  sra          s9, gp, t4
                  slti         t2, zero, 501
                  slli         s4, s0, 20
                  addi         a1, t1, 1004
                  sra          gp, sp, s11
                  bltu         t6, a4, 1835f
                  bne          ra, sp, 1831f
1831:             or           a6, t4, s3
                  nop
                  sltu         a2, a7, s0
                  sltiu        t2, t2, 1635
1835:             bltu         tp, s6, 1846f
                  sltiu        a4, s7, -320
                  nop
                  add          t1, a0, zero
                  sra          t2, s2, s9
                  bge          ra, sp, 1844f
                  sltu         s5, a0, a7
                  sra          t3, s2, s7
                  bltu         a6, s9, 1851f
1844:             sll          t1, s4, s9
                  bne          s3, t4, 1846f
1846:             srli         t3, t1, 27
                  addi         s4, a3, 12
                  bne          a1, s8, 1858f
1851:             andi         tp, s3, 1525
                  bne          a5, a5, 1860f
                  slli         a6, t0, 23
                  sltiu        a4, tp, 880
                  and          gp, s5, tp
                  addi         a2, t4, -1590
1860:             bgeu         a1, a5, 1867f
                  slti         s3, t5, -1491
                  lui          s2, 93978
                  ori          s2, s7, -482
                  sll          t3, t6, a1
                  sra          t3, t4, s5
                  srai         a5, sp, 11
1867:             or           s2, a6, t4
                  andi         zero, s3, 1632
                  bltu         zero, s5, 1879f
                  srai         a2, zero, 12
                  nop
                  or           s4, sp, s0
                  bltu         gp, tp, 1882f
                  beq          sp, s1, 1883f
                  srli         t6, s1, 31
                  xori         s5, a3, 1290
                  bgeu         t0, a3, 1894f
1882:             blt          t0, a1, 1887f
1883:             slli         s11, s5, 22
                  addi         a0, tp, -217
                  slt          a4, s10, s1
                  bge          s2, a4, 1887f
1887:             sub          s11, t5, zero
                  addi         t2, s3, 774
                  ori          s1, a5, 747
                  and          s2, s5, t5
                  blt          zero, s3, 1896f
1894:             bge          a1, s0, 1895f
1895:             srl          tp, t6, a3
1896:             srl          a2, t0, t2
                  bge          t0, a6, 1900f
1900:             lui          sp, 459158
                  xori         zero, a1, -880
                  bgeu         s11, t2, 1917f
                  sltu         a1, s3, s7
                  sltiu        a7, a0, -1856
                  slti         s0, s9, -1221
                  bne          a2, s7, 1915f
                  sra          s0, a3, t1
                  nop
                  sub          s11, tp, a3
1915:             sll          s0, s5, sp
                  or           a1, t6, t2
1917:             sra          zero, a5, t2
                  auipc        s3, 181819
                  auipc        t4, 417990
                  bne          s11, a2, 1928f
                  lui          s8, 214304
                  auipc        a7, 798926
                  bgeu         s3, s3, 1933f
                  slli         t5, t4, 31
1928:             bne          s1, t1, 1935f
                  xor          s9, s7, a1
                  sltu         a1, ra, a2
                  sra          sp, t5, s1
                  bne          t0, t1, 1936f
1933:             sll          s10, s1, t4
                  srai         a1, a4, 8
                  xori         a4, t0, 120
                  slli         tp, a3, 4
                  addi         s1, gp, 8
                  slt          a0, a3, a7
                  slli         t1, a0, 8
                  auipc        a7, 102002
                  ori          a5, t3, 945
                  sltiu        a6, t0, 946
                  andi         gp, ra, -646
                  xor          a5, t4, t4
                  srai         s10, s3, 19
                  xor          t4, a5, a7
                  and          a0, s11, t1
                  srai         s1, s8, 1
                  srai         s9, tp, 4
                  andi         t2, tp, -911
                  slli         a1, t4, 13
                  srai         s1, t5, 10
                  bge          t0, s8, 1979f
                  sltiu        s9, t5, -100
                  addi         s10, a4, 683
                  slli         a7, s7, 19
                  srai         a0, s7, 14
                  sub          gp, a5, t1
                  or           t3, s7, s5
                  bgeu         gp, s0, 1985f
                  xori         a3, a0, 652
                  nop
                  slti         s11, sp, 680
                  srai         sp, a2, 13
                  andi         t6, s4, 1954
                  sra          tp, s8, s4
                  addi         a5, a4, 181
                  and          a1, t1, t4
                  lui          s11, 216989
                  bne          a0, zero, 1990f
                  bge          t6, t2, 1986f
1985:             sra          t1, s0, a6
1986:             slli         s2, ra, 17
                  sub          a0, s2, s9
                  auipc        ra, 380458
                  nop
1990:             sltu         t2, ra, t1
                  or           t5, sp, s0
                  addi         t3, s5, -1325
                  and          t3, t4, t6
                  bgeu         s9, gp, 2011f
                  sub          s8, a2, s6
                  addi         a6, a5, 79
                  slli         s11, t5, 9
                  slti         s10, a7, 803
                  lui          s10, 419983
                  srai         s3, t2, 0
                  add          a2, s9, t6
                  srli         s8, tp, 10
                  srai         s2, a2, 18
                  srai         s5, t4, 16
                  andi         s0, tp, -695
2011:             sub          t4, s9, a5
                  lui          t6, 177455
                  srl          a3, s10, t3
                  bltu         s0, s7, 2030f
                  bne          t3, s0, 2019f
                  or           t2, s5, s6
                  bgeu         t6, zero, 2030f
2019:             sltiu        a1, t2, 870
                  add          s5, a5, t4
                  sra          t6, s4, s10
                  add          s9, a0, t0
                  la           s4, region_1+41041
                  sh           a6, -55(s4)
                  lb           a6, 0(s4)
                  sh           a6, -29(s4)
                  lb           s0, 12(s4)
                  sb           s8, 62(s4)
                  lbu          t3, 28(s4)
                  slti         s3, a6, 2018
                  sb           t3, 4(s4)
                  lbu          s0, -46(s4)
                  srai         s3, s0, 30
                  sh           tp, 59(s4)
                  sb           t3, 1(s4)
                  xor          s8, s3, a6
                  sltiu        t3, s8, -1501
                  andi         t3, s3, 539
                  xor          t3, a6, s8
                  sll          s3, tp, s8
                  lb           s8, -32(s4)
                  lb           t3, 56(s4)
                  lhu          s0, 7(s4)
                  sub          s8, s3, t3
                  srl          tp, a6, s3
                  sb           tp, -35(s4)
                  sb           t3, 64(s4)
                  srli         s8, s3, 21
                  lhu          s0, -51(s4)
                  sb           s0, -14(s4)
                  and          t3, s0, s3
                  lw           t3, -41(s4)
                  sh           s0, 1(s4)
                  lh           s0, 31(s4)
                  sh           s8, -41(s4)
                  add          zero, s2, s10
                  auipc        a7, 102785
                  slti         s11, s5, -1813
                  andi         sp, s1, 1895
                  srli         a2, a5, 31
2030:             xori         t5, s10, -847
                  la x5, test_done
                  jalr x0, x5, 0
test_done:
                  li gp, 1
sub_5:            slti         s5, s11, 889
                  bge          s7, s10, sub_5_stack_p
                  sltiu        t5, s3, -1184
                  sra          a2, a4, t0
                  and          s8, s5, t2
sub_5_stack_p:    addi         s7, s7, -8
                  sltu         a2, ra, s7
                  sw           ra, 4(s7)
                  andi         a6, a2, -316
                  la           t3, region_0+1743
                  sw           t3, -247(t3)
                  lb           s11, -247(t3)
                  lb           t2, -247(t3)
                  lbu          a5, -247(t3)
                  lw           s4, -247(t3)
                  sra          t5, s7, gp
                  lw           a6, -247(t3)
                  lb           a2, -247(t3)
                  lh           s0, -247(t3)
                  lh           s4, -247(t3)
                  lbu          a7, -247(t3)
                  slli         s1, s10, 17
                  lhu          a0, -247(t3)
                  or           s1, t1, s9
                  sb           s8, -247(t3)
                  sh           t1, -247(t3)
                  sh           s6, -247(t3)
                  sh           s9, -247(t3)
                  nop
                  lh           a0, -247(t3)
                  srl          s5, s3, s2
                  sh           t3, -247(t3)
                  sb           ra, -247(t3)
sub_5_7:          jal          ra, 0f
0:                jal          ra, 5f
1:                jal          gp, 13f
2:                jal          t1, 11f
3:                jal          ra, 12f
4:                jal          ra, 9f
5:                jal          t1, 6f
6:                jal          ra, 8f
7:                jal          t1, 4b
8:                jal          ra, 3b
9:                jal          ra, 10f
10:               jal          ra, 2b
11:               jal          ra, 1b
12:               jal          ra, 7b
13:               and          t3, t4, s1
sub_5_4:          jal          ra, 4f
0:                jal          t1, 8f
1:                jal          s2, 5f
2:                jal          ra, 13f
3:                jal          s9, 9f
4:                jal          ra, 0b
5:                jal          ra, 2b
6:                jal          t1, 12f
7:                jal          sp, 10f
8:                jal          t1, 6b
9:                jal          ra, 1b
10:               jal          ra, 3b
11:               jal          a1, 7b
12:               jal          ra, 11b
13:               sll          t5, s10, s9
                  la           a7, region_1+49277
                  sb           zero, -24(a7)
                  la           s8, region_0+3198
                  sb           a6, 29(a7)
                  lbu          a0, -19(s8)
                  lb           ra, -28(a7)
                  lhu          ra, 42(s8)
                  lb           a5, -7(s8)
                  sh           a3, 119(a7)
                  sb           s0, 232(a7)
                  lb           s2, -47(s8)
                  lb           t4, 72(a7)
                  lbu          s1, 130(a7)
                  lbu          t2, 39(s8)
                  lbu          a0, 7(s8)
                  lb           s5, -5(s8)
                  lb           t6, -53(s8)
                  lbu          s10, 96(a7)
                  lbu          a2, -16(a7)
                  lhu          sp, 26(s8)
                  la           a4, region_0+594
                  la           a2, region_0+1173
                  la           a3, region_0+568
                  lhu          t6, 18(a3)
                  lhu          s2, -69(a2)
                  sh           s2, -14(a3)
                  sb           s11, -49(a3)
                  lb           s8, -9(a3)
                  sb           s10, -3(a3)
                  sh           a5, -119(a2)
                  lbu          s3, -41(a4)
                  lbu          t6, 177(a2)
                  lb           tp, 31(a3)
                  lhu          t5, 67(a2)
                  lbu          s2, -100(a2)
                  lb           a6, 56(a4)
                  sb           s1, 0(a4)
                  lb           sp, 5(a3)
                  lbu          s2, -62(a4)
                  sh           s9, -30(a3)
                  lb           s8, 49(a3)
                  lhu          tp, -32(a4)
                  lh           t5, 46(a3)
                  sb           s3, -52(a2)
                  addi         s1, zero, 7
                  sltu         s9, sp, ra
                  srli         ra, s1, 1
                  addi         s3, zero, 7
                  sll          sp, zero, a3
                  sra          a7, s0, a6
                  sra          a0, zero, s8
                  srl          t4, t5, tp
                  xori         s10, s7, -1260
sub_5_18_0_t:     nop
                  andi         t5, s2, -596
                  addi         s1, s1, -6
                  sltiu        s0, a4, -2020
                  sra          t2, gp, gp
                  slt          s4, sp, a7
                  bgeu         s1, s3, sub_5_18_0_t
                  addi         a1, t0, -1808
                  la           tp, region_1+34470
                  la           s4, region_0+1238
                  lb           a5, -53(tp)
                  lw           t1, -6(s4)
                  sw           s7, -42(tp)
                  sh           s7, -12(s4)
                  lb           a7, 17(tp)
                  lbu          t1, -7(s4)
                  sb           a7, -9(s4)
                  sw           a4, 10(s4)
                  lb           a2, -15(s4)
                  sb           s0, -28(tp)
                  lh           a7, -16(s4)
                  sb           a4, 15(s4)
                  lb           s1, -51(tp)
                  la           s1, region_0+684
                  lbu          a2, 565(s1)
                  auipc        s0, 555165
                  lbu          t3, -303(s1)
                  lbu          a6, 1250(s1)
                  lbu          s0, 232(s1)
                  lw           a2, -460(s1)
                  lbu          a2, 1453(s1)
                  sltiu        a2, s0, 665
                  srli         tp, a6, 3
                  sh           a6, 592(s1)
                  sb           s0, 1223(s1)
                  srl          a6, t6, t6
                  lb           tp, 1319(s1)
                  sb           a2, -628(s1)
                  lb           a2, 566(s1)
                  auipc        t6, 540208
                  lb           t3, 1263(s1)
                  or           a6, t3, t6
                  sltu         a6, s0, tp
                  sltu         t6, t6, a6
                  sw           tp, -368(s1)
                  and          t3, t3, tp
                  sub          s0, t3, s0
                  sb           t3, 1103(s1)
                  lbu          tp, 705(s1)
                  lb           tp, 752(s1)
                  lhu          a2, 1762(s1)
                  lbu          t6, 1790(s1)
                  addi         a2, t6, 1577
                  lh           tp, 2004(s1)
                  slli         tp, tp, 17
                  or           tp, t6, t6
                  sub          tp, t3, a6
                  sb           tp, 1975(s1)
                  la           s10, region_1+57030
                  lbu          s11, -42(s10)
                  lb           a5, -9(s10)
                  sh           ra, -36(s10)
                  sb           t1, 15(s10)
                  sb           t1, -43(s10)
                  la           tp, region_0+2126
                  sb           a6, 37(s10)
                  sh           t3, -340(tp)
                  lbu          s9, 14(s10)
                  lb           t2, 1251(tp)
                  sb           s3, -63(s10)
                  sb           gp, 817(tp)
                  lb           t4, 1575(tp)
                  sb           s8, 175(tp)
                  lh           s2, 8(s10)
                  sb           t3, -287(tp)
                  sb           s8, 3(tp)
                  lh           ra, 1942(tp)
                  lhu          s8, -24(s10)
                  la           t4, region_0+1286
                  la           sp, region_0+732
                  sw           gp, -2(t4)
                  lb           s9, -3(t4)
                  lb           zero, -64(sp)
                  lb           t1, 55(sp)
                  lb           s4, 33(sp)
                  lb           s8, 5(t4)
                  lbu          s0, 13(t4)
                  sb           s5, 37(sp)
                  sb           s3, 57(sp)
                  lbu          s0, 25(sp)
                  sh           a2, 0(t4)
                  sb           s2, -31(sp)
                  lh           ra, 2(t4)
                  la           s9, region_1+11073
                  la           t4, region_1+51233
                  sb           t3, 100(t4)
                  lb           t5, -1690(s9)
                  lb           s4, 123(t4)
                  la           a4, region_1+9524
                  sb           a6, 9(a4)
                  lb           s3, 202(t4)
                  sw           s5, 2015(s9)
                  lbu          a1, -210(a4)
                  lb           ra, 98(t4)
                  lbu          s5, 41(a4)
                  lbu          s8, -25(a4)
                  lb           ra, 272(s9)
                  lb           s0, 128(t4)
                  lhu          s1, -197(t4)
                  sb           a7, 226(a4)
                  sh           s2, -1763(s9)
                  lbu          a0, -69(a4)
                  sw           t6, -256(a4)
                  lhu          s1, -1985(s9)
                  lb           s11, -88(a4)
                  lbu          s4, 137(s9)
                  lbu          s5, -824(s9)
                  sb           t0, 46(t4)
                  lb           a3, -1426(s9)
                  addi         sp, zero, -7
                  slt          s1, t3, a1
                  addi         a0, zero, 0
sub_5_16_1_t:     xori         a5, a3, 1099
                  addi         sp, sp, 1
                  addi         a2, s7, -666
                  ori          s1, gp, 1309
                  addi         t2, zero, 10
                  addi         s5, zero, 18
                  sltiu        a5, a0, 705
sub_5_16_0_t:     andi         t1, s4, 1406
                  slti         a6, t3, 1944
                  xori         t4, a4, 998
                  andi         s8, s8, -1794
                  or           s0, sp, a7
                  addi         t2, t2, 5
                  bltu         t2, s5, sub_5_16_0_t
                  bne          sp, a0, sub_5_16_1_t
                  auipc        t5, 537410
                  addi         tp, zero, 8
                  ori          s4, a5, -58
                  addi         sp, zero, 15
                  slt          a6, s1, t1
sub_5_19_1_t:     xor          s8, a1, ra
                  auipc        a3, 455821
                  slli         a6, s6, 11
                  sltu         a0, t4, t2
                  addi         tp, tp, 8
                  addi         s10, zero, -7
                  addi         t5, zero, -19
                  andi         s9, gp, -1789
sub_5_19_0_t:     xori         a7, s6, 997
                  add          a3, a5, a1
                  addi         s10, s10, -3
                  and          s2, a5, s7
                  bne          s10, t5, sub_5_19_0_t
                  lui          a0, 48190
                  bltu         tp, sp, sub_5_19_1_t
                  ori          a4, a3, -288
                  la           a5, region_1+14757
                  xori         t6, a6, -976
                  lbu          s9, -26(a5)
                  sb           s0, -27(a5)
                  sb           t4, -29(a5)
                  nop
                  lw           t5, -29(a5)
                  add          sp, s6, s0
                  sb           a3, -29(a5)
                  or           t6, a2, t6
                  lhu          a2, 19(a5)
                  and          gp, a1, s2
                  sb           s8, -52(a5)
                  sh           t4, 5(a5)
                  sb           a6, 5(a5)
                  sh           tp, 5(a5)
                  sb           a2, 5(a5)
                  la           s3, region_1+18075
                  sh           a2, -1819(s3)
                  andi         t6, zero, 714
                  sh           a4, 1435(s3)
                  lhu          t3, 1435(s3)
                  sb           a2, 1435(s3)
                  lh           s0, 1435(s3)
                  sb           s0, -2012(s3)
                  lbu          a0, -2012(s3)
                  lb           s4, -2012(s3)
                  lb           t2, -2012(s3)
                  lbu          zero, -2012(s3)
                  lb           t6, -2012(s3)
                  sll          t6, t1, s10
                  lbu          s10, -2012(s3)
sub_5_6:          jal          ra, 10f
0:                jal          a2, 7f
1:                jal          ra, 4f
2:                jal          ra, 3f
3:                jal          ra, 8f
4:                jal          t1, 9f
5:                jal          a5, 1b
6:                jal          a7, 12f
7:                jal          s0, 11f
8:                jal          ra, 5b
9:                jal          ra, 6b
10:               jal          ra, 0b
11:               jal          t1, 2b
12:               slli         s4, s0, 11
                  la           sp, region_0+167
                  ori          a3, a2, 1868
                  srai         t2, a3, 31
                  add          t2, tp, t5
                  lhu          tp, -61(sp)
                  and          t2, a6, t2
                  sb           t2, -157(sp)
                  sh           tp, 55(sp)
                  addi         t2, a3, 1435
                  lb           a2, 1(sp)
                  sb           a2, 106(sp)
                  sltu         tp, a6, a3
                  sh           t5, -21(sp)
                  sra          tp, a3, a6
                  lbu          t2, 127(sp)
                  lb           a6, -94(sp)
                  andi         a6, a2, 1189
                  srli         a6, t2, 23
                  xor          tp, tp, t2
                  srli         t2, tp, 29
                  sltu         t5, t5, a2
                  lbu          a6, 50(sp)
                  sra          tp, t2, tp
                  lb           t5, 236(sp)
                  add          t5, t2, t2
                  sltiu        a6, a2, -148
                  srai         a2, t5, 7
                  lbu          tp, 102(sp)
                  lb           a3, 161(sp)
                  sltu         a6, a2, a2
                  lb           t2, 158(sp)
                  lb           a6, 133(sp)
                  sll          a6, t2, a6
                  lh           a6, -165(sp)
                  sltiu        tp, a3, -95
                  sb           a3, 191(sp)
                  sw           a6, -111(sp)
                  la           a2, region_1+30599
                  sb           s0, -10(a2)
                  sb           t0, 10(a2)
                  lbu          sp, -11(a2)
                  lb           s0, 3(a2)
                  la           a5, region_1+29238
                  sh           sp, -7(a2)
                  lh           t4, -11(a2)
                  lb           s10, -9(a5)
                  lb           t3, 9(a5)
                  lbu          s8, 7(a5)
                  lhu          s11, 12(a5)
                  lb           s3, 11(a5)
                  lbu          s5, -12(a2)
                  sh           s8, -11(a2)
                  lb           tp, 5(a5)
                  lbu          s1, 15(a2)
                  lhu          s0, -4(a5)
                  sw           s9, -2(a5)
                  lb           s2, -6(a5)
                  lbu          s8, -8(a2)
                  la           a3, region_1+35090
                  andi         s8, t1, 1688
                  srai         s0, s7, 19
                  sb           t3, -1585(a3)
                  sb           s5, -284(a3)
                  lb           s8, 1750(a3)
                  auipc        a0, 326085
                  auipc        s11, 384845
                  sltiu        s2, gp, 1162
                  ori          s11, s1, -220
                  lb           t4, -1714(a3)
                  sh           ra, 642(a3)
                  lbu          s5, 676(a3)
                  slti         s9, ra, 1967
                  sb           tp, -365(a3)
                  xori         s4, t1, -495
                  lhu          t5, -712(a3)
                  sw           t1, 1602(a3)
                  xor          a5, a3, s3
                  add          s8, s11, t4
                  nop
                  and          t1, sp, t6
                  sltu         s3, a4, ra
                  srli         t4, s10, 25
                  andi         s11, s8, 1860
                  lbu          a4, 367(a3)
                  lh           a2, -1840(a3)
                  srli         s10, s8, 6
                  lb           tp, 1023(a3)
                  la           s1, region_1+36564
                  xori         t4, s10, 1337
                  sh           s10, 2(s1)
                  sb           a1, -13(s1)
                  lh           a7, -8(s1)
                  lh           s4, -4(s1)
                  lh           a0, -8(s1)
                  lb           a4, -11(s1)
                  sb           a7, -6(s1)
                  sw           s11, -16(s1)
                  sh           t1, -2(s1)
                  srai         s5, s10, 12
                  lb           tp, 9(s1)
                  sb           t4, -5(s1)
                  sb           t5, -7(s1)
                  sb           a0, -4(s1)
                  sll          t1, t6, s6
                  lb           a6, -2(s1)
                  sb           s2, -8(s1)
                  sh           t1, -6(s1)
                  xori         a7, ra, 1412
                  slli         a3, a7, 19
                  lb           a6, -2(s1)
                  sb           s6, -13(s1)
                  auipc        sp, 119535
                  lbu          s5, -4(s1)
                  lbu          s9, -3(s1)
                  lbu          s0, 9(s1)
                  sll          zero, a3, a2
                  srai         zero, a4, 14
                  sb           s1, -10(s1)
                  auipc        s10, 164511
                  lbu          tp, 15(s1)
                  lb           zero, -13(s1)
                  lb           a5, 15(s1)
                  la           a2, region_0+3662
                  and          zero, a6, t1
                  sb           s1, -141(a2)
                  sb           gp, 113(a2)
                  lw           t2, 14(a2)
                  xori         s10, s1, 1022
                  lui          s8, 549823
                  or           s8, s2, a1
                  andi         t1, s5, 1421
                  lhu          s10, 76(a2)
                  andi         s2, t1, 1391
                  auipc        a1, 567106
                  slt          t3, s3, t3
                  sh           a4, 136(a2)
                  sb           a7, 177(a2)
                  sltiu        a4, s2, 1789
                  lb           a7, -71(a2)
                  lh           ra, -152(a2)
                  sll          t3, t2, t3
                  sb           a1, -113(a2)
                  sltiu        s10, tp, -2026
                  lb           s0, 231(a2)
                  ori          s10, s3, 1998
                  add          zero, s1, sp
                  ori          a0, gp, 1259
                  sb           s6, -29(a2)
                  lui          s2, 409485
                  sltu         s10, a2, a4
                  lui          a1, 774966
                  sb           a6, 153(a2)
                  slti         sp, a7, -1226
                  xor          s10, s8, t5
                  lbu          a7, 75(a2)
                  sw           s6, -6(a2)
                  andi         s8, t2, -606
                  lb           gp, 12(a2)
                  ori          s8, t6, 148
                  sb           zero, 244(a2)
                  lb           t6, -33(a2)
                  or           a6, s4, sp
                  sb           s4, 171(a2)
                  lb           s3, 33(a2)
                  lb           t6, 132(a2)
                  la           s11, region_0+2662
                  sb           a2, 13(s11)
                  sra          t3, t3, s0
                  sltu         a4, a2, gp
                  sw           a4, 14(s11)
                  sra          a5, a4, t3
                  lbu          a2, 1(s11)
                  sb           gp, -15(s11)
                  add          a5, a4, t3
                  lui          gp, 748083
                  add          a5, s0, a5
                  srli         a2, a2, 30
                  sltiu        t3, t3, 1395
                  srl          t3, a4, a5
                  srai         s0, a5, 17
                  srl          t3, a2, s0
                  lb           gp, 3(s11)
                  srai         t3, a5, 0
                  sb           t3, 14(s11)
                  lbu          gp, -11(s11)
                  xori         a4, a4, -226
                  sh           t3, -16(s11)
                  auipc        a5, 645341
                  lbu          s0, -1(s11)
                  sb           a5, -9(s11)
                  lb           t3, -13(s11)
                  sh           s0, -4(s11)
                  or           a4, gp, a5
                  lh           a4, -12(s11)
                  sltu         gp, gp, a5
                  sb           a2, 7(s11)
                  la           a3, region_1+18715
                  lhu          sp, 31(a3)
                  lb           a0, 31(a3)
                  sltiu        sp, s5, 948
                  sh           s2, 31(a3)
                  lhu          zero, 31(a3)
                  lh           gp, 31(a3)
                  lh           s10, 145(a3)
                  lh           t6, 189(a3)
                  sb           s5, -210(a3)
                  lbu          s4, -116(a3)
                  sltiu        ra, sp, -986
                  lw           t3, -135(a3)
                  sb           t4, 187(a3)
                  lhu          t3, -41(a3)
                  lbu          t5, -41(a3)
                  lbu          s0, -41(a3)
                  lb           s0, 34(a3)
                  lhu          t3, 163(a3)
                  lh           s4, 163(a3)
                  sb           gp, 54(a3)
                  bge          t1, a1, 19f
                  srai         s5, a7, 21
                  sltiu        t1, t3, -1190
                  bltu         a3, a2, 24f
                  add          t1, a4, t1
                  xor          gp, a7, a3
                  slti         zero, ra, -1604
                  bge          s10, sp, 19f
                  bne          a2, sp, 27f
                  xor          s5, s9, s6
                  bltu         gp, s8, 26f
                  srai         s5, s2, 15
                  sltu         t4, t2, zero
                  lui          t1, 727040
                  and          s4, zero, s11
                  add          s1, zero, s3
19:               sra          s2, s4, t3
                  bltu         s8, s10, 35f
                  sll          gp, a5, zero
                  slli         a2, t5, 8
                  srai         t1, sp, 10
24:               addi         s5, a2, 487
                  add          t1, t2, zero
26:               bgeu         a5, t3, 39f
27:               addi         s9, s10, 672
                  addi         a4, s10, 1366
                  andi         t5, zero, -55
                  ori          s4, a5, 1941
                  lui          ra, 977890
35:               xor          t6, a1, a6
                  beq          a0, a7, 44f
                  blt          s11, s6, 48f
                  sll          s11, gp, s8
39:               sra          t1, s2, a2
                  srai         gp, a3, 3
                  sra          t2, tp, sp
                  bltu         s1, gp, 51f
                  bne          a0, s7, 60f
                  bge          a0, t0, 58f
48:               nop
                  srl          s8, t3, a2
                  addi         s9, zero, 1078
                  beq          s11, a2, 63f
58:               sltu         s5, a6, a4
                  sll          t6, s9, t3
60:               blt          s3, s11, 74f
                  sll          a5, t6, s2
                  srli         ra, a3, 27
63:               slli         a0, a1, 26
                  ori          s8, s0, 628
                  blt          s11, t2, 75f
                  auipc        s5, 1001965
                  sltiu        t4, s5, -995
                  sltu         s11, a6, s6
                  beq          a1, gp, 91f
74:               srl          s1, s9, sp
75:               bge          t5, a2, 93f
                  srai         a4, a4, 7
                  srai         s8, t0, 5
                  slt          a5, s5, s2
                  bne          a6, s9, 97f
                  nop
                  slti         s1, a5, -1266
                  srli         t1, s8, 8
                  lui          a0, 646757
                  srl          t3, t2, zero
                  sra          s8, s6, s4
                  sltiu        t4, t4, 610
                  sltu         a1, t1, s7
91:               nop
93:               bge          t1, ra, 108f
97:               lui          s1, 748887
                  sra          gp, t0, a3
                  sub          s2, a6, s11
                  bne          t0, s9, 117f
                  xori         zero, t6, -1605
                  srai         a5, t3, 7
                  andi         s4, a7, -1275
                  slli         a5, s0, 30
                  sll          s8, s2, s10
                  srli         s3, gp, 18
                  sra          s11, a4, s0
                  blt          a0, a5, 128f
                  and          t2, tp, s5
                  blt          s4, a3, 133f
                  sub          gp, zero, t2
117:              and          a0, a3, s0
sub_5_5:          jal          ra, 1f
0:                jal          ra, 10f
1:                jal          ra, 5f
2:                jal          ra, 7f
3:                jal          t1, 8f
4:                jal          t1, 2b
5:                jal          s11, 6f
6:                jal          tp, 4b
7:                jal          ra, 9f
8:                jal          ra, 0b
9:                jal          t1, 3b
10:               sltiu        s5, s0, 1520
                  add          s8, t6, s11
                  sltu         t6, s11, a0
                  bge          a5, t5, 130f
                  andi         t5, s2, -1026
                  sll          a0, s8, s5
                  sub          a6, s3, s2
                  sltiu        s5, s0, 1214
                  sltu         sp, t6, a3
                  addi         s11, a6, -642
                  addi         s11, a2, 1148
                  bltu         t4, ra, 135f
                  slt          t1, s9, a4
133:              bne          ra, tp, 146f
                  srli         s4, s5, 0
135:              slt          a2, s4, s0
                  sra          tp, tp, sp
                  xori         a6, gp, 389
                  xor          ra, s5, s3
                  and          t2, s0, a6
                  xor          t3, s0, ra
                  sll          s10, a3, t4
                  lui          s8, 642270
                  add          s2, s7, s6
                  and          s11, gp, s2
146:              and          ra, a2, sp
                  beq          t6, a3, 162f
                  beq          s10, a6, 152f
                  bltu         s11, a6, 163f
                  slti         a7, s1, -1650
152:              addi         s2, s9, -1704
                  slt          s9, s8, a4
                  bltu         s0, s10, 158f
                  srli         t6, t6, 22
                  ori          a0, t4, -2044
                  beq          a7, s10, 170f
                  blt          a3, gp, 168f
                  xori         a3, a5, -238
162:              xori         ra, zero, 1316
163:              addi         sp, t3, -835
                  bne          tp, tp, 176f
168:              srl          t1, tp, s6
                  and          gp, t2, s4
                  blt          s3, s3, 176f
                  beq          sp, a3, 186f
                  sra          t1, t6, zero
                  slli         s5, s10, 11
                  bltu         gp, t4, 192f
                  srli         a5, ra, 10
                  and          a7, s6, t5
                  bge          t5, a5, 189f
                  la           t1, region_1+48004
                  sub          a5, sp, sp
                  sub          s5, a2, a5
                  lui          s5, 668380
                  sb           s3, -374(t1)
                  xori         sp, sp, -1947
                  sb           a2, -1230(t1)
                  lh           s5, -320(t1)
                  lb           sp, 394(t1)
                  lhu          s3, -1108(t1)
                  sb           s3, -1768(t1)
                  lbu          ra, -387(t1)
                  or           a5, s5, s3
                  sb           sp, 345(t1)
                  lbu          s5, 2043(t1)
                  sb           s5, -1357(t1)
                  sh           s5, -418(t1)
                  lhu          s3, 96(t1)
                  lh           ra, -418(t1)
                  lbu          a5, 1240(t1)
                  lbu          a5, -818(t1)
                  sh           s3, 1076(t1)
                  lbu          a5, 1990(t1)
                  lh           s5, 1346(t1)
                  lb           a2, 425(t1)
                  lb           ra, -632(t1)
                  lbu          sp, 381(t1)
                  sra          s5, a5, ra
                  lhu          s3, 454(t1)
                  andi         a2, s5, -805
                  sb           s3, 1125(t1)
                  sltu         a2, a5, ra
                  lbu          a2, 1018(t1)
                  lbu          sp, 1838(t1)
                  lb           s5, -640(t1)
                  srl          t4, t0, s6
                  and          t6, t0, sp
                  srai         ra, a5, 21
186:              bltu         s10, t0, 201f
                  sltiu        a2, s0, -1616
                  srli         t6, a6, 11
189:              sll          s4, ra, ra
                  xor          tp, gp, s8
                  srai         s5, a3, 14
192:              sub          s8, s5, s3
                  sra          s8, s3, t5
                  xor          t1, s7, s8
                  sll          t1, t4, sp
                  sra          t5, a3, s7
                  sub          s8, t3, s11
                  srl          s5, a6, s3
                  lui          a5, 868782
                  bgeu         s3, s8, 219f
                  or           t3, t2, a6
                  sll          ra, s0, a0
                  la           sp, region_0+1598
                  lbu          s9, -29(sp)
                  lb           s5, -13(sp)
                  lbu          a7, 47(sp)
                  sb           s10, -41(sp)
                  add          t1, s9, a2
                  sh           t2, 4(sp)
                  sub          s0, zero, s2
                  auipc        a2, 245116
                  lbu          a1, -45(sp)
                  andi         a3, s1, -1288
                  lh           t3, -42(sp)
                  sb           a5, -25(sp)
                  lhu          zero, -18(sp)
                  lb           a7, -63(sp)
                  lb           a4, 6(sp)
                  lhu          t4, 52(sp)
                  auipc        a7, 758593
                  slli         t1, a5, 14
                  nop
                  add          zero, s4, s0
                  and          s10, t0, s2
                  lbu          t5, -3(sp)
                  lhu          a5, -4(sp)
                  lbu          a6, -3(sp)
                  lb           t4, 16(sp)
                  sll          gp, s4, s5
                  lbu          t1, -60(sp)
                  lb           t1, -6(sp)
                  sw           s4, -50(sp)
                  sb           a0, 33(sp)
                  andi         t2, s5, 610
                  slli         gp, t1, 8
                  lbu          t4, -53(sp)
                  srli         s1, t5, 28
                  lw           gp, 26(sp)
                  lbu          s0, 17(sp)
                  and          s0, gp, ra
                  sll          s8, s3, s1
                  lbu          a1, -59(sp)
                  slli         t6, t3, 16
                  add          a7, a7, s2
                  andi         s1, s11, -480
                  lb           s0, 41(sp)
                  sub          s3, s5, a1
                  sh           tp, 16(sp)
                  auipc        a4, 434279
                  sb           s3, -33(sp)
                  sw           s6, 34(sp)
                  sh           t1, 64(sp)
                  lbu          t4, -41(sp)
                  xori         a1, a1, 22
                  bltu         tp, a0, 218f
                  bgeu         zero, zero, 226f
                  bgeu         s3, a7, 213f
                  bne          s1, t1, 225f
                  beq          t4, s9, 230f
213:              slt          a7, sp, a6
                  slti         s4, t6, -1323
                  addi         t5, s0, 332
                  xori         s9, s10, -801
                  srai         s0, sp, 5
219:              slti         s8, t4, 285
                  srli         s3, s10, 6
                  sra          t6, a4, a6
                  beq          a0, s5, 239f
                  slt          s11, s2, t5
                  bge          t1, zero, 233f
226:              bge          s0, s3, 232f
                  lui          ra, 198096
                  blt          tp, s11, 247f
                  sll          s1, s5, s2
232:              or           tp, tp, t4
233:              add          a6, s8, a1
                  bgeu         a6, a0, 245f
                  xori         a1, t0, -552
                  sltu         s2, a5, a6
239:              slli         s5, gp, 19
                  sub          s11, t1, zero
                  sra          s5, a1, a2
                  bne          s0, a6, 258f
245:              sltu         a6, sp, t6
247:              bge          a0, a3, 260f
                  sub          s9, s5, s7
                  sra          s0, s6, s0
                  auipc        s2, 812709
                  ori          s1, t4, -1218
                  xor          t6, s5, s8
                  and          t6, t1, s5
258:              sltu         s0, s2, s11
                  slli         s0, a4, 31
260:              slti         a0, t0, -284
                  srli         t2, s8, 7
                  bge          a2, t3, 275f
                  srli         s2, s0, 22
                  nop
                  beq          s1, a6, 280f
                  slt          t2, a6, s3
                  bge          s0, t5, 288f
                  sltiu        t1, t0, 1941
                  sltiu        a3, tp, 1878
                  or           sp, a0, s6
275:              sub          a2, a5, t1
                  sltiu        sp, a3, -360
                  andi         s4, t0, -953
280:              xor          s5, s4, t2
                  srai         t2, gp, 0
                  srl          ra, a7, s3
                  bltu         a0, a1, 293f
                  sra          t4, a4, a0
                  sltiu        t1, t1, 113
288:              srl          t2, zero, t2
                  srli         a2, a5, 31
                  lui          t1, 905486
293:              xori         sp, t2, 1673
                  slti         s3, sp, -1890
                  xor          a6, gp, a3
                  sltu         gp, t5, tp
                  bne          s7, a0, 314f
                  nop
                  slli         a2, a2, 24
                  beq          s9, t6, 305f
                  xori         s8, s5, -1058
                  and          a3, s4, t3
305:              sltiu        s8, a6, -1246
                  xor          sp, a6, a5
                  sltu         gp, a5, s3
                  bge          a1, t3, 322f
                  addi         a5, a3, -1379
                  slli         s8, a6, 12
314:              bge          a5, ra, 328f
                  bltu         s3, s7, 328f
                  sltu         sp, t3, ra
                  srl          t3, s0, t5
                  add          s9, t1, s5
                  bne          t6, t6, 336f
                  bge          a3, s6, 338f
                  add          a5, a5, a0
                  xor          s11, s1, s6
                  slli         a7, a4, 23
328:              sltiu        ra, t6, 1413
                  or           s1, a7, t4
                  ori          s8, s2, 562
                  xori         s5, t3, -1510
                  and          a0, s9, s3
                  auipc        t2, 118081
                  sll          ra, a5, s11
336:              ori          s8, s7, -1415
                  blt          zero, a0, 352f
338:              lui          t2, 796591
                  add          a0, t2, tp
                  srli         s5, s11, 13
                  blt          t0, a1, 347f
                  sll          s8, tp, t1
                  nop
                  srl          t4, a7, t1
347:              and          s5, s9, a5
                  slt          a2, s9, a2
                  bgeu         gp, s7, 366f
                  xor          a7, t4, s5
                  ori          t6, s10, -1446
352:              srai         s0, s7, 12
                  andi         t6, t0, 333
                  slti         a3, t0, 1810
                  addi         gp, a3, 1469
                  bgeu         a2, a0, 375f
                  srai         tp, a1, 10
                  addi         t2, a6, 1628
                  bge          a6, s0, 369f
                  and          s8, ra, t2
                  sra          s3, s8, zero
366:              slli         a6, t3, 4
                  slli         t1, a6, 29
                  blt          s3, s0, 388f
                  slti         t5, t4, -1125
                  sltiu        a7, t5, -1504
                  add          s8, t6, a6
375:              beq          a0, s10, 390f
                  bne          a7, t1, 384f
                  sub          a0, sp, s1
                  lui          t2, 618361
                  slli         gp, a5, 2
                  beq          s8, s1, 390f
                  addi         s9, gp, 1307
                  bne          a6, a0, 396f
384:              add          a5, s9, ra
                  sub          s8, s7, s11
                  auipc        s11, 989142
388:              or           t3, s5, t3
                  srli         a5, s8, 7
                  beq          s3, t0, 401f
                  xori         t3, s9, -582
                  srli         ra, a1, 12
                  srai         a4, a3, 14
396:              sra          zero, t2, t1
                  sra          a5, a0, a2
                  srai         s8, s8, 8
                  xori         a7, s10, 1578
401:              sltu         a3, t6, sp
                  nop
                  srai         zero, a6, 14
                  add          s8, t3, tp
                  bne          a6, s10, 423f
                  bge          t2, s9, 423f
                  auipc        t1, 27664
                  or           tp, s10, s1
                  bge          t5, t3, 426f
                  sltiu        s5, s8, -986
                  andi         t5, s7, 770
                  sra          a3, t0, t6
                  nop
                  sll          s0, a6, s4
                  bltu         a5, s4, 431f
                  and          t5, a6, t1
                  bne          s2, a3, 434f
                  or           a0, s4, a3
423:              addi         zero, s4, 1354
                  auipc        s1, 671907
                  and          a6, s4, s5
426:              srl          a4, s5, a7
                  slli         t1, a6, 19
                  sltu         sp, a5, s7
                  srl          s10, a1, s2
431:              srli         t2, a6, 30
                  srl          s3, t6, t0
                  bge          s5, s1, 446f
434:              sra          t3, a7, zero
                  bge          t4, a1, 453f
                  slli         a5, tp, 4
                  sltiu        s1, s6, -1003
                  beq          s4, s10, 452f
                  beq          zero, t4, 443f
                  bltu         a5, s4, 459f
                  bgeu         s10, a1, 453f
                  bge          a3, s8, 456f
                  slti         ra, a1, -862
                  sltiu        t5, a2, -1719
                  sra          a4, gp, t0
                  xori         s9, s3, 3
452:              ori          s9, t3, 1536
                  nop
                  sub          s1, s0, s6
456:              bne          t0, sp, 465f
                  add          a2, a4, t3
                  auipc        s0, 711924
                  xor          a6, tp, a2
                  nop
                  and          a6, s10, s5
                  slt          s4, tp, a6
465:              srli         t1, t1, 9
                  xor          s3, s2, a1
                  sra          a3, t5, a6
                  sll          a6, s9, t1
                  or           a1, t5, t5
                  bltu         s7, zero, 485f
                  sltu         a6, a5, s10
                  nop
                  bge          a4, ra, 479f
                  xor          s9, tp, t0
                  sub          a2, a3, s8
                  ori          a7, t0, -886
479:              sra          sp, s1, a2
                  srl          s8, tp, a6
                  bgeu         gp, s11, 497f
                  blt          s8, s1, 498f
485:              or           t1, t1, zero
                  bge          a4, s11, 498f
                  sub          sp, s9, s11
                  ori          s0, a3, -396
                  srai         a3, a7, 13
                  sltu         t6, s5, s3
                  slli         a0, s11, 7
                  sll          a6, a0, s10
497:              xor          t4, t4, tp
498:              bge          s2, s1, 514f
                  auipc        s8, 781693
                  sra          s2, t6, t3
                  sll          s0, s1, a6
                  add          s2, a3, s10
                  xori         t1, a6, -1376
                  bne          t5, a2, 523f
                  sltu         t2, s5, sp
                  sub          zero, ra, s6
                  lui          ra, 967739
                  ori          s11, s2, -381
                  bge          a4, s1, 526f
                  blt          gp, s6, 518f
                  andi         a0, s6, -422
                  sll          t3, t4, s7
                  auipc        t6, 613028
518:              slli         s10, t4, 0
                  or           s9, s6, a2
                  srl          a7, t5, ra
523:              and          s0, sp, s8
                  lui          a6, 1007441
526:              srl          s9, t3, t2
                  xor          t2, t0, s10
                  auipc        a1, 334213
                  ori          s2, a4, 1192
                  beq          t1, a3, 548f
                  sra          s5, a1, t4
                  auipc        sp, 872454
                  slt          a7, t4, s4
                  addi         s0, s6, 1714
                  sub          t2, t6, s9
                  slti         s8, s2, -424
                  slt          a3, s10, s11
                  xor          a1, a7, zero
                  srai         sp, t5, 0
                  bgeu         a1, t6, 559f
                  xor          t3, t3, a3
                  sltiu        s0, t2, -797
548:              beq          a0, t4, 559f
                  xori         a1, s7, 700
                  xor          t4, a1, sp
                  sltiu        s10, s1, 180
                  sltiu        a0, a6, -1769
                  ori          t2, s7, -1369
                  bgeu         s9, s6, 563f
                  srai         t4, sp, 7
                  bge          t4, t2, 570f
                  addi         sp, a3, 1836
559:              addi         s4, t5, 859
                  and          s3, s4, a0
                  addi         tp, s10, -458
                  slt          s11, zero, zero
563:              auipc        t3, 1021378
                  srai         t3, a7, 8
                  sltiu        zero, s5, -1607
                  ori          ra, t5, 1264
                  addi         t1, a5, 710
                  bne          s3, tp, 585f
                  sub          s11, a7, a7
                  nop
                  add          s3, t2, a3
                  bgeu         tp, a0, 577f
                  sub          t4, s4, s7
                  xor          a7, s1, s0
577:              nop
                  bgeu         s9, t2, 589f
                  beq          t3, s8, 583f
                  auipc        t3, 760182
                  bltu         s0, a0, 600f
                  beq          a2, tp, 595f
                  slli         a5, t4, 0
585:              bgeu         a0, s10, 589f
                  auipc        a3, 640660
                  sra          sp, s5, a1
                  auipc        s10, 1046245
589:              slti         a2, t5, 732
                  xor          gp, t3, t2
                  and          s2, t1, a3
595:              blt          s2, t3, 613f
                  srli         s3, a3, 22
                  or           a1, sp, s6
                  bltu         sp, a3, 608f
600:              xori         t6, a2, -819
                  lui          s5, 515044
                  lui          a6, 321925
                  bge          s1, s6, 612f
                  add          s0, s1, zero
                  addi         t5, s2, 1646
608:              auipc        a1, 118128
                  bltu         s0, s1, 623f
                  blt          s5, t6, 628f
                  srli         t6, a6, 14
612:              srl          s5, gp, s6
613:              addi         s0, a5, 1467
                  sltu         a7, a5, t6
                  add          t3, a3, s3
                  or           a1, tp, a4
                  lui          a7, 741909
                  slli         a3, sp, 15
623:              auipc        ra, 902843
                  sra          a4, t0, ra
                  bge          ra, s11, 640f
628:              beq          t2, a7, 642f
                  srli         s8, s4, 0
                  add          s3, t6, t0
                  bne          gp, s11, 647f
                  beq          a4, a5, 646f
                  sra          s9, a5, s4
                  ori          t5, gp, -867
                  auipc        gp, 146700
                  ori          t2, t4, -1068
                  ori          s9, s4, 158
640:              slt          a4, s9, t0
                  slli         s2, t4, 3
                  auipc        s10, 886882
                  slli         tp, s4, 21
646:              auipc        a6, 200486
647:              beq          s5, ra, 662f
                  add          tp, t2, s0
                  bgeu         s0, s10, 669f
                  srli         ra, s6, 16
                  sra          s3, s11, s8
                  nop
                  and          a2, s7, a0
                  srl          s2, s9, sp
                  or           s11, t5, a4
662:              auipc        t2, 105710
                  srai         t6, a5, 10
                  sra          s11, s10, a3
                  auipc        ra, 812439
                  beq          s4, t6, 676f
                  bltu         s1, a6, 685f
669:              srai         s0, sp, 21
                  addi         t6, a6, 130
                  addi         a3, s2, 1950
                  xori         s3, t2, -497
                  or           s4, t4, s0
                  srli         s0, ra, 15
676:              and          s0, a0, s9
                  ori          sp, s1, 509
                  slt          s9, a0, t5
                  slt          a7, a2, t0
                  lui          a2, 437691
                  blt          a5, t1, 692f
                  sltu         gp, sp, s10
                  bltu         s11, a5, 688f
685:              andi         s9, tp, -1497
                  slti         t4, s5, -974
688:              bltu         s3, s6, 698f
                  blt          t1, s6, 704f
                  sra          a5, a1, s2
                  srli         s5, t6, 29
692:              or           zero, s0, tp
                  sra          a3, t0, s6
                  xori         tp, s1, 288
                  blt          a0, sp, 713f
                  lui          a5, 26465
698:              slti         s2, tp, -1888
                  sltu         a7, sp, s6
                  andi         t5, s7, -1079
                  bge          t3, a6, 706f
                  addi         a2, t3, 1981
                  srl          t6, s1, a6
                  or           a3, t6, t3
                  slli         s4, t2, 31
                  sltiu        s9, a5, 1513
                  bne          a6, s0, 728f
713:              add          a3, s2, s6
                  or           s8, tp, t6
                  xori         a0, t2, -1592
                  sub          s4, a4, a4
                  add          zero, s7, s10
                  addi         s2, zero, 5
                  sra          tp, zero, s3
                  nop
                  ori          sp, t1, 1642
                  slt          s1, s10, s6
                  addi         s3, zero, 17
                  auipc        t3, 917837
sub_5_17_1_t:     andi         zero, zero, 1301
                  slli         s1, t0, 25
                  sltiu        a2, s1, 1372
                  sub          s11, a3, s4
                  sltu         a3, a7, a3
                  ori          t2, t2, 1534
                  addi         s2, s2, 3
                  addi         s9, zero, 2
                  addi         s10, zero, -14
                  xori         t4, gp, 247
                  andi         a1, a6, 100
sub_5_17_0_t:     xori         tp, s11, -1121
                  addi         s9, s9, -1
                  sltiu        t1, tp, -1035
                  auipc        a4, 159781
                  ori          a1, ra, -761
                  auipc        s8, 499759
                  andi         a7, a2, -1713
                  bge          s9, s10, sub_5_17_0_t
                  ori          t3, a0, -205
                  bne          s2, s3, sub_5_17_1_t
                  addi         s3, s8, 838
                  xor          s11, t0, gp
                  slt          a2, zero, s5
                  srai         t4, s11, 21
                  bne          a7, a3, 737f
                  slti         a1, a5, 1447
                  nop
                  addi         s2, t3, 719
                  beq          tp, t2, 749f
737:              ori          t3, zero, -906
                  nop
                  bne          a4, s3, 756f
                  or           gp, zero, t3
                  bgeu         s11, a5, 745f
                  beq          t5, a0, 749f
                  addi         s1, s4, -646
745:              auipc        t6, 383760
                  blt          s7, t5, 764f
                  bltu         t5, zero, 760f
                  bltu         a0, a0, 757f
749:              srli         s8, a0, 9
                  sra          s9, s9, a2
                  sra          sp, t3, t4
                  sll          a1, sp, a5
                  nop
                  sltu         s8, s1, t5
756:              add          a1, t5, s7
                  la           s10, region_1+29277
                  la           gp, region_0+2149
                  sw           t4, 339(s10)
                  lbu          ra, 1270(gp)
                  lbu          s11, 80(gp)
                  sb           s9, 426(s10)
                  lhu          a3, -587(gp)
                  sb           s5, 30(s10)
                  lw           a6, -793(gp)
                  lbu          a0, -1595(s10)
                  sb           s3, 1661(s10)
                  lb           sp, 1045(s10)
                  lbu          ra, -1416(s10)
                  lbu          tp, -358(gp)
                  lbu          zero, -836(s10)
                  sb           a1, -1178(gp)
                  bne          s1, t6, 771f
                  andi         s4, t0, -1834
760:              slli         s1, s0, 4
                  bge          s11, s5, 770f
                  lui          s8, 970668
                  slti         a1, s4, 1787
                  addi         a0, t2, -1818
                  xori         a0, a7, -767
                  bltu         s10, a5, 782f
                  blt          s11, t5, 787f
771:              ori          a5, gp, -1591
                  sub          t1, a0, gp
                  xor          a5, a3, t4
                  bltu         s4, sp, 783f
                  bne          s2, tp, 783f
                  bge          a5, a6, 792f
                  sltiu        a3, s2, -1771
                  xor          a1, s3, a0
                  sub          s2, s1, gp
                  slti         s3, a3, -539
                  srl          s0, s8, a3
                  auipc        s1, 838100
787:              slli         t5, t0, 29
                  nop
                  srli         tp, t1, 14
                  srl          s4, s8, s3
                  lui          s2, 329219
792:              andi         a2, a4, 769
                  bne          s2, s11, 807f
                  srli         s8, a0, 26
                  or           s0, s9, tp
                  slti         a0, s8, -42
                  and          a1, a3, t0
                  bne          s6, a1, 812f
                  andi         t3, t6, 845
                  slti         gp, s10, -796
                  addi         t3, s10, 511
                  slt          ra, t0, t0
                  xori         s0, t1, -1664
                  andi         a1, t1, 1392
807:              andi         a1, tp, 1153
                  bltu         t5, s1, 822f
                  slt          gp, s2, a1
                  sub          gp, zero, s10
                  srl          t3, s5, t0
                  lui          a0, 418125
                  bltu         t4, sp, 834f
                  slti         gp, t5, 1491
                  bgeu         gp, s9, 829f
                  sra          a2, s3, s1
                  ori          a4, s8, -578
822:              lui          t4, 837792
                  sra          a2, s7, a1
                  bltu         a0, ra, 844f
                  beq          a2, t4, 840f
                  srai         t5, a7, 11
829:              xori         gp, s8, 8
                  addi         t3, a4, 1438
                  slti         zero, s1, -731
                  srai         a0, a4, 22
                  xori         s11, s1, 1838
834:              auipc        t6, 457532
                  srl          s10, gp, gp
                  slli         s3, a3, 29
                  sll          s1, gp, t5
840:              sltu         sp, t0, s10
                  blt          s3, tp, 857f
844:              srli         s9, ra, 2
                  bltu         s7, s10, 862f
                  sll          s3, a5, a4
                  sltu         t5, tp, s2
                  bgeu         s0, zero, 858f
                  blt          t4, gp, 853f
                  addi         t3, s5, -1893
                  slt          zero, zero, a6
853:              slli         s0, a0, 0
                  ori          a2, a4, 1080
                  ori          s5, zero, -1179
857:              srai         t5, a5, 7
                  slli         a4, sp, 31
                  bltu         s0, s5, 877f
                  sub          ra, a4, s4
862:              srl          gp, s11, t1
                  or           s10, a7, t4
                  and          s3, t3, a5
                  srl          s11, a2, s9
                  srl          a7, t4, s1
                  bge          t6, s3, 890f
                  lui          s8, 481296
                  bltu         s8, s7, 886f
                  sub          s8, zero, a3
                  xori         t1, s9, -734
                  beq          t6, a4, 884f
877:              xori         t2, a1, -1977
                  sltiu        a6, s5, -461
                  sra          a7, s2, a4
                  bgeu         s6, ra, 897f
884:              sub          s4, a3, t0
                  slt          s0, t0, t1
                  bgeu         a6, a3, 905f
                  sub          t1, t3, s4
890:              andi         gp, a5, -958
                  or           sp, a6, a2
                  sub          t4, tp, a0
                  auipc        s5, 104499
                  add          a7, a6, s6
                  srl          a5, s0, zero
897:              bltu         s4, a3, 906f
                  slti         s8, s8, -2001
                  slti         s2, t6, 1745
                  nop
                  sll          t2, s1, t2
                  xor          a3, t4, t5
                  bltu         s9, s10, 920f
                  beq          s6, a6, 915f
906:              bltu         a5, t4, 912f
                  srl          s3, t2, ra
                  slt          s5, s5, s1
                  add          t2, a0, t0
912:              sra          a6, zero, a5
                  slt          s3, t3, s5
                  srli         t5, t3, 18
                  bne          s3, sp, 932f
                  srl          s1, s8, s8
                  srai         a2, a2, 20
                  or           s9, s6, t2
920:              srl          s0, a6, t0
                  or           s4, t3, tp
                  bne          t6, a7, 938f
                  blt          t3, s4, 935f
                  sra          a4, ra, t1
                  beq          s4, gp, 940f
                  sub          t4, s6, t6
                  sltiu        a6, t3, 1984
                  sub          a7, t6, s1
932:              bgeu         a3, s7, 950f
                  bltu         s10, s2, 942f
                  add          t5, s10, s0
935:              srl          a5, s6, a6
                  bne          s8, s10, 940f
                  xor          s2, s6, s4
938:              srl          s8, ra, a2
                  andi         t5, s5, 1887
940:              ori          a6, s6, -1721
                  bltu         s3, t2, 959f
942:              bne          s7, s3, 957f
                  nop
                  sll          t2, zero, zero
                  lui          a7, 398220
                  srli         a6, t6, 8
                  lui          gp, 335242
                  sltiu        a5, s6, 859
                  beq          t2, t1, 966f
                  slt          zero, s6, a5
                  sub          a7, s4, a1
                  slt          s8, s9, t6
                  andi         t4, s1, 1393
                  bgeu         s1, s3, 971f
957:              srli         tp, s8, 21
959:              sltiu        a2, s6, -821
                  addi         a7, a0, -390
                  xor          t3, s7, ra
                  sll          t1, a5, s1
966:              ori          t4, t6, 392
                  xor          a1, t3, s6
                  auipc        t6, 1024418
                  srai         s8, sp, 27
971:              ori          t6, t4, -23
                  auipc        s1, 69127
                  ori          t2, a7, -567
                  srli         gp, a1, 0
                  sra          t1, a2, a6
                  sltiu        s5, t1, -1080
                  addi         zero, s5, 1747
                  sra          a6, t1, ra
                  sub          a2, t3, s9
                  bne          s3, gp, 995f
                  ori          a3, t2, -1677
                  slti         ra, t5, -1895
                  bge          t0, a5, 1002f
                  nop
                  auipc        sp, 16418
                  sltiu        a0, s7, 1384
                  srl          a5, sp, a0
                  auipc        t3, 444003
                  blt          ra, s10, 1002f
995:              sub          t6, a6, zero
                  xor          a3, a2, s7
                  add          s3, a0, t4
                  sra          s1, a2, a3
                  sub          s4, s10, s4
                  srai         a2, s3, 14
                  xor          s1, t6, t0
1002:             slli         t2, a1, 2
                  lw           ra, 4(s7)
                  nop
                  addi         s7, s7, 8
                  addi         a0, sp, 1910
                  srli         s8, s9, 20
1749:             addi x7, x1, 1
1749:             jalr x7, x7, 0
sub_4:            bge          a3, s8, sub_4_stack_p
sub_4_stack_p:    addi         s7, s7, -36
                  andi         zero, a3, -1714
                  lui          s9, 190449
                  sw           ra, 4(s7)
                  add          a4, s10, sp
                  slt          a6, a0, a3
                  sltiu        s2, s0, 1381
                  sub          a7, a0, s7
                  add          s0, a7, a6
                  andi         s10, t0, -524
                  bge          a1, s1, sub_4_j7
                  sll          s0, s0, s7
                  srli         s1, a6, 19
sub_4_j7:         jal          ra, sub_5
                  bge          s9, a5, 10f
                  nop
                  ori          s4, s6, 9
                  sub          s9, s5, a1
                  sra          s4, s1, s10
                  beq          t1, s1, 14f
                  xor          t6, gp, t3
                  bne          sp, t5, 16f
10:               bne          s4, s7, 22f
                  auipc        t4, 845632
                  and          tp, s8, s0
                  ori          a6, s4, 1092
14:               addi         a3, s1, 246
                  nop
16:               sub          ra, a1, sp
                  lui          s3, 818729
                  blt          t3, s3, 27f
                  sltiu        t1, t4, 1319
                  add          a6, s4, t0
                  bltu         a3, ra, 38f
22:               or           s0, a0, s4
                  bne          a3, a4, 28f
                  bltu         a3, t2, 41f
27:               sub          s4, s4, a5
28:               bltu         a0, a6, 33f
                  slt          s8, t0, a7
                  slt          sp, s2, a7
                  srli         a5, t2, 27
                  sltu         a6, s9, s9
33:               bgeu         s10, t6, 40f
                  slli         t1, ra, 6
                  slti         s1, s11, -340
                  addi         s10, s9, -1824
                  bne          t0, a2, 42f
38:               and          a0, t1, s6
                  sll          t6, s2, ra
40:               addi         tp, s7, 854
41:               andi         a3, s4, -368
42:               srli         a1, a7, 17
                  srl          t5, s7, a2
                  or           zero, s5, zero
                  nop
                  slt          t6, s6, t6
                  srai         t3, tp, 2
                  bgeu         t3, s11, 65f
                  sltiu        t2, s8, 1070
                  xori         a6, t3, -65
                  srli         zero, t4, 7
                  bge          a6, s1, 61f
                  xor          a6, a2, t1
                  and          t2, a5, t5
                  nop
                  blt          s1, s4, 61f
                  add          s5, t1, s9
                  beq          s10, tp, 64f
61:               slt          s9, t3, t3
                  bgeu         s5, tp, 69f
                  slti         t5, a3, -21
64:               beq          a6, t4, 67f
                  addi         zero, s11, 849
67:               sltiu        s8, s10, -449
                  blt          tp, a4, 81f
69:               sll          s4, a0, gp
                  bltu         t5, a5, 72f
                  slli         t5, a3, 2
72:               nop
                  and          a3, gp, t3
                  or           tp, t4, ra
                  bgeu         a0, t3, 89f
                  srai         zero, a4, 0
                  xori         t5, a5, 185
                  sltiu        sp, a1, 1297
81:               blt          t3, s10, 90f
                  slli         s2, t4, 16
                  sub          a4, s3, a7
                  bne          s2, s9, 88f
                  slli         t5, s9, 6
                  bgeu         a1, s1, 96f
                  bltu         s10, s11, 91f
88:               slt          t5, t0, s9
89:               bgeu         a7, s9, 108f
90:               sll          s2, s9, sp
91:               bltu         sp, s0, 101f
                  blt          a2, a4, 103f
                  sub          a2, zero, s7
96:               sltu         t4, t1, s8
                  lui          s1, 860253
                  addi         s11, s7, 1712
                  slli         a4, ra, 5
                  sltiu        a4, t2, 1439
101:              sltu         sp, t3, a6
                  bltu         zero, s4, 120f
103:              srli         a6, s0, 2
                  addi         tp, t5, -184
                  sub          a4, t1, tp
                  addi         s4, s4, 824
108:              bge          gp, sp, 115f
                  sltiu        s5, a7, -790
                  bltu         s7, a1, 129f
                  add          tp, tp, s11
                  bge          ra, s2, 119f
115:              sltu         s0, a0, s8
                  ori          s11, tp, -1565
                  ori          a3, a3, -1047
119:              srai         zero, sp, 17
120:              beq          s5, a5, 123f
                  bne          sp, gp, 128f
                  nop
123:              sll          t2, s3, s11
                  slli         gp, sp, 18
                  add          s10, sp, a1
                  xor          s1, s2, t0
                  srl          a5, a6, t2
                  andi         tp, zero, -174
                  bne          t3, ra, sub_4_j6
                  and          a1, s7, t1
sub_4_j6:         jal          ra, sub_5
                  and          s0, t3, s11
                  srli         a7, s0, 22
                  srl          a2, s5, t3
128:              beq          gp, t0, 135f
129:              sltiu        s0, sp, 1776
                  sra          zero, a1, a7
                  lui          s11, 711787
                  sub          a0, s9, s11
                  andi         a5, t0, -1064
                  slt          a7, a5, a6
135:              xor          t1, t2, t1
                  nop
                  sll          t2, a4, gp
                  srli         a4, s11, 5
                  srli         s5, a2, 1
                  ori          t5, s5, 241
                  bne          s5, s11, 153f
                  ori          sp, s7, -2022
                  slt          s8, s11, s5
                  sltiu        t2, ra, 692
                  sltiu        t4, s1, 1689
                  blt          s2, s3, 166f
                  bgeu         s10, s0, 161f
                  bgeu         s3, s6, 164f
                  xor          s2, t6, a7
                  slti         s3, a7, 462
                  auipc        sp, 163933
                  srli         a7, a7, 5
                  sltu         a2, gp, ra
                  slt          s2, a4, s11
                  xor          s10, zero, ra
161:              sub          a3, ra, a0
                  beq          ra, t4, 167f
                  lui          s11, 344233
164:              sub          t1, s10, a1
                  or           s4, a3, gp
166:              bgeu         a2, a4, 182f
167:              slli         t6, ra, 17
                  or           s3, s7, a4
                  or           ra, s7, t5
                  bge          t3, s2, 175f
                  srl          t3, s0, s10
                  bge          s8, s7, 177f
                  ori          s1, gp, -1962
177:              xori         s1, a1, 699
                  bgeu         t1, s2, 183f
                  bge          t4, ra, 190f
182:              sll          a1, s5, s10
183:              ori          t3, s2, 830
                  addi         t4, a4, -365
                  xor          a2, s10, ra
190:              sltiu        t6, t0, -21
                  slli         s4, s2, 27
                  and          a7, s9, t4
                  lw           ra, 4(s7)
                  sra          a4, s5, s6
                  slt          s5, t5, s2
                  addi         s7, s7, 36
                  sll          s11, t2, sp
226:              addi x8, x1, 0
226:              jalr x8, x8, 0
sub_1:            andi         s5, s3, 1903
                  xor          gp, tp, a2
                  bne          a1, t1, sub_1_stack_p
                  sltu         t3, sp, a4
                  sra          s4, s11, a4
sub_1_stack_p:    addi         s7, s7, -32
                  slli         tp, s4, 17
                  andi         s3, t5, -1543
                  srai         tp, s1, 3
                  sw           ra, 4(s7)
                  nop
                  addi         s5, sp, -1742
                  xor          s4, s9, sp
                  la           s0, region_1+48005
                  la           t1, region_0+3699
                  lb           tp, 198(s0)
                  lb           a2, -178(t1)
                  lb           zero, 242(s0)
                  sb           sp, 76(s0)
                  lb           s11, 201(t1)
                  lbu          ra, 74(t1)
                  lb           ra, 27(t1)
                  lbu          a7, 138(s0)
                  lhu          s1, -153(t1)
                  lb           a6, -34(s0)
                  lbu          sp, -20(t1)
                  sh           zero, -111(t1)
                  lbu          s10, -180(s0)
                  sh           s8, -63(t1)
                  lb           s9, -70(s0)
                  lbu          t5, -26(t1)
                  lhu          s5, 9(s0)
                  sb           s4, -79(s0)
                  lbu          s5, 202(t1)
                  lw           s1, 247(s0)
                  la           sp, region_1+29282
                  slti         s10, ra, 1249
                  lbu          a3, -1(sp)
                  xori         s2, s2, 1222
                  sb           s1, -1(sp)
                  sb           t3, -1(sp)
                  lb           s11, -1(sp)
                  lb           s2, -1(sp)
                  lb           s9, -1(sp)
                  lb           s9, -1(sp)
                  sb           a3, -1(sp)
                  lbu          a5, -7(sp)
                  xori         t5, s7, 112
                  lbu          s9, -7(sp)
                  sb           t3, -7(sp)
                  lb           t1, -7(sp)
sub_1_6:          jal          ra, 11f
0:                jal          gp, 14f
1:                jal          t1, 2f
2:                jal          ra, 15f
3:                jal          ra, 17f
4:                jal          t3, 7f
5:                jal          a4, 10f
6:                jal          s2, 9f
7:                jal          ra, 21f
8:                jal          ra, 19f
9:                jal          t1, 0b
10:               jal          t1, 23f
11:               jal          ra, 12f
12:               jal          s3, 3b
13:               jal          sp, 18f
14:               jal          ra, 4b
15:               jal          t1, 24f
16:               jal          ra, 25f
17:               jal          ra, 1b
18:               jal          t1, 16b
19:               jal          ra, 20f
20:               jal          ra, 5b
21:               jal          ra, 8b
22:               jal          a7, 6b
23:               jal          ra, 13b
24:               jal          t1, 22b
25:               srli         t1, a6, 20
sub_1_5:          jal          ra, 18f
0:                jal          tp, 16f
1:                jal          ra, 3f
2:                jal          ra, 22f
3:                jal          ra, 12f
4:                jal          ra, 7f
5:                jal          ra, 8f
6:                jal          ra, 10f
7:                jal          ra, 9f
8:                jal          ra, 17f
9:                jal          ra, 23f
10:               jal          ra, 5b
11:               jal          t1, 2b
12:               jal          a4, 14f
13:               jal          ra, 6b
14:               jal          t1, 13b
15:               jal          ra, 20f
16:               jal          ra, 19f
17:               jal          a5, 11b
18:               jal          a4, 15b
19:               jal          t1, 4b
20:               jal          sp, 1b
21:               jal          ra, 0b
22:               jal          t1, 21b
23:               srai         a1, sp, 30
                  la           t1, region_0+2710
                  la           s4, region_0+1841
                  la           tp, region_0+191
                  lb           t2, -182(s4)
                  lb           gp, 331(t1)
                  sb           s7, -1(tp)
                  lbu          sp, -1519(t1)
                  lb           a3, -1637(t1)
                  lhu          a0, 3(tp)
                  lhu          a5, 5(s4)
                  lh           sp, -1584(t1)
                  lh           s11, 916(t1)
                  lw           ra, -11(tp)
                  sb           tp, 66(s4)
                  sb           a6, -76(s4)
                  lh           a4, -9(tp)
                  lh           s9, 3(tp)
                  lb           t5, -1687(t1)
                  lbu          gp, 14(tp)
                  sb           s0, 267(t1)
                  lbu          gp, -633(t1)
                  lbu          s10, 6(s4)
                  sh           a3, -11(tp)
                  lbu          s10, -125(t1)
                  lh           a1, 7(s4)
                  sw           s0, -15(tp)
                  la           sp, region_0+194
                  sb           s0, 1655(sp)
                  lbu          t2, 1655(sp)
                  sltu         a2, t1, tp
                  lbu          s10, 1655(sp)
                  lbu          s5, 1655(sp)
                  sb           s11, 1655(sp)
                  srai         s5, a6, 11
                  lbu          a2, 1655(sp)
                  lbu          s2, 1655(sp)
                  lb           s8, 1655(sp)
                  sb           t3, 1655(sp)
                  xor          a5, a0, s3
                  lbu          s8, 1655(sp)
                  la           s0, region_0+4027
                  lb           s4, 56(s0)
                  srli         s4, s4, 23
                  nop
                  sb           sp, -12(s0)
                  lhu          a3, -229(s0)
                  nop
                  lb           s4, -15(s0)
                  lb           t1, -84(s0)
                  srl          sp, s4, a3
                  lbu          sp, -148(s0)
                  lh           s4, -119(s0)
                  lh           s4, -79(s0)
                  sh           a3, -95(s0)
                  sltu         sp, t4, t4
                  sb           sp, -24(s0)
                  slti         a3, t4, 43
                  sll          t1, s4, a3
                  sb           a3, -197(s0)
                  sb           sp, -232(s0)
                  lbu          t1, 50(s0)
                  auipc        t1, 488019
                  lw           t4, -131(s0)
                  lb           a7, -36(s0)
                  slt          sp, t1, t1
                  lbu          a3, 30(s0)
                  lb           t4, -200(s0)
                  sb           s4, -152(s0)
                  la           sp, region_1+36285
                  lbu          s1, 6(sp)
                  lb           s1, -4(sp)
                  or           s0, s8, a6
                  lw           s0, -9(sp)
                  sb           s1, -6(sp)
                  sltiu        a7, s8, 368
                  lbu          a7, -9(sp)
                  sh           a6, 11(sp)
                  lb           s0, -14(sp)
                  lui          s3, 544785
                  lbu          a7, -2(sp)
                  lbu          a6, 13(sp)
                  lh           s3, 3(sp)
                  lbu          s0, -2(sp)
                  lw           a6, 15(sp)
                  sltu         s0, a7, s3
                  lb           a6, -2(sp)
                  or           s1, s1, s8
                  lbu          a6, -8(sp)
                  lhu          s0, 15(sp)
                  sll          a7, s3, a7
                  and          a6, s8, s1
                  lw           a6, -1(sp)
                  sb           a6, 6(sp)
                  addi         s3, a7, -1112
                  lb           s8, 10(sp)
                  lhu          a7, -5(sp)
                  lb           s3, 14(sp)
                  lbu          a7, -10(sp)
                  lbu          a6, 4(sp)
                  la           t5, region_1+48663
                  lbu          tp, -168(t5)
                  xori         s0, t0, 1894
                  lhu          a3, 139(t5)
                  add          s3, s0, a0
                  sh           t5, 139(t5)
                  lbu          s10, 244(t5)
                  lbu          tp, 244(t5)
                  lb           t4, -82(t5)
                  sb           s7, -82(t5)
                  sra          t1, a0, t5
                  sub          a0, s1, a5
                  lbu          tp, 28(t5)
                  lbu          a5, 28(t5)
                  lh           a5, 107(t5)
                  sltiu        s3, zero, -31
                  sh           t3, 107(t5)
                  sltu         a1, tp, gp
                  lb           a6, 107(t5)
                  la           sp, region_1+19065
                  slt          a7, ra, s6
                  lbu          a1, 29(sp)
                  sra          t1, a3, a7
                  sh           t4, -5(sp)
                  lbu          s5, 60(sp)
                  auipc        s5, 988470
                  slti         a5, gp, 1112
                  lbu          s0, 53(sp)
                  lb           a5, -10(sp)
                  lbu          gp, 5(sp)
                  sra          a4, a0, t1
                  slti         s0, t3, -897
                  lbu          gp, 0(sp)
                  slti         s8, s8, -621
                  and          s5, a1, a7
                  srl          s3, a0, a7
                  lb           t2, -40(sp)
                  lb           a6, -21(sp)
                  lbu          s9, 6(sp)
                  sb           s4, 8(sp)
                  sub          s11, t4, a6
                  ori          s8, s2, -780
                  xori         t5, zero, -1267
                  srai         a3, t0, 31
                  sltu         a7, s9, s11
                  lhu          t1, -55(sp)
                  la           a0, region_1+44448
                  sb           s10, 629(a0)
                  sb           t4, 759(a0)
                  la           s0, region_0+2666
                  lb           sp, 477(s0)
                  sb           s1, -874(a0)
                  lw           t6, -978(s0)
                  lh           s4, 906(a0)
                  lhu          tp, -440(a0)
                  sw           a0, -594(s0)
                  lw           sp, -1824(a0)
                  sb           s5, -1591(a0)
                  lbu          s9, 1334(s0)
                  sb           a5, -261(a0)
                  lw           ra, -1298(s0)
                  lbu          s1, -1279(s0)
                  sw           s9, -1266(s0)
                  lbu          t4, -888(s0)
                  sh           t1, 798(s0)
                  la           sp, region_0+3848
                  sll          s11, tp, t3
                  sh           s7, -520(sp)
                  andi         s5, sp, 214
                  or           t3, a4, a4
                  lb           s4, -69(sp)
                  sh           a0, -310(sp)
                  lbu          s9, -1613(sp)
                  sub          s2, s3, t6
                  sb           t1, -491(sp)
                  lb           s2, -1041(sp)
                  addi         a7, s0, 232
                  srli         s4, s11, 9
                  lhu          zero, -604(sp)
                  addi         t2, s5, -1200
                  slti         tp, s4, -360
                  ori          t6, s1, -1774
                  lh           s9, -812(sp)
                  sb           s5, -119(sp)
                  sltiu        a1, a5, 752
                  nop
                  sb           sp, -985(sp)
                  lbu          a4, 66(sp)
                  slt          s4, t2, s10
                  sb           s4, -1391(sp)
                  la           a2, region_0+3556
                  la           a1, region_0+777
                  lh           gp, -223(a1)
                  la           ra, region_0+3817
                  lb           s2, -124(a1)
                  lb           t3, 4(ra)
                  lb           s8, 208(a1)
                  lbu          zero, 8(ra)
                  lb           t6, 8(ra)
                  lh           gp, -6(a2)
                  sb           s6, -92(a1)
                  lhu          a6, -15(ra)
                  lhu          s9, 1(ra)
                  lhu          t1, 10(a2)
                  sb           s4, -154(a1)
                  lb           t4, -14(ra)
                  lb           s2, 58(a1)
                  lb           tp, -11(a2)
                  lhu          s2, 6(a2)
                  lbu          s2, 164(a1)
                  sh           t0, -151(a1)
                  lb           s10, -126(a1)
                  lhu          a5, 8(a2)
                  addi         t1, zero, 8
                  or           s4, s8, zero
                  addi         t3, zero, 6
sub_1_17_1_t:     addi         s3, t1, 1210
                  addi         t1, t1, -1
                  addi         ra, zero, 9
                  nop
                  addi         s5, zero, -18
                  or           s11, a7, t6
sub_1_17_0_t:     and          a2, a4, t5
                  xori         a2, a7, -705
                  addi         ra, ra, -7
                  bge          ra, s5, sub_1_17_0_t
                  bgeu         t1, t3, sub_1_17_1_t
                  srl          tp, s11, a0
                  la           t1, region_1+47524
                  sh           a4, 28(t1)
                  lb           s0, -20(t1)
                  lw           s11, -56(t1)
                  sb           a4, -13(t1)
                  la           a1, region_0+922
                  lh           s11, 204(a1)
                  lh           tp, -142(a1)
                  lbu          a2, -219(a1)
                  lh           s0, 18(a1)
                  lbu          t4, 6(t1)
                  sb           s6, 13(t1)
                  sb           t0, 219(a1)
                  lbu          s8, -35(t1)
                  sb           t5, -63(t1)
                  lhu          t2, -132(a1)
                  sb           sp, 98(a1)
                  sb           s5, 60(t1)
                  lbu          tp, -200(a1)
                  lb           ra, 57(a1)
                  lhu          s5, 18(a1)
                  la           a6, region_0+988
                  la           s1, region_0+467
                  lw           s0, 1449(s1)
                  la           s8, region_0+2231
                  la           a4, region_0+3049
                  lw           a3, 825(s1)
                  sh           a2, -179(a4)
                  lbu          s5, -196(a4)
                  lbu          s0, -1(a6)
                  la           t4, region_0+984
                  lhu          s5, -14(t4)
                  lb           t5, 184(a4)
                  sb           a5, -1458(s8)
                  sb           a2, 906(s8)
                  lb           s2, -11(a6)
                  lbu          a7, 932(s1)
                  lbu          s3, -1(a6)
                  lb           a1, 15(a6)
                  sw           s3, -8(t4)
                  lbu          t2, 38(a4)
                  lb           t5, 10(t4)
                  sb           s3, 107(a4)
                  lhu          t6, -413(s1)
                  sw           s9, -8(t4)
                  sb           s0, 15(a6)
                  sb           ra, 6(a4)
                  lbu          s11, 1530(s8)
                  lb           t3, 11(a6)
                  lb           tp, 5(a6)
                  sb           s10, 1078(s8)
                  sb           t2, -10(t4)
                  lw           tp, 127(a4)
                  lbu          a2, 498(s1)
                  lb           s10, 3(t4)
                  lhu          t1, 1239(s1)
                  lb           t2, -1606(s8)
                  sb           s8, 2(t4)
                  sh           t0, 1253(s1)
                  lb           ra, 786(s8)
                  lb           t5, 9(a6)
                  sb           s6, -137(a4)
                  sb           t4, 8(t4)
                  lbu          ra, 1(a6)
                  lb           a0, 10(t4)
                  sw           a1, -111(s1)
                  sw           ra, -157(a4)
                  sb           s1, 1350(s1)
                  lb           ra, 4(a6)
                  sw           t0, 0(t4)
sub_1_4:          jal          ra, 17f
0:                jal          ra, 7f
1:                jal          ra, 18f
2:                jal          sp, 1b
3:                jal          ra, 15f
4:                jal          t1, 6f
5:                jal          ra, 10f
6:                jal          ra, 5b
7:                jal          ra, 9f
8:                jal          t1, 12f
9:                jal          ra, 14f
10:               jal          gp, 3b
11:               jal          s11, 20f
12:               jal          t4, 19f
13:               jal          ra, 8b
14:               jal          s0, 2b
15:               jal          t1, 11b
16:               jal          a5, 4b
17:               jal          ra, 13b
18:               jal          t1, 16b
19:               jal          t1, 0b
20:               xori         a0, tp, -1358
                  la           sp, region_0+1151
                  slt          a7, s4, t3
                  lbu          gp, 332(sp)
                  sh           zero, 1905(sp)
                  lbu          a2, -576(sp)
                  sh           a2, -625(sp)
                  slti         s0, s6, 1962
                  lb           s3, 1701(sp)
                  sra          s8, t1, a5
                  lb           a2, 1324(sp)
                  sb           s1, 473(sp)
                  xor          tp, s6, zero
                  lbu          s2, -878(sp)
                  ori          a3, s0, -770
                  lb           a4, -414(sp)
                  auipc        ra, 738443
                  lui          s8, 352857
                  srli         a4, t4, 3
                  lbu          a7, 1936(sp)
                  xori         t2, a7, 446
                  and          a1, s3, s3
                  sub          a1, s11, a1
                  ori          s3, s7, -1776
                  slti         s10, a0, -2001
                  lui          s0, 856902
                  lb           a0, 619(sp)
                  sw           a0, 1489(sp)
                  srai         t2, a2, 30
                  auipc        s3, 497405
                  and          s10, t5, s11
                  lui          s3, 509305
                  sh           zero, -919(sp)
                  slli         s5, t6, 22
                  lb           t2, -1116(sp)
                  or           s3, s11, a3
                  lhu          a6, -41(sp)
                  sb           a0, -484(sp)
                  la           a2, region_1+38253
                  sltiu        s0, a5, 1210
                  sb           a5, -722(a2)
                  sra          s1, ra, s10
                  srai         s1, t4, 11
                  lhu          s10, -605(a2)
                  sltu         s1, ra, a5
                  lb           ra, -1606(a2)
                  lbu          t4, -988(a2)
                  lbu          t4, -1024(a2)
                  lb           ra, 1606(a2)
                  auipc        t4, 49556
                  andi         s0, a5, -1601
                  sb           s0, -198(a2)
                  sw           t4, 191(a2)
                  sb           s10, 616(a2)
                  or           s10, a5, s1
                  srli         t4, ra, 3
                  sh           ra, 915(a2)
                  slt          ra, s1, a5
                  lb           s0, -1966(a2)
                  auipc        s1, 17691
                  sb           s10, -444(a2)
                  lhu          ra, -1135(a2)
                  sra          ra, t4, s0
                  lbu          a5, 1539(a2)
                  lbu          ra, -1215(a2)
                  sb           s10, 1187(a2)
                  lw           a5, 123(a2)
                  lb           s0, -1096(a2)
                  slti         t4, ra, 172
                  xori         s10, a5, 452
                  sb           s0, -1536(a2)
                  la           a4, region_1+4064
                  la           a1, region_0+2911
                  lh           s5, 9(a1)
                  lhu          t2, -240(a4)
                  lh           s8, 11(a1)
                  lhu          s8, -136(a4)
                  sb           a2, -59(a4)
                  lw           s9, 180(a4)
                  lb           a2, 105(a4)
                  sh           s0, -9(a1)
                  sb           s5, -81(a4)
                  sh           s3, 59(a1)
                  lb           a2, -217(a4)
                  sh           a5, -44(a4)
                  lb           s4, -51(a1)
                  sh           t2, -72(a4)
                  sb           s4, -101(a4)
                  sb           s7, -26(a1)
                  la           t3, region_0+51
                  lbu          t2, 46(t3)
                  lb           t4, 38(t3)
                  lhu          t4, -25(t3)
                  sh           t2, 37(t3)
                  lb           t2, 32(t3)
                  addi         t4, a2, 1532
                  nop
                  slti         t5, t5, -627
                  sb           t2, 1(t3)
                  lh           s8, 11(t3)
                  sb           t5, 64(t3)
                  sb           t4, 16(t3)
                  lb           t4, 54(t3)
                  lhu          a2, 41(t3)
                  lbu          s8, 50(t3)
                  slt          t4, s8, s8
                  lh           a5, 31(t3)
                  sra          t2, t2, t2
                  lh           t4, 37(t3)
                  nop
                  sll          t4, a2, t5
                  sub          t5, s8, t2
                  addi         t2, t4, -354
                  lbu          t2, 22(t3)
                  lb           t2, 10(t3)
                  lb           t4, -45(t3)
                  or           t2, a5, a2
                  lb           a2, -46(t3)
                  add          t2, a5, a5
                  sb           t4, 2(t3)
                  lbu          s8, -28(t3)
                  ori          a5, t4, -1753
                  sb           s8, -33(t3)
                  sb           t2, 50(t3)
                  lb           t5, 26(t3)
                  lbu          s8, -30(t3)
                  lh           t2, 29(t3)
                  nop
                  xori         t5, s8, -680
                  addi         a2, a2, 842
                  lbu          t2, 51(t3)
                  lbu          a5, 5(t3)
                  la           a6, region_0+3244
                  la           a7, region_0+240
                  la           t5, region_0+2985
                  lbu          s10, 19(a6)
                  lbu          s1, 1086(a7)
                  lbu          zero, 567(a7)
                  sh           t5, 1070(a7)
                  lb           s10, -11(a6)
                  lb           sp, -936(t5)
                  lhu          s5, 1022(a7)
                  sb           a7, 539(t5)
                  lw           zero, -92(a7)
                  lb           a4, 34(a6)
                  sb           s8, -63(a6)
                  sb           s10, 1123(a7)
                  lbu          s1, 47(a6)
                  sb           t2, -1824(t5)
                  lb           gp, 45(a6)
                  lbu          t6, 543(a7)
                  lb           s11, -1626(t5)
                  sb           a3, -63(a6)
                  lhu          sp, 30(a6)
                  lb           s11, -660(t5)
                  xori         s3, s10, 1114
                  ori          gp, s0, 537
                  srai         t2, a2, 18
                  sltiu        s8, s2, 371
                  add          s4, t0, s0
                  sra          a3, a3, s3
                  slli         s11, a4, 7
                  srai         sp, s9, 28
                  srl          t4, s2, t1
                  sltiu        s8, t4, 1015
                  ori          t5, a2, -880
                  xor          s8, a0, a1
                  addi         s1, t1, -689
                  lui          s4, 90584
                  lui          s8, 841216
                  sltu         t4, t6, a3
                  and          sp, s7, t2
                  slli         s9, t2, 4
                  bge          s9, s7, 29f
                  add          t5, t2, a2
                  sltu         a3, s2, t1
                  bne          s3, a1, 39f
                  sltiu        a4, s9, -2030
                  slt          a6, t2, s0
                  sll          t6, gp, s8
                  xor          s0, s4, t2
29:               blt          a5, s2, 45f
                  bne          t2, a6, 37f
                  bgeu         a3, s11, 51f
                  srl          s5, t0, t1
                  sltiu        sp, a7, -1181
                  lui          s8, 545252
37:               add          t5, t2, t3
                  slti         a4, s9, -1181
39:               xori         t3, t0, 512
                  xori         t5, a7, 1589
                  addi         ra, zero, 2
                  sub          a2, a3, s11
                  addi         a5, zero, -18
sub_1_18_0_t:     ori          s9, t6, -1651
                  addi         ra, ra, -4
                  bge          ra, a5, sub_1_18_0_t
                  xori         s4, s4, 1455
                  bge          s7, t1, 43f
                  srli         s4, a6, 17
                  ori          zero, a5, -247
45:               srai         a3, sp, 2
                  slli         a2, s10, 26
                  nop
                  srli         s8, s7, 8
                  addi         tp, t5, 937
51:               slti         gp, s1, 737
                  xori         s11, a6, -1174
                  and          a6, a3, s4
                  slt          sp, t0, a1
                  blt          a0, t3, 75f
                  addi         t2, a5, 110
                  ori          s0, s3, 1106
                  and          a7, t4, s3
                  add          t3, sp, ra
                  or           a4, t3, s8
                  lui          s8, 66364
                  srli         t6, t0, 24
                  bge          s4, s11, 76f
                  srl          s11, s1, a6
                  srl          s2, s4, s10
                  lui          s4, 51870
                  srli         s10, a7, 25
                  bgeu         ra, t5, 84f
                  blt          tp, t3, 72f
72:               or           a0, s6, a2
                  sra          s2, t2, t3
                  auipc        a0, 820374
75:               xor          t6, s9, a2
76:               sra          t4, a2, a3
                  xor          sp, s2, t2
                  slli         a6, a4, 6
                  sub          a5, s7, t4
                  auipc        t5, 573729
                  xori         a6, t3, 1655
84:               auipc        ra, 892555
                  bgeu         s1, s2, 97f
                  xor          s5, ra, t5
                  slti         t4, a7, 1364
                  xor          a4, a6, a0
                  srl          ra, zero, s10
                  lui          s3, 1001528
                  slti         a2, t0, 189
                  xor          t3, s7, sp
                  andi         a4, s6, 1620
                  or           gp, s3, a4
97:               sltu         s0, sp, a1
                  srl          s3, sp, a6
                  or           a2, s8, t4
                  ori          s10, s0, 91
                  sub          zero, s10, s7
                  srl          a3, s6, t5
                  lui          sp, 596485
                  srli         a4, tp, 13
                  srl          s2, a6, s0
                  blt          t6, t4, 109f
                  beq          a5, a0, 122f
109:              slti         gp, a3, -766
                  bne          s0, a4, 124f
                  sub          tp, s7, t6
                  srli         s10, ra, 10
                  or           s3, t3, s10
                  blt          a4, tp, 119f
                  sll          tp, s9, s4
                  sltu         a2, s0, s3
                  slt          t6, a6, t3
                  bgeu         a4, s3, 127f
119:              slt          s11, zero, t0
                  sltiu        s4, s10, 2045
                  slti         s0, tp, 85
122:              add          s11, a2, t4
                  bne          s9, a5, 131f
124:              slti         s9, s10, 289
                  bltu         s1, s7, 126f
126:              add          a1, s8, zero
127:              nop
                  srai         t3, a4, 18
131:              xori         s4, s7, 303
                  and          t4, s5, t2
                  xor          ra, ra, a2
                  beq          ra, s0, 144f
                  or           s4, a3, t1
                  sub          t3, gp, a6
                  andi         t5, s7, -1476
                  sltu         zero, s11, a7
                  ori          s2, s3, 1594
                  srai         s0, t4, 23
                  sra          a7, s7, tp
                  blt          s6, s8, 145f
144:              srai         ra, t3, 26
145:              andi         s4, s2, -1495
                  sltu         s9, s11, s0
                  xori         s8, a6, 899
                  slti         a0, s2, 347
                  bgeu         t2, a0, 170f
                  lui          t5, 848313
                  beq          s3, s10, 165f
                  add          zero, a6, t0
                  ori          t4, s1, 1375
                  or           t5, t4, s3
                  nop
                  slt          s4, ra, a4
                  blt          a3, sp, 178f
                  sltiu        s8, s7, -677
                  bne          t2, s10, 174f
165:              sltu         zero, s5, s11
                  srli         t5, gp, 14
                  beq          a0, s4, 182f
                  sltu         t5, s9, s3
                  sltiu        a5, a6, 414
                  bne          s2, ra, 185f
174:              sll          gp, t0, t3
                  beq          ra, a2, 181f
                  xor          t1, t5, tp
                  slli         s9, tp, 5
178:              lui          zero, 1008148
                  xor          s0, s10, a4
181:              or           s8, t5, a6
182:              bge          a4, s3, 192f
                  slti         s1, ra, -118
                  bltu         a0, s1, 203f
                  srl          ra, a6, s6
                  xor          s1, s9, a1
                  srl          s11, t2, s7
                  bgeu         ra, t3, 209f
                  bne          a6, t0, 196f
                  slti         s2, s9, 250
192:              blt          t0, tp, 204f
                  srai         a7, s10, 10
                  nop
                  sub          ra, s4, tp
                  sltiu        t1, s6, -1796
                  and          s3, t3, a5
                  bltu         a7, a6, 202f
                  beq          a7, s9, 209f
202:              andi         t3, a0, -1975
203:              slti         s8, a3, -494
204:              lui          a7, 280239
                  sltu         a3, a4, a4
                  bge          a4, s6, 211f
                  blt          ra, sp, 208f
208:              slti         s2, t3, 1964
209:              bge          s8, zero, 219f
                  lui          s10, 711238
                  sll          a2, t0, s9
                  addi         zero, ra, -248
                  sra          t4, s8, zero
                  sltu         t1, s7, t0
                  addi         a3, t3, -1216
                  la           s1, region_1+12082
                  sb           s5, -179(s1)
                  lbu          zero, -179(s1)
                  and          t6, a7, s8
                  sb           a5, -179(s1)
                  sb           a7, -179(s1)
                  lbu          s5, -179(s1)
                  sb           t5, -179(s1)
                  lbu          tp, -179(s1)
                  lb           s2, -179(s1)
                  lb           a2, -167(s1)
                  sltiu        t1, s8, -1240
                  lbu          s5, -167(s1)
                  lbu          s11, -167(s1)
                  lb           s11, -167(s1)
                  lbu          t2, -167(s1)
                  sb           t2, -167(s1)
                  lw           a0, -98(s1)
                  sw           a3, -98(s1)
                  lb           s8, -98(s1)
                  sltiu        s2, a5, 1978
                  addi         t1, t1, 329
219:              bge          s8, s0, 234f
                  sltu         s4, t2, s9
                  slli         a0, a7, 9
                  slti         s5, a1, 1284
                  bne          s4, s5, 246f
                  srai         t3, tp, 17
                  auipc        zero, 436497
                  addi         s2, a0, 1585
                  xor          t3, t5, s9
                  xor          s10, s4, a6
                  auipc        s11, 1021738
234:              sub          gp, tp, s1
                  xor          s11, t4, a0
                  bltu         a6, a7, 256f
                  auipc        tp, 347036
                  slti         a7, s3, -1856
                  addi         s9, a6, -1409
                  sra          ra, zero, s5
                  ori          s5, s4, -1961
                  lui          t1, 964902
246:              srl          t2, t1, a0
                  addi         tp, s5, 1178
                  slt          ra, s4, a0
                  sub          a7, s0, t0
                  sra          s9, s10, t2
                  xori         s10, s10, -1469
                  and          a5, gp, s2
                  srai         a3, s8, 26
256:              slti         zero, t3, -939
                  srai         s3, s4, 6
                  xori         t5, a3, 468
                  slli         s3, s1, 7
                  blt          s8, a5, 269f
                  beq          a5, s8, 274f
                  srli         sp, sp, 3
                  blt          zero, tp, 273f
                  lui          s8, 971958
                  bltu         a0, t6, 284f
                  or           s1, s1, s3
274:              sltiu        s3, t6, 1042
                  sltiu        s8, s8, 1726
                  sltiu        s5, s8, 1435
                  addi         s2, s1, 722
                  srl          s3, t4, s8
                  sltiu        a3, s4, -1213
284:              srai         sp, s1, 16
                  blt          a6, zero, 299f
                  sub          a3, t2, gp
                  beq          a0, a6, 291f
                  xori         s2, a5, -1111
                  sra          s2, s2, a1
291:              auipc        s8, 489464
                  sltu         t5, t6, gp
                  lui          s2, 582545
                  sltu         s4, s5, tp
                  nop
                  sra          s4, a0, a3
                  and          t1, s3, s3
299:              bne          s0, t5, 301f
301:              sll          zero, t1, s3
                  sltu         a6, a2, s7
                  srli         ra, ra, 11
                  nop
                  bne          s0, s10, 321f
                  slti         ra, a3, 548
                  srai         a5, t6, 10
                  bne          ra, s10, 324f
                  slti         a1, t6, -374
                  auipc        t3, 675862
                  and          t6, tp, t1
                  sub          t4, s9, sp
                  xor          s4, a7, a4
                  sltu         s9, s1, gp
                  andi         sp, s9, -783
321:              ori          sp, t6, -1317
                  sra          s10, s9, a7
                  lui          s5, 159198
324:              sltu         s8, t4, a1
                  sltiu        s8, s7, 1165
                  sub          t2, s1, s4
                  sltu         s0, s5, s10
                  sll          s0, t6, t4
                  srl          a6, s10, s1
                  andi         s4, s9, -206
                  srli         s0, t6, 20
                  sub          t5, a4, s0
                  sub          t4, a2, a6
                  sub          s10, a3, s9
                  addi         sp, s0, -1211
                  add          a6, s4, a3
                  srli         a1, gp, 11
                  sltiu        a2, t5, 646
                  xor          tp, s11, sp
                  blt          s10, t5, 358f
                  lui          sp, 433926
                  srl          s9, a6, s7
                  srli         a5, s9, 11
                  bltu         a1, a6, 360f
                  sltiu        zero, s7, -1623
                  auipc        t1, 629277
                  sra          s2, t5, s5
                  sltu         s11, t5, s9
                  sub          s5, a4, s6
                  slti         t3, t6, -1790
358:              bltu         a0, s9, 371f
                  sltu         t2, zero, s1
360:              bne          s9, t4, 376f
                  srli         a6, a4, 10
                  sra          s9, s2, s9
                  and          a5, a3, s10
                  srai         s8, a4, 15
                  lui          s2, 824686
                  ori          sp, t3, -236
                  sll          t6, a5, ra
                  add          a3, t3, tp
371:              srl          a5, gp, ra
                  slt          a7, tp, s10
                  lui          s11, 13610
                  slti         t2, s2, -22
                  sltiu        s2, s0, 1767
376:              sra          t3, a2, tp
                  bgeu         s6, t1, 388f
                  sll          s2, s8, s10
                  add          t1, t5, tp
                  or           tp, tp, a6
                  bne          a1, s7, 401f
                  beq          s10, a4, 402f
                  xor          t1, t2, s2
                  slli         a3, t2, 27
                  slt          gp, t2, s11
388:              srai         t1, t1, 20
                  slt          sp, t6, a2
                  lui          a0, 571397
                  ori          s8, tp, -1618
                  blt          t4, t1, 411f
                  slli         s2, gp, 8
                  xor          a4, a2, t0
                  bne          gp, a3, 404f
                  ori          s10, a0, 700
                  lui          s0, 701285
401:              sra          t3, tp, s0
404:              lui          s11, 1006078
                  bltu         gp, a5, 406f
406:              add          a7, a3, s9
                  srli         sp, a7, 19
                  add          t5, a6, s0
411:              sra          t2, a1, ra
                  srai         t3, a7, 16
                  srai         t6, a1, 25
                  addi         a1, t3, -1603
                  bgeu         s4, a0, 433f
                  sll          s4, s4, s10
                  slti         a0, zero, 1767
                  sll          t3, s9, t4
                  or           s9, a5, s10
                  bgeu         a7, s10, 440f
                  and          t2, tp, a3
                  sltu         t3, s6, a2
                  sll          s5, s3, a4
                  bge          a4, a7, 435f
                  bge          t6, t0, 436f
                  addi         s4, t6, 1163
                  slt          a6, t0, zero
                  blt          s3, zero, 437f
                  sll          t2, s3, t4
                  xor          a5, s0, s0
433:              xor          gp, s8, s2
                  bge          s10, t5, 448f
436:              slli         s5, a6, 6
437:              slti         a6, a5, -852
                  sltu         s1, s8, a5
                  bgeu         s8, t1, 458f
                  and          a0, a2, a1
                  xor          s5, s4, t4
                  bge          sp, s7, 454f
                  andi         sp, t2, 1043
                  or           s8, s1, t1
                  nop
                  srai         s4, s5, 11
                  addi         s9, s5, -293
454:              beq          t4, a0, 459f
                  auipc        a1, 311393
                  sltiu        t5, s5, 155
458:              blt          t2, t5, 467f
459:              or           t3, s10, s5
                  or           a4, t6, s4
                  addi         s0, zero, -6
                  andi         t2, zero, 900
                  addi         zero, s9, -94
                  lui          s9, 167833
                  srli         t4, s3, 13
                  sll          s8, t1, a3
                  addi         a4, zero, -11
                  nop
                  xori         gp, a4, 1059
sub_1_16_0_t:     xor          zero, s6, sp
                  add          gp, s0, ra
                  addi         s0, s0, -7
                  auipc        t1, 740104
                  sub          s9, t5, t1
                  xori         s8, t6, 1437
                  slt          t6, s1, s6
                  sltiu        t5, t2, 290
                  sltu         tp, s8, a4
                  auipc        s5, 651068
                  nop
                  bge          s0, a4, sub_1_16_0_t
                  ori          a5, a7, -1660
                  bgeu         gp, ra, 463f
463:              beq          a2, t2, 476f
                  ori          t1, gp, 1383
                  sub          s5, tp, ra
467:              lui          s4, 989972
                  auipc        t6, 162868
                  slli         t3, zero, 24
                  slli         s8, t0, 17
                  and          s0, s11, a6
476:              or           a3, s4, tp
                  slt          t2, s9, ra
                  andi         s9, s5, 663
                  sub          a7, gp, s5
                  add          t1, a7, sp
                  bne          t6, a3, 483f
483:              srli         a4, s0, 26
                  bgeu         t5, a6, 500f
                  xori         t5, s8, -1572
                  xor          a6, s8, a6
                  nop
                  xori         gp, s7, -411
                  or           a0, a1, s2
                  xor          a5, a0, a4
                  andi         gp, t2, 2030
                  slti         a3, zero, -1602
                  xor          gp, t5, s8
                  slli         sp, sp, 2
                  srai         a4, t6, 14
                  slli         a2, s0, 0
500:              auipc        a1, 86797
                  bgeu         s4, t5, 513f
                  nop
                  and          zero, zero, ra
                  slti         a0, t1, -154
                  sltiu        a5, a7, -955
                  sra          a6, s7, s9
                  bltu         t5, a3, 527f
                  bltu         s4, s4, 512f
                  blt          tp, s5, 512f
                  nop
513:              slti         t3, s11, 1827
                  sub          s0, ra, gp
                  sltu         t1, a3, s0
                  srai         t4, a0, 16
                  andi         t3, s10, 458
                  auipc        t2, 759792
                  sll          a2, a0, s10
                  bgeu         zero, gp, 531f
                  bge          s3, s11, 524f
524:              bgeu         s11, s5, 530f
                  blt          s8, s6, 537f
                  auipc        gp, 176938
527:              bge          a5, s4, 545f
                  srai         t6, zero, 4
                  sltiu        s10, zero, 737
530:              andi         t2, s3, 174
531:              slli         a3, a4, 15
                  bgeu         a5, t1, 553f
                  ori          a3, s6, 1142
                  ori          s5, t3, 261
                  or           s2, t1, s11
                  andi         t5, s10, -245
                  beq          t1, s7, 560f
                  andi         s3, a5, -944
                  sltiu        tp, s3, 1651
545:              sltiu        s10, a2, 85
                  sltu         s4, s5, s3
                  add          s5, tp, ra
                  sltu         a6, t6, s0
                  or           s3, s1, zero
                  addi         a1, s5, -1322
                  srai         a2, zero, 10
                  blt          ra, a1, 558f
                  add          a6, s2, t5
                  slli         a1, a2, 3
                  bltu         a4, a5, 573f
560:              andi         sp, t0, -496
                  add          a2, s3, tp
                  sub          t2, t2, a6
                  ori          a4, a5, 426
                  xor          s11, a1, a6
                  sub          s10, t1, a2
                  and          a4, zero, t6
                  and          zero, s0, a3
573:              sltiu        s2, s9, -876
                  slli         s8, s1, 8
                  andi         a0, zero, -1692
                  bltu         t3, a2, 592f
                  lui          a6, 966314
                  addi         s8, t4, -537
                  blt          s9, tp, 596f
                  addi         t4, s7, 2026
                  sll          a6, s1, a1
                  auipc        ra, 555536
                  bne          s4, a7, 596f
                  add          a1, t4, s5
sub_1_7:          jal          ra, 1f
0:                jal          t1, 22f
1:                jal          ra, 17f
2:                jal          ra, 6f
3:                jal          s4, 7f
4:                jal          ra, 13f
5:                jal          a2, 16f
6:                jal          t1, 14f
7:                jal          t1, 12f
8:                jal          ra, 0b
9:                jal          sp, 15f
10:               jal          ra, 21f
11:               jal          ra, 4b
12:               jal          ra, 10b
13:               jal          s1, 3b
14:               jal          t1, 5b
15:               jal          gp, 2b
16:               jal          t1, 23f
17:               jal          ra, 11b
18:               jal          ra, 8b
19:               jal          sp, 9b
20:               jal          t1, 19b
21:               jal          ra, 18b
22:               jal          ra, 20b
23:               srai         a0, t4, 28
                  nop
592:              xor          tp, a1, a6
                  addi         sp, a6, 1660
                  sltiu        s11, a4, 673
                  bne          t6, a1, 614f
                  sltiu        s2, s3, 1918
                  srl          s3, t3, t4
                  bge          a0, s0, 608f
                  slti         s10, tp, -1721
                  sltiu        sp, a6, 734
                  xori         a7, s3, 1146
608:              ori          a0, zero, 1883
                  bgeu         t4, s1, 611f
611:              xor          s8, s8, a1
                  bgeu         s8, s11, 624f
                  and          a5, s8, s5
614:              ori          a6, s1, 326
                  auipc        gp, 176200
                  add          s11, tp, s10
                  bge          a3, s1, 631f
                  beq          s0, t0, 628f
                  sltu         s11, s0, s1
                  xor          s2, tp, t0
                  sltu         s10, a2, t2
                  sll          s8, t6, gp
624:              auipc        a3, 215380
                  slti         a6, t5, 152
                  andi         a3, s3, -1568
                  add          s0, ra, a5
628:              or           s0, a6, s11
                  bne          a4, a7, 644f
                  sub          s2, s6, zero
631:              sltiu        t6, a1, 1793
                  ori          s8, t0, -1780
                  blt          t4, a1, 642f
                  bne          a1, s10, 650f
                  blt          s8, t1, 657f
                  sltiu        ra, s11, -462
                  bltu         s9, s2, 646f
644:              slti         t4, s8, -1512
                  beq          a7, t0, 665f
646:              andi         a4, s10, -1808
                  and          tp, a5, s3
650:              sra          a4, tp, s9
                  slli         t1, t2, 14
                  slt          zero, s6, s4
                  bgeu         s6, s1, 674f
                  or           t1, a4, sp
                  slt          s8, ra, a7
                  sub          a3, s7, s7
                  blt          a1, s2, 678f
                  srli         gp, a4, 12
                  slt          s4, s7, s5
                  sub          t4, s5, gp
665:              blt          a2, s11, 679f
                  blt          s6, ra, 674f
                  beq          gp, s2, 683f
                  or           a3, s0, s8
                  xori         s10, s11, -1140
                  ori          a7, s4, -900
674:              sll          s2, sp, t5
                  or           t1, s11, t0
                  auipc        t4, 981673
678:              bge          a5, t0, 697f
679:              sltu         a1, a4, s3
                  sltiu        a5, t4, -307
                  auipc        ra, 515871
                  srli         t3, a2, 19
                  slli         a2, a7, 0
                  srli         t1, t1, 26
                  andi         sp, s5, 2044
                  srai         t4, tp, 18
                  addi         sp, a0, 456
                  sltu         ra, s5, a5
                  addi         a6, t3, -1937
                  xor          a5, t4, t5
                  srai         tp, s5, 23
                  ori          s10, a2, 1665
                  slli         sp, s7, 25
                  addi         s10, sp, 250
                  sra          a3, s5, s10
                  nop
                  and          s9, a3, t3
                  xor          s0, t3, s7
                  sra          t6, s2, a2
                  bne          a0, t5, 716f
                  sub          s1, a5, s1
                  xor          a4, a3, a0
                  slti         s8, s0, -1804
                  slt          sp, t3, t1
                  sra          a0, ra, s10
                  or           a6, s3, s7
                  slt          s9, ra, s2
                  or           t2, t2, a7
                  sub          a5, s0, a5
716:              and          a2, s10, a5
                  srli         zero, zero, 18
                  sltiu        s3, ra, -336
                  xor          s11, s3, s1
                  blt          a2, a4, 741f
                  bltu         s2, a1, 732f
                  slti         a6, a0, 1367
                  xor          ra, s10, ra
                  srai         s10, a5, 2
                  auipc        a2, 214494
                  or           a2, s9, s8
                  xor          s1, t3, a1
                  addi         s2, s0, -1581
732:              xori         s4, t3, -291
                  slti         t1, a3, 257
                  xor          a6, s3, s0
                  sltiu        s0, ra, -137
                  and          a3, s8, a2
                  srli         t4, s8, 31
                  add          tp, a2, a3
                  ori          a5, sp, -1553
741:              slti         a7, s7, 1115
                  sra          s11, t5, a7
                  addi         t1, s3, -1967
                  addi         t5, t4, -29
                  nop
                  sll          s8, a5, a6
                  bltu         s11, t0, 764f
                  srai         a5, t1, 30
                  and          t2, s7, t1
                  sltu         s8, t3, t4
                  bgeu         t1, s9, 763f
                  sltu         t6, a2, s7
                  ori          s5, sp, 1245
                  slli         s3, s0, 28
                  bltu         s1, s3, 758f
                  auipc        t4, 1013685
758:              ori          s5, a6, 1574
                  srai         t2, t1, 18
                  bge          a2, s6, 766f
                  sll          t1, a7, a7
763:              slt          a7, s5, t1
                  or           s2, a7, s5
                  sll          sp, zero, t4
                  blt          ra, s9, 780f
                  xori         s8, s3, -1016
                  bne          t1, t5, 771f
771:              addi         s11, sp, -1783
                  xor          zero, a7, t2
                  slli         a0, s2, 25
                  sltiu        t1, s2, -993
                  beq          s0, s8, 777f
                  bltu         a2, t6, 782f
777:              nop
                  sra          a0, s3, s6
                  and          s9, a2, s6
782:              slti         t6, t1, 333
                  srai         s1, s4, 21
                  auipc        s0, 1046553
                  xori         s1, s2, -1776
                  srai         a6, s2, 16
                  bgeu         t1, t3, 800f
                  auipc        a4, 722785
                  bltu         s8, s11, 804f
                  sub          a2, t6, s8
                  srai         t5, t0, 3
                  slti         gp, s7, -524
                  ori          tp, s7, -1131
800:              blt          a5, a0, 820f
                  sra          t5, ra, a4
                  auipc        a7, 1044592
                  sll          t2, s1, t3
                  or           sp, a0, a1
                  andi         a2, a1, -1317
                  and          s11, a5, a3
                  addi         t3, s1, -995
                  xor          sp, tp, t4
                  slt          s4, a4, s9
                  sltu         t5, s11, s1
                  srl          a3, t1, zero
                  xori         a2, s9, -2044
                  srli         s8, s3, 26
                  or           s0, s11, s4
820:              add          s2, t1, s10
                  or           a4, s6, t2
                  and          s11, a5, t1
                  xor          s10, s2, a4
                  xor          a4, a1, a3
                  srl          a1, t4, s9
                  andi         gp, t5, -1835
                  sub          t6, s8, a4
                  and          a4, s11, t1
                  slli         t6, s6, 19
                  sltu         gp, a4, a3
                  bgeu         s1, a4, 846f
                  bne          t2, t2, 854f
                  sltiu        a0, a2, -1775
                  nop
                  ori          a0, s1, -1720
                  bge          s3, ra, 851f
                  sub          gp, gp, s3
                  beq          s4, a0, 854f
                  or           ra, a4, t0
                  and          t4, zero, s4
846:              sra          s2, s7, t1
                  nop
                  addi         a5, a5, -698
                  bltu         t1, t6, 862f
                  bge          t0, ra, 856f
                  sll          s8, t6, s11
                  auipc        tp, 534168
854:              ori          a4, s11, -580
                  addi         a6, tp, -97
856:              and          a7, a1, s5
                  auipc        t3, 1014802
                  xor          s2, a2, s11
                  srai         a6, s5, 25
                  sltiu        s8, s6, -1755
862:              or           a4, s4, a5
                  xor          s8, a6, s2
                  bgeu         a3, s1, 871f
                  slli         t6, s0, 9
                  sltu         a7, s11, ra
871:              sub          a2, s1, t1
                  srai         sp, a3, 19
                  bge          t4, s6, 884f
                  blt          s4, tp, 894f
                  srai         s5, a5, 0
                  nop
                  bltu         s8, t0, 897f
                  xori         t4, t0, -1027
                  sltu         t1, s11, t1
                  addi         a2, zero, 1544
                  or           a0, a4, s4
                  ori          a6, s9, -229
                  sltiu        tp, s6, 1817
                  lui          s0, 1024790
                  la           gp, region_0+3059
                  sltiu        ra, s10, -711
                  andi         s5, a0, -1139
                  add          t4, t3, a0
                  sltiu        t2, s7, -1945
                  lhu          t3, 41(gp)
                  lui          t4, 82101
                  lbu          zero, -219(gp)
                  xor          t5, t5, t0
                  sltiu        tp, s3, 774
                  srli         s4, s2, 17
                  lbu          s2, -42(gp)
                  lbu          t4, -146(gp)
                  and          tp, s1, a2
                  lbu          s9, 34(gp)
                  sb           gp, 195(gp)
                  sb           s11, 118(gp)
                  ori          s5, s5, 661
                  sb           t2, -54(gp)
                  lb           s11, -227(gp)
                  srli         zero, t3, 20
                  and          t5, zero, a2
                  sb           t6, 12(gp)
                  sra          sp, tp, gp
                  lh           s9, -199(gp)
                  sb           tp, -224(gp)
                  sw           t5, -123(gp)
                  slt          sp, a3, a5
                  lbu          s8, -81(gp)
                  lhu          a4, 189(gp)
                  srl          t4, a1, a5
                  sb           a0, 153(gp)
                  sltiu        a2, t6, -858
                  slti         a1, t0, 1583
                  lbu          a5, -162(gp)
                  lhu          t6, 117(gp)
                  xori         t5, s11, 66
                  lui          a1, 700455
                  slti         a4, s2, -1897
                  lbu          t4, -111(gp)
                  sh           t6, 5(gp)
                  xori         a3, a7, 609
                  sb           t5, -204(gp)
                  lbu          s3, 71(gp)
                  ori          a6, a0, 1260
                  lh           s1, 49(gp)
                  lb           a5, -70(gp)
                  lbu          a0, 3(gp)
                  sh           t2, -67(gp)
                  sb           a0, -197(gp)
                  sb           s0, -108(gp)
                  lui          s1, 139707
                  slli         a0, a5, 29
                  srl          t1, t0, a5
894:              or           a0, a3, a1
897:              bne          t5, ra, 911f
                  nop
                  lui          t1, 70903
                  xor          gp, t0, a6
                  add          a4, s9, sp
                  xori         t3, t3, -1564
                  or           t2, t3, t2
                  bgeu         a1, gp, 910f
                  beq          gp, t0, 928f
                  bne          gp, t0, 923f
910:              or           t1, s5, a6
911:              bltu         gp, s8, 927f
                  ori          sp, s7, -690
                  sll          a1, t0, a0
                  slt          sp, gp, t5
                  sll          ra, s0, sp
                  bgeu         tp, a0, 918f
918:              slti         s11, t4, -602
                  srl          a7, zero, a0
                  andi         a5, tp, -467
                  andi         t3, a5, -894
923:              bne          a6, t2, 932f
                  xor          s9, gp, t4
                  slli         s1, s8, 29
                  srli         sp, s1, 23
927:              lui          s3, 1046688
928:              srl          a2, a0, s4
                  bne          t6, a6, 935f
                  auipc        a3, 1030983
                  nop
935:              srli         s4, s7, 9
                  srl          s10, s8, s11
                  andi         a7, s7, -1902
                  xor          s11, sp, a1
                  bgeu         s9, sp, 942f
942:              addi         a5, a2, -708
                  andi         s8, t6, 1631
                  srai         t1, s8, 19
                  sra          sp, s1, s6
                  sltu         a6, a7, t1
                  srl          t2, s10, a5
                  and          a6, s9, s11
                  beq          s11, t5, 971f
                  and          s4, a0, s9
                  beq          a6, s2, 974f
                  bne          zero, t4, 962f
                  addi         s5, a0, -121
962:              and          t5, s4, s8
                  slli         a3, zero, 0
                  xor          s9, tp, t0
                  lui          s8, 642493
                  sltiu        t2, gp, -1787
                  sra          s11, s0, s5
                  and          s0, s9, s5
                  and          gp, s6, tp
971:              addi         a3, t0, -653
                  srl          s0, s7, s5
                  add          s4, s7, s4
974:              or           a1, s3, t0
                  xori         gp, a3, -216
                  blt          s1, s11, 986f
                  sra          s8, s2, s1
                  slli         a5, a2, 12
                  slti         s5, a6, 714
                  add          s8, s11, s11
                  xori         gp, a0, -1462
986:              bne          s9, s5, 1006f
                  slti         s5, t3, -44
                  bne          s7, t0, 1000f
                  bgeu         t4, s3, 1006f
                  bge          s9, ra, 1002f
                  addi         a7, s7, -1122
                  srl          s9, t0, s6
                  beq          a2, s8, 998f
                  auipc        a1, 57449
998:              bgeu         s0, sp, 1006f
                  bltu         zero, t5, 1020f
1002:             srli         ra, s7, 6
                  slli         s10, s1, 16
                  sll          s9, s10, s10
                  lui          s4, 916954
1006:             or           t3, s11, ra
                  sub          s3, s11, s0
                  add          t2, s9, s8
                  addi         a6, zero, 8
                  slli         sp, a7, 26
                  addi         a2, zero, 2
sub_1_19_1_t:     xori         s10, s5, 2044
                  or           s11, s11, a6
                  addi         a6, a6, -1
                  addi         s2, zero, -8
                  addi         a0, zero, 10
                  srai         t1, a4, 7
sub_1_19_0_t:     addi         s8, s5, 43
                  addi         s2, s2, 1
                  beq          s2, a0, sub_1_19_0_t
                  srl          t2, t6, t5
                  slli         s3, gp, 28
                  or           s0, a1, s6
                  beq          a6, a2, sub_1_19_1_t
                  sltiu        s11, s3, -1149
                  or           s1, s8, t2
                  and          tp, a0, t1
                  bgeu         s3, a1, 1026f
                  slli         a4, sp, 13
                  bne          a0, a2, 1031f
                  or           s3, s5, t0
                  sra          a5, s5, a4
                  srl          s0, a2, tp
                  bltu         t3, s2, 1040f
                  blt          a5, a5, 1033f
                  xori         a5, a7, 387
                  andi         s1, s0, -1178
1026:             sll          gp, t5, a2
                  blt          s8, a1, 1038f
                  xori         s0, s2, -947
                  srai         t5, s11, 6
1031:             nop
1033:             srai         gp, s3, 20
                  nop
                  bgeu         s5, t0, 1051f
                  xori         s3, t5, -100
                  andi         s11, t0, 611
                  sub          ra, t2, s4
                  auipc        s0, 564464
                  sub          t4, s10, gp
                  andi         sp, a4, 74
                  beq          s8, s2, 1052f
                  srai         a2, s5, 31
                  srai         a4, s1, 0
1051:             and          t1, tp, a5
                  addi         a2, t3, -270
                  addi         a6, a4, 2029
                  lui          gp, 269086
                  addi         a2, a3, 232
                  sltiu        s9, sp, -576
                  bgeu         zero, t1, 1069f
                  beq          t0, t4, 1069f
                  slt          t3, s0, sp
                  srai         s5, t6, 7
                  blt          s2, s7, 1063f
1063:             srai         t1, s11, 29
                  sra          a2, s2, a4
                  sltu         t4, a3, a0
                  and          tp, t0, a7
1069:             slt          t5, ra, s1
                  sltiu        a3, tp, -350
                  lw           ra, 4(s7)
                  addi         s7, s7, 32
                  slti         t6, t3, 1561
1847:             addi x13, x1, 1
1847:             jalr x13, x13, 0
sub_3:            slti         zero, t1, -1775
                  bne          a1, s9, sub_3_stack_p
                  xori         sp, gp, 1916
sub_3_stack_p:    addi         s7, s7, -24
                  andi         t1, a0, 1706
                  sltiu        a2, t6, -1928
                  sw           ra, 4(s7)
                  srli         t4, sp, 0
                  xori         sp, t0, 1711
                  addi         a4, zero, -1
                  addi         s0, zero, -6
sub_3_29_1_t:     addi         t5, s11, -1711
                  addi         a4, a4, -5
                  addi         a3, zero, 3
                  xor          s8, t6, s9
                  addi         s3, zero, 8
sub_3_29_0_t:     xori         s2, s8, -613
                  addi         a3, a3, 5
                  auipc        t4, 507132
                  bne          a3, s3, sub_3_29_0_t
                  bne          a4, s0, sub_3_29_1_t
                  sll          t4, t6, a7
                  la           t6, region_1+38546
                  la           a5, region_1+65400
                  lb           a1, -16(t6)
                  lb           gp, 44(a5)
                  lb           t1, -956(a5)
                  lb           s9, -959(a5)
                  sb           t4, -359(a5)
                  lhu          s2, 32(t6)
                  sb           a6, -5(t6)
                  sb           t6, -891(a5)
                  sb           zero, -55(t6)
                  lbu          a2, -937(a5)
                  lh           a7, 64(t6)
                  lb           s4, -1159(a5)
                  la           a5, region_1+30830
                  lb           t6, 963(a5)
                  xori         s3, t3, 1884
                  lhu          s9, -318(a5)
                  add          s9, s10, a0
                  lbu          s1, 54(a5)
                  lhu          t5, 1160(a5)
                  lbu          a3, 415(a5)
                  sb           tp, 331(a5)
                  lb           s4, -1109(a5)
                  sb           t6, 1949(a5)
                  add          t1, gp, t3
                  lbu          zero, -1249(a5)
                  sltiu        a3, a3, -1735
                  lui          s8, 888652
                  lb           t2, 619(a5)
                  lbu          s10, 871(a5)
                  lb           t6, -1537(a5)
                  lbu          a3, 956(a5)
                  andi         t3, a2, 1814
                  andi         t1, ra, 1786
                  addi         s5, sp, 1689
                  sltiu        s0, a6, 906
                  sw           s0, -226(a5)
                  lbu          s3, -1780(a5)
                  lb           gp, 1445(a5)
                  slli         a2, t1, 28
                  sll          a3, s1, a3
                  lb           a6, 1797(a5)
                  addi         a6, gp, -822
                  lbu          a1, -1727(a5)
                  slli         a7, s1, 29
                  sh           s1, -766(a5)
                  sh           s11, 276(a5)
                  sb           tp, 2009(a5)
                  lbu          a0, 1355(a5)
                  lb           a7, -1669(a5)
                  lb           s0, -128(a5)
                  sb           a7, -21(a5)
                  addi         s0, s3, -633
                  sub          tp, a6, s3
                  sh           tp, 1752(a5)
                  lb           s11, 325(a5)
                  and          s0, tp, a4
                  lbu          t3, 319(a5)
                  la           s4, region_1+14380
                  lbu          sp, -99(s4)
                  lb           s3, 2047(s4)
                  la           s0, region_0+1919
                  lh           a1, 731(s0)
                  lbu          a5, -363(s0)
                  sh           a1, 1308(s4)
                  lhu          s11, -19(s0)
                  sh           s2, -1358(s4)
                  sb           s8, -1489(s0)
                  sb           a4, 1479(s0)
                  lb           a3, -959(s4)
                  lbu          zero, 875(s4)
                  lb           ra, 62(s0)
                  sb           a5, 1032(s4)
                  lb           zero, -1385(s0)
                  lbu          s9, -1890(s0)
                  lw           s8, 1120(s4)
                  sb           t2, -1378(s4)
                  la           sp, region_0+620
                  sltu         s4, s4, tp
                  xori         t3, s7, 1953
                  andi         s0, t1, -276
                  nop
                  sltu         zero, s8, gp
                  sb           t5, -172(sp)
                  sll          ra, a3, a2
                  or           zero, ra, a5
                  sb           t2, 157(sp)
                  addi         s9, t0, -1656
                  lb           s3, -61(sp)
                  sh           t0, -242(sp)
                  auipc        a4, 299061
                  sb           sp, -175(sp)
                  lbu          t3, -163(sp)
                  sb           t1, 183(sp)
                  addi         a0, ra, -1662
                  lhu          s5, 6(sp)
                  lb           a6, -194(sp)
                  lbu          t3, -1(sp)
                  addi         a3, s4, -189
                  auipc        a5, 898421
                  lbu          t3, -52(sp)
                  lui          s4, 660308
                  xor          s4, a0, s11
                  sb           t6, 16(sp)
                  sb           gp, -196(sp)
                  add          tp, s6, s0
                  sltiu        s4, a1, -1562
                  xori         s11, a2, 1760
                  slti         s5, s4, -1497
                  lh           s11, 68(sp)
                  la           t5, region_1+13737
                  sb           s1, -7(t5)
                  lb           t1, -7(t5)
                  lhu          t6, -7(t5)
                  lh           s4, -7(t5)
                  lhu          a2, -7(t5)
                  lbu          gp, -7(t5)
                  lb           t2, -10(t5)
                  srl          t2, s4, a3
                  lbu          s9, 1(t5)
                  lhu          t6, 1(t5)
                  lh           a0, 1(t5)
sub_3_8:          jal          ra, 9f
0:                jal          ra, 17f
1:                jal          t1, 8f
2:                jal          ra, 5f
3:                jal          t1, 1b
4:                jal          t1, 21f
5:                jal          s1, 20f
6:                jal          a6, 15f
7:                jal          ra, 19f
8:                jal          ra, 16f
9:                jal          t1, 13f
10:               jal          a0, 12f
11:               jal          t1, 2b
12:               jal          t1, 18f
13:               jal          ra, 0b
14:               jal          ra, 6b
15:               jal          a5, 10b
16:               jal          tp, 7b
17:               jal          ra, 11b
18:               jal          ra, 22f
19:               jal          ra, 4b
20:               jal          a3, 3b
21:               jal          ra, 14b
22:               srl          a1, t5, t1
                  la           s5, region_1+54589
                  la           t4, region_0+957
                  sb           ra, -679(t4)
                  lbu          a2, -159(s5)
                  lb           ra, 173(t4)
                  sb           s7, -220(s5)
                  sb           a6, -884(t4)
                  lbu          t6, 216(s5)
                  sh           a5, -609(t4)
                  sb           s4, 236(s5)
                  lb           t1, 2(s5)
                  lhu          gp, 929(t4)
                  sh           a6, 501(t4)
                  lbu          a7, -184(s5)
                  lbu          a6, 526(t4)
                  sb           a6, 244(s5)
                  lhu          s10, 761(t4)
                  lb           s8, 963(t4)
                  lbu          t3, -188(s5)
                  la           t1, region_1+32522
                  la           a7, region_0+2876
                  sb           t6, -95(a7)
                  lbu          zero, 214(t1)
                  sh           a0, -52(t1)
                  lb           a6, -249(a7)
                  sb           s8, 130(t1)
                  sb           s3, -25(t1)
                  lbu          gp, 195(a7)
                  sb           t3, 202(t1)
                  sb           sp, -248(a7)
                  sb           s4, 4(t1)
                  sb           s4, -112(t1)
                  lb           sp, -158(t1)
                  lb           s4, 170(a7)
                  sh           t2, 150(a7)
                  addi         s10, zero, 8
                  and          a7, a4, a0
                  addi         s11, zero, -7
                  ori          t1, s10, -143
                  xor          t3, sp, tp
                  ori          s0, zero, 2024
                  nop
sub_3_24_1_t:     auipc        t1, 825757
                  slt          a5, s11, a5
                  xor          s8, t4, s8
                  addi         s10, s10, -5
                  slti         t4, s11, -797
                  lui          t4, 809336
                  sltu         tp, s4, a5
                  add          t5, t1, sp
                  addi         t2, zero, 4
                  sub          a2, a5, s1
                  addi         ra, zero, -3
                  ori          s5, a4, 640
sub_3_24_0_t:     and          t1, t0, s6
                  addi         s0, a0, -1655
                  addi         t2, t2, -1
                  nop
                  bge          t2, ra, sub_3_24_0_t
                  slt          s4, zero, sp
                  bne          s10, s11, sub_3_24_1_t
                  la           sp, region_0+822
                  lbu          a2, 1560(sp)
                  sb           s2, 1560(sp)
                  lhu          s1, 1560(sp)
                  lh           a3, 1560(sp)
                  addi         s11, a2, -1922
                  lbu          zero, 1560(sp)
                  lb           a6, -418(sp)
                  sh           a3, 276(sp)
                  lh           a0, 1264(sp)
                  srli         t4, t1, 17
                  sb           t1, -798(sp)
                  lhu          a6, -798(sp)
                  la           s10, region_1+5323
                  la           a0, region_1+20359
                  la           a5, region_1+24820
                  lh           ra, -3(a0)
                  sb           a0, -7(a0)
                  la           s11, region_1+64772
                  la           a6, region_1+41649
                  lb           t4, 594(s10)
                  lw           t4, -1491(s10)
                  lhu          s8, 7(a0)
                  sw           a5, 740(a5)
                  sw           s2, 443(a6)
                  lbu          s5, 1310(s10)
                  sb           zero, -547(a5)
                  lb           a4, -1601(s11)
                  sb           s9, 6(a0)
                  lh           t5, 5(a0)
                  lh           s0, -1971(a6)
                  sb           t0, 1278(a6)
                  sb           s6, -937(s11)
                  sh           a4, -11(a0)
                  lbu          ra, 671(s11)
                  sh           t6, -758(a5)
                  lb           t6, 1216(a6)
                  sw           a6, -800(a5)
                  lhu          a2, -1473(s10)
                  lbu          t2, -478(s10)
                  lbu          a3, -2(a0)
                  lhu          gp, 15(a6)
                  lb           s3, -150(s11)
                  lhu          t1, 1539(s10)
                  lb           s8, -992(a5)
                  lb           tp, 14(a0)
                  lhu          s9, 589(s10)
                  lb           s2, 14(a0)
                  sb           t4, -559(s11)
                  sb           s10, 1921(s10)
                  sb           a6, -5(a0)
                  lbu          s8, -2031(a5)
                  la           t6, region_0+1852
                  lbu          s9, 1535(t6)
                  sltiu        s9, a3, -1284
                  sh           s9, -26(t6)
                  srli         a3, sp, 1
                  sltiu        s9, t3, -695
                  sb           t1, -1537(t6)
                  add          t1, a3, a3
                  sb           t3, -1113(t6)
                  sh           t1, 1534(t6)
                  sra          sp, t3, sp
                  add          s2, sp, sp
                  lb           sp, -981(t6)
                  sra          a3, a3, s9
                  sh           s9, -1104(t6)
                  srli         t1, a3, 21
                  lui          t3, 240124
                  lhu          t1, -522(t6)
                  sh           t1, -664(t6)
                  sub          sp, a3, sp
                  srli         t1, s9, 23
                  sb           s9, 1553(t6)
                  slli         t3, t1, 8
                  add          s9, t3, s9
                  lb           sp, -1714(t6)
                  nop
                  lb           t3, -576(t6)
                  sra          t1, a3, s9
                  sltiu        sp, t3, -1178
                  srl          s9, a3, s9
                  sb           a3, -1665(t6)
                  lb           t1, -253(t6)
                  slti         t3, t3, -1921
                  ori          sp, t1, -1282
                  lbu          t1, -780(t6)
                  srl          s2, s2, sp
                  lb           t1, -877(t6)
                  and          s9, s2, t1
                  lbu          s9, 1875(t6)
                  lb           t3, -109(t6)
                  sw           s9, 956(t6)
                  sb           sp, -1816(t6)
                  addi         t5, zero, 7
                  slli         s3, t5, 27
                  addi         a6, zero, 7
sub_3_26_0_t:     addi         a7, t6, -592
                  sltiu        a2, t3, -1405
                  addi         t5, t5, -6
                  sltu         s1, t0, s10
                  bgeu         t5, a6, sub_3_26_0_t
                  xori         s3, t2, 1019
                  la           a1, region_1+13303
                  lbu          zero, -65(a1)
                  lh           a3, -131(a1)
                  lh           a6, -131(a1)
                  lbu          t1, -131(a1)
                  lw           t2, -131(a1)
                  sw           t1, -131(a1)
                  lb           a7, -131(a1)
                  lbu          t4, -131(a1)
                  sh           s7, -131(a1)
                  lh           a2, -131(a1)
                  lb           t3, 33(a1)
                  ori          a3, t0, -2024
                  lb           s10, -130(a1)
                  lb           t2, -130(a1)
                  lb           a4, -130(a1)
                  sb           s6, -130(a1)
                  xori         t3, tp, -1557
                  lbu          a6, 15(a1)
                  andi         t2, s5, -1589
                  sh           a2, 15(a1)
                  lw           sp, -223(a1)
                  la           a3, region_0+4067
                  slli         s3, a2, 11
                  sb           a7, -9(a3)
                  xori         sp, zero, 107
                  sb           s9, -4(a3)
                  nop
                  sb           s5, 3(a3)
                  xori         s8, s9, 1328
                  lw           gp, 9(a3)
                  lh           a1, -11(a3)
                  ori          s10, t2, -292
                  sh           a5, -11(a3)
                  sltu         a5, s4, s7
                  slti         s10, s4, -1270
                  lb           a6, -11(a3)
                  lui          a4, 824077
                  nop
                  lb           t1, 14(a3)
                  lb           t2, -2(a3)
                  lui          s0, 463180
                  lh           s5, -3(a3)
                  sra          ra, a5, s6
                  srai         s5, ra, 20
                  lh           s10, 9(a3)
                  srai         s4, s2, 23
                  add          gp, s1, t4
                  slti         a4, tp, 108
                  lw           s2, -15(a3)
                  lbu          t4, -9(a3)
                  la           s1, region_1+24284
                  lb           a0, 52(s1)
                  sh           s11, -46(s1)
                  la           s2, region_0+3898
                  lb           sp, -41(s1)
                  lbu          a6, -35(s1)
                  lbu          gp, -42(s1)
                  sb           gp, 13(s2)
                  lhu          s9, -58(s1)
                  lh           a6, 0(s2)
                  lbu          s10, -5(s2)
                  lb           t6, 5(s1)
                  lbu          ra, 9(s2)
                  lb           s5, 11(s2)
                  lb           zero, -27(s1)
                  lbu          a3, 11(s2)
                  la           a6, region_0+2344
                  la           s5, region_0+2804
                  sb           a7, -9(s5)
                  sh           a4, 6(a6)
                  lb           zero, 5(a6)
                  la           a1, region_0+2623
                  lbu          s11, 900(a1)
                  lbu          ra, -13(s5)
                  lb           s10, -13(a6)
                  lb           s10, -608(a1)
                  lbu          s9, -1626(a1)
                  sb           gp, 13(a6)
                  lbu          a5, 12(s5)
                  sb           s1, -1902(a1)
                  lb           a3, -1602(a1)
                  lhu          a4, 535(a1)
                  sb           a2, 15(a6)
                  sh           s6, -925(a1)
                  lbu          ra, 3(s5)
                  sh           a5, -6(a6)
                  lb           gp, -882(a1)
                  sb           s8, -13(a6)
                  lh           s8, -2(s5)
                  lbu          a3, 178(a1)
                  sb           a0, 15(s5)
                  sh           s8, -6(a6)
                  lbu          t3, 622(a1)
                  lb           t6, 7(s5)
                  la           tp, region_0+164
                  slt          a7, t4, a6
                  srl          a6, t0, t4
                  lb           s2, 5(tp)
                  lh           t6, 10(tp)
                  sub          s1, a7, s9
                  lbu          a7, -15(tp)
                  sltu         a0, t6, s6
                  auipc        sp, 112129
                  sb           t1, -13(tp)
                  lh           a3, 10(tp)
                  and          a1, s8, s8
                  sw           s10, 16(tp)
                  sb           a1, -3(tp)
                  slli         sp, s1, 12
                  sb           zero, 16(tp)
                  add          t5, a4, s11
                  add          ra, zero, t5
                  lb           s10, 15(tp)
                  xori         t6, t4, 18
                  slti         s10, s9, -446
                  sub          t3, t1, a3
                  sb           sp, 7(tp)
                  lh           a7, -14(tp)
                  lbu          t4, -14(tp)
                  lhu          s5, -14(tp)
                  sb           t4, -1(tp)
                  srl          a0, s2, a1
                  lhu          t6, 2(tp)
                  ori          s4, s8, 1048
                  slli         s4, t2, 28
                  lbu          s9, -5(tp)
                  lui          a4, 393221
                  lb           a6, -15(tp)
                  sw           s7, 4(tp)
                  or           s1, s7, a5
                  lbu          zero, -7(tp)
                  la           sp, region_0+3814
                  andi         s4, s4, 1383
                  lb           s4, -5(sp)
                  lb           s9, -13(sp)
                  lb           a2, 13(sp)
                  sltiu        ra, ra, 1601
                  sll          a1, t6, a2
                  lbu          t6, 0(sp)
                  add          s9, a1, a1
                  lui          t6, 191611
                  lhu          s9, 6(sp)
                  addi         a1, s4, 2001
                  ori          ra, s4, 669
                  ori          a2, s9, 584
                  lhu          t6, 12(sp)
                  lbu          s9, 14(sp)
                  xori         t6, ra, 2038
                  sh           ra, -12(sp)
                  srli         s9, a1, 2
                  xor          a1, s4, s9
                  slti         a1, a1, -1017
                  sra          s4, t6, a2
                  lbu          a1, 11(sp)
                  lb           t6, 9(sp)
                  xori         ra, ra, -1739
                  lbu          a1, 4(sp)
                  lbu          t6, -4(sp)
                  lui          a1, 691487
                  lhu          a2, -8(sp)
                  sh           s4, -16(sp)
                  lh           s9, -8(sp)
                  sll          s9, a2, s9
                  srai         s4, a2, 30
                  lbu          t6, 0(sp)
                  lhu          a1, -10(sp)
                  srl          ra, a2, t6
                  sb           ra, 4(sp)
                  ori          s9, t6, -1605
                  sltiu        a2, t6, 1730
                  sltu         ra, ra, s4
                  auipc        t6, 415467
                  lw           s4, -2(sp)
                  lhu          s9, -4(sp)
sub_3_7:          jal          ra, 19f
0:                jal          t1, 15f
1:                jal          ra, 3f
2:                jal          t1, 10f
3:                jal          t1, 20f
4:                jal          t1, 16f
5:                jal          sp, 7f
6:                jal          ra, 0b
7:                jal          ra, 13f
8:                jal          ra, 21f
9:                jal          ra, 18f
10:               jal          a5, 8b
11:               jal          gp, 14f
12:               jal          t1, 23f
13:               jal          a4, 6b
14:               jal          ra, 1b
15:               jal          a4, 9b
16:               jal          t1, 5b
17:               jal          ra, 2b
18:               jal          ra, 12b
19:               jal          ra, 11b
20:               jal          ra, 17b
21:               jal          ra, 22f
22:               jal          gp, 4b
23:               xori         a0, a5, -1267
                  la           s1, region_1+41807
                  lb           t5, -26(s1)
                  lb           a6, -26(s1)
                  lbu          s0, -38(s1)
                  lb           a6, 26(s1)
                  sub          s5, t0, s2
                  srl          s3, t1, s9
                  lb           a2, 26(s1)
                  srl          t2, t1, s7
                  lbu          a4, -12(s1)
                  sb           ra, -12(s1)
                  nop
                  srl          tp, t4, s2
                  addi         a3, a6, 870
                  sb           sp, -12(s1)
                  sb           a0, -12(s1)
                  sll          t3, a5, s4
                  lbu          gp, -12(s1)
                  lb           t1, -12(s1)
                  lb           s0, -12(s1)
                  lbu          gp, -12(s1)
                  sb           s7, -12(s1)
                  lb           t5, -64(s1)
                  sb           s7, -64(s1)
                  lb           a6, -23(s1)
                  lw           ra, -23(s1)
                  lb           s8, -59(s1)
                  sb           s8, -59(s1)
                  la           t3, region_0+2191
                  sb           t2, 1556(t3)
                  lbu          s8, 1556(t3)
                  sb           s6, 1556(t3)
                  sb           s4, 1556(t3)
                  sb           tp, -1291(t3)
                  sh           a4, -1291(t3)
                  sh           a7, -1291(t3)
                  sh           t6, -1291(t3)
                  lhu          t6, 1769(t3)
                  lh           a7, 1769(t3)
                  lh           zero, 1769(t3)
                  lbu          a2, 607(t3)
                  lhu          a7, 607(t3)
                  lh           s2, 607(t3)
                  xor          s5, a7, a0
                  sh           gp, 607(t3)
                  sh           a5, 607(t3)
                  lbu          s10, 1645(t3)
                  lhu          a6, 1645(t3)
                  la           sp, region_1+30817
                  sb           s9, 1397(sp)
                  srli         a1, a4, 24
                  nop
                  lbu          a4, -410(sp)
                  sb           tp, -1266(sp)
                  sb           t4, 798(sp)
                  andi         s10, a4, 1631
                  or           t6, t0, zero
                  addi         s1, t2, 776
                  srl          t4, a4, s5
                  sra          a4, a3, t3
                  lbu          a2, -1235(sp)
                  lbu          a1, 674(sp)
                  srli         s1, a2, 10
                  sb           s8, 977(sp)
                  andi         a7, t1, -1904
                  lb           a0, 1200(sp)
                  sb           s11, 89(sp)
                  andi         s2, s6, -573
                  sh           t6, 89(sp)
                  lh           a7, 69(sp)
                  lb           t6, 1862(sp)
                  srli         tp, s5, 12
                  slli         t1, t0, 12
                  sb           sp, 1228(sp)
                  lb           a0, 360(sp)
                  lbu          t3, 1490(sp)
                  or           a2, s0, s0
                  lb           t3, -322(sp)
                  ori          s9, zero, 604
                  sh           s9, -1415(sp)
                  sb           zero, 460(sp)
                  sltu         s1, s4, s3
                  sh           t1, -1411(sp)
                  lbu          s8, -1202(sp)
                  sltu         ra, s4, t1
                  sub          s10, s10, s3
                  nop
                  lh           a5, -293(sp)
                  la           a0, region_0+1019
                  la           a5, region_0+2491
                  la           s1, region_0+3675
                  la           s4, region_0+2319
                  sb           a3, 57(a0)
                  lb           t3, 206(a5)
                  lhu          zero, 1607(a0)
                  lbu          sp, -279(s4)
                  lbu          gp, 2(s1)
                  la           s3, region_0+2161
                  lb           zero, 1273(s4)
                  lbu          s5, -242(a5)
                  sb           s10, -1304(s4)
                  lhu          a2, 71(a5)
                  lh           s0, -699(a0)
                  sb           a2, -6(s1)
                  sw           ra, -795(a0)
                  lb           s10, 1932(a0)
                  lbu          s5, 6(s1)
                  lbu          s2, 49(s3)
                  lh           s9, -701(a0)
                  lb           zero, -494(s4)
                  sh           gp, 47(s3)
                  lbu          a7, -82(a0)
                  lbu          zero, -162(a5)
                  sb           s1, 21(s3)
                  lbu          t4, 141(a5)
                  lbu          t1, -15(s1)
                  sb           t5, 0(s3)
                  lh           t6, -1(s1)
                  sh           t6, 149(a5)
                  lhu          tp, 1571(a0)
                  lb           a6, 1248(a0)
                  lb           t6, -15(s1)
                  sb           a0, -1594(s4)
                  lb           t6, 4(s1)
                  lbu          s9, -123(a5)
                  sb           s3, 732(s4)
                  lh           s11, -13(a5)
                  sb           s6, 1102(a0)
                  lbu          s0, 688(s4)
                  lb           s10, 10(s1)
                  lb           a6, 6(s3)
                  la           a7, region_0+3142
                  la           s9, region_0+2459
                  lbu          tp, -153(a7)
                  la           s10, region_0+1212
                  lbu          sp, -6(s9)
                  la           s5, region_0+3606
                  lbu          t3, -1399(a7)
                  sb           a3, -68(s10)
                  lh           s0, -25(s9)
                  lbu          t5, 561(a7)
                  lbu          a3, -236(s5)
                  lbu          t2, -32(s9)
                  sb           s11, 181(s5)
                  lhu          a3, -1226(a7)
                  sb           s4, 154(s5)
                  la           ra, region_0+279
                  sh           a2, 1262(s10)
                  lb           s3, -353(a7)
                  sb           s7, -1643(a7)
                  lb           a3, 209(s5)
                  sh           a3, 688(a7)
                  lb           s4, -10(ra)
                  lb           s8, -13(s5)
                  lh           a6, 51(s9)
                  lh           t1, -242(s5)
                  lbu          a0, -3(ra)
                  lbu          gp, -404(s10)
                  sb           t2, 47(s9)
                  sh           a1, -5(ra)
                  sb           zero, 646(s10)
                  lbu          a5, 1252(s10)
                  sw           a1, -1846(a7)
                  sb           s9, -59(s5)
                  sb           s1, 395(s10)
                  lb           s4, -30(s9)
                  lbu          s3, 38(s5)
                  lbu          a4, -16(s5)
                  lbu          s8, 10(ra)
                  sb           t1, -1073(s10)
                  lb           t2, 12(ra)
                  lbu          sp, 119(s5)
                  lh           s11, 47(s9)
sub_3_10:         jal          ra, 4f
0:                jal          ra, 19f
1:                jal          ra, 17f
2:                jal          a3, 18f
3:                jal          tp, 22f
4:                jal          t1, 0b
5:                jal          ra, 12f
6:                jal          ra, 15f
7:                jal          t1, 10f
8:                jal          ra, 5b
9:                jal          t1, 6b
10:               jal          ra, 3b
11:               jal          ra, 20f
12:               jal          a2, 21f
13:               jal          ra, 1b
14:               jal          ra, 11b
15:               jal          gp, 8b
16:               jal          ra, 7b
17:               jal          t1, 9b
18:               jal          ra, 13b
19:               jal          tp, 2b
20:               jal          ra, 16b
21:               jal          gp, 14b
22:               and          t2, s0, a0
                  la           sp, region_1+44131
                  sw           s5, -219(sp)
                  lh           t1, -219(sp)
                  sh           t4, -219(sp)
                  sb           sp, -219(sp)
                  lw           s9, -219(sp)
                  sh           s0, -219(sp)
                  sb           a7, -219(sp)
                  sltu         t6, t3, ra
                  sb           a7, -219(sp)
                  lh           tp, -219(sp)
                  andi         s4, s7, 1925
                  lbu          a2, -219(sp)
                  lbu          a0, -219(sp)
                  sb           s3, -219(sp)
                  sltu         s10, t5, s2
                  nop
                  lhu          t4, -219(sp)
                  sb           t4, -219(sp)
                  andi         t4, s0, -1411
                  lbu          a4, -219(sp)
                  lhu          a7, 9(sp)
                  la           a6, region_1+5449
                  sb           t0, -7(a6)
                  la           sp, region_0+29
                  lbu          s1, -12(sp)
                  lb           tp, 138(sp)
                  lb           zero, 14(a6)
                  lbu          t4, -1(a6)
                  sb           s8, 115(sp)
                  sb           t3, 252(sp)
                  lb           s5, 102(sp)
                  lbu          t4, -6(a6)
                  sb           s3, 142(sp)
                  sb           t5, -12(a6)
                  lh           t6, 151(sp)
                  la           ra, region_1+52329
                  sb           tp, 1969(ra)
                  lbu          a1, -1448(ra)
                  sw           a0, 471(ra)
                  auipc        s11, 718212
                  lb           a1, 1708(ra)
                  lb           gp, -54(ra)
                  lbu          a1, 1694(ra)
                  slli         s11, tp, 7
                  lbu          a0, 1176(ra)
                  slt          a1, a0, tp
                  lui          tp, 35782
                  slti         a5, gp, 1466
                  auipc        gp, 956741
                  sb           a1, -573(ra)
                  lb           a0, 2028(ra)
                  srai         gp, a1, 18
                  sltiu        a5, gp, -629
                  xori         s11, s11, 1071
                  sltu         a0, a1, tp
                  lb           a0, -848(ra)
                  sb           s11, -882(ra)
                  lbu          gp, -616(ra)
                  lb           gp, -324(ra)
                  sb           tp, 566(ra)
                  nop
                  sh           s11, -1247(ra)
                  sltiu        s11, gp, 969
                  srli         tp, a5, 3
                  srl          a1, tp, a0
                  or           gp, gp, a0
                  lhu          a0, -1981(ra)
                  sb           a1, 1016(ra)
                  lb           tp, -1708(ra)
                  sw           a0, 207(ra)
                  lui          gp, 6738
                  sltiu        tp, a5, 1427
                  ori          s11, a1, -928
                  lbu          a1, -159(ra)
                  xor          a0, s11, tp
                  srl          a5, gp, tp
                  sh           a5, -1925(ra)
                  la           a3, region_1+14380
                  la           a1, region_1+47999
                  sb           t0, -801(a3)
                  la           gp, region_1+63173
                  la           a4, region_1+38393
                  sh           a7, -75(gp)
                  sb           s7, -1688(a3)
                  lbu          s2, 48(gp)
                  sh           t5, -201(a4)
                  sb           tp, 46(a1)
                  sh           a2, 856(a3)
                  lbu          t1, -150(gp)
                  sh           s2, -89(gp)
                  sb           a7, 1571(a3)
                  sw           t2, -43(a1)
                  sh           s5, -1902(a3)
                  lw           s10, -181(a4)
                  lbu          t6, -50(a1)
                  sw           ra, -47(a1)
                  lbu          s11, -1189(a3)
                  lhu          t2, 253(a4)
                  sb           s9, -27(a3)
                  sb           t6, -230(a4)
                  lh           t6, 53(a1)
                  sb           s3, 190(a4)
                  lb           s5, -208(gp)
                  lhu          zero, 135(gp)
                  lw           s9, 61(a1)
                  lbu          tp, -7(gp)
                  lbu          s10, -113(gp)
                  lb           sp, 137(a4)
                  lb           s5, -84(a4)
                  lbu          t6, 219(gp)
                  lb           a6, -38(a1)
                  lh           t2, -27(a4)
                  lbu          s10, 129(a4)
                  lh           zero, 1104(a3)
                  lw           t4, 1028(a3)
                  sb           s6, -64(a1)
                  lbu          s5, 100(gp)
                  lbu          s2, 210(a4)
                  sb           s6, -44(a1)
                  addi         s5, zero, 10
                  addi         a3, zero, 7
                  srl          a4, s10, s11
                  auipc        a5, 205949
                  sub          t1, a6, s4
                  addi         t4, a0, 1942
sub_3_28_1_t:     slt          tp, s2, a5
                  addi         s5, s5, -4
                  slli         t6, a7, 29
                  addi         t3, zero, -8
                  slti         sp, s1, -1478
                  addi         a2, zero, -7
                  or           zero, t6, a3
sub_3_28_0_t:     sub          s8, t4, t4
                  sltiu        s11, s11, 1175
                  addi         t3, t3, 5
                  blt          t3, a2, sub_3_28_0_t
                  srl          a1, a6, t2
                  bgeu         s5, a3, sub_3_28_1_t
                  la           a4, region_0+496
                  lb           s1, 949(a4)
                  sh           ra, -160(a4)
                  sltu         tp, ra, ra
                  sb           a1, -281(a4)
                  lhu          a0, 232(a4)
                  slli         s1, a1, 3
                  sh           tp, 548(a4)
                  sb           a0, 365(a4)
                  or           tp, a1, ra
                  ori          a1, s11, -181
                  sb           ra, 1572(a4)
                  sub          a1, s11, s1
                  sb           tp, 1025(a4)
                  srl          a0, s1, ra
                  lui          s11, 888602
                  slt          tp, ra, tp
                  slt          a1, s11, ra
                  lbu          tp, -177(a4)
                  lhu          a1, 280(a4)
                  sb           a0, 1255(a4)
                  srl          tp, a1, s11
                  xor          s1, ra, tp
                  auipc        a0, 333741
                  lbu          tp, 1163(a4)
                  andi         s1, a1, 1507
                  lb           ra, -436(a4)
                  sb           tp, 587(a4)
                  slti         s11, s11, 1309
                  lbu          tp, 1572(a4)
                  lb           a0, 1221(a4)
                  la           a2, region_0+3615
                  slti         t1, a7, 549
                  lb           a7, 160(a2)
                  lbu          s8, 68(a2)
                  sra          t1, t1, s8
                  add          s1, t1, t1
                  xori         a3, s1, -725
                  srai         s8, s9, 9
                  sltiu        t1, a3, -972
                  auipc        t1, 554309
                  lhu          t1, 149(a2)
                  sltu         t1, s1, t1
                  slli         t1, s1, 27
                  sw           a3, 101(a2)
                  ori          a3, a7, -860
                  sb           s1, -130(a2)
                  ori          a3, a3, 1175
                  lbu          s1, 244(a2)
                  sll          s9, a3, s8
                  lui          s1, 436003
                  sb           a3, -150(a2)
                  sh           t1, -211(a2)
                  srli         t1, s8, 4
                  lhu          s9, 233(a2)
                  nop
                  lui          s8, 860531
                  srli         a3, s1, 8
                  slt          s1, s1, s1
                  sb           a3, 12(a2)
                  xor          s1, a7, a7
                  slt          s8, s9, a7
                  sub          a3, s1, s8
                  auipc        s9, 180034
                  sb           s8, 228(a2)
sub_3_9:          jal          ra, 6f
0:                jal          t1, 2f
1:                jal          ra, 21f
2:                jal          ra, 5f
3:                jal          ra, 23f
4:                jal          t1, 14f
5:                jal          gp, 24f
6:                jal          ra, 19f
7:                jal          ra, 9f
8:                jal          tp, 16f
9:                jal          t1, 15f
10:               jal          s5, 22f
11:               jal          ra, 3b
12:               jal          a3, 26f
13:               jal          ra, 20f
14:               jal          s10, 1b
15:               jal          tp, 10b
16:               jal          ra, 11b
17:               jal          a2, 7b
18:               jal          sp, 25f
19:               jal          t1, 18b
20:               jal          t1, 28f
21:               jal          t1, 17b
22:               jal          ra, 13b
23:               jal          t6, 0b
24:               jal          a3, 27f
25:               jal          t1, 8b
26:               jal          t1, 4b
27:               jal          gp, 12b
28:               slt          s3, s3, a6
sub_3_6:          jal          ra, 11f
0:                jal          ra, 5f
1:                jal          s10, 13f
2:                jal          ra, 15f
3:                jal          s10, 18f
4:                jal          ra, 10f
5:                jal          ra, 1b
6:                jal          a2, 4b
7:                jal          ra, 16f
8:                jal          sp, 9f
9:                jal          ra, 2b
10:               jal          ra, 8b
11:               jal          ra, 7b
12:               jal          ra, 6b
13:               jal          a4, 12b
14:               jal          t1, 17f
15:               jal          t4, 3b
16:               jal          t1, 14b
17:               jal          ra, 0b
18:               sltiu        zero, t1, 1197
                  la           a5, region_1+42417
                  lb           t1, -10(a5)
                  sh           sp, 3(a5)
                  sb           a6, 34(a5)
                  lb           s0, 17(a5)
                  lbu          gp, 34(a5)
                  xori         t2, t5, 68
                  sra          a7, s0, t4
                  srli         t4, s10, 30
                  lbu          s9, 36(a5)
                  sltiu        s2, a0, -280
                  addi         s9, s5, 487
                  slli         t2, a5, 16
                  and          s3, a0, s4
                  sb           t5, 46(a5)
                  lbu          s8, -16(a5)
                  sb           s0, 12(a5)
                  sb           tp, -1(a5)
                  lb           ra, -10(a5)
                  xor          s0, t2, s7
                  lui          s5, 2369
                  lbu          gp, -28(a5)
                  srl          s11, s5, gp
                  auipc        a6, 167130
                  srai         gp, t6, 29
                  lb           s5, 3(a5)
                  sb           s1, 13(a5)
                  lui          sp, 764290
                  lh           zero, 15(a5)
                  lbu          a2, -50(a5)
                  xori         sp, s2, -365
                  lbu          s2, 44(a5)
                  xori         a0, a7, 68
                  or           tp, t0, t6
                  srai         a4, ra, 12
                  nop
                  sltu         zero, t1, a1
                  sltu         a3, s5, s10
                  auipc        sp, 801043
                  srli         t2, s11, 31
                  bgeu         s10, sp, 24f
                  ori          a0, t6, 1278
                  beq          s3, s10, 27f
                  nop
                  slti         zero, s5, 834
                  sub          a2, t1, s0
                  sra          a0, a5, a2
                  sra          a6, a0, s7
                  srl          s2, s5, a6
                  sltu         a5, a3, s8
27:               bge          s2, s5, 39f
                  la           sp, region_1+41613
                  sll          a6, zero, a6
                  sb           zero, 27(sp)
                  lb           zero, 52(sp)
                  sb           a5, 40(sp)
                  lbu          s1, -4(sp)
                  sb           a6, 64(sp)
                  lui          a5, 56743
                  lbu          a6, -62(sp)
                  lb           s1, 58(sp)
                  xori         s1, t5, -811
                  srli         s1, s1, 27
                  or           t5, s1, a6
                  sb           a6, -24(sp)
                  lb           a5, 38(sp)
                  and          zero, a5, s1
                  sltiu        a5, a6, -1974
                  lhu          a5, 29(sp)
                  lbu          s1, 58(sp)
                  lbu          a5, -2(sp)
                  lhu          s1, 13(sp)
                  lhu          a6, 25(sp)
                  sub          s1, t5, a6
                  srai         zero, a5, 12
                  addi         zero, a6, 1625
                  lb           t1, -42(sp)
                  or           t5, zero, s1
                  sll          a5, a6, a5
                  xori         s1, zero, -1435
                  lbu          a5, 58(sp)
                  slli         zero, a6, 7
                  sb           t5, -42(sp)
                  slt          a6, s1, a6
                  lb           a6, 33(sp)
                  sltiu        s1, a6, -525
                  srai         t1, a5, 22
                  sub          s1, a5, t1
                  lbu          a5, 23(sp)
                  sb           t1, 37(sp)
                  or           a5, a6, zero
                  addi         zero, a5, -1932
                  nop
                  lhu          t5, -17(sp)
                  lbu          a6, 4(sp)
                  lh           zero, 13(sp)
                  sh           t1, -53(sp)
                  lh           t5, 49(sp)
                  sb           s1, 39(sp)
                  lh           t5, -3(sp)
                  bne          a2, t0, 31f
31:               sltu         s11, t5, s3
                  bgeu         a3, t0, 35f
                  sll          s9, s9, s7
                  slti         s0, ra, 1661
                  bltu         s9, gp, 48f
                  xor          t5, s3, s2
39:               or           sp, a7, s7
                  sltiu        a0, a4, 1753
                  bge          s2, tp, 57f
                  sra          s9, s5, a4
                  addi         ra, s10, 725
                  slt          s2, t6, s10
                  slli         ra, a6, 17
                  sll          s9, s8, s4
                  bge          zero, s10, 59f
48:               srai         t1, t2, 22
                  lui          t5, 1038662
                  ori          a0, a7, -1205
                  and          s11, ra, t4
                  lui          s0, 339965
                  blt          s10, s8, 55f
                  xori         tp, a5, -182
55:               addi         s4, a7, 422
                  sltu         a3, a2, a4
57:               slt          t6, t1, zero
                  bge          s10, t5, 60f
59:               addi         t1, s8, 1080
60:               bge          tp, a7, 79f
                  xori         sp, s0, 333
                  or           s5, s1, sp
                  sub          gp, sp, t4
                  add          t2, t1, a3
                  sltiu        s0, t0, -429
                  sra          a2, ra, a6
                  bne          sp, s2, 85f
                  lui          s10, 441602
                  or           a6, ra, sp
                  bgeu         a6, zero, 78f
                  slti         t1, gp, 1978
                  add          t1, ra, s0
                  andi         s5, s10, -759
                  sltu         gp, tp, s7
79:               auipc        tp, 759804
                  or           a3, s9, t1
                  bne          s0, a4, 94f
                  xori         t4, s11, 1530
                  bltu         s5, t5, 94f
                  auipc        s8, 368231
85:               addi         s3, s8, 135
                  sub          s11, a1, t1
                  bltu         s9, sp, 98f
                  xori         a6, s10, 1231
                  slt          s0, s9, a3
                  slti         ra, t1, -775
                  blt          a2, a6, 95f
                  sltu         a7, t0, zero
94:               beq          s9, t4, 104f
95:               bge          s6, s2, 109f
                  blt          t0, t2, 100f
98:               bge          s3, a3, 110f
100:              srl          t4, s0, sp
                  slt          a7, s1, a0
                  sra          a1, s3, sp
                  nop
104:              slli         a6, ra, 31
                  slli         sp, s5, 26
                  slli         a6, zero, 24
                  xori         t1, s9, 1235
                  sub          ra, s1, s5
109:              slt          zero, tp, a2
110:              auipc        s0, 297098
                  and          t5, zero, s9
                  nop
                  slt          s4, a5, gp
                  add          t1, s2, a2
                  srai         s10, s2, 31
                  sra          t4, s1, a4
                  andi         s10, s4, 1480
                  addi         s3, s11, -1362
                  lui          a0, 504679
                  xor          s9, a5, s9
                  sltu         a0, s0, a5
                  bne          ra, gp, 136f
                  srl          gp, sp, a2
                  andi         s5, s6, 1103
                  srli         s0, s5, 21
                  beq          s0, a3, 141f
                  srl          a7, s4, s3
                  srai         s3, zero, 3
136:              bltu         t2, t3, 149f
                  and          t6, s0, zero
                  bge          s9, s0, 144f
                  xori         s11, s3, 1447
                  xor          a0, ra, a7
                  ori          s8, t6, 343
144:              bgeu         s7, gp, 164f
                  srai         t2, a4, 1
                  andi         s9, ra, -635
                  sub          zero, s6, s3
                  beq          a0, a7, 149f
149:              bge          t1, tp, 157f
                  and          zero, t4, s11
                  bne          s9, s3, 162f
                  nop
                  xor          tp, a5, t1
157:              bltu         s8, ra, 165f
                  sra          a0, a3, s1
                  add          sp, s0, a0
                  xori         t4, t4, 1598
                  blt          t2, ra, 181f
162:              sll          sp, s3, t6
164:              xori         gp, s7, -827
165:              lui          sp, 204461
                  ori          a7, t1, -520
                  slti         s3, sp, 1957
                  sll          a6, t5, gp
                  sltu         sp, a7, a5
                  slt          a2, gp, s10
                  sub          t6, a7, t3
                  sltu         a7, s2, a2
                  sltiu        a6, s0, -1627
                  auipc        s4, 419800
                  bne          a0, tp, 178f
                  slti         t6, a1, -1417
                  beq          a5, s11, 194f
181:              and          s5, s7, s2
                  auipc        a4, 1008975
                  auipc        a2, 981304
                  blt          a1, t0, 187f
                  xori         gp, a2, -1176
187:              beq          s9, s4, 198f
                  auipc        a5, 613675
                  bgeu         s5, t5, 197f
                  nop
                  xor          a2, a4, t5
                  slli         s2, s11, 14
                  andi         t3, s4, 1298
194:              addi         s8, s11, 2020
                  bltu         t1, s1, 197f
                  srai         t4, t5, 0
197:              sltiu        tp, ra, 1769
198:              srli         t1, gp, 21
                  sltiu        a5, a6, 1713
                  slt          t6, s5, gp
                  or           gp, a0, s0
                  bltu         s11, t2, 215f
                  addi         s10, t3, -570
                  slli         a6, s6, 8
                  andi         t5, zero, -1919
                  sltiu        t1, s7, -101
                  bge          zero, s2, 222f
                  auipc        a5, 444147
                  xori         a2, a0, 1021
                  andi         tp, s8, 892
                  bgeu         a7, a2, 229f
215:              addi         s0, gp, 1088
                  slt          s4, a1, s10
                  bne          s10, sp, 229f
                  slt          a1, t1, s9
                  bltu         t5, s9, 224f
222:              addi         ra, t1, 343
224:              bgeu         t5, t2, 240f
                  srai         sp, gp, 13
                  srli         s1, s8, 11
                  srli         s11, t5, 11
                  sub          s5, zero, s11
                  ori          a6, s3, -1140
                  sltiu        a4, s10, -1473
                  bge          s2, a3, 244f
                  sll          a2, s2, a3
                  bltu         t0, s3, 249f
                  bgeu         s8, t2, 249f
240:              srai         s1, s3, 17
                  auipc        t5, 397585
                  blt          s5, s8, 244f
244:              bltu         a4, a6, 249f
                  slti         s1, t5, 1960
                  slt          s3, t2, a1
                  slti         sp, t3, 414
                  sltu         tp, a0, s2
249:              sltiu        a4, s8, -1697
                  sra          s3, s5, a6
                  sra          t3, s10, s4
                  xor          a2, a3, a3
                  slti         t4, a5, -246
                  sra          tp, t4, s3
                  add          s1, s10, s1
                  andi         s4, s3, -1702
                  xor          a7, a3, s6
                  auipc        t3, 498354
                  xor          t4, s4, s0
                  addi         s3, s7, 1171
                  srai         a6, ra, 16
                  or           s8, tp, a0
                  or           a1, s3, a5
                  and          t3, a2, t0
                  bne          a7, s5, 284f
                  andi         s3, t2, -1398
                  srli         a4, s5, 4
                  nop
                  and          s0, tp, a3
                  and          zero, a5, s0
                  bltu         s10, a6, 290f
                  bltu         a3, s10, 281f
281:              andi         s11, s5, -1437
                  blt          s1, gp, 302f
                  slli         t3, a2, 1
                  beq          a4, s7, 301f
                  srli         a6, t3, 25
                  auipc        a3, 912935
                  bltu         t5, t1, 297f
                  sltiu        a4, s10, 426
                  slli         s10, t2, 26
                  sltu         s1, t6, t0
                  srli         tp, s0, 17
                  slt          a2, s5, a1
297:              sub          s4, a0, a4
                  blt          t4, s2, 311f
301:              sll          s9, a1, s7
302:              beq          t1, s6, 310f
                  bgeu         a5, sp, 314f
                  slt          a5, zero, zero
                  srli         a5, t0, 0
                  blt          t2, a2, 312f
sub_3_11:         jal          ra, 4f
0:                jal          ra, 7f
1:                jal          t1, 8f
2:                jal          t1, 3f
3:                jal          ra, 9f
4:                jal          ra, 6f
5:                jal          ra, 10f
6:                jal          tp, 5b
7:                jal          t1, 2b
8:                jal          ra, 12f
9:                jal          ra, 1b
10:               jal          a2, 11f
11:               jal          t1, 0b
12:               srai         t3, zero, 20
310:              ori          t2, s5, 1508
312:              add          t2, gp, zero
                  blt          s4, a6, 326f
314:              xori         a1, a5, 601
                  blt          ra, a1, 327f
                  lui          a7, 973962
                  or           s5, s11, s3
                  bge          a7, a7, 322f
                  slt          s2, t3, tp
                  slti         a5, s11, 593
322:              srai         t5, s8, 17
                  bge          s0, ra, 336f
                  blt          s6, t4, 340f
                  or           sp, s1, a6
326:              srai         a6, a7, 20
                  ori          sp, t4, -2022
                  bge          t6, t3, 343f
                  sub          a4, s4, s4
                  andi         t2, a4, 676
                  lui          tp, 313379
336:              sll          a1, t4, s4
                  slti         a1, s8, -1311
340:              xori         t5, gp, -708
                  bge          t6, t5, 354f
                  slti         s0, s4, 463
343:              slli         t3, a1, 15
                  sub          zero, a7, t4
                  srl          t5, s7, t5
                  sra          t2, s10, a3
                  lui          zero, 72427
                  sub          t4, s9, s3
                  andi         s11, t6, 1126
                  beq          a2, s5, 354f
                  bge          s2, zero, 359f
354:              bge          a7, a5, 366f
                  bne          s0, a4, 368f
                  xor          tp, a2, t1
359:              or           tp, a1, a0
                  nop
                  sra          t2, s6, s5
                  srl          t2, s7, a4
                  bltu         s1, a2, 374f
                  xori         t1, s7, -1910
                  slti         zero, t5, -1760
368:              blt          s0, t6, 382f
                  lui          t1, 590544
                  and          s8, s5, gp
                  and          t2, s5, s8
                  blt          a4, a0, 384f
374:              bltu         a0, s0, 382f
                  lui          s3, 998367
                  srli         s10, a4, 6
                  add          s8, s4, t1
                  slt          a2, t5, a3
                  srl          t3, s8, s11
                  sltiu        a1, a1, -177
384:              auipc        s2, 771367
                  nop
                  andi         ra, t3, -1448
                  and          ra, s5, s9
                  sra          t3, s1, zero
                  sltiu        s4, t1, -1901
                  slli         s2, t6, 14
                  auipc        a3, 884472
                  sltiu        s9, tp, -1997
                  ori          s8, s4, 1092
                  beq          s7, a3, 411f
                  or           t6, sp, s7
                  lui          a6, 566474
                  sll          s4, t2, s11
                  lui          s1, 187275
                  beq          s7, sp, 419f
                  srli         t4, a0, 16
                  nop
                  andi         sp, a6, 1887
                  sub          s1, a0, a0
                  srai         t4, t3, 2
                  or           gp, s0, s0
                  sll          a2, a7, tp
                  bltu         t5, a6, 424f
                  or           s4, t3, a5
419:              slti         s3, t6, -516
                  auipc        a0, 874381
                  addi         a2, t3, -1054
424:              bgeu         sp, t1, 425f
425:              sra          zero, t5, a3
                  bgeu         a4, t2, 435f
                  slti         a0, a3, 1969
                  add          sp, a3, s9
                  bltu         t1, s6, 435f
                  sltu         t5, a7, t6
                  bne          a7, a1, 435f
435:              and          a7, tp, a7
                  bgeu         sp, s9, 439f
                  andi         t3, t2, 1699
                  andi         a0, s1, 1221
                  ori          gp, t1, 1710
                  sltu         a1, t0, zero
                  addi         s8, s6, 327
                  slti         a5, t5, -1866
                  xori         s8, s6, -203
                  beq          t3, zero, 451f
                  nop
451:              srli         a1, a3, 1
                  sll          gp, ra, s10
                  srai         zero, a1, 11
                  bgeu         t5, s2, 466f
                  slli         t6, zero, 29
                  add          a0, t5, s2
                  bgeu         sp, a6, 479f
                  xor          s9, t3, s3
                  or           t3, s2, s0
                  ori          s2, a5, -1447
466:              andi         t6, t1, -130
                  slti         t5, t6, 1405
                  blt          s5, s9, 481f
                  blt          t1, gp, 490f
                  sltiu        zero, s3, -836
                  bltu         s3, a4, 485f
                  add          t1, zero, t6
                  bne          s10, s5, 487f
                  bne          sp, s0, 487f
                  xor          zero, s0, t5
479:              srl          s2, a1, t2
                  bgeu         a1, s1, 485f
                  slli         s8, t0, 23
                  blt          a1, s7, 497f
                  sub          a1, a0, gp
485:              xor          s11, a3, zero
                  srli         a4, s7, 10
                  auipc        a5, 892222
490:              slli         a4, sp, 13
                  srli         a6, sp, 17
                  add          tp, a5, a1
                  sra          s0, t4, sp
                  or           gp, t0, a6
497:              lui          a7, 535557
                  sra          t1, s3, s9
                  sltiu        t5, sp, 372
                  beq          s10, s2, 520f
                  beq          ra, a1, 520f
                  slti         s10, t2, 1279
                  srli         zero, a6, 30
                  bne          gp, s5, 518f
                  addi         t3, t3, 703
                  add          t3, s0, t4
                  slti         s9, s3, 1766
                  slti         s8, s9, -1130
                  slli         t3, t5, 14
                  srai         s10, a0, 7
                  bltu         s5, s5, 517f
                  xor          t6, gp, t0
517:              slt          a1, t5, tp
                  nop
                  srl          a6, t5, s5
                  add          a7, s6, s4
                  slti         sp, s8, -196
                  addi         s10, t5, 568
                  andi         a2, a5, 824
                  srai         a3, t3, 10
                  xori         t6, s2, 611
                  sltiu        s0, a1, -886
                  or           s0, t1, s6
                  srl          s2, a4, s4
                  ori          gp, a2, -1846
                  lui          zero, 155639
                  and          t5, t3, ra
                  bltu         s11, s10, 547f
                  lui          a5, 584217
                  sltiu        a3, s10, 679
                  lui          t1, 579495
                  addi         s4, a3, -396
                  lui          s11, 193773
                  nop
547:              srai         s0, tp, 15
                  xori         t1, zero, -645
                  slli         a3, s11, 7
                  auipc        a5, 70141
                  beq          sp, a5, 565f
                  slt          s10, s2, t5
                  nop
                  slli         a3, s11, 22
                  xori         s4, s0, -1809
                  slti         a7, s8, 1200
                  beq          s1, t2, 569f
                  lui          t1, 592488
                  xor          t2, s0, a6
                  nop
                  xori         ra, tp, -1569
                  sltiu        ra, t4, 473
565:              ori          s2, s3, 795
                  slt          t4, t1, t4
                  sltu         gp, s5, t5
569:              srl          ra, sp, t2
                  srl          gp, a6, a2
                  srl          t6, ra, t6
                  slt          a0, s1, a2
                  sra          a5, s6, s11
                  lui          t1, 921858
                  bltu         t3, t0, 587f
                  sra          s11, tp, gp
                  bgeu         t6, t5, 580f
                  sub          tp, zero, t4
                  xor          s9, t4, a0
580:              addi         s0, t1, -449
                  ori          s11, sp, 1689
                  and          s3, s6, zero
                  sltu         s10, t6, t4
                  bltu         a0, a3, 598f
                  beq          gp, a7, 600f
                  ori          s1, s3, -439
                  bgeu         s5, t5, 593f
                  sltu         s3, a1, a1
593:              addi         zero, ra, -1201
                  add          t3, a1, t4
                  xori         s11, a6, -1628
                  slli         s4, t1, 22
598:              lui          a3, 960375
                  slti         a3, t1, 524
600:              bltu         s7, t5, 612f
                  sltiu        t4, s4, -51
                  andi         s5, t0, 1200
                  and          t1, a0, s6
                  sra          ra, s10, t6
                  bne          s7, t4, 610f
                  addi         s9, s0, 1288
                  bge          a4, t5, 611f
                  auipc        a0, 708726
                  xor          s1, s6, a7
                  slti         a3, tp, 224
                  slt          ra, s5, t0
                  ori          a6, s7, -1989
                  bge          gp, s7, 626f
                  sub          s0, tp, a5
                  auipc        zero, 489710
                  lui          t2, 342644
626:              beq          s7, a0, 639f
                  blt          a7, a0, 630f
                  add          t2, a6, a7
                  or           t2, t0, t2
                  addi         a3, t1, 630
                  or           a5, s5, t0
                  bgeu         t6, a0, 644f
                  and          t1, s4, s11
                  addi         s9, s1, 726
                  addi         s11, s4, 813
                  srli         a4, t0, 18
                  ori          s0, t4, -536
                  beq          a6, a7, 658f
                  sltiu        sp, tp, -2029
644:              sltiu        s8, s6, -46
                  auipc        s11, 362943
                  xori         a2, s0, -1309
                  sll          a4, s8, s6
                  srai         s5, a3, 28
                  add          s11, a0, t6
                  nop
                  andi         a7, t1, -1971
                  bgeu         t2, s4, 664f
                  sltu         t3, s7, a3
                  andi         a5, s9, 199
                  blt          a0, gp, 658f
                  slti         s0, gp, 226
                  bgeu         t3, s2, 671f
                  bltu         a4, s2, 674f
                  sll          a6, s7, tp
                  bge          t5, s2, 671f
                  sltiu        t5, t4, -1279
                  xor          s3, a7, s1
                  bne          a1, s7, 684f
                  slli         s8, a4, 12
671:              srl          gp, s0, s5
                  or           s5, t4, s7
                  bgeu         s1, t4, 681f
674:              sltiu        gp, t2, 1181
                  xor          t6, sp, a3
                  xori         sp, gp, -80
                  nop
                  sra          a0, s2, s0
                  bne          a5, t5, 693f
681:              or           t4, a3, a7
                  slt          s5, s1, a0
                  slt          t2, zero, t1
                  bltu         s3, s9, 686f
686:              sll          t2, s9, s10
                  sub          s1, a1, t5
                  sll          t2, t5, s0
                  add          a4, a2, a0
                  slt          zero, s1, t6
                  xori         s10, ra, -478
                  slt          a4, s8, a7
693:              srai         s4, s11, 23
                  blt          s7, a7, 704f
                  bne          s10, tp, 707f
                  ori          t6, s4, 587
                  xor          s3, t5, a4
                  sra          a0, s7, s10
                  srli         a3, t6, 1
                  xori         s3, s3, -9
704:              sra          a7, s5, s2
                  bge          gp, sp, 707f
                  blt          s1, s8, 721f
                  sll          a6, a0, ra
                  sll          t4, t4, s0
                  srl          a7, t0, a5
                  beq          ra, zero, 725f
                  lui          a0, 951102
                  la           a2, region_0+1553
                  la           gp, region_1+60318
                  lbu          t6, -5(gp)
                  sb           s6, -7(a2)
                  lw           a3, -9(a2)
                  lb           s1, -4(gp)
                  lb           t2, -13(gp)
                  lhu          s8, -10(gp)
                  lbu          a1, -6(a2)
                  lbu          s8, 7(gp)
                  sb           a3, -8(a2)
                  sb           s6, 14(a2)
                  lbu          s4, -12(a2)
                  lbu          a0, 2(gp)
                  sh           tp, 15(a2)
                  lbu          s0, 9(gp)
                  sh           t5, 2(gp)
                  lbu          a4, 1(gp)
                  sb           a6, -6(a2)
                  slli         a2, s0, 5
                  lui          t2, 538834
                  slt          s8, s1, t6
                  sra          a3, sp, t0
                  blt          s3, t2, 733f
                  addi         s1, zero, 8
                  addi         t5, zero, 8
sub_3_25_1_t:     add          s11, s6, s3
                  addi         s1, s1, -4
                  addi         a3, zero, -6
                  or           t1, s10, tp
                  addi         s10, zero, 9
sub_3_25_0_t:     xori         a2, a6, -402
                  addi         a3, a3, 5
                  blt          a3, s10, sub_3_25_0_t
                  bgeu         s1, t5, sub_3_25_1_t
                  bltu         s9, s5, 722f
722:              blt          t0, ra, 725f
                  beq          ra, a3, 726f
725:              bltu         a6, s1, 736f
726:              srai         a0, s5, 25
                  sltu         s2, s4, sp
                  bgeu         s10, a5, 729f
729:              bne          s6, ra, 745f
                  andi         a0, a1, 535
                  xor          a2, s4, gp
733:              bgeu         a7, s0, 741f
                  sll          sp, tp, s1
736:              lui          s11, 471002
                  sll          s11, a2, a4
                  addi         s10, t4, -1447
                  xor          a6, s7, s10
741:              ori          s1, s7, 106
                  bne          s7, ra, 750f
                  or           t4, t5, s11
745:              sll          ra, a5, sp
                  addi         gp, gp, -941
                  srai         s9, ra, 6
                  bne          s7, zero, 760f
750:              bltu         a3, t1, 753f
                  slt          a6, gp, s3
                  xor          s10, gp, s7
753:              bltu         t5, a0, 754f
754:              ori          ra, ra, 1930
                  srai         s8, a4, 21
                  ori          s9, s9, 253
                  andi         s2, s10, 678
                  bgeu         a0, s1, 771f
760:              or           a2, s11, t1
                  bltu         ra, s9, 775f
                  slli         t2, ra, 8
                  sltiu        t2, s5, 444
                  sra          s0, s2, s6
                  sltu         t6, s10, t0
                  bltu         a1, s2, 779f
771:              bge          s0, s0, 787f
                  auipc        a1, 809775
                  sll          tp, ra, s1
775:              sra          s3, ra, s11
                  or           a5, a5, t4
779:              bne          a2, a5, 784f
                  bltu         a6, t2, 788f
                  xori         s3, s5, -821
784:              lui          a1, 814578
                  and          a3, sp, s7
                  slli         t5, tp, 28
787:              bge          a0, s1, 797f
                  srl          a5, zero, ra
                  srai         s11, t4, 28
                  xori         s2, s5, 1086
                  srl          s4, t6, t5
                  xori         s1, t0, -568
                  andi         s9, s2, -1546
                  slt          t6, t6, zero
797:              bne          sp, a7, 817f
                  srai         s8, a0, 12
                  xori         s9, t3, 1699
                  slt          t2, t2, s9
                  bge          tp, t5, 820f
                  andi         t2, s9, 1431
                  beq          ra, s1, 812f
                  beq          a4, s4, 819f
                  bgeu         s6, a0, 822f
                  srai         t6, t5, 23
                  srli         a0, t6, 3
812:              sltu         a3, t0, zero
                  bge          s8, s7, 824f
                  xori         t3, a5, -1392
                  nop
817:              lui          a7, 689516
                  sra          tp, zero, s7
                  srli         s1, t0, 18
824:              sub          a6, s3, t3
                  xori         a7, t2, 958
                  srli         ra, s10, 14
                  andi         t1, s0, 1394
                  sub          s10, t3, a6
                  srai         ra, s11, 10
                  bne          t0, s7, 848f
                  or           s9, t5, s1
                  xor          zero, s11, s6
                  sll          s11, a6, a7
                  auipc        s3, 544996
                  slti         t2, s7, 70
848:              andi         t4, t5, -1169
                  sltu         s4, s3, s10
                  bge          a6, s2, 851f
851:              ori          ra, s8, -1626
                  srai         a5, gp, 21
                  nop
                  sra          s10, a2, t1
                  xori         tp, a5, 1614
                  srli         t4, t3, 1
                  auipc        s11, 96923
                  sra          zero, t4, s6
                  slli         a5, s1, 29
                  bgeu         a1, s1, 877f
                  bgeu         t5, a3, 877f
                  sll          s11, a0, gp
                  bne          s5, a6, 881f
                  lui          s9, 1008033
                  bne          a3, s10, 882f
                  sub          s9, s0, s0
                  blt          sp, a6, 892f
877:              bge          s9, s11, 888f
                  addi         ra, gp, 499
                  srai         s0, a5, 25
                  sll          s5, ra, s5
881:              sltiu        a5, s4, 56
882:              xor          t3, gp, s10
                  xori         s2, s9, -349
                  addi         a6, a3, -629
                  slli         t6, s3, 5
                  sll          tp, s6, a4
888:              slli         t2, a4, 6
                  nop
                  slli         a4, s6, 30
                  blt          a4, a6, 901f
892:              srli         tp, t0, 15
                  auipc        a6, 488292
                  blt          a5, s3, 897f
                  nop
                  or           s11, a4, a2
897:              auipc        a2, 387720
                  sub          a4, s1, s4
                  bne          t6, a2, 911f
901:              bge          s4, t4, 903f
                  lui          s5, 549153
                  sltiu        a5, s4, -1293
                  or           t4, a6, s11
                  auipc        sp, 1035471
                  bge          tp, ra, 922f
                  bltu         tp, s8, 922f
911:              xor          tp, s11, s5
                  addi         a5, a7, 1990
                  addi         a4, t0, -30
                  slt          s0, t5, s6
                  bgeu         gp, gp, 938f
                  sub          t5, t5, a1
922:              sltiu        s9, s7, -497
                  sub          t6, s9, a7
                  auipc        s10, 35624
                  auipc        zero, 351754
                  slt          a0, s9, t3
                  bge          a5, s11, 941f
                  ori          zero, s1, -1505
                  xori         s11, a0, 810
                  xor          sp, sp, s4
                  nop
                  srli         t4, s2, 26
938:              sub          s5, sp, t2
                  slti         a6, a5, -136
                  or           s3, zero, t1
941:              slti         a2, tp, -1748
                  xori         a1, ra, 489
                  ori          tp, t2, -459
                  add          s11, a6, a2
                  slli         s1, a1, 1
                  beq          s1, gp, 957f
                  sltu         a5, s6, a3
                  nop
                  sll          zero, s4, s10
                  bltu         s4, t1, 953f
                  sltiu        s9, gp, 1462
                  srai         a0, s9, 25
953:              blt          t0, t2, 961f
                  sltu         zero, t3, s10
                  auipc        a0, 852607
957:              xor          s11, a3, t4
                  xor          s3, s9, s6
                  slli         a7, a7, 3
961:              slti         a4, s7, -1018
                  bltu         s6, a1, 964f
                  sltu         s8, a2, a1
964:              blt          t0, zero, 984f
                  srl          t3, s7, s7
                  sltu         a2, s9, gp
                  or           a0, a5, a6
                  bgeu         s11, s3, 984f
                  bne          gp, s6, 981f
                  addi         s2, s2, -948
                  bne          a0, s11, 984f
                  auipc        s8, 254200
                  bltu         a2, s2, 992f
                  bne          a4, a0, 995f
                  sra          s3, t1, s5
981:              blt          s1, a3, 986f
                  xori         ra, s3, 1295
                  slli         a4, s5, 8
984:              andi         t2, tp, -1537
                  slti         sp, s10, 1985
986:              srl          t5, zero, t0
                  or           s5, s0, a6
                  sll          t3, s5, t5
                  sltu         s5, s7, t5
992:              sltiu        a6, a4, 1768
                  bgeu         zero, s6, 994f
994:              sltu         sp, s10, s4
                  slti         zero, a0, 1842
                  srai         s2, tp, 12
                  and          s1, s7, a6
                  srai         a5, a4, 19
                  sra          a1, a2, a2
                  sltu         s10, a7, t0
                  xori         ra, t2, 175
                  add          a3, sp, a4
                  sltu         s8, ra, s5
                  xori         a0, t0, 1044
                  and          s5, t2, a3
                  add          a3, s7, s8
                  bne          s5, s4, 1018f
                  addi         a1, t6, 239
                  slli         tp, t1, 10
                  bge          t6, sp, 1019f
                  beq          t2, s8, 1019f
1018:             slti         t6, tp, 1847
1019:             auipc        s10, 653357
                  bltu         t1, a1, 1022f
                  andi         a1, s0, -1843
1022:             sltu         s9, s5, ra
                  sltiu        t6, s1, 1812
                  bltu         t0, ra, 1037f
                  sltiu        a1, t4, 2021
                  and          t4, s5, a4
                  sll          a5, s11, t2
                  blt          s7, a5, 1045f
                  xor          s1, a0, s7
                  auipc        s2, 509852
                  sub          s2, s1, s10
1037:             ori          s1, s1, 610
                  and          zero, a6, a7
                  add          a2, zero, a7
                  sub          a3, s2, s7
                  nop
                  and          a5, a2, t2
                  slt          t5, s9, s10
                  addi         t2, t6, -619
                  blt          a2, s10, 1064f
                  srli         a7, t0, 18
                  slt          a5, t4, s0
                  sltiu        t2, a3, -1735
                  srai         t5, t6, 12
                  andi         a2, t1, 282
                  auipc        a6, 545924
                  bne          a4, s7, 1078f
                  auipc        a5, 172898
                  srli         t5, a4, 15
                  slli         s2, t0, 17
1064:             add          a2, gp, gp
                  slt          s1, s10, t1
                  or           s8, a7, s8
                  nop
                  bge          t3, a0, 1078f
                  slli         t6, zero, 9
                  xori         s0, s1, -278
                  srli         s4, t5, 10
                  sub          s8, a3, s8
                  sltiu        s0, gp, 730
                  lui          a0, 483611
                  slt          s11, t0, a3
                  ori          zero, t5, 1660
                  sltiu        s3, s6, -677
                  addi         s2, s11, 1564
                  srl          t3, zero, a7
                  slti         s4, gp, -1444
                  xor          t5, ra, s7
                  nop
                  srai         zero, t6, 23
                  bltu         ra, ra, 1102f
                  lui          a5, 665005
                  xor          t3, s0, zero
                  andi         ra, a0, -797
                  xori         a0, a3, 1904
                  or           s9, t2, s8
                  bltu         s10, s2, 1113f
                  slt          s5, a6, a3
                  slt          zero, s3, ra
                  addi         a0, a6, 487
                  sra          s2, a0, t2
                  auipc        t6, 204074
                  sub          s4, t5, s6
                  sll          a6, s1, s7
                  and          zero, t1, t0
                  bne          tp, t4, 1128f
                  slti         sp, s2, -1746
                  bltu         sp, s2, 1117f
1113:             slti         a5, a2, -1948
                  and          a4, s1, t0
                  lui          a2, 994058
                  bltu         ra, t0, 1134f
                  sub          s0, t0, t2
                  sll          ra, t5, a1
                  slti         t5, t0, -595
                  srli         a7, t6, 18
                  sub          t6, t2, a3
                  slt          s4, a6, a4
                  bltu         s11, sp, 1144f
                  andi         a2, a5, 59
1134:             and          a4, tp, t3
                  sub          t5, t2, gp
                  auipc        a3, 593104
                  slli         gp, t3, 27
                  sub          a1, s0, a5
                  srai         a4, s0, 7
                  andi         s0, zero, -1892
                  srl          a4, a0, tp
                  sub          s5, s8, s10
1144:             bge          a1, t6, 1157f
                  bltu         s8, s1, 1156f
                  slti         s3, s6, 1551
                  nop
                  xor          a4, zero, s2
                  xori         a4, t6, -616
                  addi         a0, s6, 2038
                  andi         s10, tp, -706
                  bltu         a2, tp, 1162f
                  xori         s3, a6, 666
1156:             or           ra, s5, s10
1157:             srai         a1, t4, 12
                  add          s10, t5, s5
                  slt          a0, s7, ra
                  sll          t1, tp, t0
1162:             ori          a1, a4, -2028
                  sltiu        s2, zero, 1417
                  addi         t2, a6, 1403
                  or           a3, s8, s3
                  srli         s5, ra, 3
                  sltiu        t1, a0, 1607
                  srai         t1, zero, 27
                  blt          s3, s7, 1184f
                  auipc        s1, 1007464
                  ori          t4, gp, 1340
                  sra          s4, a1, a1
                  ori          a0, s8, 1925
                  add          a1, s0, a7
                  srl          s5, gp, a5
                  srl          t5, s5, t3
                  addi         t2, ra, -1725
                  slli         s11, t3, 21
                  slti         a3, a3, 1573
                  addi         s8, s0, 457
1184:             and          a5, s6, t0
                  slt          a4, tp, s7
                  and          s2, t6, t4
                  beq          a7, t1, 1190f
                  auipc        a2, 511847
                  slti         ra, t5, 354
1190:             sub          zero, s10, zero
                  slti         s9, s10, -2
                  ori          t6, t3, 555
                  srai         s0, t3, 13
                  sra          zero, a4, a4
                  sltiu        a4, s5, -1537
                  beq          sp, zero, 1199f
                  andi         s10, a5, -1712
                  xori         s9, a1, -19
                  srai         t3, s5, 11
                  nop
                  sra          a1, a3, zero
                  srai         t5, a4, 18
                  srai         t6, s6, 27
                  sra          t2, s10, s5
                  blt          zero, s11, 1215f
                  srl          t1, a5, s2
1215:             or           t3, t1, t2
                  bltu         zero, t6, 1227f
                  lui          s4, 1036080
                  and          t1, s11, t0
                  sra          a1, sp, t2
                  nop
                  srli         s2, s11, 25
                  add          t1, a7, a7
                  ori          s2, s2, -1611
                  addi         s3, s7, 454
1227:             beq          s10, gp, 1233f
                  xor          s3, s0, t2
                  srli         t4, zero, 18
                  bne          zero, t3, 1239f
                  bge          s3, t3, 1235f
1233:             beq          s3, a1, 1245f
                  add          t5, gp, s6
1235:             slli         a7, s7, 31
                  or           s1, ra, s0
                  add          s2, s9, zero
                  slti         s9, a6, 1241
1239:             auipc        a3, 293825
                  bne          s6, s0, 1242f
1242:             or           t1, a0, a1
                  beq          s0, a1, 1255f
1245:             bgeu         s7, tp, 1258f
                  xori         s2, s9, 1553
                  bge          t5, t3, 1255f
                  bne          t1, gp, 1264f
                  beq          s10, a4, 1262f
                  slti         a7, s1, 312
                  and          s11, s0, t3
                  sltu         a4, s7, t6
                  sltu         ra, a5, sp
                  blt          a2, zero, 1270f
1255:             or           t2, gp, a3
                  bgeu         t2, zero, 1257f
1257:             beq          s9, t5, 1269f
1258:             sra          s9, sp, ra
                  addi         s1, tp, 384
                  andi         a3, a6, 772
                  slt          a4, gp, a3
1262:             slti         a5, a3, 1011
                  beq          s0, gp, 1276f
                  srl          gp, s3, a0
                  srai         s1, gp, 21
                  auipc        gp, 590075
1270:             nop
                  bgeu         t6, s0, 1281f
                  srl          tp, t6, s0
                  slt          s9, ra, s7
                  lui          a5, 23052
1276:             srl          a3, sp, s7
                  sra          a6, ra, a4
                  xori         tp, s1, -965
                  bgeu         t4, s3, 1294f
                  sra          s1, s3, s8
                  auipc        sp, 495644
                  ori          s10, a5, 787
                  lui          ra, 119544
                  or           t4, s3, ra
                  xor          t6, t1, t1
                  sra          a4, s10, s1
                  sra          t6, s4, s3
                  sltu         s9, s0, s10
                  sub          s0, t6, a2
                  beq          t4, a6, 1312f
1294:             bne          ra, a0, 1305f
                  lui          s0, 941688
                  sub          a1, s7, a6
                  addi         a6, t3, -37
                  auipc        t4, 554374
                  slt          a5, t0, s10
                  blt          s10, s8, 1312f
                  slt          s10, t1, s11
                  bltu         a6, zero, 1305f
1305:             and          s9, a6, s7
                  bltu         s6, a4, 1321f
                  xor          a0, ra, s9
                  and          gp, s7, t1
                  xor          a6, s10, t3
1312:             srli         a1, s4, 1
                  beq          s5, s2, 1316f
                  sub          s2, a7, s5
                  andi         t6, zero, 1512
1316:             lui          t6, 866204
                  or           s11, zero, a0
                  andi         a2, s7, 911
                  bne          s10, s7, 1323f
1321:             or           t1, t1, ra
                  srli         a5, s6, 0
                  slli         s0, gp, 1
                  slti         s4, s9, 1767
                  lui          t6, 829737
                  sltu         t1, s9, a4
                  sll          tp, s4, s2
                  slli         a4, t0, 21
                  sltu         a3, gp, ra
                  beq          s11, s9, 1348f
                  slt          a5, t0, s6
                  xori         t6, zero, 395
                  slli         a1, s2, 5
                  andi         s4, s6, 670
                  andi         zero, s0, 1668
                  bgeu         a4, t6, 1340f
1340:             or           s9, sp, t1
                  ori          s1, a2, 492
                  bltu         a3, t0, 1355f
                  sltu         a0, a5, a7
                  ori          s2, ra, -1131
                  bge          a3, a2, 1348f
1348:             xor          a4, t3, s1
                  blt          s3, t6, 1352f
                  ori          a1, s9, -997
1352:             bltu         s5, s0, 1363f
                  slt          a7, a5, t5
                  bltu         a4, t6, 1374f
1355:             blt          s2, s6, 1361f
                  bltu         a3, a3, 1364f
                  sltiu        ra, s8, -1486
                  addi         s9, t1, 1691
                  auipc        ra, 330062
                  addi         t4, t0, -1889
1361:             auipc        s10, 856040
1363:             srl          ra, a0, s5
                  blt          s9, s3, 1376f
                  xor          s9, a5, s5
                  xor          s5, t4, s8
                  xor          t5, s9, t6
                  slt          s8, t5, t5
                  slli         tp, s0, 15
                  xori         s9, a2, -1377
                  xori         a6, a6, 1690
                  slti         a3, a3, -1011
1376:             add          t3, ra, a1
                  add          s9, a1, s10
                  slti         s0, s8, -1987
                  beq          s9, t2, 1393f
                  slli         a2, t1, 6
                  or           a6, gp, a0
                  or           a3, a7, s2
                  bne          s1, t4, 1396f
                  xori         t2, s2, 972
                  srli         s9, t1, 26
                  auipc        t4, 804628
                  auipc        sp, 914844
                  add          s10, s7, s2
                  srai         a2, tp, 18
                  xori         s0, s6, 460
                  sll          a6, s3, s6
1396:             srl          zero, a7, sp
                  srli         a2, s8, 30
                  sltiu        gp, s10, -909
                  and          gp, a6, t2
                  bltu         t5, sp, 1409f
                  slli         a0, a5, 13
                  xor          tp, t0, tp
                  nop
                  xor          ra, sp, sp
1409:             sra          s10, s1, a5
                  bgeu         s11, s8, 1418f
                  add          ra, s0, t6
                  bge          ra, t0, 1424f
                  bltu         s9, a7, 1419f
                  bge          s1, t4, 1416f
1416:             sub          s4, sp, s5
                  add          s2, s7, t6
1418:             sltu         gp, s1, s7
1419:             lui          s3, 281740
                  bgeu         a3, zero, 1422f
                  srai         t1, s11, 1
1422:             and          t6, a1, t4
                  srai         t1, t5, 5
                  and          s2, a6, s5
                  sltiu        a5, s2, -1012
                  sll          s2, tp, s8
                  blt          s9, t4, 1447f
                  slt          a3, a1, ra
                  blt          s5, gp, 1433f
                  andi         s3, a0, -1357
1433:             auipc        s11, 1025207
                  bne          a2, t5, 1446f
                  slli         a3, a7, 26
                  bltu         a5, s5, 1446f
                  slli         tp, a2, 16
                  bge          s6, gp, 1447f
                  sltu         s9, t1, s3
                  sltiu        zero, t2, -1756
                  sll          a5, s5, t0
                  sltiu        t6, t5, -1224
1446:             sll          sp, s4, s8
1447:             addi         tp, s1, 1046
                  auipc        a4, 136199
                  xori         a5, s3, 1829
                  srl          tp, s4, t1
                  slti         s9, a6, -1480
                  bge          s7, a7, 1463f
                  sra          s2, s9, a7
                  blt          s4, t2, 1462f
                  bne          s4, s5, 1470f
                  sll          s10, t4, a3
                  slli         a4, t4, 17
                  bne          s7, t0, 1476f
                  lui          s5, 499064
1462:             sltiu        t5, s2, 875
1463:             sub          s4, ra, a5
                  sltiu        a7, s1, -1318
                  beq          t1, a2, 1477f
                  bne          a3, s8, 1472f
                  and          s11, a3, t2
                  ori          s1, s3, 188
1470:             bge          a4, gp, 1473f
                  srli         t3, sp, 27
1473:             srai         a6, a0, 19
                  or           t2, a6, t1
                  beq          t5, t4, 1489f
                  addi         sp, s4, 769
                  add          s5, a0, s6
                  addi         a6, zero, 7
                  addi         t5, zero, 6
sub_3_27_1_t:     auipc        gp, 689648
                  addi         a6, a6, -5
                  addi         s1, zero, -7
                  addi         a0, zero, -13
sub_3_27_0_t:     and          s9, t5, s3
                  addi         s1, s1, -1
                  bge          s1, a0, sub_3_27_0_t
                  bgeu         a6, t5, sub_3_27_1_t
                  srai         gp, s9, 31
                  sltu         s4, s5, t1
                  andi         a6, t5, 1948
                  slti         tp, t0, -834
                  beq          t3, s5, 1498f
                  beq          s5, s7, 1500f
1489:             bge          sp, a5, 1494f
                  sra          gp, s2, s5
                  xori         a4, s8, 1663
1494:             beq          a0, s0, 1507f
                  srai         t3, a5, 18
                  srai         s3, s4, 25
                  bne          ra, ra, 1510f
1498:             srai         a6, t5, 9
                  bge          a7, sp, 1502f
                  srl          a6, s0, a0
1502:             blt          gp, zero, 1504f
                  lui          t4, 240981
1504:             lui          t1, 56061
                  nop
                  sltiu        zero, a7, -1091
1507:             bltu         s1, a7, 1510f
                  nop
                  slti         s5, s4, 952
1510:             andi         a4, a5, 348
                  lw           ra, 4(s7)
                  addi         s7, s7, 24
                  lui          s1, 704811
                  and          t4, a0, a6
                  srl          a1, t5, s2
2726:             addi x13, x1, 1
2726:             jalr x13, x13, 0
sub_2:            and          sp, s8, s5
                  addi         s7, s7, -12
                  sw           ra, 4(s7)
                  xori         t5, t3, 1915
                  slli         t1, a6, 20
                  la           sp, region_0+1671
                  sb           s5, 64(sp)
                  nop
                  auipc        s5, 1037501
                  sb           a3, -15(sp)
                  slti         s5, a4, 135
                  or           s5, a3, s5
                  xori         a3, a4, -163
                  lbu          a3, -177(sp)
                  lb           a4, -55(sp)
                  sb           a6, 233(sp)
                  sb           s5, 31(sp)
                  lh           s1, -37(sp)
                  sb           s5, 63(sp)
                  sb           a3, 186(sp)
                  sltiu        a3, s5, 733
                  lb           a4, -193(sp)
                  lui          s1, 58347
                  xori         a3, a3, -1922
                  lb           s2, -17(sp)
                  sb           a4, -172(sp)
                  sltu         a4, a4, s5
                  sb           a6, -81(sp)
                  xor          a6, a4, s5
                  lbu          s5, 114(sp)
                  and          a6, a6, s5
                  lb           a3, -52(sp)
                  lbu          s1, -171(sp)
                  ori          a4, s2, -92
                  sb           a4, 101(sp)
                  lb           a4, -178(sp)
                  sw           s1, 49(sp)
                  andi         a6, s1, 939
                  sltiu        s2, a3, 909
                  sltiu        a4, s5, -1612
                  sb           a6, -223(sp)
                  la           sp, region_1+45499
                  sb           t4, -16(sp)
                  lbu          a4, -40(sp)
                  lh           tp, -35(sp)
                  srai         t4, tp, 26
                  auipc        s8, 250313
                  auipc        s0, 694925
                  sb           a4, -10(sp)
                  lb           t4, 27(sp)
                  lbu          t4, 63(sp)
                  lbu          a6, 16(sp)
                  sb           t4, -18(sp)
                  sra          tp, t4, a6
                  sb           s8, -46(sp)
                  sb           s8, 61(sp)
                  lbu          s8, -58(sp)
                  lbu          t4, -53(sp)
                  lw           a4, -7(sp)
                  sltiu        s8, a6, 1921
                  sw           s0, -27(sp)
                  and          tp, a6, a4
                  lb           a6, 35(sp)
                  slt          s0, t4, t4
                  lb           a4, 55(sp)
                  lbu          a6, 19(sp)
                  sb           s8, 51(sp)
                  xori         s8, s0, 1504
                  lb           tp, -60(sp)
                  lbu          a6, -21(sp)
                  xor          a4, s0, tp
                  lb           a4, -23(sp)
                  lb           t4, 61(sp)
                  sra          t4, s8, tp
                  slti         s8, a4, 1364
                  sll          s0, s8, tp
                  lb           a4, 64(sp)
                  add          a4, tp, t4
                  xori         a6, a4, -216
                  lb           t4, 62(sp)
                  srai         a6, s0, 25
                  sh           a4, 31(sp)
                  lb           t4, -43(sp)
                  add          tp, t4, s8
                  lbu          s0, -40(sp)
                  or           tp, s8, a6
                  sra          tp, s8, t4
                  lbu          s0, -49(sp)
                  sb           t4, -30(sp)
                  srai         a4, a4, 11
                  lbu          a6, -26(sp)
sub_2_31:         jal          ra, 0f
0:                jal          ra, 15f
1:                jal          ra, 16f
2:                jal          ra, 17f
3:                jal          ra, 23f
4:                jal          ra, 21f
5:                jal          t5, 26f
6:                jal          ra, 14f
7:                jal          tp, 18f
8:                jal          a5, 27f
9:                jal          t1, 20f
10:               jal          ra, 2b
11:               jal          s9, 1b
12:               jal          ra, 13f
13:               jal          ra, 3b
14:               jal          t1, 29f
15:               jal          ra, 8b
16:               jal          ra, 22f
17:               jal          ra, 12b
18:               jal          t3, 19f
19:               jal          t1, 24f
20:               jal          ra, 6b
21:               jal          t1, 5b
22:               jal          ra, 9b
23:               jal          a5, 28f
24:               jal          ra, 4b
25:               jal          ra, 11b
26:               jal          ra, 25b
27:               jal          ra, 10b
28:               jal          a4, 7b
29:               srl          s5, t3, s11
                  addi         s5, zero, 8
                  addi         sp, zero, 8
                  sll          t1, a3, s3
                  sub          a6, s8, ra
                  xor          a0, s3, a7
sub_2_69_1_t:     sltiu        t6, s0, -38
                  addi         s5, s5, -7
                  auipc        a3, 1015429
                  ori          s0, a4, 492
                  addi         s1, zero, 3
                  nop
                  addi         ra, zero, 17
sub_2_69_0_t:     xor          a7, t1, s5
                  addi         s1, s1, 7
                  bne          s1, ra, sub_2_69_0_t
                  bgeu         s5, sp, sub_2_69_1_t
                  srli         a4, a2, 27
sub_2_30:         jal          ra, 6f
0:                jal          t1, 3f
1:                jal          a3, 7f
2:                jal          s4, 8f
3:                jal          s2, 2b
4:                jal          ra, 1b
5:                jal          t1, 9f
6:                jal          ra, 11f
7:                jal          ra, 10f
8:                jal          ra, 14f
9:                jal          ra, 13f
10:               jal          ra, 5b
11:               jal          ra, 12f
12:               jal          t1, 4b
13:               jal          t1, 0b
sub_2_21:         jal          ra, 18f
0:                jal          ra, 11f
1:                jal          t1, 12f
2:                jal          ra, 9f
3:                jal          ra, 5f
4:                jal          ra, 7f
5:                jal          ra, 2b
6:                jal          ra, 4b
7:                jal          s11, 10f
8:                jal          sp, 13f
9:                jal          ra, 17f
10:               jal          ra, 19f
11:               jal          gp, 14f
12:               jal          s2, 15f
13:               jal          ra, 16f
14:               jal          ra, 3b
15:               jal          ra, 0b
16:               jal          ra, 6b
17:               jal          sp, 8b
18:               jal          ra, 1b
19:               xori         tp, t3, 639
                  la           sp, region_0+3670
                  lh           t3, 8(sp)
                  lhu          s10, 8(sp)
                  lh           t2, 8(sp)
                  lw           a3, 10(sp)
                  sb           t6, 5(sp)
                  sb           t1, 3(sp)
                  sb           s6, 3(sp)
                  lbu          tp, -5(sp)
                  lbu          a2, -5(sp)
                  lbu          a1, 13(sp)
                  lb           zero, 10(sp)
                  sh           s9, 10(sp)
                  lb           a2, -6(sp)
                  sh           s8, -6(sp)
                  lw           t1, -6(sp)
                  sb           t4, -6(sp)
                  lhu          t3, -6(sp)
                  la           sp, region_1+6323
                  slt          s2, sp, t6
                  lh           t5, -1865(sp)
                  xori         t5, a4, 1773
                  srl          s5, sp, a0
                  add          t5, t1, a5
                  slt          a0, sp, a7
                  lbu          a7, -1618(sp)
                  add          a3, ra, s6
                  lhu          s3, 847(sp)
                  sh           s5, 1055(sp)
                  sw           s11, 265(sp)
                  and          t2, t4, a7
                  and          ra, ra, t0
                  lbu          a7, -1944(sp)
                  ori          a1, s0, -1004
                  sb           sp, 1566(sp)
                  lbu          t4, 418(sp)
                  slt          a4, s6, s10
                  lhu          s5, 515(sp)
                  lw           ra, -411(sp)
                  sb           s11, 1186(sp)
                  lhu          s1, 2037(sp)
                  sb           s0, -243(sp)
                  sub          a1, t1, t1
                  lb           a5, -1064(sp)
                  lbu          s4, -688(sp)
                  sub          t4, s5, tp
                  lbu          ra, -536(sp)
                  xori         s11, t0, -2007
                  srai         zero, t3, 14
                  srli         a3, a7, 27
                  auipc        t5, 479248
                  sh           t0, 281(sp)
                  ori          a6, t4, 1781
                  lbu          tp, 982(sp)
                  sw           s6, -535(sp)
sub_2_16:         jal          ra, 0f
0:                jal          ra, 16f
1:                jal          t1, 27f
2:                jal          ra, 6f
3:                jal          t1, 20f
4:                jal          s0, 19f
5:                jal          t1, 12f
6:                jal          s2, 23f
7:                jal          ra, 14f
8:                jal          a0, 3b
9:                jal          t1, 5b
10:               jal          ra, 8b
11:               jal          t3, 13f
12:               jal          ra, 26f
13:               jal          t4, 18f
14:               jal          ra, 17f
15:               jal          ra, 7b
16:               jal          t1, 4b
17:               jal          ra, 2b
18:               jal          ra, 10b
19:               jal          ra, 24f
20:               jal          ra, 15b
21:               jal          t1, 9b
22:               jal          ra, 11b
23:               jal          ra, 1b
24:               jal          ra, 21b
25:               jal          ra, 22b
26:               jal          ra, 25b
27:               sra          s5, sp, s1
                  la           t2, region_0+3682
                  addi         gp, gp, -740
                  or           a7, a4, zero
                  sll          ra, t4, s9
                  sltiu        a5, s1, -1602
                  lhu          s0, -22(t2)
                  auipc        a1, 744521
                  ori          tp, a0, -1794
                  sb           ra, -15(t2)
                  slt          a1, ra, s0
                  lb           s10, 11(t2)
                  lbu          s1, 15(t2)
                  sltiu        a5, s11, -214
                  lbu          s2, -29(t2)
                  sltu         a5, t0, t2
                  or           sp, s9, a3
                  sltiu        s3, t1, 984
                  lbu          s10, -41(t2)
                  srli         tp, a1, 13
                  slli         a6, t2, 8
                  lb           t5, -17(t2)
                  lhu          gp, 20(t2)
                  andi         a7, ra, 981
                  nop
                  sb           t2, 4(t2)
                  lbu          s4, 61(t2)
                  lbu          a2, 27(t2)
                  lb           s5, -30(t2)
                  lw           a0, -34(t2)
                  lbu          s8, 1(t2)
                  sra          t6, gp, a4
                  lbu          s10, -53(t2)
sub_2_25:         jal          ra, 12f
0:                jal          ra, 6f
1:                jal          ra, 11f
2:                jal          t2, 15f
3:                jal          ra, 7f
4:                jal          ra, 3b
5:                jal          s3, 10f
6:                jal          t1, 5b
7:                jal          a3, 9f
8:                jal          ra, 17f
9:                jal          t1, 16f
10:               jal          ra, 14f
11:               jal          t1, 18f
12:               jal          ra, 1b
13:               jal          t4, 0b
14:               jal          tp, 2b
15:               jal          t2, 8b
16:               jal          ra, 13b
17:               jal          ra, 19f
18:               jal          gp, 4b
19:               sub          t4, t5, a6
                  la           a2, region_0+3262
                  lb           a4, 16(a2)
                  sb           a4, -33(a2)
                  lhu          t4, -16(a2)
                  slti         t5, t5, 217
                  andi         t3, a4, -887
                  lhu          t4, 46(a2)
                  lw           a4, 30(a2)
                  lb           tp, 41(a2)
                  sb           t3, 56(a2)
                  lb           t2, -4(a2)
                  sb           tp, -23(a2)
                  and          t3, tp, t4
                  slti         t4, a4, -888
                  slti         a4, a4, -716
                  sb           a4, -29(a2)
                  lb           t5, -1(a2)
                  add          t4, t3, t2
                  sub          t5, t4, a4
                  sb           t3, -31(a2)
                  sltu         a4, t5, t4
                  lh           t4, 52(a2)
                  lbu          t2, -40(a2)
                  and          tp, a4, t4
                  sh           t2, 26(a2)
                  sub          tp, t5, a4
                  lhu          t4, -42(a2)
                  lbu          a4, -20(a2)
                  lb           t5, -55(a2)
                  sra          t2, a4, t2
                  sh           a4, -12(a2)
                  sll          t3, t5, t4
                  sb           t3, 41(a2)
                  addi         t4, zero, 5
                  ori          tp, s0, -222
                  add          a0, s6, t0
                  addi         s11, zero, 4
                  sll          zero, s5, a7
sub_2_64_0_t:     xor          tp, a6, s5
                  sub          s0, t2, t3
                  srai         t5, s7, 14
                  addi         t4, t4, -3
                  lui          s10, 475627
                  ori          a4, s3, -249
                  srli         gp, s2, 13
                  andi         s5, a6, 223
                  sltu         s1, a6, ra
                  sltu         s3, s1, s8
                  sra          sp, a4, t6
                  xor          a6, a0, a4
                  xor          a4, a5, a6
                  addi         tp, t1, -1695
                  bgeu         t4, s11, sub_2_64_0_t
                  sra          s8, s2, t2
                  la           sp, region_1+16211
                  sra          a5, zero, t2
                  lbu          t5, -12(sp)
                  sltiu        a2, s6, 1509
                  lw           s9, -11(sp)
                  or           a6, s2, a4
                  slti         a2, s5, 1348
                  lb           s1, 5(sp)
                  andi         t3, zero, -1246
                  slti         a0, t4, -106
                  sra          t6, t4, s10
                  lbu          ra, -12(sp)
                  lb           s8, 12(sp)
                  addi         a4, t1, -268
                  lb           s0, -15(sp)
                  sh           s7, 15(sp)
                  sb           gp, -6(sp)
                  addi         s5, zero, 1168
                  lb           t1, 14(sp)
                  sb           a1, 12(sp)
                  lb           s9, 5(sp)
                  addi         gp, ra, -1257
                  sb           gp, 6(sp)
                  sh           a4, 1(sp)
                  lbu          s10, -14(sp)
                  lbu          a1, 0(sp)
                  lbu          a3, 14(sp)
                  lui          ra, 5409
                  lb           s11, 10(sp)
                  sb           sp, -4(sp)
                  xori         s2, t6, 1389
                  sb           t1, 8(sp)
                  la           a7, region_1+19031
                  la           ra, region_0+1633
                  lb           s10, -34(ra)
                  lbu          s1, -62(a7)
                  lbu          s8, 52(ra)
                  sb           s1, 38(a7)
                  lb           s4, -8(ra)
                  lbu          t5, -50(a7)
                  lw           s10, -27(a7)
                  sb           sp, -50(ra)
                  sb           s11, 34(ra)
                  lbu          s2, 7(a7)
                  sb           zero, 6(a7)
                  lbu          s1, 28(ra)
                  lbu          gp, 8(a7)
                  lbu          s11, 39(a7)
                  lb           s1, 30(a7)
                  lb           a0, 24(a7)
                  lbu          s8, 50(ra)
                  lh           t3, 33(ra)
                  la           t3, region_1+4040
                  la           s9, region_1+54870
                  lb           t5, 17(t3)
                  sb           t1, 9(s9)
                  lbu          t6, -5(s9)
                  lbu          s10, 3(s9)
                  lh           s0, 10(s9)
                  lh           t5, -36(t3)
                  lh           t1, 8(s9)
                  sb           gp, 57(t3)
                  sh           s11, -10(s9)
                  lhu          t5, -46(t3)
                  lbu          s2, 21(t3)
                  la           a1, region_0+2999
                  la           a6, region_0+3308
                  la           s5, region_0+3807
                  sw           t1, -12(a6)
                  lbu          a5, 180(s5)
                  sb           s8, 15(s5)
                  la           s1, region_0+2125
                  lbu          gp, -112(s5)
                  lb           s0, -34(a1)
                  sb           ra, -15(a6)
                  lh           s3, -13(s1)
                  sb           t0, 13(a6)
                  lbu          sp, -244(s5)
                  lhu          s8, -63(a1)
                  sb           a3, -6(a6)
                  sb           tp, 30(a1)
                  lh           ra, -6(a6)
                  lbu          tp, 7(a6)
                  lb           t1, 89(s1)
                  lbu          ra, 240(s5)
                  sh           s0, 6(a6)
                  sw           a3, 63(s1)
                  sw           t5, 255(s1)
                  lb           s4, 1(a1)
                  lbu          s0, -48(a1)
                  sb           sp, 13(a6)
                  lb           zero, 3(s5)
                  lw           tp, -16(a6)
                  lb           ra, -21(a1)
                  lhu          t5, 49(s1)
                  sb           sp, -50(a1)
                  lbu          a3, 36(a1)
                  lb           s4, 10(a6)
                  lb           a0, -46(s1)
                  la           sp, region_0+681
                  la           t5, region_0+1158
                  la           s8, region_0+3856
                  sb           zero, -45(t5)
                  sh           t0, -59(sp)
                  sb           s0, -1533(s8)
                  lh           ra, -1506(s8)
                  la           a2, region_0+1721
                  lb           a1, -2(sp)
                  sb           t5, -28(a2)
                  lb           s9, -161(s8)
                  lbu          ra, 64(sp)
                  sb           s8, -13(a2)
                  lh           s10, -30(t5)
                  lw           s10, -1816(s8)
                  lh           gp, -253(a2)
                  sb           t4, -259(s8)
                  lbu          s10, -881(s8)
                  lbu          s1, 33(t5)
                  lh           s10, -710(s8)
                  lbu          s5, 25(sp)
                  lb           a6, -577(s8)
                  lb           a0, 54(sp)
                  lbu          t1, -61(t5)
                  lbu          t2, 47(sp)
                  lbu          s10, 148(a2)
                  sh           s5, -55(sp)
                  lbu          a6, 47(t5)
                  lb           s11, 215(a2)
                  sw           s6, -1504(s8)
                  lhu          a6, 149(a2)
                  la           t2, region_1+8394
                  la           sp, region_0+1167
                  lh           s11, -12(t2)
                  lbu          s8, -2(sp)
                  lh           a7, -36(t2)
                  sb           s9, -175(t2)
                  sw           s0, 13(sp)
                  lb           s4, -2(sp)
                  lbu          t5, -172(t2)
                  lw           s2, 114(t2)
                  lbu          t1, -118(t2)
                  sh           a2, 5(sp)
                  sb           t5, 1(sp)
                  lb           t1, -147(t2)
                  lhu          a7, 13(sp)
                  lb           s5, -12(sp)
                  sb           tp, -221(t2)
                  lhu          a5, -3(sp)
                  lbu          s3, -140(t2)
                  addi         s2, zero, 10
                  addi         t6, zero, 8
sub_2_65_1_t:     and          ra, s1, s5
                  xori         tp, s8, -1237
                  addi         s2, s2, -7
                  addi         s11, zero, -7
                  addi         a2, zero, 5
sub_2_65_0_t:     nop
                  addi         s11, s11, 2
                  bne          s11, a2, sub_2_65_0_t
                  bgeu         s2, t6, sub_2_65_1_t
                  srai         sp, s6, 11
                  la           a2, region_0+2369
                  add          t6, t1, s10
                  or           s4, t4, t4
                  sh           s9, -29(a2)
                  sra          s11, s0, t4
                  lbu          a6, 30(a2)
                  lbu          s8, -16(a2)
                  sb           a6, 39(a2)
                  sll          s9, s0, a0
                  lbu          s1, -56(a2)
                  lw           t4, -5(a2)
                  sub          s5, s6, a6
                  sb           s8, -53(a2)
                  lb           s11, -52(a2)
                  andi         s8, a7, 1284
                  lui          s11, 163589
                  nop
                  lbu          zero, 28(a2)
                  sb           a1, 12(a2)
                  lhu          s2, -59(a2)
                  lbu          s4, 38(a2)
                  sb           t0, -42(a2)
                  lhu          t3, 61(a2)
                  lb           tp, -42(a2)
                  sltiu        s11, s7, -1917
                  slti         a7, s5, 1713
                  slt          t6, sp, s10
                  xori         a6, t4, 1216
                  xori         s1, a7, 64
                  sub          a4, a2, gp
                  lb           s11, -26(a2)
                  sltu         s5, s2, tp
                  slli         t2, tp, 12
                  slli         zero, gp, 4
                  srai         a3, a3, 16
                  lh           s5, 17(a2)
                  slti         s3, t1, -1010
                  lb           tp, 14(a2)
                  sb           s7, -46(a2)
                  lb           a5, 18(a2)
                  sb           s1, 10(a2)
                  srl          t4, t1, tp
                  lb           sp, -46(a2)
                  la           sp, region_0+1732
                  sb           t2, -26(sp)
                  lbu          a2, -26(sp)
                  lbu          a4, 39(sp)
                  lbu          t3, -63(sp)
                  lb           s9, -63(sp)
                  xori         a1, a6, 2003
                  lbu          a0, 21(sp)
                  lb           gp, 34(sp)
                  lbu          t3, 34(sp)
                  sb           s10, 17(sp)
                  sb           sp, 17(sp)
                  lbu          s3, -3(sp)
                  sb           t5, -3(sp)
                  lbu          a7, -3(sp)
                  la           sp, region_1+56786
                  sb           s4, 27(sp)
                  lbu          s3, 27(sp)
                  sb           s0, 27(sp)
                  lbu          a6, -43(sp)
                  lb           a1, -43(sp)
                  lb           s3, 63(sp)
                  lw           s1, 42(sp)
                  sh           t1, 42(sp)
                  sll          s11, a2, ra
                  lbu          zero, 42(sp)
                  lw           t3, 42(sp)
                  xori         gp, a2, 453
                  sw           s2, 42(sp)
                  lh           a2, 42(sp)
                  lbu          a5, 42(sp)
                  lbu          a0, -39(sp)
                  lbu          s11, -39(sp)
                  sltu         t6, sp, a2
                  lbu          a7, 6(sp)
                  lhu          s2, 6(sp)
                  lw           t2, 6(sp)
                  lw           a7, -30(sp)
                  sw           zero, -30(sp)
                  la           s4, region_0+1038
                  la           gp, region_0+947
                  la           s11, region_0+135
                  la           t4, region_0+12
                  lb           a7, -3(s11)
                  lhu          t5, -2(s4)
                  lb           s9, -50(s11)
                  lbu          a1, 7(s4)
                  sw           s9, 29(s11)
                  la           a5, region_0+51
                  lbu          a3, 33(s11)
                  lbu          t1, 1032(gp)
                  lbu          s0, -37(s11)
                  lbu          t1, 239(t4)
                  lbu          sp, 765(a5)
                  sb           a3, 258(gp)
                  lh           a0, 797(a5)
                  sb           s9, 64(s11)
                  lbu          t3, 768(a5)
                  lhu          t3, 19(a5)
                  lb           a1, 1430(a5)
                  lbu          s10, -45(s11)
                  lw           t2, 41(gp)
                  lbu          a7, 31(a5)
                  lhu          t1, 68(t4)
                  lhu          s3, 63(s11)
                  lb           a1, 210(gp)
                  lbu          t6, 483(gp)
                  lb           a4, 58(s11)
                  lb           t1, 1(s4)
                  lbu          s9, 1104(gp)
                  lbu          t3, 99(t4)
                  lbu          tp, 191(t4)
                  lb           a7, 1016(a5)
                  lb           s1, 98(t4)
                  sh           s1, 8(s4)
                  lbu          s10, 656(gp)
                  sb           gp, -12(s11)
                  sb           t5, -8(s4)
                  lbu          a6, 715(gp)
                  lb           t5, 270(a5)
                  sw           a5, -691(gp)
                  lhu          s9, 134(t4)
                  lb           a6, -345(gp)
                  la           sp, region_0+2092
                  la           s9, region_0+2427
                  la           a3, region_0+2153
                  lbu          a4, -14(a3)
                  la           a2, region_0+3345
                  lw           t6, 135(a2)
                  lbu          s8, -279(a2)
                  sb           zero, 546(a2)
                  sh           s11, -586(sp)
                  lw           t1, -15(s9)
                  sb           t5, -51(a3)
                  lw           a0, -1709(a2)
                  lb           s0, -37(sp)
                  sb           a2, -42(a3)
                  sb           s7, -830(a2)
                  sb           s0, 1077(sp)
                  sh           s9, 391(a2)
                  lhu          s11, -13(s9)
                  lbu          t1, 11(a3)
                  lhu          ra, -51(a3)
                  lbu          s11, -6(s9)
                  lbu          a6, -1171(a2)
                  sw           t3, -884(sp)
                  sb           t4, -1821(a2)
                  sb           ra, 585(sp)
                  sb           t0, -16(s9)
                  sw           s0, -5(a3)
                  sb           gp, -53(a3)
                  lb           zero, -5(s9)
                  addi         s1, zero, -4
                  addi         a0, zero, -18
sub_2_76_0_t:     ori          s2, s9, -1520
                  addi         s1, s1, -3
                  addi         s3, s10, -1890
                  bge          s1, a0, sub_2_76_0_t
                  ori          gp, a6, -1191
                  la           t3, region_0+4095
                  la           a1, region_0+2784
                  la           gp, region_0+3817
                  sb           s6, -16(t3)
                  lbu          t2, 17(a1)
                  lbu          sp, -3(t3)
                  la           a2, region_0+1257
                  lb           s10, -8(a2)
                  lbu          s2, 5(gp)
                  lbu          t1, 12(gp)
                  lbu          zero, -4(t3)
                  lb           s5, 61(a1)
                  lbu          s5, -13(t3)
                  lhu          t4, 44(a1)
                  sb           a5, 1(a1)
                  lb           tp, 4(a2)
                  sw           s7, 15(gp)
                  lb           a6, 13(a1)
                  sb           s11, 14(a2)
                  lb           s8, 0(t3)
                  sh           t0, -7(t3)
                  lw           ra, 44(a1)
                  lb           a5, 14(gp)
                  sh           t5, 3(gp)
                  lbu          s9, -5(t3)
                  sb           s4, -15(a2)
                  sb           s11, 12(gp)
                  lbu          t4, 3(a1)
                  lbu          s3, -6(t3)
                  lbu          s4, 9(gp)
                  lbu          s0, -42(a1)
                  lw           s2, 15(gp)
                  lb           t2, -8(a2)
                  addi         s9, zero, 2
                  addi         a7, zero, 6
                  sra          t4, a3, sp
                  sltu         s3, s6, t2
                  sltiu        t6, ra, 131
                  slli         a6, t2, 23
sub_2_77_0_t:     sub          zero, a2, s3
                  sltiu        sp, a0, 795
                  addi         s9, s9, 5
                  sll          t6, ra, t2
                  blt          s9, a7, sub_2_77_0_t
                  add          a4, s1, a3
                  la           s2, region_0+2475
                  la           a6, region_0+1582
                  lhu          a2, 11(s2)
                  lbu          t6, 687(a6)
                  la           ra, region_0+3009
                  sb           a6, -1321(a6)
                  lw           s8, 9(s2)
                  lh           a0, 145(ra)
                  sh           s0, -460(a6)
                  lbu          s9, -16(s2)
                  lbu          s3, -38(ra)
                  lb           t6, -1317(a6)
                  lb           a4, 14(s2)
                  lw           a4, -1178(a6)
                  lb           a2, 112(ra)
                  lh           t3, -1132(a6)
                  lbu          t6, 28(ra)
                  lb           t4, 269(a6)
                  sb           sp, 12(s2)
                  lb           s10, 14(s2)
                  lb           a1, -82(ra)
                  lbu          a2, -14(s2)
                  sw           tp, -49(ra)
                  sb           s11, -166(ra)
                  lh           t4, 796(a6)
                  addi         s4, zero, 8
                  nop
                  ori          s3, tp, -910
                  ori          a4, s10, 925
                  addi         tp, zero, 8
sub_2_72_0_t:     auipc        ra, 332481
                  sltiu        t4, s1, 1310
                  xori         a5, a7, -959
                  or           s9, a2, s1
                  addi         ra, a3, -1115
                  addi         s4, s4, -7
                  bgeu         s4, tp, sub_2_72_0_t
                  slti         s8, gp, -1725
                  la           s9, region_0+149
                  sb           s1, -102(s9)
                  la           tp, region_1+51547
                  lbu          a0, 59(tp)
                  sb           ra, 763(s9)
                  lb           a5, -64(tp)
                  lb           s5, 351(s9)
                  lb           s8, 10(tp)
                  lb           t2, 1312(s9)
                  lhu          a1, 1939(s9)
                  lhu          a2, -21(tp)
                  sb           s3, 1868(s9)
                  lbu          s4, -26(tp)
                  lbu          s3, -8(tp)
                  la           sp, region_1+44967
                  sltu         a4, s4, a0
                  sb           a4, -1426(sp)
                  andi         a7, a0, 1744
                  lbu          a0, 678(sp)
                  sb           t3, 1176(sp)
                  lb           t3, 1507(sp)
                  sb           a0, 1454(sp)
                  sh           t3, 51(sp)
                  lbu          s4, -1811(sp)
                  or           s4, a7, a4
                  lb           a7, 1788(sp)
                  lb           a0, 354(sp)
                  sh           a0, -239(sp)
                  add          t3, s4, a0
                  sub          a4, s10, a0
                  lbu          t3, -1836(sp)
                  slt          a4, s4, a7
                  sh           s10, -681(sp)
                  sh           a4, 1811(sp)
                  lbu          a0, 799(sp)
                  addi         s4, t3, -137
                  lb           a7, 439(sp)
                  add          s10, s4, a7
                  sb           a7, -56(sp)
                  lbu          a4, -310(sp)
                  addi         s10, s4, 6
                  lh           a7, 1683(sp)
                  lb           a7, -190(sp)
                  slli         a0, a4, 31
                  sb           t3, -1693(sp)
                  lb           a4, 455(sp)
                  sw           s10, 2037(sp)
                  lbu          t3, 1744(sp)
                  lb           t3, -1039(sp)
                  lbu          s10, -302(sp)
                  nop
                  lw           s4, 393(sp)
                  sb           a7, -105(sp)
                  la           ra, region_1+21447
                  lbu          s4, 15(ra)
                  sltiu        s4, s4, -230
                  slt          t5, t3, a5
                  srai         t3, t3, 21
                  addi         t5, t5, 1521
                  sb           gp, -64(ra)
                  lb           a5, 9(ra)
                  srli         s4, s4, 27
                  sltu         t1, a5, t5
                  sltiu        s4, t3, 1056
                  lbu          a5, 28(ra)
                  andi         s4, t5, 1199
                  lb           t1, 24(ra)
                  lb           a5, -50(ra)
                  lb           a5, 18(ra)
                  srl          t1, a5, s4
                  lb           t5, -44(ra)
                  lbu          a5, 36(ra)
                  srai         gp, a5, 31
                  sb           gp, 31(ra)
                  sltu         t3, t3, t5
                  or           s4, t1, t5
                  lb           gp, -14(ra)
                  and          t5, t3, t3
                  sh           t5, 55(ra)
                  sltiu        t1, t3, -1014
                  srl          s4, t5, a5
                  lb           gp, -57(ra)
                  srl          t5, gp, a5
                  sb           t5, 34(ra)
                  sll          t3, a5, a5
                  srai         t3, t1, 28
                  lbu          t5, 19(ra)
                  la           t1, region_0+855
                  lb           a7, -62(t1)
                  sb           gp, -40(t1)
                  sw           s9, -47(t1)
                  addi         tp, s5, -351
                  sb           t6, -19(t1)
                  nop
                  sw           t2, 41(t1)
                  slt          t5, a5, s9
                  sb           s7, -64(t1)
                  sw           s7, -43(t1)
                  sb           gp, -60(t1)
                  andi         zero, s1, 993
                  lb           a4, 24(t1)
                  slt          ra, s3, t6
                  sll          sp, s7, s8
                  nop
                  lbu          s3, -42(t1)
                  and          t2, t3, t2
                  xori         tp, t6, -1203
                  sll          s4, s8, s2
                  sub          a7, gp, s0
                  sltu         a4, a7, s5
                  sh           a0, -33(t1)
                  la           s8, region_0+1711
                  la           t5, region_0+1667
                  la           s4, region_0+2153
                  lh           s3, 1961(t5)
                  la           tp, region_0+2182
                  lbu          s0, 157(s8)
                  sb           a7, 324(s4)
                  la           ra, region_0+3549
                  sb           a3, 212(s8)
                  lh           s9, -801(t5)
                  sb           sp, -492(s4)
                  lbu          t2, -684(t5)
                  sw           t6, -225(ra)
                  lbu          s11, -224(s8)
                  lbu          s10, 933(tp)
                  lb           s1, -251(t5)
                  lhu          sp, 1240(tp)
                  sh           t3, 1767(t5)
                  sb           t6, -596(s4)
                  lh           t3, -113(ra)
                  sb           t0, -1197(t5)
                  lb           a3, 203(tp)
                  lb           s1, 233(ra)
                  sb           s9, -204(ra)
                  lbu          s10, -235(ra)
                  sb           s11, -348(s4)
                  lbu          s11, 697(t5)
                  sb           s3, -241(tp)
                  sb           a2, 46(t5)
                  sh           s2, 1843(s4)
                  lb           t6, -331(t5)
                  sb           tp, -2(ra)
                  lb           t3, -146(ra)
                  lb           a4, 1590(t5)
                  lhu          s0, -940(tp)
                  lb           a7, -226(ra)
                  lb           a4, 320(s4)
                  sw           a7, 21(s8)
                  lh           s5, -227(s8)
                  lh           s3, -233(s8)
                  lb           a6, 228(ra)
                  lbu          a1, -1680(tp)
                  lbu          s9, 80(s8)
                  lb           zero, -256(s8)
                  sb           gp, -4(ra)
                  sb           s6, 749(tp)
                  la           sp, region_0+224
                  lh           t4, 12(sp)
                  slli         s3, t3, 24
                  xori         t4, sp, -432
                  lb           s0, 5(sp)
                  sb           a3, 7(sp)
                  lhu          s9, -2(sp)
                  sb           gp, -10(sp)
                  lbu          t3, 9(sp)
                  lbu          s2, 9(sp)
                  lb           s2, 0(sp)
                  lw           gp, 16(sp)
                  sh           tp, -2(sp)
                  sltiu        t1, s7, -80
                  lb           a0, 15(sp)
                  srli         a7, t4, 17
                  lbu          s11, -15(sp)
                  lbu          a3, -11(sp)
                  or           s2, a1, s9
                  lb           s5, -11(sp)
                  lb           a4, -11(sp)
                  andi         tp, s5, -1985
                  lb           a6, -13(sp)
                  lbu          a3, -6(sp)
                  sh           a2, -8(sp)
                  nop
                  slli         s8, a4, 30
                  lbu          t1, 9(sp)
                  sh           gp, 14(sp)
                  sb           a6, 2(sp)
                  or           t1, t3, s3
                  add          s3, s0, ra
                  lb           s0, -9(sp)
                  add          s5, s11, a7
                  add          s0, a6, t3
                  lbu          t6, -3(sp)
                  lh           a1, -10(sp)
                  lb           a4, 3(sp)
                  lui          gp, 875165
                  slli         t5, a1, 0
                  slt          a0, s0, s10
                  addi         t4, t2, -63
                  lhu          a1, -14(sp)
                  sb           s7, -11(sp)
sub_2_18:         jal          ra, 1f
0:                jal          ra, 7f
1:                jal          ra, 2f
2:                jal          ra, 6f
3:                jal          s3, 4f
4:                jal          t1, 10f
5:                jal          t6, 9f
6:                jal          a0, 5b
7:                jal          t6, 8f
8:                jal          ra, 3b
9:                jal          ra, 0b
10:               sll          a0, gp, t0
                  la           s2, region_0+1856
                  slt          gp, a1, s8
                  lh           a2, 12(s2)
                  lb           a4, -9(s2)
                  sb           a2, 11(s2)
                  or           a4, a1, a4
                  lbu          a1, 6(s2)
                  xori         a2, a1, -1037
                  ori          a4, s8, 1535
                  lhu          a4, -14(s2)
                  lb           a2, 15(s2)
                  ori          a3, a1, 847
                  lbu          a3, 12(s2)
                  sltiu        a1, gp, 936
                  slli         s8, a3, 10
                  sll          a3, a3, a2
                  sb           a3, 6(s2)
                  slt          a3, s8, a4
                  andi         a4, gp, 441
                  lb           a3, 13(s2)
                  lhu          gp, 14(s2)
                  sb           a2, 11(s2)
                  lb           a1, 4(s2)
                  sb           a3, -8(s2)
                  lh           a1, -6(s2)
                  nop
                  sltu         gp, a1, a3
                  ori          a3, a4, -1435
                  or           s8, a1, a1
                  lb           a4, 9(s2)
                  lbu          a4, 15(s2)
                  lb           a1, 14(s2)
                  lhu          gp, 6(s2)
                  lh           gp, -16(s2)
                  or           a2, a2, a1
                  sra          a3, a1, a2
                  or           a1, a1, a4
                  lb           a4, 5(s2)
                  sltiu        a3, gp, 1805
                  add          s8, a4, a3
                  lb           a1, -7(s2)
                  add          a3, a4, gp
                  lbu          gp, 1(s2)
                  lbu          a4, 13(s2)
                  srli         a3, s8, 13
                  sh           gp, 10(s2)
                  sltu         gp, a3, s8
                  sh           a1, -14(s2)
                  lbu          a1, 5(s2)
                  lbu          s8, 14(s2)
                  lw           a4, -8(s2)
                  la           s4, region_0+2731
                  lbu          a6, -12(s4)
                  lbu          ra, -12(s4)
                  sltu         a6, a0, sp
                  lhu          a1, -239(s4)
                  lbu          t3, 227(s4)
                  lbu          a1, -38(s4)
                  lbu          s0, -38(s4)
                  sb           t2, -203(s4)
                  auipc        a1, 686598
                  lb           t1, -190(s4)
                  sll          t4, gp, t2
                  sb           s4, -190(s4)
                  lbu          t5, -190(s4)
                  lbu          s9, -190(s4)
                  lh           s2, -21(s4)
                  sb           s5, 121(s4)
                  lb           a5, 121(s4)
                  sh           gp, 253(s4)
                  lb           a6, -34(s4)
                  srli         a0, tp, 6
                  lh           sp, 131(s4)
                  sb           t6, -122(s4)
                  la           a7, region_0+770
                  slli         s3, a7, 24
                  and          ra, s11, s0
                  lb           sp, 14(a7)
                  lb           t5, -13(a7)
                  slli         a5, a7, 6
                  ori          s1, s8, 1273
                  sltiu        sp, s8, 722
                  auipc        gp, 643769
                  lb           a5, -14(a7)
                  sub          t2, s0, s1
                  lbu          s10, -14(a7)
                  lb           t5, -9(a7)
                  addi         t1, a3, -1543
                  srli         t3, s9, 29
                  auipc        a5, 899523
                  lb           a3, -12(a7)
                  xor          a6, t3, s3
                  sb           t5, 11(a7)
                  lh           a0, 8(a7)
                  sb           t0, -1(a7)
                  lbu          t6, 10(a7)
                  sb           a2, -8(a7)
                  lui          t1, 152133
                  lb           t5, -9(a7)
                  andi         s1, gp, 2031
                  xor          s9, s0, t1
                  slt          s2, ra, t0
                  lb           t3, 16(a7)
                  ori          s10, ra, -919
                  sltu         s8, gp, s2
                  slt          s3, zero, t2
                  srai         t4, a3, 27
                  addi         s4, a0, -1617
                  lb           s9, -3(a7)
                  sb           s1, -13(a7)
                  lb           a0, 5(a7)
                  lhu          s5, 6(a7)
                  la           t1, region_1+30392
                  lb           s0, 9(t1)
                  lbu          t5, -15(t1)
                  sb           s3, 4(t1)
                  sb           t5, 7(t1)
                  la           t2, region_0+118
                  lb           s0, 16(t2)
                  lbu          s0, 8(t1)
                  lhu          t6, -14(t2)
                  lbu          sp, -8(t1)
                  lw           s3, -14(t2)
                  lb           s1, 8(t1)
                  lh           s9, -2(t2)
                  lb           s10, -14(t1)
                  lb           t4, -6(t2)
                  sb           s2, -2(t1)
                  la           t5, region_0+155
                  sb           t0, 1016(t5)
                  lb           s11, 242(t5)
                  lhu          a6, 1735(t5)
                  la           tp, region_1+61996
                  sh           sp, -50(tp)
                  lbu          s5, -19(tp)
                  lbu          s9, 32(t5)
                  sb           s7, 33(tp)
                  lw           s2, 1821(t5)
                  sb           t5, 241(t5)
                  sw           s10, 20(tp)
                  sb           t0, -62(tp)
                  sb           t6, 802(t5)
                  la           tp, region_1+47469
                  auipc        s11, 913006
                  xor          gp, s11, s8
                  lhu          gp, 77(tp)
                  auipc        t4, 83967
                  slt          a4, s2, s2
                  lhu          s2, -13(tp)
                  sltu         s11, s2, a4
                  sltiu        gp, t4, -241
                  auipc        s11, 471776
                  sll          gp, a4, gp
                  sltu         gp, gp, a4
                  lui          t4, 595860
                  lb           t4, 122(tp)
                  or           a4, gp, s2
                  lb           s2, 99(tp)
                  srli         s2, a4, 22
                  sb           t4, -59(tp)
                  lbu          s11, 148(tp)
                  lbu          a4, -153(tp)
                  sltu         s8, t4, s11
                  lhu          a4, 75(tp)
                  sh           t4, 143(tp)
                  sb           s8, 247(tp)
                  lb           s2, -188(tp)
                  andi         a4, t4, 1341
                  sb           s8, 78(tp)
                  lh           s8, -57(tp)
                  or           s8, s2, t4
                  auipc        t4, 615879
                  sltiu        t4, s11, -1603
                  lb           s11, 109(tp)
                  sb           s11, -119(tp)
                  sltiu        gp, gp, -403
                  srl          s8, s11, s2
                  sll          s11, s2, s11
                  sb           t4, -204(tp)
                  and          gp, s11, s11
                  sra          a4, a4, t4
                  sh           t4, -129(tp)
                  sltu         s11, s11, s8
                  sb           s11, -180(tp)
                  lb           a4, 123(tp)
                  lhu          s11, -255(tp)
                  sub          s11, s2, s8
                  srai         s2, s2, 16
                  lb           a4, 215(tp)
                  la           t2, region_0+2653
                  lbu          t1, -48(t2)
                  lbu          t6, -40(t2)
                  la           a3, region_0+1356
                  lb           s3, 54(t2)
                  lbu          s3, -12(a3)
                  lb           s2, 1(a3)
                  lb           s9, 18(t2)
                  lbu          s0, -7(a3)
                  lb           sp, -3(t2)
                  sb           s4, -3(a3)
                  lhu          ra, -16(a3)
                  lbu          tp, 42(t2)
                  lb           s4, 16(t2)
                  sh           s8, 7(t2)
                  lhu          a0, -6(a3)
                  sh           t3, 45(t2)
                  lbu          t6, -13(a3)
                  lw           gp, -9(t2)
                  lb           t1, 13(a3)
                  la           s0, region_1+47284
                  lh           sp, -248(s0)
                  lh           s10, -248(s0)
                  lb           sp, -248(s0)
                  sh           s5, -170(s0)
                  lh           a2, 254(s0)
                  nop
                  lb           a0, 179(s0)
                  lb           s2, 179(s0)
                  lb           tp, 11(s0)
                  sb           s10, -176(s0)
                  lhu          s8, -246(s0)
                  sltu         s11, s0, t5
                  lb           a3, 47(s0)
                  srai         s2, t6, 4
                  lbu          ra, 215(s0)
                  sb           ra, 215(s0)
                  la           t4, region_1+31010
                  lh           s9, 1612(t4)
                  la           a0, region_0+1661
                  sh           a2, -1046(t4)
                  sb           s9, -131(a0)
                  sb           s6, 460(t4)
                  sw           zero, -5(a0)
                  sb           t0, 45(a0)
                  lb           a2, -645(t4)
                  lbu          s5, -238(a0)
                  lbu          s8, -1191(t4)
                  lb           a3, 1123(t4)
                  lh           a2, 450(t4)
                  sw           s11, 966(t4)
                  lbu          s2, 1476(t4)
                  lb           s3, 415(t4)
                  lb           s1, 192(a0)
                  la           s9, region_0+1886
                  la           tp, region_0+3340
                  sb           a6, 946(s9)
                  la           s11, region_0+1280
                  la           t4, region_0+3996
                  lbu          a0, 183(s11)
                  lb           a2, 1305(s9)
                  sb           s2, -155(s11)
                  lbu          zero, -138(s11)
                  lb           t3, -792(t4)
                  sb           a4, -1894(t4)
                  sb           ra, 45(s11)
                  lbu          a4, -1125(t4)
                  sb           s8, -229(tp)
                  lw           a7, -48(t4)
                  lhu          t2, 1980(s9)
                  lbu          a3, 1878(s9)
                  sh           a2, 52(tp)
                  lbu          a3, 1817(s9)
                  sb           s4, -1951(t4)
                  lbu          ra, 199(tp)
                  lbu          s8, -162(tp)
                  sh           s2, 818(s9)
                  lh           s1, 174(s11)
                  lb           s0, 21(s11)
                  sb           t5, 740(s9)
                  lbu          s8, -1999(t4)
                  lbu          zero, -79(s11)
                  lbu          gp, -561(t4)
                  lh           s10, -214(s11)
                  lb           t2, -1061(t4)
                  sb           s5, 118(s11)
                  lb           s5, -15(t4)
                  lb           a5, 150(tp)
                  lb           s0, -1783(s9)
                  sb           tp, -857(s9)
                  la           t1, region_0+3192
                  la           a5, region_0+2449
                  la           gp, region_0+1813
                  lb           s2, -1746(a5)
                  lbu          s10, -65(t1)
                  sb           a2, -311(a5)
                  lb           s5, 7(gp)
                  sb           a6, -1488(a5)
                  lw           a2, -629(a5)
                  sh           s5, 198(t1)
                  sb           a0, 832(a5)
                  sb           s1, 4(gp)
                  lbu          sp, -173(a5)
                  lhu          t6, -9(gp)
                  lbu          t6, 1(gp)
                  lb           a7, 218(t1)
                  lbu          s2, -85(t1)
                  lbu          zero, -2(gp)
                  sb           t4, -494(a5)
                  sb           s11, 15(gp)
                  lbu          s8, -556(a5)
                  lbu          s10, -79(a5)
                  lw           s2, 7(gp)
                  sb           s5, -25(t1)
                  lb           ra, -4(gp)
                  lb           s3, 243(t1)
                  sb           t4, 5(gp)
                  sh           t3, -583(a5)
                  lbu          a4, 187(t1)
                  sb           s3, -12(gp)
                  la           a0, region_1+32698
                  la           sp, region_0+1315
                  lhu          a3, -248(a0)
                  sh           t5, -110(a0)
                  lbu          a5, -476(sp)
                  lh           s11, -66(a0)
                  lhu          t2, 859(sp)
                  sb           t6, -317(sp)
                  lb           s2, -172(sp)
                  sb           t4, -109(a0)
                  sb           ra, 354(sp)
                  sb           t3, -656(sp)
                  sb           t0, 1(a0)
                  lh           a3, 12(a0)
                  lbu          a4, 31(sp)
                  lb           s10, -141(a0)
                  sh           s11, -126(a0)
                  sb           s4, -71(a0)
                  addi         s8, zero, -5
                  addi         s11, t1, 124
                  sub          a5, s1, a2
                  addi         s3, zero, -12
sub_2_75_1_t:     slt          a2, s8, a1
                  addi         s8, s8, -7
                  slli         tp, zero, 12
                  sll          s2, t3, s0
                  addi         a3, zero, -2
                  sll          t5, s0, a2
                  addi         s9, zero, 6
sub_2_75_0_t:     slt          a4, a7, a1
                  addi         a3, a3, 1
                  nop
                  bltu         a3, s9, sub_2_75_0_t
                  srli         t4, a5, 2
                  beq          s8, s3, sub_2_75_1_t
                  xori         s4, a2, -1505
sub_2_27:         jal          ra, 15f
0:                jal          ra, 9f
1:                jal          t5, 11f
2:                jal          a7, 23f
3:                jal          ra, 6f
4:                jal          tp, 16f
5:                jal          ra, 4b
6:                jal          t1, 21f
7:                jal          sp, 0b
8:                jal          t1, 12f
9:                jal          ra, 5b
10:               jal          ra, 14f
11:               jal          ra, 20f
12:               jal          ra, 19f
13:               jal          ra, 3b
14:               jal          ra, 1b
15:               jal          t1, 22f
16:               jal          t1, 8b
17:               jal          t1, 13b
18:               jal          sp, 17b
19:               jal          t1, 18b
20:               jal          ra, 7b
21:               jal          t1, 2b
22:               jal          a4, 10b
23:               auipc        a7, 31504
                  la           s9, region_1+12539
                  la           a4, region_1+36349
                  lhu          a7, -459(a4)
                  lhu          tp, 1291(a4)
                  lbu          tp, 10(s9)
                  lb           t5, -1866(a4)
                  sh           s6, 7(s9)
                  lb           zero, -500(a4)
                  lb           s0, 3(s9)
                  sb           t3, 12(s9)
                  lbu          gp, 1757(a4)
                  lh           t3, -1603(a4)
                  sh           a3, 7(s9)
                  lbu          a5, -812(a4)
                  lbu          s4, -1357(a4)
                  sh           t0, -1(s9)
                  lhu          s1, -1407(a4)
                  la           sp, region_0+1012
                  sb           s11, 134(sp)
                  sltiu        a4, a4, -576
                  lbu          s9, -77(sp)
                  sub          a4, s9, t1
                  andi         s11, s10, -339
                  sb           t1, 183(sp)
                  slti         t1, s9, 433
                  srli         a3, t1, 26
                  lb           t1, -148(sp)
                  auipc        a4, 578415
                  srl          s9, s10, s9
                  sb           s10, -132(sp)
                  lbu          s11, 49(sp)
                  andi         s11, t1, -888
                  slt          t1, a3, s9
                  sh           t1, 22(sp)
                  lb           s11, -45(sp)
                  sb           a4, -251(sp)
                  xori         s9, a3, -958
                  add          s9, s10, a4
                  srl          t1, s9, a4
                  sb           t1, 136(sp)
                  sb           s10, 220(sp)
                  sra          s9, a3, s9
                  addi         t1, a3, -954
                  sh           a3, 2(sp)
                  lui          t1, 140091
                  lh           s10, 114(sp)
                  srl          a3, s10, a4
                  sb           s10, -85(sp)
                  sb           a4, -3(sp)
                  lbu          a4, -152(sp)
                  lbu          s11, -153(sp)
                  lbu          a3, -143(sp)
                  la           t3, region_0+3445
                  lh           t2, -9(t3)
                  lbu          gp, 2(t3)
                  lb           s4, 16(t3)
                  lb           a4, 16(t3)
                  lb           s1, 16(t3)
                  lb           a1, 8(t3)
                  lbu          a2, 8(t3)
                  auipc        a5, 414841
                  lb           sp, 8(t3)
                  sb           t0, 8(t3)
                  sb           a0, 8(t3)
                  lhu          s8, 3(t3)
                  sb           t3, 2(t3)
                  lb           s5, 9(t3)
                  lhu          a5, 9(t3)
                  lh           s2, 9(t3)
                  la           s0, region_1+44419
                  sh           s4, -45(s0)
                  xori         a2, s8, 19
                  xori         a2, t6, -45
                  sra          a2, s8, a2
                  srai         t3, s8, 17
                  lh           t3, -33(s0)
                  sll          s8, a2, t2
                  srli         a2, s4, 6
                  addi         t3, t6, 1389
                  lui          t6, 371285
                  sh           t2, -49(s0)
                  slti         t3, t2, -115
                  lui          t2, 833952
                  lhu          s4, -17(s0)
                  slti         t3, t6, -747
                  lb           t3, 58(s0)
                  lb           t3, -50(s0)
                  srli         t3, t2, 24
                  lb           t3, -46(s0)
                  sll          s8, a2, t3
                  lw           t6, 17(s0)
                  lw           s8, 13(s0)
                  lh           t6, -61(s0)
                  sb           t6, 46(s0)
                  sb           a2, -52(s0)
                  lb           t6, -30(s0)
                  lbu          s8, 6(s0)
                  ori          a2, t2, -817
                  sll          t3, t2, s8
                  srai         s8, t6, 7
                  and          t6, t3, t2
                  lh           s8, 61(s0)
                  lbu          t6, -50(s0)
                  lbu          t2, 7(s0)
                  sb           a2, 24(s0)
                  lbu          s8, 60(s0)
sub_2_22:         jal          ra, 1f
0:                jal          ra, 9f
1:                jal          ra, 3f
2:                jal          a7, 17f
3:                jal          t1, 11f
4:                jal          t3, 16f
5:                jal          ra, 19f
6:                jal          ra, 14f
7:                jal          ra, 21f
8:                jal          t1, 30f
9:                jal          ra, 27f
10:               jal          ra, 26f
11:               jal          ra, 29f
12:               jal          a4, 2b
13:               jal          ra, 20f
14:               jal          ra, 18f
15:               jal          t1, 8b
16:               jal          ra, 24f
17:               jal          ra, 7b
18:               jal          ra, 13b
19:               jal          tp, 23f
20:               jal          ra, 25f
21:               jal          s1, 22f
22:               jal          t2, 4b
23:               jal          ra, 12b
24:               jal          ra, 15b
25:               jal          ra, 5b
26:               jal          ra, 0b
27:               jal          ra, 6b
28:               jal          ra, 10b
29:               jal          t1, 28b
                  la           t1, region_1+51876
                  lb           s3, 7(t1)
                  la           a1, region_0+2069
                  lw           a0, -12(t1)
                  lb           a2, -1(t1)
                  lbu          t3, 2(a1)
                  lb           a4, -16(a1)
                  lh           s5, -4(t1)
                  lb           a4, 2(a1)
                  lbu          t3, -9(a1)
                  lb           tp, 10(t1)
                  sb           s8, 12(a1)
                  sb           a3, -9(t1)
                  lbu          t4, 1(t1)
                  sb           a2, -12(a1)
                  la           t2, region_0+1276
                  lb           s3, -16(t2)
                  lbu          a6, 16(t2)
                  ori          a6, t1, -534
                  lhu          a6, 16(t2)
                  sub          s0, s4, gp
                  addi         s10, s0, -558
                  lbu          a6, 15(t2)
                  ori          s8, sp, -1517
                  sh           s9, 6(t2)
                  lbu          sp, 6(t2)
                  lh           zero, 4(t2)
                  slti         s10, s7, -1039
                  lbu          a0, 1(t2)
                  lhu          a6, 2(t2)
                  lbu          t4, -2(t2)
                  sb           s7, 9(t2)
                  la           a7, region_0+3116
                  lbu          s4, 41(a7)
                  sb           s3, 41(a7)
                  lhu          t2, -82(a7)
                  lh           a0, -82(a7)
                  lbu          a4, -82(a7)
                  sh           s11, -82(a7)
                  sb           tp, -82(a7)
                  lb           s11, -67(a7)
                  lbu          t4, -67(a7)
                  lbu          s11, -67(a7)
                  lb           t3, -67(a7)
                  sb           a2, -67(a7)
                  lb           zero, -67(a7)
                  lui          s2, 1026190
                  lb           t2, -67(a7)
                  lb           t4, -67(a7)
                  la           sp, region_1+32533
                  lw           t2, 7(sp)
                  sw           s5, 183(sp)
                  srai         a0, a1, 15
                  lhu          a5, 5(sp)
                  lbu          a1, -250(sp)
                  srl          a6, a5, a0
                  sb           t2, -128(sp)
                  sltiu        s5, s5, 937
                  sw           a1, -33(sp)
                  slt          t2, s5, t2
                  lb           a5, -176(sp)
                  sltiu        t2, a6, -842
                  nop
                  lb           a0, 172(sp)
                  slti         a0, t2, -919
                  sb           s5, 220(sp)
                  sh           a5, -157(sp)
                  sb           a1, 254(sp)
                  addi         t2, s5, 283
                  slti         a1, t2, -1564
                  lb           a6, 145(sp)
                  and          t2, a5, a0
                  sb           s5, 106(sp)
                  lb           t2, -194(sp)
                  lbu          a0, 212(sp)
                  sra          a1, t2, a1
                  add          a0, a5, a0
                  sltu         s5, s5, t2
                  lb           a1, -108(sp)
                  or           s5, t2, a1
                  sb           a0, 108(sp)
                  srl          a6, s5, a5
                  lhu          a5, 15(sp)
                  sh           s5, -193(sp)
                  or           a0, a1, a6
                  lb           a5, 236(sp)
sub_2_28:         jal          ra, 10f
0:                jal          sp, 11f
1:                jal          ra, 6f
2:                jal          ra, 9f
3:                jal          ra, 5f
4:                jal          t1, 3b
5:                jal          a6, 12f
6:                jal          t1, 4b
7:                jal          ra, 2b
8:                jal          t1, 1b
9:                jal          ra, 0b
10:               jal          ra, 7b
11:               jal          s2, 8b
                  addi         a4, zero, -9
                  auipc        s10, 253771
                  addi         sp, zero, -19
                  addi         s3, t6, 692
sub_2_67_1_t:     slt          s2, t3, s6
                  add          s2, tp, t5
                  ori          a5, s4, 503
                  addi         a4, a4, -10
                  srl          a0, zero, t2
                  nop
                  auipc        s11, 815386
                  ori          zero, t3, -1417
                  srai         gp, gp, 22
                  ori          gp, s6, -1595
                  or           s9, t1, t2
                  srai         ra, s6, 17
                  sltiu        ra, a7, -1922
                  auipc        t3, 628785
                  addi         a2, zero, -2
                  sub          s1, t4, a6
                  addi         t5, zero, -3
sub_2_67_0_t:     slt          s1, s3, t2
                  andi         a5, t3, -1037
                  addi         a2, a2, -2
                  nop
                  bge          a2, t5, sub_2_67_0_t
                  xori         a1, a2, -158
                  sltiu        s2, s11, 744
                  lui          s8, 468052
                  beq          a4, sp, sub_2_67_1_t
                  srl          s8, s3, s1
                  la           t6, region_1+34301
                  la           s10, region_1+14049
                  lw           s4, 11(t6)
                  la           t5, region_1+44013
                  lb           s11, 1022(s10)
                  lbu          s2, 17(t5)
                  lbu          zero, 777(s10)
                  lb           a7, 0(t6)
                  la           t2, region_1+4201
                  sh           gp, -9(t2)
                  lb           s1, 993(s10)
                  lb           a0, 102(t5)
                  lbu          s4, 4(t2)
                  lw           a3, -5(t6)
                  lbu          s2, -178(t5)
                  sb           t1, -4(t2)
                  sb           a5, -11(t6)
                  sh           t2, 345(s10)
                  lbu          a1, 14(t2)
                  lbu          s0, -1193(s10)
                  sh           a3, -11(t6)
                  lbu          s11, -447(s10)
                  sb           s9, -4(t6)
                  lb           a1, -237(t5)
                  sb           s7, -16(t6)
                  lb           a5, -132(t5)
                  sb           s6, 81(t5)
                  lbu          t3, 302(s10)
                  lbu          a0, 130(t5)
                  lhu          s11, -9(t2)
                  sh           a0, 1(t6)
                  lb           s11, 27(t5)
                  lb           a0, 2(t6)
                  lb           t3, -6(t2)
                  sh           s0, -247(s10)
                  sb           t5, 202(t5)
                  sw           s0, 127(t5)
                  lbu          a2, 5(t2)
                  lbu          a4, 0(t6)
                  lb           s11, 1856(s10)
                  la           t4, region_0+1747
                  sb           s0, -420(t4)
                  lb           s8, 978(t4)
                  lhu          tp, -251(t4)
                  sll          t6, t2, s2
                  lw           a1, 545(t4)
                  lbu          s9, 1151(t4)
                  lb           zero, 900(t4)
                  sh           a4, 573(t4)
                  add          s0, a7, a7
                  sub          a5, s0, tp
                  andi         s8, sp, 1213
                  lb           a6, -384(t4)
                  andi         t2, a7, 665
                  lb           a4, 1764(t4)
                  sltu         s10, t0, gp
                  xor          a2, s3, t6
                  sb           a7, 214(t4)
                  lh           gp, -787(t4)
                  andi         a3, s8, 515
                  sb           a5, 262(t4)
                  auipc        gp, 498855
                  lh           s11, -321(t4)
                  sh           a0, -961(t4)
                  or           zero, s0, t0
                  lbu          s2, 640(t4)
                  lhu          a5, -889(t4)
                  sb           s11, -1726(t4)
                  sra          t6, s2, t2
                  lhu          s2, 1029(t4)
                  sw           s10, -1587(t4)
                  sb           sp, -1500(t4)
                  xori         a5, s6, 612
                  lh           a5, -871(t4)
                  srl          s1, t0, t4
                  lbu          t1, 828(t4)
                  ori          tp, t6, -812
                  lb           a2, 1979(t4)
                  or           a1, s5, s4
                  sltiu        t6, a2, 807
                  lb           s1, 2001(t4)
                  andi         s2, s10, -1763
                  sb           s6, 55(t4)
                  addi         s2, zero, 3
                  and          a4, s1, t5
                  and          ra, s9, s1
                  sub          t6, ra, s11
                  slt          a5, t3, s5
                  add          zero, t0, t4
                  srl          a6, zero, a7
                  ori          s11, a7, -50
                  addi         s3, zero, 12
sub_2_78_0_t:     add          gp, s9, t6
                  addi         s2, s2, 9
                  xori         sp, s4, 1303
                  beq          s2, s3, sub_2_78_0_t
                  sra          a4, a1, tp
                  la           gp, region_1+44668
                  lbu          a7, -1631(gp)
                  la           a0, region_0+3720
                  sb           a1, 105(a0)
                  lh           a1, -1658(gp)
                  lbu          t1, 51(a0)
                  sb           t5, -131(a0)
                  lh           t4, 1094(gp)
                  lb           t4, 232(a0)
                  lbu          zero, 75(a0)
                  lb           s8, 83(a0)
                  lbu          a1, 7(a0)
                  sb           s1, 443(gp)
                  lb           s8, -123(a0)
                  lhu          s1, -46(a0)
                  lb           s0, -704(gp)
                  lh           s11, 46(a0)
                  addi         s4, zero, 1
                  add          s9, s5, t2
                  xor          s1, s11, t1
                  auipc        s0, 934130
                  nop
                  addi         a6, zero, 11
                  addi         a0, a0, -826
                  sll          s1, s6, a2
                  addi         t6, s8, -1341
                  sll          t1, tp, a7
sub_2_68_0_t:     slti         s0, a2, -1928
                  srai         t6, ra, 28
                  addi         s4, s4, 10
                  beq          s4, a6, sub_2_68_0_t
                  slt          t3, ra, s4
                  la           ra, region_0+852
                  la           a0, region_1+28564
                  lb           s8, -1(a0)
                  lhu          t1, 6(ra)
                  lb           a1, 0(a0)
                  lbu          s10, 5(a0)
                  lb           t2, 9(a0)
                  lbu          tp, -14(ra)
                  sb           t2, -1(a0)
                  sb           a4, 5(ra)
                  lw           a6, 16(a0)
                  sh           zero, 10(ra)
                  sw           s4, -12(a0)
                  lbu          s0, 9(ra)
                  lb           zero, 1(a0)
                  la           a4, region_1+41982
                  sb           a1, 13(a4)
                  lb           a2, 13(a4)
                  lbu          t6, 13(a4)
                  lb           s10, 13(a4)
                  lb           s2, 13(a4)
                  lbu          s8, 13(a4)
                  lb           a2, 13(a4)
                  sb           s10, 13(a4)
                  andi         a0, a2, 69
                  sb           s1, 13(a4)
                  sb           t2, -1(a4)
                  sb           s7, -1(a4)
                  lbu          sp, -1(a4)
                  sb           t2, -1(a4)
                  lb           a1, -1(a4)
                  lb           a3, -1(a4)
                  lb           s0, -1(a4)
                  lbu          t6, -1(a4)
sub_2_23:         jal          ra, 0f
0:                jal          s0, 3f
1:                jal          ra, 10f
2:                jal          ra, 11f
3:                jal          ra, 8f
4:                jal          ra, 5f
5:                jal          t3, 9f
6:                jal          ra, 2b
7:                jal          ra, 1b
8:                jal          t1, 4b
9:                jal          ra, 7b
10:               jal          ra, 6b
11:               slt          s0, s11, s7
                  la           t5, region_1+22919
                  la           s0, region_0+3853
                  lbu          zero, -876(s0)
                  lb           s10, 2(t5)
                  sb           t0, -2(t5)
                  sb           a5, -131(s0)
                  lb           zero, -5(t5)
                  lbu          tp, -4(t5)
                  lb           t4, -118(s0)
                  sb           s5, -14(t5)
                  lbu          t1, -352(s0)
                  lbu          t6, -362(s0)
                  lbu          a5, -2030(s0)
                  lb           a7, 14(t5)
                  lbu          tp, -254(s0)
                  lh           s11, -377(s0)
                  sb           a2, -12(t5)
                  lbu          sp, 12(t5)
sub_2_29:         jal          ra, 7f
0:                jal          ra, 15f
1:                jal          ra, 16f
2:                jal          t1, 18f
3:                jal          a2, 20f
4:                jal          ra, 3b
5:                jal          ra, 26f
6:                jal          t1, 29f
7:                jal          t3, 9f
8:                jal          a4, 10f
9:                jal          ra, 21f
10:               jal          ra, 19f
11:               jal          tp, 0b
12:               jal          ra, 6b
13:               jal          t1, 5b
14:               jal          ra, 17f
15:               jal          t1, 13b
16:               jal          a3, 28f
17:               jal          ra, 30f
18:               jal          ra, 8b
19:               jal          a1, 11b
20:               jal          t1, 22f
21:               jal          t1, 23f
22:               jal          ra, 1b
23:               jal          ra, 25f
24:               jal          ra, 12b
25:               jal          t1, 2b
26:               jal          a0, 27f
27:               jal          a0, 4b
28:               jal          t1, 24b
29:               jal          t1, 14b
                  la           s11, region_0+1758
                  la           a2, region_0+3498
                  lh           s1, 30(s11)
                  lb           t1, 15(a2)
                  sb           s2, -41(s11)
                  lb           zero, -2(a2)
                  lb           ra, 32(s11)
                  lb           s3, -33(s11)
                  lbu          s8, -1(a2)
                  lb           s1, -13(a2)
                  lb           s5, -21(s11)
                  lbu          a3, -1(a2)
                  lb           a6, 14(s11)
                  sb           s1, 9(a2)
                  lb           s0, -3(a2)
                  la           sp, region_1+19496
                  lb           t2, 1(sp)
                  nop
                  lhu          a4, 6(sp)
                  lb           s4, 11(sp)
                  sh           t1, 10(sp)
                  sb           a2, -3(sp)
                  sh           s4, -12(sp)
                  lbu          a0, 2(sp)
                  srli         t2, s4, 12
                  nop
                  sb           a2, -13(sp)
                  lbu          s4, -1(sp)
                  sll          s4, a4, a2
                  lbu          a2, -1(sp)
                  lhu          t1, 14(sp)
                  sb           t2, -7(sp)
                  sub          t2, s4, t2
                  sb           a2, 11(sp)
                  add          t1, t2, t1
                  sb           a0, 9(sp)
                  lbu          a0, 15(sp)
                  lh           s4, -4(sp)
                  slli         s4, s4, 18
                  lbu          s4, 1(sp)
                  sw           a0, -12(sp)
                  and          t2, a0, a2
                  auipc        s4, 748213
                  sb           a4, -2(sp)
                  lb           a4, -3(sp)
                  xori         a0, s4, -7
                  lbu          t2, -15(sp)
                  srai         a0, a4, 23
                  nop
                  slli         a4, s4, 5
                  nop
                  xor          t2, a2, a4
                  nop
                  or           a0, t2, a0
                  lhu          t2, -10(sp)
                  lbu          t1, 15(sp)
                  addi         s10, zero, -10
                  addi         t1, zero, -11
sub_2_70_1_t:     sltu         s5, zero, a5
                  addi         s10, s10, -4
                  addi         a7, zero, 7
                  addi         sp, zero, 13
                  xori         a3, a1, 606
sub_2_70_0_t:     slt          s5, a0, t3
                  addi         a7, a7, 6
                  beq          a7, sp, sub_2_70_0_t
                  bge          s10, t1, sub_2_70_1_t
                  srai         s5, s9, 19
                  addi         s9, zero, 2
                  slti         a2, t4, 1684
                  srl          t2, ra, s10
                  addi         gp, zero, 17
                  and          s4, s10, a5
                  and          t2, s0, a4
sub_2_71_0_t:     slti         zero, a6, 763
                  addi         s9, s9, 3
                  sltiu        s3, s4, 389
                  beq          s9, gp, sub_2_71_0_t
                  sra          a3, s1, s8
                  la           sp, region_1+62608
                  sb           s5, -14(sp)
                  lhu          t3, -14(sp)
                  lbu          a0, 1(sp)
                  lbu          t4, 9(sp)
                  sub          t4, s3, t0
                  lh           s10, -6(sp)
                  lbu          s9, -11(sp)
                  and          a0, tp, zero
                  sub          a5, t3, s8
                  or           a0, s6, t6
                  sh           t2, 14(sp)
                  lw           t1, -16(sp)
                  slt          a4, a2, s4
                  sb           s11, -7(sp)
                  sll          gp, a4, t3
                  lb           t6, 16(sp)
                  and          s3, gp, s5
                  auipc        t2, 560805
                  slli         s1, s1, 18
                  addi         t1, ra, -1153
                  sltiu        s4, a0, -1652
                  lbu          a4, -15(sp)
                  lbu          s9, 13(sp)
                  lh           s3, 10(sp)
                  sw           t2, -12(sp)
                  lbu          zero, 1(sp)
                  lbu          t3, 5(sp)
                  sltiu        a2, zero, 1114
                  nop
                  xori         s1, s9, -1762
                  sb           a3, 14(sp)
                  andi         s11, s2, -293
                  sh           s4, -2(sp)
                  add          t1, s6, t1
                  lb           t5, 2(sp)
                  andi         ra, t2, 1198
                  lb           t6, 7(sp)
                  lbu          t3, -7(sp)
                  la           gp, region_0+1028
                  sb           s10, 254(gp)
                  lhu          t3, 254(gp)
                  lh           t6, -120(gp)
                  addi         s4, t6, 470
                  lbu          t5, -13(gp)
                  lbu          t3, 159(gp)
                  lb           s3, 159(gp)
                  lbu          a1, 225(gp)
                  sb           zero, 225(gp)
                  lbu          a6, -81(gp)
                  lbu          s0, 139(gp)
                  lbu          a3, 139(gp)
                  sb           s8, 229(gp)
                  lb           sp, -55(gp)
                  lbu          a1, -73(gp)
                  lb           s10, -73(gp)
                  lb           a0, -73(gp)
                  sub          a5, s8, a7
                  sb           sp, -73(gp)
                  lw           s10, -64(gp)
                  la           sp, region_1+32438
                  lbu          s0, 53(sp)
                  sh           s0, 0(sp)
                  lbu          a1, -55(sp)
                  sll          a1, a5, s5
                  lb           a5, -41(sp)
                  andi         a1, a1, -961
                  slt          s11, ra, a5
                  xor          a5, s5, ra
                  sh           a1, 42(sp)
                  sb           ra, 36(sp)
                  lb           a5, 50(sp)
                  srli         s11, s0, 5
                  lbu          s5, 20(sp)
                  sh           a5, 52(sp)
                  lb           a5, 36(sp)
                  lbu          s11, -4(sp)
                  ori          s0, a5, 406
                  sb           a5, 45(sp)
                  lb           s0, 59(sp)
                  or           s5, s11, s0
                  lw           s11, -14(sp)
                  slli         ra, a5, 13
                  sb           s0, 27(sp)
                  lh           a1, 4(sp)
                  sb           a1, -52(sp)
                  sra          s5, s11, ra
                  xori         ra, s5, -1950
                  auipc        a5, 1018879
                  sb           a1, -12(sp)
                  lui          s5, 174454
                  lb           a5, 48(sp)
                  andi         s11, ra, 73
                  lbu          a5, 1(sp)
                  lbu          ra, -9(sp)
                  slt          s0, a1, s0
                  lb           s5, -25(sp)
                  lh           a1, -16(sp)
                  sh           s5, -44(sp)
                  lbu          ra, -47(sp)
                  lbu          s11, 39(sp)
                  srl          s11, s0, s5
                  sh           s5, 42(sp)
                  lb           s5, 21(sp)
                  slli         ra, s0, 6
                  lb           s0, -19(sp)
                  la           a3, region_0+3663
                  la           t1, region_0+3553
                  lhu          a4, 15(a3)
                  lb           s3, 12(a3)
                  lhu          a5, -3(t1)
                  lb           tp, 12(t1)
                  sw           ra, -7(a3)
                  lh           s4, 11(t1)
                  lbu          s1, 0(a3)
                  sh           t3, -9(a3)
                  lbu          ra, -15(a3)
                  sb           s9, -1(a3)
                  lw           a4, -9(t1)
                  sb           t3, 15(a3)
                  lb           s1, 1(t1)
                  lb           s5, 3(t1)
                  la           s0, region_1+24130
                  lbu          s2, -871(s0)
                  lbu          s9, -871(s0)
                  lbu          a4, -871(s0)
                  sub          s8, t5, t1
                  sb           t5, -871(s0)
                  addi         s1, t0, 912
                  lbu          a3, 1249(s0)
                  lw           t6, 962(s0)
                  lw           ra, 962(s0)
                  lb           s9, -1885(s0)
                  lbu          ra, -1885(s0)
                  lb           a4, -1885(s0)
                  sb           s11, -1347(s0)
                  slti         t4, s7, 946
                  sb           ra, 143(s0)
                  lbu          t3, -5(s0)
                  lb           s5, -5(s0)
sub_2_19:         jal          ra, 10f
0:                jal          ra, 3f
1:                jal          ra, 15f
2:                jal          t1, 6f
3:                jal          sp, 22f
4:                jal          t1, 23f
5:                jal          ra, 11f
6:                jal          gp, 17f
7:                jal          ra, 2b
8:                jal          ra, 4b
9:                jal          a7, 8b
10:               jal          t1, 7b
11:               jal          sp, 9b
12:               jal          a1, 18f
13:               jal          ra, 21f
14:               jal          ra, 0b
15:               jal          ra, 5b
16:               jal          ra, 12b
17:               jal          ra, 13b
18:               jal          ra, 20f
19:               jal          ra, 24f
20:               jal          ra, 1b
21:               jal          ra, 14b
22:               jal          ra, 16b
23:               jal          a1, 19b
24:               xori         ra, s11, -263
                  la           a0, region_0+2304
                  sltu         t3, zero, s11
                  lb           t2, 99(a0)
                  and          a7, t0, a5
                  lb           a2, 99(a0)
                  sb           zero, 99(a0)
                  lbu          s2, -65(a0)
                  sb           s10, -55(a0)
                  lb           zero, -55(a0)
                  lb           t2, -177(a0)
                  addi         sp, s8, 1397
                  sh           s11, 86(a0)
                  lhu          ra, 86(a0)
                  lui          s3, 1037895
                  lbu          sp, 149(a0)
                  lbu          s4, 149(a0)
                  sll          a5, a6, t4
                  lhu          s5, 70(a0)
                  la           s4, region_0+1885
                  la           ra, region_1+33521
                  lbu          s1, 7(ra)
                  lbu          s3, -36(s4)
                  sb           t4, 2(s4)
                  lbu          s0, 14(ra)
                  lh           s0, 37(s4)
                  lb           s0, -10(ra)
                  sh           a6, 63(s4)
                  lbu          zero, -6(ra)
                  lbu          a6, 6(s4)
                  lh           s8, -7(ra)
                  lb           a3, -6(s4)
                  lbu          gp, 9(s4)
                  sb           s4, -24(s4)
                  lh           gp, 9(ra)
                  lb           zero, -11(ra)
                  sb           t1, -47(s4)
                  lb           sp, 21(s4)
sub_2_24:         jal          ra, 4f
0:                jal          ra, 1f
1:                jal          s8, 7f
2:                jal          t1, 5f
3:                jal          sp, 9f
4:                jal          gp, 3b
5:                jal          ra, 6f
6:                jal          ra, 11f
7:                jal          t1, 2b
8:                jal          ra, 10f
9:                jal          t1, 8b
10:               jal          ra, 0b
11:               xori         s5, a5, -1255
                  la           a5, region_0+1031
                  lbu          t1, 5(a5)
                  lh           t1, 5(a5)
                  lhu          a2, 45(a5)
                  lw           ra, 45(a5)
                  sb           s8, 45(a5)
                  lb           s9, 20(a5)
                  lbu          tp, 20(a5)
                  sb           s3, 26(a5)
                  lbu          t6, 26(a5)
                  sb           t1, 26(a5)
                  lbu          s10, -38(a5)
                  lb           zero, -38(a5)
                  sb           t1, 53(a5)
                  sh           t1, 53(a5)
                  lbu          s5, 53(a5)
                  lw           s4, 53(a5)
                  sltiu        s10, s3, 826
                  lb           s4, -9(a5)
                  lhu          a1, -9(a5)
                  addi         s0, zero, -4
                  addi         a1, zero, -9
sub_2_74_1_t:     andi         t6, s11, -736
                  addi         s0, s0, -7
                  addi         tp, zero, 9
                  sra          a0, s9, a2
                  addi         gp, zero, 7
sub_2_74_0_t:     addi         a5, zero, -466
                  sltu         sp, gp, s4
                  addi         tp, tp, -5
                  bgeu         tp, gp, sub_2_74_0_t
                  bge          s0, a1, sub_2_74_1_t
                  slt          sp, t0, s9
                  la           s11, region_1+16883
                  ori          a5, t6, 1700
                  lw           s0, -643(s11)
                  lb           a7, 290(s11)
                  lui          zero, 303727
                  srl          t3, t5, a5
                  sb           ra, 1019(s11)
                  sll          t4, t4, s8
                  lh           s2, -1367(s11)
                  sh           a5, 1807(s11)
                  srai         t4, s2, 3
                  lhu          a4, -1433(s11)
                  addi         zero, t3, 688
                  lbu          s5, 550(s11)
                  auipc        s5, 100091
                  xori         ra, s9, -927
                  xor          a3, a4, gp
                  lbu          a7, 1014(s11)
                  sll          zero, t5, t0
                  lhu          t1, -1727(s11)
                  lbu          a6, 1620(s11)
                  ori          a3, s5, -1626
                  sb           t0, 1344(s11)
                  lb           gp, -404(s11)
                  lbu          tp, -1398(s11)
                  lbu          s8, 1329(s11)
                  lh           t1, -591(s11)
                  xori         s5, a3, 139
                  lbu          t3, -1970(s11)
                  lb           t2, 1325(s11)
                  sb           s4, 994(s11)
                  lbu          a4, 1168(s11)
                  lb           t1, -934(s11)
                  lbu          s8, -256(s11)
                  add          s1, a2, s4
                  addi         a2, s9, -1771
                  lhu          s9, -33(s11)
                  lb           t5, 485(s11)
                  lbu          zero, -964(s11)
                  la           t5, region_1+23080
                  la           a2, region_0+856
                  lhu          s3, 198(a2)
                  sh           sp, -198(a2)
                  sb           a1, -11(a2)
                  lbu          sp, -13(t5)
                  lbu          a6, -33(a2)
                  lbu          s1, 7(t5)
                  lb           s10, -15(t5)
                  lh           t6, 144(a2)
                  lb           s0, -13(t5)
                  lbu          s3, -252(a2)
                  sb           a2, 11(t5)
                  lb           a3, -186(a2)
                  lb           t1, -191(a2)
                  la           s5, region_0+2805
                  lb           t4, 218(s5)
                  lb           a4, 218(s5)
                  lbu          a3, 218(s5)
                  lbu          t5, 218(s5)
                  lbu          s3, 218(s5)
                  lbu          a6, 218(s5)
                  lbu          s0, 218(s5)
                  sb           t5, 218(s5)
                  lb           t6, 218(s5)
                  sb           gp, 218(s5)
                  lbu          ra, 218(s5)
                  lbu          t6, 218(s5)
                  lbu          a2, 218(s5)
                  lbu          sp, 218(s5)
                  lbu          t6, 218(s5)
                  sb           gp, 218(s5)
                  sb           s2, 218(s5)
                  la           s8, region_1+36006
                  slt          s11, t0, s8
                  sb           a2, 77(s8)
                  sb           t0, 31(s8)
                  lhu          s0, 40(s8)
                  lb           s5, 47(s8)
                  lbu          s9, 89(s8)
                  sh           a5, -176(s8)
                  lb           t3, 138(s8)
                  sub          s4, t3, t1
                  srai         a5, s9, 1
                  sb           tp, -41(s8)
                  lb           s11, -199(s8)
                  lb           ra, -251(s8)
                  xori         a6, sp, 874
                  sltiu        t5, s8, -482
                  add          a3, gp, t1
                  lh           sp, -16(s8)
                  sb           t4, -199(s8)
                  sb           gp, 89(s8)
                  slti         t6, a4, -968
                  lui          s2, 681947
                  sll          s9, s6, t3
                  sb           s7, 72(s8)
                  sub          s10, t0, s4
                  and          s3, tp, t6
                  lbu          s11, 60(s8)
                  la           s10, region_0+3136
                  la           gp, region_1+47666
                  sb           t2, 9(s10)
                  lbu          t4, -43(s10)
                  sb           gp, 28(s10)
                  lb           a2, -61(s10)
                  lhu          s3, -42(gp)
                  lb           a0, 64(s10)
                  sb           s7, 37(s10)
                  lb           a7, -19(gp)
                  lhu          s5, -18(gp)
                  lh           a3, -30(gp)
                  sb           a5, 22(s10)
                  lbu          a5, -60(gp)
                  lb           a5, 51(s10)
                  lb           s9, -57(gp)
                  lbu          s11, -5(gp)
                  lhu          a6, 38(s10)
                  lhu          s11, -42(gp)
                  lb           s11, 49(gp)
                  lh           a3, 16(s10)
sub_2_20:         jal          ra, 1f
0:                jal          ra, 6f
1:                jal          t1, 12f
2:                jal          ra, 4f
3:                jal          ra, 13f
4:                jal          ra, 9f
5:                jal          tp, 11f
6:                jal          gp, 3b
7:                jal          ra, 8f
8:                jal          ra, 2b
9:                jal          t1, 5b
10:               jal          t1, 0b
11:               jal          sp, 10b
12:               jal          gp, 7b
13:               sltu         s5, s4, a5
sub_2_17:         jal          ra, 4f
0:                jal          ra, 1f
1:                jal          ra, 3f
2:                jal          ra, 20f
3:                jal          s0, 19f
4:                jal          tp, 7f
5:                jal          ra, 14f
6:                jal          ra, 15f
7:                jal          a1, 0b
8:                jal          ra, 6b
9:                jal          ra, 8b
10:               jal          s8, 12f
11:               jal          ra, 9b
12:               jal          t1, 2b
13:               jal          t1, 17f
14:               jal          a5, 11b
15:               jal          ra, 13b
16:               jal          ra, 18f
17:               jal          s2, 10b
18:               jal          ra, 5b
19:               jal          ra, 16b
                  addi         gp, zero, 4
                  srli         a6, s3, 29
                  addi         s11, zero, 20
sub_2_79_1_t:     andi         t5, a0, 1981
                  auipc        sp, 590930
                  addi         gp, gp, 1
                  slti         t1, t3, 1812
                  addi         t3, zero, 4
                  addi         t6, zero, 14
sub_2_79_0_t:     sltu         a4, s6, a4
                  addi         t3, t3, 4
                  slt          s3, t3, a4
                  bltu         t3, t6, sub_2_79_0_t
                  slt          s2, gp, s5
                  sll          s4, tp, s0
                  ori          t2, t6, -551
                  ori          s10, t6, 58
                  addi         a0, s1, -1100
                  ori          a6, sp, -160
                  sll          t4, t4, a3
                  xori         s9, a0, 1815
                  nop
                  blt          gp, s11, sub_2_79_1_t
                  la           s4, region_0+3708
                  lui          s0, 579862
                  lw           t1, -60(s4)
                  srl          t5, gp, s1
                  slti         ra, t5, 1651
                  sb           a0, -15(s4)
                  srli         a5, tp, 3
                  xor          t3, zero, s9
                  lui          s3, 414301
                  lh           a3, -16(s4)
                  add          s5, s6, t5
                  sb           s8, -25(s4)
                  addi         s3, a4, 540
                  lb           s8, -35(s4)
                  srai         t4, s3, 31
                  sb           s2, 19(s4)
                  sb           s4, -63(s4)
                  lbu          t6, -27(s4)
                  lw           s5, 20(s4)
                  sltu         t2, t6, s3
                  lbu          t4, 33(s4)
                  sltiu        t4, t3, -1138
                  lw           a3, 36(s4)
                  xori         a5, a1, -1351
                  lui          a0, 416835
                  sub          a7, s2, s11
                  lb           a4, -29(s4)
                  nop
                  lb           s11, -57(s4)
                  auipc        s10, 819435
                  lh           a0, 22(s4)
                  lb           s3, 27(s4)
                  slt          t2, s10, t5
                  nop
                  sw           t2, -4(s4)
                  sb           t0, -13(s4)
                  sltu         s0, s4, gp
                  sb           a1, 30(s4)
                  addi         zero, t4, -611
                  lb           t1, 21(s4)
                  srai         a2, a7, 23
                  lbu          t6, -63(s4)
                  addi         ra, zero, 8
                  slli         s8, t0, 20
                  addi         s2, zero, 10
sub_2_73_1_t:     sltiu        tp, s7, -1868
                  addi         ra, ra, 2
                  sltiu        sp, a5, 917
                  auipc        gp, 460885
                  addi         s0, zero, -2
                  sll          tp, t4, t2
                  srai         t6, a0, 8
                  addi         a2, zero, -10
                  slt          s10, t0, sp
sub_2_73_0_t:     or           t1, ra, a4
                  add          s11, s6, s2
                  addi         s0, s0, -4
                  beq          s0, a2, sub_2_73_0_t
                  ori          s8, ra, 792
                  nop
                  bltu         ra, s2, sub_2_73_1_t
sub_2_26:         jal          ra, 0f
0:                jal          t1, 18f
1:                jal          ra, 6f
2:                jal          t1, 5f
3:                jal          tp, 15f
4:                jal          t1, 3b
5:                jal          ra, 16f
6:                jal          ra, 17f
7:                jal          ra, 1b
8:                jal          ra, 9f
9:                jal          t5, 7b
10:               jal          sp, 13f
11:               jal          gp, 14f
12:               jal          t1, 11b
13:               jal          t1, 8b
14:               jal          ra, 10b
15:               jal          ra, 2b
16:               jal          s3, 12b
17:               jal          t6, 20f
18:               jal          ra, 19f
19:               jal          s8, 4b
20:               addi         zero, zero, 298
                  la           s8, region_1+58477
                  sb           s0, -82(s8)
                  nop
                  lb           a3, 149(s8)
                  sb           s0, -28(s8)
                  add          t6, t3, t6
                  lb           s0, 242(s8)
                  nop
                  sb           t3, -126(s8)
                  lb           t3, -256(s8)
                  and          a0, a7, t6
                  auipc        t6, 147150
                  lhu          a3, -13(s8)
                  lbu          a7, -138(s8)
                  lhu          a0, 205(s8)
                  slli         a7, a0, 11
                  srli         t6, a0, 14
                  lb           t3, -225(s8)
                  lhu          a7, -235(s8)
                  xori         t3, a0, -224
                  sll          a7, a3, a0
                  lw           t3, -97(s8)
                  lbu          s0, -184(s8)
                  slli         a7, t3, 11
                  lw           a3, -77(s8)
                  lb           s0, 20(s8)
                  sb           t3, 14(s8)
                  slti         a7, a3, 178
                  sb           s0, 70(s8)
                  sb           s0, -119(s8)
                  slt          t6, a3, t3
                  lb           a3, -34(s8)
                  lbu          s0, 204(s8)
                  auipc        a3, 52333
                  xor          t6, t3, a7
                  lb           t3, -74(s8)
                  lbu          t6, 224(s8)
                  sw           a0, -41(s8)
                  sb           t6, 27(s8)
                  sll          t3, t6, a3
                  sw           t3, 191(s8)
                  sltiu        t3, s0, -1277
                  lb           t3, -227(s8)
                  add          t3, t6, s0
                  lbu          t6, 175(s8)
                  la           a3, region_1+4079
                  lb           s0, 13(a3)
                  la           t6, region_0+3431
                  lh           s4, -3(t6)
                  lb           t2, 56(a3)
                  lhu          t1, -11(t6)
                  lw           zero, 17(a3)
                  lbu          t4, 58(a3)
                  lb           s5, 16(t6)
                  sb           a5, -22(a3)
                  lb           a2, -16(t6)
                  lb           s0, -2(a3)
                  lb           sp, -6(t6)
                  lh           a7, 31(a3)
                  lbu          a2, -16(a3)
                  sb           s5, -16(t6)
                  lhu          t3, 47(a3)
                  lb           a0, -14(t6)
                  lbu          tp, 6(t6)
                  addi         ra, zero, -9
                  addi         t3, zero, -2
                  addi         s8, sp, 1768
sub_2_66_1_t:     slt          a7, zero, t3
                  addi         ra, ra, 7
                  addi         a3, zero, -3
                  addi         s5, zero, 18
sub_2_66_0_t:     auipc        a5, 186905
                  sra          t6, s6, t5
                  addi         a3, a3, 1
                  blt          a3, s5, sub_2_66_0_t
                  sltiu        a7, t6, -1020
                  bne          ra, t3, sub_2_66_1_t
                  sltiu        a6, s2, 1616
                  srli         a6, s11, 0
                  srli         s11, s4, 18
                  xor          a6, s4, t2
                  xor          s9, a4, a6
                  bgeu         s11, t1, 17f
                  nop
                  sltu         s11, tp, t2
                  andi         t1, s9, -56
                  slli         s10, a6, 12
                  sll          s1, s4, t3
                  lui          tp, 945400
                  srli         s10, a7, 12
                  sll          s11, a0, a0
17:               or           s9, t2, zero
                  srai         a0, s3, 9
                  addi         t1, a4, 1660
                  xori         t1, t2, 689
                  or           a6, a3, gp
                  bne          s3, s1, 41f
                  addi         a5, zero, -1527
                  sra          t1, gp, s3
                  beq          t0, gp, 40f
                  sra          t6, s4, t0
                  sra          s3, a0, gp
                  srai         s2, s9, 15
                  addi         s2, s11, -1711
                  sra          t6, a4, sp
                  and          gp, s2, t5
                  srai         s4, ra, 31
40:               sll          a7, t4, t5
41:               srl          a2, s8, a1
                  srl          t4, s8, s0
                  beq          s9, zero, 44f
                  sltu         a1, a3, s0
                  andi         a6, s1, 2044
                  srli         t4, s1, 22
                  xori         t1, a1, -1645
                  sltu         t6, t2, a1
                  sub          t1, tp, s9
                  sra          s1, a4, sp
                  blt          t1, a7, 60f
                  bgeu         t0, t0, 60f
                  xori         s4, s6, 1860
                  slli         t3, a6, 19
                  xor          s3, s7, s9
60:               andi         zero, zero, -154
                  nop
                  auipc        a2, 172577
                  sub          s11, s2, s9
                  sra          a1, a4, t1
                  bltu         s7, s4, 87f
                  add          t3, s3, s6
                  or           t6, gp, ra
                  addi         gp, s7, 829
                  sra          a1, a4, s11
                  srai         a5, t2, 15
                  sub          zero, sp, ra
                  nop
                  slli         a5, t2, 22
                  sltiu        gp, t4, 1052
                  bgeu         t2, t5, 98f
                  andi         gp, s1, 2011
                  ori          s8, tp, -1781
                  bgeu         a2, s4, 101f
                  srai         s10, s7, 19
                  lui          ra, 979285
87:               bge          a2, a0, 94f
                  slti         sp, t3, -1434
                  slti         t6, a6, 1195
                  nop
                  and          ra, s11, ra
94:               andi         a5, tp, 1068
                  andi         s3, s0, 1689
                  srai         s5, a4, 15
                  srai         t3, a5, 6
98:               slli         a3, s7, 27
                  addi         a4, t1, 214
                  xor          t6, t6, gp
101:              auipc        ra, 96236
                  bne          s8, s6, 115f
                  sltiu        tp, gp, 656
                  addi         tp, s5, 868
                  or           s3, t4, a3
                  bge          t5, a2, 123f
                  bgeu         a1, zero, 125f
                  blt          ra, t1, 122f
                  bne          s4, s11, 116f
                  srli         a3, t0, 17
                  slt          s2, s9, a5
                  beq          a3, a2, 115f
115:              auipc        s1, 551958
116:              lui          s2, 1041491
                  lui          t6, 649267
                  srl          ra, s0, t0
                  add          t3, a0, t0
                  srl          ra, a0, s4
122:              srli         t5, s5, 13
123:              sltu         s11, s8, s9
                  sll          s11, s4, a2
125:              sltiu        tp, s4, -240
                  and          s0, s7, sp
                  bne          t5, t0, 130f
130:              and          t5, s9, t0
                  or           s3, t4, s0
                  andi         t3, a0, -1121
                  sltiu        s0, gp, -1998
                  srli         s5, s11, 22
                  addi         t5, t0, 1414
                  sll          t6, t3, a6
                  sltiu        t2, s4, 158
                  blt          s1, s10, 156f
                  or           gp, zero, a5
                  sll          t6, s7, s7
                  sltu         s0, a3, a2
                  nop
                  bltu         a1, a6, 154f
                  or           a7, a5, a5
                  slli         s4, s6, 14
                  bne          s7, t6, 168f
                  andi         sp, s3, -1566
                  bltu         s9, s7, 166f
                  srli         t1, a5, 11
                  sub          a5, a7, t5
                  slti         gp, zero, -1809
                  xor          t6, s10, t1
                  xori         s3, a0, -1602
                  sltu         ra, s4, t1
                  lui          t1, 457663
                  xori         t4, a6, 117
                  lui          t4, 444650
                  andi         s9, zero, 1946
166:              add          t6, a6, s4
                  srl          t5, s6, s7
168:              beq          sp, s7, 177f
                  blt          a5, s4, 186f
                  slti         t3, s4, -1850
                  srai         s5, s6, 5
                  auipc        a7, 159745
                  srai         t3, s8, 1
                  bgeu         tp, t0, 196f
                  auipc        s3, 838593
                  addi         a4, t5, -967
                  add          a5, a0, t0
                  slli         a2, s9, 7
                  ori          s9, s0, 193
186:              srl          gp, s7, s7
                  and          s10, a2, t1
                  sub          a2, a1, t6
                  bgeu         s2, t5, 191f
                  slli         ra, ra, 0
191:              slt          s11, a6, s9
                  andi         s4, a3, -417
                  auipc        s3, 314086
                  and          t6, t1, s2
                  srli         t5, s8, 2
196:              andi         t4, s6, 1614
                  slt          s5, t4, zero
                  auipc        s1, 971016
                  bgeu         sp, s8, 217f
                  blt          s4, a7, 208f
                  or           t1, t4, s9
                  sub          t3, gp, t5
                  slt          a2, s8, t4
                  sub          tp, t5, s7
                  or           a2, a5, t0
                  slt          a7, s10, s0
                  beq          t2, s4, 212f
                  addi         s1, zero, 204
212:              lui          t5, 774508
                  xor          s2, s3, s3
                  ori          t2, t3, -1117
                  addi         t4, a6, -1059
                  srai         t2, s5, 12
                  blt          a4, sp, 231f
                  xor          s0, s4, s11
                  sll          s5, a5, t1
                  slt          s2, t5, s0
                  bge          t3, s0, 230f
                  lui          t6, 690393
                  bgeu         gp, a3, 227f
227:              srai         s1, t2, 11
                  blt          a5, tp, 230f
                  auipc        a2, 939813
231:              slt          gp, t3, zero
                  bge          s5, s4, 240f
                  addi         s2, t1, 1735
                  lui          s11, 331535
                  bltu         t4, tp, 252f
                  beq          t2, a3, 246f
                  beq          a7, gp, 250f
                  srli         s1, s9, 4
                  add          t2, s5, s2
240:              srl          a6, zero, a3
                  lui          s5, 114833
                  nop
                  slti         gp, t0, -1256
                  xor          a7, s5, s3
                  srai         a4, a4, 4
                  sltu         a7, s2, tp
                  auipc        a7, 454319
252:              nop
                  ori          sp, s2, 769
                  slti         s5, s4, -1396
                  bge          s8, s3, 256f
                  sll          sp, s1, t1
                  xori         s3, tp, -240
                  sltiu        s1, a2, 487
                  addi         s0, s0, 1039
                  addi         s9, s3, -21
                  beq          t4, a1, 276f
                  or           t4, s8, a3
                  bge          a4, t5, 271f
                  addi         a1, s2, -1850
                  beq          a3, s5, 285f
                  srli         t5, tp, 26
                  sltu         tp, t6, ra
                  bgeu         t2, a4, 281f
271:              slli         tp, s10, 13
                  sra          a5, a5, a6
                  or           s5, a7, a4
                  sll          t4, s10, t4
                  blt          sp, a0, 293f
276:              sra          gp, a5, t4
                  nop
                  add          a2, s0, s6
                  slli         t2, t6, 14
                  lui          s4, 750871
281:              sltu         a0, s2, s5
                  addi         t5, zero, -956
                  and          t1, sp, s3
                  sltiu        t6, s9, 624
285:              bge          t5, a1, 298f
                  bge          s0, s8, 306f
                  and          a2, gp, tp
                  slt          s1, a4, s7
                  lui          t2, 213071
                  sltiu        gp, t2, 691
                  sra          s4, s4, tp
                  add          a0, t1, a3
293:              srl          a6, a4, t4
                  bltu         gp, s7, 300f
                  sub          a3, s9, s4
                  bge          zero, t1, 303f
298:              sltiu        s0, t3, 1217
                  srl          ra, s8, a4
300:              xori         t4, s6, 694
                  srai         s11, a6, 9
                  ori          s10, s11, -39
303:              andi         a3, s3, -870
                  beq          s10, s0, 314f
306:              beq          s9, sp, 317f
                  bne          s5, s6, 322f
                  add          s2, s10, gp
                  sltiu        s0, t0, 328
                  bltu         t3, s11, 330f
                  bgeu         a5, t2, 315f
314:              sll          a6, s3, a7
315:              andi         t6, s0, 1339
                  slti         t2, a3, -4
317:              bge          sp, s6, 334f
                  auipc        sp, 1014046
                  slli         t4, a1, 15
                  bge          s8, a5, 328f
322:              xori         s0, s5, 1258
                  bgeu         ra, s0, 328f
                  auipc        gp, 1034377
                  srai         t1, s11, 7
                  ori          s1, s9, -1726
                  beq          s9, s1, 347f
328:              slt          t3, t5, t6
                  or           t4, gp, s11
330:              add          a5, s6, s6
                  slli         t4, sp, 3
                  srli         t1, t2, 8
334:              bgeu         s3, s9, 335f
335:              ori          s9, s5, -1327
                  auipc        tp, 780815
                  bge          a6, zero, 353f
                  or           a6, ra, s0
                  or           a4, zero, s9
                  sra          s1, s1, s7
                  xor          s9, zero, ra
                  xori         a3, a3, 1264
                  slt          sp, t3, zero
347:              lui          a4, 771385
                  sra          t4, s4, gp
                  sub          a3, s11, s3
                  add          ra, s11, a5
                  addi         a7, a6, 1580
353:              auipc        a7, 778966
                  sltu         a0, s5, t2
                  srl          gp, t5, s4
                  andi         t5, t4, -733
                  srl          s11, s7, s1
                  sll          s2, s10, s0
                  srai         s11, s4, 29
                  add          s8, s5, s8
                  sltu         t5, t6, s8
                  add          s2, t4, t2
                  andi         a6, a0, 1232
                  srl          a6, s2, s0
                  sltu         t4, ra, sp
                  bne          t1, a4, 385f
                  auipc        a2, 635849
                  bgeu         a4, a5, 388f
                  sltu         t2, a3, t2
                  sub          t3, a7, gp
                  bgeu         s2, s8, 392f
                  slli         s0, s5, 21
                  sll          t5, sp, a5
                  sltu         gp, sp, zero
                  xor          a2, a4, zero
                  bgeu         s8, s10, 397f
                  slti         gp, sp, 2020
                  bge          t4, a4, 397f
385:              sub          a2, zero, t3
                  sll          s3, a4, t1
                  slli         a3, tp, 4
388:              sra          a7, a5, s8
                  slti         a7, tp, 633
                  and          t3, a0, zero
                  la           a1, region_0+3284
                  lbu          s5, -205(a1)
                  slt          s9, a2, s4
                  sb           a5, -199(a1)
                  lb           a2, 23(a1)
                  xori         s4, s4, -1331
                  srl          a5, s5, s4
                  sb           s9, -199(a1)
                  sb           s4, -141(a1)
                  lhu          s4, -182(a1)
                  lb           s4, -62(a1)
                  lb           s9, -217(a1)
                  sb           a2, 9(a1)
                  auipc        a2, 277669
                  sh           tp, -172(a1)
                  sra          a2, s9, a2
                  lb           tp, -47(a1)
                  and          s9, a5, s5
                  slt          a2, tp, s5
                  ori          s4, tp, -1651
                  lb           tp, 81(a1)
                  lhu          a2, -216(a1)
                  lh           tp, 174(a1)
                  lb           s9, -51(a1)
                  sb           s9, 233(a1)
                  slli         s9, a2, 24
                  sltiu        s5, a2, -15
                  sb           s4, 229(a1)
                  lbu          a2, -82(a1)
                  lbu          a5, 222(a1)
                  lbu          s9, -187(a1)
                  slli         s5, tp, 8
                  srli         tp, s4, 23
                  addi         s5, s4, -1335
                  lb           s9, 125(a1)
                  srl          a2, s9, a5
                  lbu          a2, -60(a1)
                  sb           s9, -243(a1)
                  sw           s9, 232(a1)
                  lbu          a2, -16(a1)
                  sw           s4, 196(a1)
                  ori          a2, a5, -1721
                  lbu          s4, 247(a1)
                  slti         t1, gp, 1842
                  xor          t2, s0, t1
397:              sub          a4, t5, s10
                  slt          t3, t3, t3
                  srai         s3, a7, 22
                  srli         s1, t1, 12
                  or           t2, s2, a6
                  sll          a7, a0, s5
                  sll          a6, gp, s3
                  sub          t5, s3, t1
                  beq          a2, a6, 419f
                  sra          a1, s2, s8
                  blt          a4, s7, 418f
                  xori         a7, a3, 1148
                  andi         s2, a4, 643
                  srli         a4, a6, 2
                  ori          s10, zero, -1299
418:              slt          tp, a7, zero
419:              addi         sp, tp, -1803
                  lui          tp, 978974
                  xori         a5, a3, -1656
                  or           a6, a6, t6
                  slli         t3, s6, 6
                  slt          s3, s5, s9
                  slli         gp, s0, 14
                  srli         s1, t5, 21
                  bge          t4, s3, 451f
                  slt          sp, t1, a2
                  sll          t1, a4, s8
                  beq          tp, zero, 440f
440:              bltu         zero, a6, 446f
                  sll          t6, a7, t0
                  sll          s8, tp, a2
                  lui          s2, 895347
446:              sra          t4, s11, a0
                  slti         a0, a1, -1771
                  xor          gp, s11, a6
                  slt          s8, a7, a3
                  xori         t1, s3, 587
451:              slli         sp, s1, 1
                  slt          a4, s3, a2
                  and          sp, s1, s3
                  bne          a6, s4, 474f
                  slti         s2, t2, 1840
                  xor          gp, s9, t1
                  addi         a2, a7, -1825
                  or           sp, s10, ra
                  xor          a1, a3, t5
                  ori          s3, s7, -1773
                  sltiu        a2, s8, 829
                  lui          s11, 630801
                  nop
                  slt          s5, zero, s7
                  sltu         a5, s2, a2
                  andi         t2, sp, 1339
                  or           t4, ra, t0
                  and          a5, a0, s4
                  bne          s6, s2, 489f
                  slti         t2, a6, -524
474:              slti         s1, s10, 1537
                  bge          sp, a5, 493f
                  addi         t4, s3, -1023
                  srl          s5, s11, s2
                  slti         s11, s5, -1851
                  beq          s9, s0, 498f
                  andi         s9, gp, -1794
                  bgeu         s1, s10, 500f
                  ori          a0, s2, -1742
                  sub          s11, tp, s5
                  slti         s11, t3, 1831
                  slti         a6, ra, 83
                  srli         zero, a7, 19
489:              xor          s4, t4, a1
                  or           t3, t4, t2
                  bltu         a7, a2, 511f
                  xori         s9, a4, 1387
                  auipc        s2, 7232
                  sub          s8, a2, t3
                  add          ra, t0, a5
500:              sltiu        t4, s9, 962
                  add          a4, a2, a6
                  slti         gp, s5, -1691
                  sub          a1, t2, t3
                  sltiu        t5, zero, -1831
                  sltu         a0, a6, t5
                  bgeu         t1, a7, 509f
509:              nop
                  srai         t2, a6, 15
511:              auipc        s11, 824892
                  slt          t1, t1, a4
                  slti         s11, a1, -813
                  bne          t2, t0, 515f
515:              blt          s5, ra, 528f
                  sltu         tp, s2, a6
                  lui          a4, 280116
                  bltu         a4, t4, 528f
                  srai         s1, a6, 12
                  bne          s11, s8, 534f
                  bltu         a3, s3, 528f
                  beq          s6, a7, 542f
                  srl          a2, tp, s9
                  sra          a5, s11, a7
                  ori          s9, ra, -710
528:              or           gp, a3, t3
                  srli         a7, s2, 31
                  sub          sp, a3, s8
                  bne          a4, s11, 549f
                  bltu         t3, a2, 549f
                  xor          t5, s2, gp
534:              beq          t1, zero, 536f
                  srai         a4, sp, 25
536:              auipc        s9, 999977
                  bge          t0, a6, 539f
                  xor          a3, a5, a1
                  lui          s1, 1001997
                  sltiu        t4, s9, -702
542:              sll          a5, t3, t0
                  beq          a0, s4, 556f
                  and          a3, t3, t2
                  sra          a2, a0, a0
                  xori         s10, s3, -369
                  srl          s8, s11, a6
                  or           a3, ra, s8
                  xori         a0, a4, 687
                  or           a6, s10, a5
556:              sub          s4, a3, a3
                  lui          s11, 948696
                  ori          s9, s5, -1348
                  sub          s5, a4, a7
                  sltu         t2, t5, a5
                  la           t2, region_1+13043
                  lb           s2, -13(t2)
                  lbu          t4, 10(t2)
                  lb           a5, -12(t2)
                  lh           gp, -7(t2)
                  lb           s4, 14(t2)
                  slti         a5, s9, -1076
                  sltu         gp, t5, tp
                  sb           s6, -7(t2)
                  sb           a2, -6(t2)
                  lbu          t4, 16(t2)
                  sb           zero, 12(t2)
                  lbu          a7, -4(t2)
                  sh           t6, -15(t2)
                  sb           a1, 10(t2)
                  sw           t0, -11(t2)
                  sb           t3, -16(t2)
                  lbu          s9, 16(t2)
                  lb           s1, 13(t2)
                  lb           a5, 12(t2)
                  slli         a6, s11, 8
                  sh           t3, -3(t2)
                  xori         s8, s11, -208
                  sub          s3, s0, s11
                  srai         a7, t4, 22
                  lb           t5, -2(t2)
                  ori          s9, a7, 1857
                  sb           t5, 8(t2)
                  lbu          a0, -8(t2)
                  lw           t3, 9(t2)
                  lb           a4, 12(t2)
                  lb           t4, 6(t2)
                  lbu          s4, -16(t2)
                  and          s11, s8, a6
                  lb           s4, -8(t2)
                  sb           a4, -11(t2)
                  sltiu        s4, sp, -381
                  srai         t5, t1, 25
                  srai         t4, t5, 11
                  lh           ra, -15(t2)
                  slli         a3, s2, 27
                  lhu          a3, -5(t2)
                  beq          s4, a2, 578f
                  srai         a3, s10, 15
                  blt          tp, s4, 570f
                  srli         s2, a2, 9
                  bgeu         s1, a1, 574f
                  sltu         gp, zero, a3
                  srli         sp, t6, 18
                  bltu         s11, s2, 574f
570:              add          ra, t2, s9
                  nop
                  blt          t3, zero, 581f
                  srl          a3, sp, gp
574:              sltiu        zero, t2, 800
                  add          a5, a6, s8
581:              blt          s5, s0, 598f
                  beq          t1, s2, 600f
                  bne          t4, t0, 602f
                  andi         a5, s7, 187
                  andi         a6, t5, -551
                  bgeu         s0, a0, 594f
                  addi         a5, t2, 1280
                  xor          t6, t1, sp
                  slli         tp, a3, 20
                  slti         s3, s7, -1147
                  sltu         s5, tp, sp
594:              slti         gp, a1, 1616
                  addi         gp, a3, 1627
                  sltiu        a1, s10, -1793
                  andi         t2, ra, 1411
598:              sltiu        s10, a2, -236
                  sltiu        s11, s0, -1133
602:              slli         s5, a4, 20
                  auipc        s10, 904044
                  and          s8, sp, a5
                  bltu         s4, gp, 607f
607:              andi         s1, t0, 924
                  bgeu         sp, t1, 610f
                  sll          t3, t0, a0
610:              sra          s10, a4, s11
                  srl          s8, t3, t2
                  auipc        zero, 928667
                  srli         t6, t5, 7
                  bge          t5, s2, 624f
                  slt          a4, s8, t0
                  srl          t1, s11, a0
                  slli         s1, t6, 30
                  slti         zero, a3, 1812
                  sltu         tp, a6, a6
624:              addi         a3, s9, 306
                  xor          s0, s8, s11
                  slti         ra, a4, -939
                  add          s3, t5, t6
                  sub          a2, a2, s11
                  bne          s8, a2, 631f
                  sra          ra, t6, s10
631:              srai         tp, sp, 0
                  nop
                  lui          s8, 717210
                  bne          tp, sp, 642f
                  auipc        a2, 883527
                  andi         a3, t0, 625
                  srli         t1, tp, 3
642:              slli         s10, a1, 2
                  lui          s5, 880029
                  slti         a6, a0, 1731
                  sll          a4, s10, a6
                  bltu         s11, gp, 648f
648:              addi         a1, s10, 17
                  sub          zero, a0, a7
                  sltu         s4, s2, ra
                  or           a6, zero, s0
                  srai         a2, zero, 26
                  slti         s9, s11, -1536
                  addi         tp, t5, -540
                  or           t2, gp, s8
                  nop
                  lui          zero, 971485
                  sub          gp, t4, t5
                  bgeu         s4, t2, 670f
                  sub          a0, s1, tp
                  andi         a6, s9, 197
                  bgeu         s4, a5, 681f
                  ori          t1, a6, -1630
                  blt          a3, a0, 686f
                  beq          s10, t4, 682f
670:              slti         t2, t1, 707
                  beq          t3, s4, 691f
                  blt          t0, s2, 678f
                  sub          s11, a1, s5
                  slt          a5, a2, sp
                  sltiu        s10, a1, -1081
                  sltiu        a6, t5, -1168
678:              nop
                  sll          a3, tp, sp
                  sub          s5, sp, a3
681:              nop
682:              bgeu         t5, ra, 688f
                  sltiu        s10, s6, 724
                  slt          a4, a4, s11
686:              bge          s2, s9, 691f
                  sub          ra, zero, zero
691:              or           s9, tp, a0
                  blt          s3, s9, 710f
                  blt          a1, a1, 696f
696:              xori         gp, tp, -1887
                  srl          ra, s3, a0
                  sltu         a7, s11, a2
                  bltu         s0, a4, 710f
                  srli         a5, a4, 6
                  auipc        a6, 855067
                  srl          t1, s3, t0
                  add          t5, t0, s8
                  lui          s8, 469492
                  blt          s4, a3, 724f
                  andi         a2, gp, 550
                  bne          s1, s11, 717f
710:              sltu         sp, a6, t5
                  srai         t4, s2, 0
                  sltu         s3, a2, t5
                  beq          a2, t4, 726f
                  xor          ra, sp, t1
                  blt          sp, s6, 731f
717:              sltu         s0, s0, a0
                  slti         s9, t6, 126
                  sltiu        a0, t5, 1388
726:              bltu         a7, t0, 737f
                  slli         s0, s3, 3
                  lui          a7, 579533
                  beq          s5, s8, 748f
731:              sll          a1, gp, tp
                  bge          t0, s11, 746f
                  slt          a1, s5, s1
                  bltu         s8, s7, 754f
737:              bge          t6, s10, 757f
                  lui          s8, 257831
                  sra          gp, s11, s5
                  sll          s9, s9, a1
                  xori         a0, s0, -604
                  srl          tp, t6, s4
                  srai         a3, t2, 1
746:              or           a2, s6, t6
748:              lui          t2, 280632
                  lui          t3, 140863
                  slli         a3, a5, 20
                  srli         a7, t5, 4
                  slti         gp, ra, 1742
                  nop
754:              sub          a3, s7, a6
                  sll          s2, gp, a7
                  sltiu        gp, s2, -30
                  sub          t2, a4, t2
                  slli         t5, a4, 4
                  sltu         a0, sp, a0
                  sra          s3, t1, t6
                  slli         a0, s10, 1
                  addi         t2, s0, -1037
                  bgeu         s0, s10, 787f
                  srl          s9, s7, t1
                  sltu         a1, s10, a4
                  srli         t5, a1, 6
                  sltiu        t2, t2, 532
                  bne          s1, a1, 790f
                  bgeu         a1, s11, 791f
                  ori          s5, s5, -1439
                  bne          s6, ra, 790f
                  nop
                  sltu         a1, s7, s10
                  srai         t4, a4, 11
                  auipc        ra, 261371
                  srli         tp, a4, 11
                  bgeu         s8, s1, 789f
                  sub          t6, t2, t5
                  and          t5, a5, zero
                  slli         t6, s8, 12
787:              add          a0, tp, s2
                  bltu         tp, a4, 797f
789:              slt          s11, a7, s10
                  ori          s5, s11, -1217
                  srai         a2, a6, 4
                  add          gp, s7, gp
                  sltu         t2, a0, sp
797:              sll          s8, t4, t3
                  and          a4, s9, a5
                  or           a6, a6, tp
                  and          s2, tp, a5
                  nop
                  bgeu         a1, t3, 820f
                  and          a7, a2, gp
                  bge          a2, s7, 811f
                  srli         s8, t3, 20
                  slti         t6, sp, -1204
                  and          a0, a4, t0
                  bltu         s3, t1, 827f
811:              xor          s5, t1, a0
                  sra          s9, t2, t3
                  andi         s9, t1, -901
                  nop
                  auipc        s5, 451562
                  addi         s10, a7, -1944
                  slli         a3, t0, 7
                  or           s4, zero, s1
                  sll          s9, s10, a2
                  sll          s9, a6, a6
                  slti         tp, tp, -47
                  sltu         a7, gp, s1
827:              and          s5, ra, a4
                  slti         s11, tp, 730
                  srai         s5, t3, 11
                  xor          s0, t1, t1
                  add          t5, s10, a6
                  sub          zero, a5, s8
                  sll          a2, tp, a2
                  slti         t1, a3, -325
                  addi         a5, t2, 612
                  and          a0, t4, s4
                  beq          ra, t0, 860f
                  add          a6, sp, s0
                  sltiu        a5, s5, 1085
                  srai         s1, a2, 1
                  blt          s0, t5, 866f
                  srli         a1, zero, 30
                  or           a1, a1, a0
                  auipc        a7, 45507
                  srl          s11, a6, a0
                  blt          t2, t6, 855f
855:              sub          a7, sp, ra
                  sll          a7, s8, s3
                  addi         a1, tp, 32
                  slli         a2, s2, 27
                  srli         a5, a2, 1
                  bgeu         s8, a5, 877f
                  slt          a0, a6, tp
                  xori         a1, a1, -1012
                  add          s9, s10, a5
866:              lui          a3, 250031
                  xor          a5, s1, a1
                  sra          tp, t3, t3
                  or           ra, s0, t1
                  addi         tp, t5, -1605
                  bgeu         s0, s6, 873f
                  srli         a0, s6, 9
873:              bge          sp, a0, 874f
874:              sltu         s2, tp, zero
                  sltiu        a5, s7, 1551
                  bltu         s8, s11, 891f
                  bgeu         s10, s6, 885f
                  beq          s1, a4, 882f
882:              blt          tp, t1, 888f
                  srai         s2, t4, 16
                  srl          a2, a1, t5
885:              bge          t1, t1, 896f
                  lui          sp, 383638
                  or           a7, a6, s6
                  beq          t0, t4, 900f
                  sltiu        ra, s7, -188
                  lui          gp, 536151
                  sra          sp, a7, gp
                  bgeu         s2, s7, 915f
896:              slli         t5, s2, 12
                  xori         s10, s5, -384
                  sub          s0, a0, s1
900:              srl          s11, tp, a3
                  lui          s8, 636364
                  slli         s0, zero, 17
                  srli         s0, tp, 2
                  ori          t6, t6, 855
                  sltu         a0, s8, gp
                  sra          a2, t4, s11
                  sra          t5, s6, s11
                  srl          a7, a7, tp
                  srli         a6, t1, 23
                  srl          a5, t2, tp
                  srl          s0, t0, s9
                  xor          s1, t5, s10
915:              sltu         a0, tp, t6
                  ori          s8, a7, 1033
                  add          zero, s11, ra
                  sltu         s8, a4, s0
                  sll          a4, a4, s1
                  sll          s0, t5, s0
                  bge          s4, sp, 931f
                  bge          s6, s7, 929f
                  blt          zero, sp, 943f
                  sll          s2, a7, t5
                  slli         s3, t1, 17
929:              ori          a3, a5, -975
931:              lui          a5, 118585
                  sltiu        ra, gp, 1623
                  or           t3, s9, gp
                  xori         t3, s5, -570
                  lui          s8, 480091
                  srai         t3, s7, 31
                  nop
                  blt          a1, gp, 950f
                  srli         a4, s3, 12
                  beq          a3, t5, 954f
                  ori          s3, s10, 1807
943:              bne          s11, t3, 945f
                  nop
945:              andi         t6, s3, 1594
                  or           t5, s6, s1
                  bltu         t0, s3, 964f
                  nop
950:              srai         t6, t6, 0
                  sltiu        t6, s0, -1051
                  nop
954:              or           t2, s2, s10
                  bge          s4, s4, 968f
                  slti         s9, a6, -1905
                  bgeu         s1, t2, 965f
                  srai         s8, a7, 4
                  bgeu         s9, s8, 980f
                  slt          a6, s6, s2
                  sra          t5, t3, s9
964:              and          a7, a7, tp
965:              nop
                  slli         t6, s0, 14
968:              add          s4, ra, t4
                  bge          t4, t0, 986f
                  slt          t2, a5, s9
                  bltu         s10, s5, 972f
972:              lui          s10, 898937
                  bge          a2, ra, 993f
                  and          t4, tp, s8
                  lui          t5, 793629
                  bltu         a2, s4, 987f
                  beq          a5, s0, 992f
980:              bge          s5, a3, 993f
                  bgeu         s3, t4, 983f
983:              sra          a4, tp, tp
                  srl          s3, t6, tp
                  bltu         s9, a6, 1000f
987:              sltiu        s2, a3, -1373
                  srl          a3, s6, a4
                  slt          sp, t4, t2
                  slt          sp, s10, s3
                  sub          s9, a6, s11
993:              srl          t6, zero, zero
                  nop
                  blt          s0, s4, 1016f
                  sub          a4, a0, a1
                  bge          t5, ra, 1002f
1002:             sub          ra, a5, t5
                  auipc        s4, 15893
                  andi         s9, s1, 935
                  or           a1, a5, a7
                  bgeu         t5, t4, 1025f
                  srl          s3, zero, ra
                  bgeu         a7, a2, 1029f
                  lui          s11, 635423
1016:             or           s5, t4, a4
                  sra          a5, t0, s1
                  slt          t6, a5, a6
                  nop
                  sub          a2, gp, a6
                  auipc        s3, 137556
1025:             auipc        s9, 785867
                  add          s10, t2, a4
                  ori          a3, a3, 813
1029:             blt          t1, a4, 1046f
                  srli         a1, a1, 24
                  add          a5, t1, a2
                  beq          t2, s2, 1051f
                  andi         a1, a2, -1741
                  bltu         s5, a5, 1042f
                  bne          sp, t2, 1055f
                  bne          s10, a5, 1044f
                  addi         s1, t0, -643
                  addi         ra, s2, 636
1042:             beq          t4, t0, 1060f
1044:             sub          s10, s6, gp
                  slli         tp, t6, 24
1046:             blt          sp, s1, 1057f
                  srl          zero, tp, a7
                  sll          a4, t3, sp
                  blt          a7, a2, 1061f
1051:             srl          t3, zero, a2
                  sll          s8, tp, t3
                  slt          s11, s1, s10
1055:             beq          t5, a0, 1060f
                  sra          a2, s1, a6
1057:             andi         t3, a5, -305
                  addi         t2, a0, -607
1060:             srli         a6, a2, 20
                  bne          s9, t6, 1064f
1064:             blt          t1, a4, 1065f
1065:             ori          t3, t4, 935
                  xori         t6, s8, 950
                  bgeu         t0, a3, 1077f
                  bne          zero, a1, 1076f
                  sra          s9, s10, a6
                  blt          sp, s4, 1083f
                  srl          a2, t3, s2
1076:             sub          t1, s7, a0
                  bgeu         t5, s5, 1094f
                  srl          t3, s7, a2
                  srai         a3, a5, 18
                  add          s0, sp, t5
                  and          sp, t4, a3
1083:             lui          s3, 379426
                  ori          t5, s6, 1479
                  sltu         t2, s0, tp
                  srli         s4, s3, 19
                  bge          sp, a5, 1100f
                  beq          s0, t0, 1099f
                  xori         gp, s3, -4
                  xori         s11, t6, -976
                  or           sp, a7, a0
                  sub          s9, s9, sp
1094:             sltiu        s1, a0, -1144
                  sub          gp, s9, s10
                  ori          s9, s10, 822
                  slli         t1, s3, 22
1099:             srai         s10, s7, 31
                  addi         a2, ra, 198
                  sub          gp, s11, a1
                  slli         a1, t0, 14
                  add          t5, s11, s11
                  srl          zero, s5, ra
                  sub          t1, t2, s9
                  ori          s2, sp, 745
                  and          a4, s10, s6
                  bltu         gp, a4, 1115f
                  srai         gp, a5, 1
1115:             blt          s10, ra, 1130f
                  nop
                  xor          a7, a7, t0
                  slli         t6, a5, 31
                  ori          zero, s5, 1638
                  slt          t3, a2, a6
                  blt          s3, s8, 1131f
                  srl          s4, a5, s7
                  sub          s0, a4, s10
                  sltu         t4, s8, t6
                  ori          a5, zero, -1969
                  addi         t5, tp, 1827
1131:             xori         s2, t2, 904
                  auipc        a1, 864471
                  srli         s0, s5, 3
                  auipc        sp, 327400
                  sltiu        s2, a6, -1915
                  andi         t5, zero, -1641
                  addi         s8, t6, -881
                  andi         t4, a2, -1755
                  sltu         a1, s6, t4
                  sra          a4, s5, s6
                  bge          a4, s7, 1159f
                  sltiu        t5, a1, 1492
                  slti         t1, s2, 426
                  bgeu         zero, a7, 1161f
                  bltu         t6, s7, 1163f
                  xor          a0, zero, s11
                  sub          zero, a2, s4
                  or           a5, a7, a0
                  srl          t3, s4, sp
                  slti         zero, a4, -495
                  nop
                  add          a2, a6, a0
1159:             ori          a1, ra, 1442
                  blt          s5, a2, 1173f
1161:             srli         s0, t4, 14
                  lui          t1, 831921
1163:             bltu         t6, a0, 1179f
                  bge          s4, zero, 1182f
                  slt          a2, t6, t1
                  nop
                  sra          t6, zero, a0
                  srl          s11, zero, a3
                  nop
                  nop
                  addi         a7, t1, -1211
1179:             addi         sp, t4, 1629
                  slti         gp, a1, 116
1182:             bgeu         gp, a3, 1200f
                  slti         s10, s6, 377
                  lui          s10, 750698
                  sltu         t2, s7, gp
                  slli         a5, s9, 1
                  slt          s4, zero, s8
                  slt          a6, a3, a3
                  auipc        a3, 384327
                  slti         s4, a4, -181
                  srli         t4, s4, 5
                  auipc        zero, 398846
                  nop
                  srai         zero, s2, 10
                  slti         a2, s8, 1806
                  srl          a3, tp, t0
1200:             addi         t6, t2, -1796
                  bgeu         s4, t1, 1215f
                  beq          s4, s6, 1206f
                  bgeu         s11, t1, 1215f
                  nop
                  add          s9, t1, s7
                  beq          a0, s5, 1223f
                  lui          t2, 703841
1215:             bgeu         s5, a0, 1221f
                  sll          a6, a7, s11
                  add          s0, gp, s5
                  sltu         zero, t1, t0
                  ori          t3, s0, -946
                  bge          sp, s8, 1233f
1221:             bne          a1, s10, 1223f
                  sltu         s4, t6, t1
1223:             auipc        t3, 605883
                  slti         s2, a3, 639
                  and          s5, s4, a6
                  nop
                  xori         zero, s11, -649
                  andi         s1, s0, 1488
                  bge          gp, a2, 1249f
                  ori          tp, a1, 618
1233:             and          s8, s8, s3
                  sltu         s5, t6, a5
                  auipc        a3, 188051
                  lui          sp, 1015
                  auipc        a3, 312931
                  slt          s2, t1, s10
                  sub          s11, t4, s7
                  auipc        a1, 954134
                  bne          t3, a3, 1242f
1242:             bne          s2, tp, 1243f
1243:             ori          t4, t0, 6
                  sltiu        t5, t1, 697
                  addi         s10, a1, 497
1249:             beq          t0, a7, 1257f
                  and          a7, a5, t3
                  la           s4, region_1+36851
                  la           t3, region_1+64752
                  la           s0, region_1+7694
                  lw           t2, -58(s0)
                  la           s10, region_1+861
                  lb           a4, 3(s10)
                  lb           t5, 0(s10)
                  lw           a1, 7(s10)
                  lbu          sp, 831(s4)
                  lh           s2, 44(s0)
                  sh           t2, 1435(s4)
                  lbu          t4, -58(s0)
                  lb           s3, -4(s10)
                  lb           a4, -60(t3)
                  sb           a7, -13(s0)
                  lbu          gp, -30(s0)
                  sb           t3, 926(s4)
                  lbu          s2, 51(t3)
                  lw           s2, 693(s4)
                  sh           s10, 11(s10)
                  lbu          gp, 43(t3)
                  sb           t5, -1245(s4)
                  sb           t6, -62(t3)
                  lbu          s3, 7(s10)
                  lb           gp, 1267(s4)
                  lbu          zero, 7(s0)
                  lb           a3, -642(s4)
                  lb           s11, -5(t3)
                  lb           sp, 404(s4)
                  sw           s7, -50(s0)
                  lhu          gp, 1157(s4)
                  lb           ra, 3(s10)
                  sb           a4, 1603(s4)
                  lb           a6, 13(s10)
                  sh           t5, 28(s0)
                  lhu          a1, 42(t3)
                  sub          gp, s10, s0
                  slt          a5, s5, t2
                  andi         t4, a5, 641
                  sra          a4, s9, a0
                  slti         s0, s10, 971
                  andi         zero, ra, 638
                  nop
                  sub          a0, t2, s6
                  bgeu         s1, ra, 1276f
                  and          t5, s3, a2
                  slt          t5, a0, s7
                  xor          tp, a7, t3
                  auipc        t1, 810009
                  sll          a6, a0, t2
                  slt          zero, t2, zero
                  xor          a1, zero, zero
                  bgeu         sp, tp, 1292f
1276:             bltu         zero, s2, 1294f
                  bgeu         s2, sp, 1282f
                  bne          a3, s2, 1299f
                  slli         t3, t5, 0
                  ori          a1, s0, -740
                  bne          s10, t4, 1289f
                  or           gp, s8, a1
                  bge          sp, s2, 1292f
                  auipc        s5, 116400
                  sra          t5, s4, t4
1292:             auipc        s11, 770879
                  srli         t4, s3, 7
1294:             bne          s1, t6, 1314f
                  sltiu        s5, ra, -192
                  addi         s10, s8, 1130
1299:             andi         s1, s8, -1338
                  beq          s11, gp, 1318f
                  slt          ra, sp, t3
                  lui          s4, 701812
                  andi         zero, t5, -1885
                  srai         s9, a6, 2
                  beq          a1, t0, 1309f
1309:             add          s5, a6, ra
1314:             slt          zero, ra, t4
                  sub          a0, t4, t4
                  sltu         s11, zero, t3
                  sll          t1, s4, a3
1318:             sra          s0, a2, a5
                  srl          s1, s3, a4
                  xor          s8, s0, s1
                  sub          s8, a4, a3
                  and          s0, s9, a4
                  bge          s1, t0, 1329f
                  ori          t6, s5, 1857
                  sltiu        s11, gp, -735
1329:             sub          a4, s7, t1
                  blt          gp, a5, 1350f
                  addi         a2, s6, -114
                  nop
                  srli         s3, t4, 6
                  sltu         tp, t2, a7
                  xor          t4, s3, zero
                  bge          s3, s5, 1354f
                  slli         s2, a7, 29
                  srli         a0, a4, 31
                  bgeu         a6, s5, 1358f
                  bne          s2, a7, 1343f
1343:             add          s3, t5, t4
                  lui          a6, 985142
                  slt          t4, t5, s8
                  lui          a3, 499757
                  blt          a2, a7, 1365f
                  bge          s5, a1, 1356f
1350:             blt          a6, sp, 1356f
1354:             ori          a4, s11, -1580
                  auipc        a3, 451859
1356:             andi         tp, t3, -1527
                  slli         a5, s0, 19
1358:             bltu         t0, s6, 1371f
                  slli         a7, a3, 9
                  beq          s10, s2, 1363f
1365:             slt          zero, t6, t2
                  bgeu         t5, t2, 1369f
                  lui          s0, 629655
                  bge          t1, a4, 1383f
1371:             bge          zero, s0, 1377f
                  sub          a1, a4, s11
                  auipc        ra, 700378
                  nop
                  sra          a6, t1, t4
                  srai         t1, a2, 12
                  srai         t4, s8, 14
                  blt          s10, a0, 1397f
                  ori          a0, s1, 1445
                  srai         a0, t2, 1
                  xori         zero, a1, -1948
                  sll          zero, s2, sp
                  slli         s4, s4, 1
                  bgeu         zero, ra, 1388f
                  andi         s0, s1, -2040
1388:             sltu         a5, ra, s9
                  auipc        s1, 252701
                  blt          a4, s11, 1408f
                  slti         s3, s1, 245
                  sltu         t1, t1, s0
                  beq          s4, tp, 1403f
                  andi         s11, s1, -90
                  lui          a3, 78731
1397:             bltu         t5, zero, 1407f
                  xori         t3, zero, 1988
                  slti         s8, t2, -529
                  or           s4, a5, s3
                  blt          s0, s9, 1416f
1403:             slt          a1, ra, sp
                  add          t1, t0, a7
1407:             and          s11, zero, gp
1408:             bge          a3, s11, 1425f
                  slti         a3, t2, 836
                  auipc        s5, 1016242
                  bgeu         s7, a2, 1421f
                  addi         t5, s3, -13
1416:             addi         t6, a4, -1709
                  nop
                  bltu         s7, tp, 1434f
                  add          t1, a7, s8
1421:             sll          a0, a0, t6
                  nop
                  add          s4, s1, tp
1425:             sltu         a7, a6, zero
                  ori          s10, a7, -838
                  beq          a7, a2, 1447f
                  lui          s11, 198577
                  lui          tp, 517980
1434:             bltu         s10, t6, 1454f
                  slt          s2, t3, t2
                  slt          s0, t2, s8
                  bne          t6, a2, 1448f
                  blt          s5, tp, 1449f
                  nop
                  sltiu        s2, s10, 1116
                  slt          s11, t6, t6
                  lui          gp, 90746
                  srli         t2, s4, 21
                  xor          a2, s11, t5
                  slli         a0, s3, 12
1447:             auipc        a0, 594577
1448:             beq          s4, s11, 1461f
1449:             slt          sp, s11, gp
                  sltiu        ra, t0, -1638
                  add          a1, a7, a1
                  lui          t2, 522219
1454:             bltu         a7, s9, 1460f
                  slli         sp, s4, 17
                  xori         s11, s8, 89
                  srl          s3, t1, t6
                  srl          sp, a0, s2
                  sltu         t4, gp, s11
1460:             sub          s9, s9, s10
1461:             bgeu         t3, gp, 1478f
                  slti         s9, a2, 1658
                  bge          a6, gp, 1476f
                  bltu         t6, s3, 1475f
                  or           ra, a2, s4
                  andi         s11, s1, 1637
                  andi         s0, s6, 918
                  slti         a1, a0, 1107
                  add          t1, t2, t6
                  bge          s9, a6, 1473f
1473:             blt          s1, sp, 1491f
                  sra          tp, ra, ra
1476:             sll          s4, ra, a1
1478:             sltu         s8, t3, a2
                  xor          s10, t6, t6
                  blt          t1, s0, 1500f
                  add          s1, a6, s0
                  bltu         s3, s0, 1490f
                  lui          s0, 340498
                  srli         t1, s4, 7
                  bltu         a1, ra, 1504f
                  sra          s8, a2, a4
                  add          s9, a4, t0
                  or           t2, s0, t2
1490:             blt          s7, tp, 1503f
1491:             bltu         t4, s1, 1507f
                  bge          t3, t6, 1494f
                  slt          sp, zero, s0
1494:             or           s8, s6, zero
                  bltu         t1, a6, 1508f
                  andi         s11, a1, 1260
                  srli         t2, tp, 26
                  and          ra, a0, s3
                  sll          tp, a7, gp
1500:             srl          a3, t0, t1
                  srl          s11, a0, sp
                  addi         a5, s9, -588
1503:             sub          s0, s2, s11
1504:             slt          s4, a6, a2
                  sll          s5, a0, s1
                  beq          sp, s8, 1523f
1507:             bgeu         t6, t4, 1516f
1508:             bge          t6, s2, 1526f
                  srli         s11, ra, 19
                  beq          a3, s7, 1511f
1511:             srl          a4, s6, ra
                  andi         a1, s1, -1569
                  srl          a2, s7, a5
1516:             bgeu         a1, t2, 1534f
                  add          gp, sp, s11
                  bltu         s8, ra, 1536f
                  bne          tp, a6, 1525f
                  bgeu         s6, tp, 1527f
                  sra          tp, t4, a1
1523:             blt          sp, s2, 1524f
1524:             sra          t1, s11, a2
1526:             xor          t3, s8, s10
1527:             lui          t2, 940423
                  andi         s0, t3, 41
                  add          a7, gp, tp
                  sub          t4, s1, a5
                  or           s4, t0, s11
1534:             addi         s11, t6, 1076
                  slt          s2, s2, sp
1536:             bne          t1, s6, 1551f
                  lui          a4, 1023108
                  xor          t1, ra, s6
                  slli         s5, a0, 25
                  xori         s8, t5, -1743
                  sub          s4, s1, s4
                  srli         zero, t2, 26
                  srl          zero, t0, a0
                  xor          s10, s2, a1
                  sra          s5, t5, s6
                  slti         t3, a3, -912
1551:             xor          s10, t3, a2
                  andi         a6, s3, -989
                  bge          ra, s3, 1564f
                  slli         a4, a3, 11
                  sll          zero, a0, a2
                  xor          s1, ra, sp
                  srli         s4, s4, 5
                  auipc        a3, 374504
                  sll          s5, s2, a5
                  blt          a0, s2, 1575f
                  andi         s3, s8, -1879
                  sra          t2, t5, a1
                  sra          t5, t2, a7
                  slli         a1, zero, 7
                  sltu         a7, s0, s5
                  beq          s7, a6, 1577f
                  bge          s8, s11, 1581f
                  nop
1575:             srli         sp, s10, 7
                  srli         a2, t5, 27
1577:             srli         s8, a4, 7
                  bgeu         t3, s7, 1598f
                  and          a7, t1, a6
                  beq          a1, zero, 1583f
1583:             slti         ra, a6, 872
                  auipc        tp, 500840
                  and          t3, a5, s10
                  bge          a2, s8, 1604f
                  addi         t1, s1, 837
                  sltiu        t1, a7, -1227
                  andi         s2, a7, -1617
                  addi         a7, gp, -366
                  slli         s8, t1, 18
                  auipc        s1, 148921
                  nop
                  slt          s2, t6, s7
                  bgeu         s1, s6, 1601f
                  srli         s2, a0, 10
                  sub          a6, s0, s10
1598:             ori          s4, tp, -1739
                  slti         s2, s10, 51
1601:             and          s0, a3, s4
                  xori         s1, s8, 1030
                  sll          s2, s2, t6
                  bge          s5, t0, 1620f
                  or           s2, t6, s4
                  add          s2, ra, sp
                  slti         t4, t2, -279
                  bltu         a0, s3, 1629f
                  andi         s4, zero, 1564
                  xori         s10, s4, 429
                  slt          t5, a4, s0
                  bne          s0, a1, 1622f
                  slli         sp, s7, 21
                  slt          t5, t5, s7
                  bge          s2, s0, 1620f
1620:             sltu         a4, s11, a7
                  auipc        t6, 619960
                  srli         s0, a5, 18
                  add          t6, t6, s5
                  beq          tp, t3, 1646f
                  srl          a2, ra, s2
                  addi         s1, a2, 878
                  slli         t2, t1, 8
                  auipc        a3, 836519
                  sra          a1, a3, t5
                  lui          a1, 94331
                  srai         s5, t6, 14
                  sll          ra, a2, a6
                  sltu         a2, a5, s3
                  bne          t0, t6, 1647f
                  xori         t6, gp, -715
                  auipc        a7, 92170
                  beq          a1, s1, 1651f
1646:             add          a6, a2, a5
1647:             xori         zero, ra, -1756
                  ori          a0, s0, 2006
                  beq          a1, a1, 1651f
                  sra          a6, t0, a5
                  bge          s0, gp, 1665f
                  or           t5, a7, a7
                  slti         t2, gp, -1538
                  sltu         a2, s11, t1
                  bge          s4, s0, 1674f
                  xori         zero, zero, -738
                  auipc        a3, 489109
                  sll          tp, s3, a7
                  slti         a7, s6, -1135
                  bge          a3, s1, 1678f
                  auipc        tp, 820830
1665:             sltu         a0, t4, s7
                  xor          tp, t2, gp
                  sll          s4, s7, ra
                  and          sp, zero, a3
                  srli         s1, zero, 23
                  xori         t1, s6, 1732
                  sltu         a3, a5, s6
                  sub          s11, tp, a1
                  sra          s3, a1, t5
                  srai         t4, s0, 26
                  bltu         a3, s7, 1684f
                  andi         t5, s2, 1689
                  nop
                  beq          a7, a2, 1701f
1684:             slt          t5, t1, t3
                  and          zero, t3, s1
                  or           t6, t0, t4
                  blt          t2, t6, 1699f
                  xor          s0, a5, gp
                  sub          a0, s11, t2
                  bne          t2, t0, 1710f
                  sltiu        a6, zero, 1611
                  srl          s0, t5, sp
                  blt          s4, s2, 1702f
                  blt          s10, t2, 1706f
                  beq          s3, s0, 1699f
1699:             lui          t2, 853956
                  bne          gp, a5, 1716f
                  srli         t3, a5, 15
                  xori         s1, s5, -1411
                  srl          s4, t5, a7
                  bge          a0, s5, 1725f
                  add          tp, a0, zero
                  slli         a0, s8, 3
1710:             andi         t5, gp, -1269
                  sltiu        s9, s8, -257
                  slli         ra, t0, 9
                  srl          zero, a4, s7
1716:             addi         a4, t5, 1241
                  xori         a0, s11, 125
                  ori          t3, t6, 1591
                  nop
                  slli         t5, s11, 0
                  blt          a4, s10, 1733f
                  auipc        zero, 908768
                  ori          s2, tp, -1994
1725:             srli         s5, t0, 13
                  auipc        a4, 250010
                  sra          a4, s1, s2
                  nop
                  bne          t4, s6, 1750f
                  bgeu         t5, t3, 1748f
                  sltiu        sp, t2, 1088
1733:             sltiu        t2, a0, -1089
                  or           s10, s6, a5
                  slt          tp, sp, zero
                  nop
                  bltu         s7, s0, 1753f
                  slt          s4, a6, t4
                  sra          s11, s2, a7
                  beq          zero, a1, 1752f
                  srl          a2, a0, s0
1748:             auipc        a2, 88825
1750:             sub          s9, gp, t6
                  beq          t4, ra, 1752f
1752:             slt          s10, s8, a6
1753:             slt          s3, a2, t2
                  bltu         a5, s8, 1772f
                  lui          t3, 998984
                  srl          a1, a2, t1
                  sra          s10, s2, s9
                  ori          t6, s6, 2008
                  or           a1, t1, s4
                  bne          a0, t1, 1774f
                  beq          t0, a6, 1767f
                  sub          s9, a2, s8
1767:             srai         s9, s1, 22
                  xor          a2, s5, sp
                  sll          s0, s8, s6
1772:             sub          s4, s0, s10
                  bltu         t2, s9, 1791f
1774:             xori         s1, s7, 204
                  xori         t3, t5, -552
                  auipc        tp, 301177
                  sltu         a2, s5, a3
                  xor          s9, tp, a3
                  and          t4, t0, t0
                  slt          s4, zero, t4
                  addi         s1, s0, 1647
                  addi         s10, t2, -1586
                  xori         a5, s0, 232
                  srl          a7, a4, a1
                  nop
1791:             slti         s11, s6, -1888
                  addi         t2, a0, -1921
                  bge          sp, a4, 1802f
                  bltu         a2, t4, 1813f
                  auipc        s8, 951475
                  xori         t4, sp, 1639
                  xor          a2, t5, s6
                  bltu         a5, a1, 1812f
                  xor          t1, s8, s11
                  lui          t3, 935472
1802:             add          s4, t6, s10
                  beq          ra, s7, 1805f
                  sra          s10, s3, t6
1805:             sra          s0, t6, a5
                  slti         s5, sp, 644
                  auipc        a6, 733003
                  auipc        s1, 533961
                  blt          a5, t2, 1826f
                  srai         gp, a6, 15
1812:             srli         a4, s8, 31
1813:             sub          a1, t4, sp
                  xori         a5, a2, 1200
                  srli         s11, t6, 16
                  nop
                  slti         s3, s5, -197
                  sub          a5, a1, a2
                  beq          s0, s9, 1837f
                  blt          tp, s4, 1832f
                  bne          s10, a0, 1833f
                  ori          ra, tp, -836
                  sub          s10, s5, sp
                  ori          s9, s8, -955
                  srl          sp, t2, a4
                  addi         s4, a5, 645
                  srl          s8, a4, tp
                  ori          t3, zero, -1834
                  bne          t0, a5, 1837f
1832:             srli         t4, a7, 19
1833:             bne          t2, s8, 1834f
1834:             add          a5, a5, s0
                  sltu         a5, a4, t4
                  or           a6, s1, a1
1837:             and          a5, s6, s0
                  nop
                  sltiu        a4, s7, 475
                  add          a5, s10, zero
                  blt          t2, ra, 1860f
                  srl          s3, t4, a4
                  srl          s0, tp, a5
                  blt          s6, s7, 1860f
                  bltu         a7, s5, 1856f
                  beq          sp, gp, 1853f
                  bltu         s6, ra, 1866f
                  bgeu         s7, s2, 1867f
                  slti         t1, sp, -342
                  ori          t3, a6, 1814
                  and          t5, s10, a6
1853:             andi         a4, t3, -184
                  and          tp, a0, s4
                  sltiu        s11, t1, 1416
1856:             slt          a0, a2, sp
                  slti         s10, tp, -664
                  bgeu         a0, s0, 1860f
                  or           t3, a5, s5
                  sltiu        a5, gp, -1722
1866:             beq          gp, a6, 1884f
1867:             slli         t5, s11, 18
                  addi         t3, a0, -917
                  add          a1, s3, s8
                  auipc        zero, 931521
                  sltu         s5, zero, s10
                  sra          a5, a7, a6
                  or           t2, s6, t5
                  slti         a4, a3, 353
                  slli         sp, t3, 14
                  srli         a4, s9, 1
                  add          s1, a4, s3
                  beq          s1, a3, 1897f
                  andi         zero, zero, -356
                  bge          a4, s6, 1894f
                  bgeu         a6, sp, 1888f
                  la           gp, region_0+853
                  sb           s2, -61(gp)
                  sw           s9, -61(gp)
                  lh           t1, -61(gp)
                  sb           gp, -39(gp)
                  lb           s5, -39(gp)
                  lhu          t4, -39(gp)
                  sb           s9, -2(gp)
                  sb           t5, -2(gp)
                  lbu          ra, -36(gp)
                  sb           a3, -36(gp)
                  lb           zero, -36(gp)
                  sb           a0, -36(gp)
                  slli         t1, s9, 10
1884:             slt          a5, a0, t0
                  lui          s0, 1027329
1888:             slli         s9, s5, 22
                  sltu         s10, zero, s8
                  srai         a6, a2, 20
                  sltu         a5, a4, s0
                  lui          s10, 37033
1894:             and          t1, t1, t6
                  and          t2, s1, t1
                  andi         ra, a6, -1710
                  xori         s3, zero, -362
                  andi         t3, s7, 1567
                  auipc        s1, 425414
                  auipc        a5, 253147
                  slt          a4, s7, s1
                  sltiu        t3, a7, -1865
                  srai         t5, s1, 19
                  srl          a5, t1, s1
                  andi         sp, ra, -1889
                  slli         gp, a5, 27
                  andi         a0, a6, 1094
                  bltu         t3, s3, 1923f
                  sll          a2, t3, gp
                  sltiu        s5, tp, 1543
                  blt          gp, t2, 1923f
                  and          tp, ra, s0
                  ori          t6, a3, -1972
                  bgeu         s9, a7, 1942f
1923:             xor          s10, s9, s7
                  andi         a1, t2, -535
                  slt          t1, s8, s7
                  srl          a5, s3, a0
                  slt          ra, a6, ra
                  slti         s0, s1, -1857
                  srl          s1, ra, s11
                  bge          s9, t4, 1932f
1932:             slli         zero, a7, 26
                  slti         a0, t6, -1139
                  auipc        s4, 609195
                  or           a0, tp, a0
                  slti         a6, a7, 1418
                  srl          t3, zero, t6
                  bgeu         t3, t4, 1941f
1941:             bne          s3, t5, 1954f
1942:             nop
                  sra          a7, t4, s9
                  bge          s0, sp, 1965f
                  sltiu        a5, s2, 1336
                  auipc        ra, 136904
                  bgeu         a3, a0, 1955f
                  srl          zero, s10, s4
                  xor          s8, zero, a5
                  addi         s0, a1, 243
1955:             bge          s9, zero, 1972f
                  addi         a7, t5, -308
                  bge          tp, a5, 1976f
                  nop
                  sll          s1, t6, a4
                  xor          a6, gp, t1
                  srl          t1, a7, s4
1965:             sll          t3, t4, a4
                  sltiu        a4, s1, -431
                  auipc        a2, 818291
                  sll          s8, s6, s1
                  sll          a3, s3, a5
                  andi         s5, s7, 988
1972:             xor          t3, tp, t0
                  bltu         a7, a5, 1975f
1976:             add          s9, s1, s0
                  sll          t1, gp, a4
                  sub          a2, t3, s11
                  addi         t4, t0, -485
                  ori          a6, s3, 935
                  sltiu        ra, s11, 591
                  xor          a5, t0, a7
                  and          a6, t0, a3
                  beq          s0, a2, 1996f
                  beq          s9, t3, 1990f
1990:             auipc        t1, 193055
                  add          a2, a0, a6
                  auipc        s5, 713354
                  slli         a2, s5, 9
                  bne          s3, a1, 2012f
                  andi         t5, zero, 1442
                  bltu         ra, zero, 2017f
                  bltu         a6, a5, 2004f
                  srli         s0, t1, 16
                  srai         s8, t3, 18
                  xori         s2, zero, 1383
                  bge          s2, t3, 2018f
                  slti         s4, t1, 2000
                  beq          s0, s2, 2019f
                  sra          s9, t2, s11
                  and          t6, s10, s1
                  sll          s4, tp, t1
2012:             sra          s1, t1, s8
                  add          a4, t0, a3
                  slli         a0, a4, 26
2018:             sll          gp, t1, s5
2019:             and          s5, t4, t1
                  xor          s0, s1, s10
                  srl          a3, t2, s8
                  ori          s2, a1, -786
                  slt          s0, zero, t1
                  srl          s8, s1, sp
                  and          a1, t4, s0
                  sltiu        zero, t6, 916
                  nop
                  bltu         a2, sp, 2046f
                  sltu         a6, t0, a0
                  bgeu         s7, s8, 2037f
                  addi         s5, s5, -355
                  or           s11, s0, t5
                  bge          a2, s1, 2050f
                  sltu         sp, a3, a6
                  bgeu         t2, s6, 2037f
2037:             auipc        a3, 800220
                  blt          tp, s7, 2055f
                  srai         t6, s3, 18
                  sra          s8, s10, a3
                  sll          a0, gp, s2
                  slli         s0, a1, 22
                  bge          t5, s7, 2057f
                  slti         a0, s5, -1221
                  addi         a7, gp, -1644
                  ori          t3, t4, 1922
                  slli         a7, t0, 24
                  bge          sp, s10, 2066f
                  sltu         s4, a2, s1
2055:             lui          a1, 330906
                  add          a7, a7, t4
2057:             bltu         t4, t5, 2059f
                  srli         t6, s4, 2
2059:             bltu         ra, t0, 2066f
                  sltu         s0, s7, s1
                  auipc        a4, 659737
                  and          a3, t4, a5
                  nop
                  add          s4, t3, tp
2066:             add          gp, s8, s3
                  slt          t4, s5, a6
                  bne          t1, t5, 2086f
                  or           s11, a3, s11
                  or           a6, a1, s4
                  sra          s3, t1, s11
                  xor          s3, s6, t4
                  or           s3, s8, s7
                  xori         a5, t0, -604
                  slli         t2, t2, 26
                  srai         s11, t0, 31
                  beq          sp, a3, 2083f
                  beq          gp, s0, 2097f
                  bne          a5, a2, 2089f
                  xori         tp, s9, -1590
                  sub          a7, sp, tp
2083:             beq          sp, sp, 2101f
                  sltiu        gp, zero, 1759
                  ori          gp, t6, 1959
2086:             slt          a4, zero, a6
                  nop
2089:             bltu         sp, s4, 2091f
2091:             ori          zero, s1, 1760
                  nop
                  or           t6, gp, t2
                  or           s4, a2, t6
                  beq          t5, s10, 2115f
                  add          s8, a2, a2
                  or           s9, s4, s8
                  xori         s8, s8, 1576
                  bge          a2, t5, 2110f
                  srai         a2, t4, 8
                  srli         t6, a3, 10
                  srl          a2, a3, t3
                  sltu         s0, a6, a5
                  beq          a4, t0, 2120f
                  beq          s1, a1, 2124f
                  or           a7, gp, s8
                  sra          s9, s1, t1
2115:             nop
                  slt          tp, s2, zero
                  bgeu         a1, s5, 2131f
                  xori         t3, s2, -191
                  andi         a3, a4, -699
2124:             slli         a6, s4, 11
                  and          a7, s2, s8
                  sltiu        t3, tp, -271
                  nop
                  sll          a7, t5, t1
                  slt          s0, s2, s6
                  slt          t2, s0, s7
                  beq          t3, a0, 2151f
                  srli         s10, a0, 17
                  bltu         s9, t5, 2153f
                  andi         s0, a7, 471
                  add          s9, t2, a7
                  bne          a2, s7, 2145f
                  ori          s0, s0, -2012
                  bgeu         a7, s7, 2160f
                  slli         s10, zero, 24
                  addi         t4, a3, -256
2145:             bgeu         s2, t6, 2162f
                  andi         a2, a2, 235
                  nop
                  lui          t2, 603980
                  la           sp, region_1+41473
                  xor          gp, a7, a5
                  lb           tp, -12(sp)
                  sb           s3, -12(sp)
                  sb           s2, -47(sp)
                  lbu          s2, -52(sp)
                  lbu          s4, -40(sp)
                  lh           a3, -19(sp)
                  sb           a4, 17(sp)
                  sb           t4, -41(sp)
                  addi         s0, s8, 2040
                  and          s11, t3, t0
                  sb           s2, -32(sp)
                  sb           a2, 62(sp)
                  lhu          a6, -11(sp)
                  sb           tp, -40(sp)
                  lbu          a4, 52(sp)
                  lbu          a7, 36(sp)
                  sw           s10, -61(sp)
                  sb           a2, 22(sp)
                  lw           ra, 51(sp)
                  and          s11, s10, s9
                  lb           t4, -10(sp)
                  lbu          s11, 47(sp)
                  lbu          t1, -46(sp)
                  sb           s9, 41(sp)
                  sb           a7, -56(sp)
                  add          a2, gp, sp
                  srl          ra, t0, a6
                  lw           a3, 31(sp)
                  lw           s11, -29(sp)
                  lbu          s0, -30(sp)
                  lbu          a7, 54(sp)
                  xori         t1, t2, 15
                  sh           s5, 13(sp)
                  sll          zero, a0, a4
                  lbu          t5, -64(sp)
                  lbu          tp, 18(sp)
                  lbu          s8, -24(sp)
                  sltu         t4, a1, a2
                  auipc        t6, 1023995
2151:             srai         s5, s1, 9
                  auipc        a1, 1028626
2153:             bltu         a1, a1, 2155f
2155:             sub          a5, s1, t4
                  or           s10, a2, a5
                  sub          a7, t1, a1
                  srli         t2, sp, 29
                  nop
2160:             add          s4, a1, s9
                  auipc        s3, 938022
                  slti         tp, s8, -1306
                  nop
                  bge          t1, s4, 2187f
                  sra          a2, s5, t2
                  slli         gp, s10, 27
                  slti         a7, zero, -842
                  sll          a4, s7, t4
                  sltiu        s9, s7, 16
                  beq          s1, a4, 2175f
2175:             sll          gp, s1, s11
                  sra          t4, gp, a4
                  sltu         a0, s7, t1
                  bgeu         tp, zero, 2184f
                  slti         s9, s4, 1760
                  slt          sp, s2, a7
                  or           s10, ra, tp
                  bltu         a6, a0, 2183f
2183:             xori         s0, a2, 119
2184:             slt          a6, s9, s7
                  and          s2, s7, s11
                  bgeu         t6, a2, 2192f
                  andi         s4, s5, 1560
                  bne          gp, a3, 2197f
                  ori          s10, t6, 862
                  sub          s0, s10, tp
2192:             bgeu         s4, s10, 2201f
                  nop
                  srl          s5, tp, gp
                  add          a1, t2, t3
2197:             bne          a5, s2, 2210f
                  xor          s9, s2, a4
                  addi         s4, a6, -1066
                  slti         a0, t5, -711
                  sub          gp, t0, a0
                  xori         s11, s1, 875
                  xori         a6, s4, 1347
                  ori          a7, t1, -1118
                  sltu         s1, a3, t5
                  slt          s9, t0, t2
                  srai         t1, s5, 22
2210:             sltiu        s1, sp, 36
                  slt          t1, s6, a7
                  and          t6, t1, a1
                  bltu         s2, a5, 2223f
                  srai         s0, a3, 11
                  slti         a1, a2, -888
                  xori         a2, t2, 1903
                  slti         s9, t3, -1594
                  sltu         s1, a1, a2
                  sub          t6, s5, t4
2223:             sra          s8, t2, s10
                  and          s8, t5, s5
                  bltu         s7, a1, 2226f
                  slti         t5, t5, 490
                  slli         a2, s9, 1
                  srli         tp, s3, 6
                  nop
                  xor          a0, zero, a6
                  ori          t5, a0, -1275
                  sub          s9, a1, s1
                  bge          t1, s5, 2244f
                  bne          s0, a1, 2255f
                  sltiu        ra, zero, 213
                  slti         s2, a0, 1006
                  nop
2244:             nop
                  xor          s10, s8, s5
                  ori          s5, a4, 1135
                  blt          a0, a7, 2260f
                  srl          zero, s3, t1
                  srl          s2, t3, t3
                  bne          a6, s5, 2254f
2254:             sltu         s11, s5, t1
2255:             or           gp, a3, zero
                  slti         tp, s10, -1579
                  ori          t6, a1, 651
                  add          t3, t3, a1
2260:             srai         s2, a4, 31
                  slt          s8, s10, gp
                  bge          s6, a5, 2280f
                  sltu         gp, sp, s4
                  blt          t2, s0, 2285f
                  sltiu        tp, t3, -328
                  sltiu        s5, ra, 1579
                  sltiu        a7, s4, -1746
                  sra          s8, t3, a0
                  srai         a2, t2, 13
                  srai         t4, s6, 31
                  lui          a0, 556025
                  sub          a0, s6, s5
                  sub          sp, t6, t4
                  auipc        a1, 463565
2280:             nop
                  beq          s3, t1, 2296f
                  slli         a7, a3, 19
                  sll          zero, a1, a7
                  beq          s5, a7, 2297f
2285:             add          a6, t1, a1
                  andi         ra, s9, -1469
                  bltu         s3, zero, 2306f
                  xor          s4, s8, s7
                  sltu         gp, a3, a1
                  bltu         s8, s9, 2311f
                  srai         s9, s6, 11
2297:             blt          a6, a3, 2303f
                  sltiu        s5, s3, -846
                  beq          s2, s10, 2310f
                  sltu         zero, s2, s3
                  sub          s3, t6, s7
                  xori         a1, s10, -643
2303:             beq          s5, t6, 2314f
                  addi         s2, s6, -1284
2306:             sra          a3, a2, sp
                  sub          s5, t4, s10
                  srai         a5, a6, 25
2310:             sll          s0, a2, t4
2311:             srai         a5, a1, 6
                  srl          a7, a0, s8
2314:             beq          t6, t0, 2332f
                  slti         s1, s7, 311
                  auipc        t1, 90
                  bge          zero, ra, 2337f
                  and          sp, gp, a0
                  add          t1, t2, a4
                  andi         s4, s1, -177
                  sltu         sp, t1, s5
                  blt          t2, a3, 2345f
                  bgeu         a2, a7, 2328f
                  lui          t5, 587763
2328:             addi         gp, a7, 1269
                  bne          a0, s11, 2340f
                  or           t1, gp, s8
                  ori          a7, s2, -567
                  auipc        a4, 573514
                  sltiu        t2, zero, -1938
                  bge          t6, gp, 2345f
                  beq          s10, s0, 2359f
                  beq          s1, t2, 2356f
                  bgeu         s8, s2, 2343f
                  blt          s4, a4, 2361f
2345:             bne          a5, t4, 2358f
                  srai         gp, s6, 9
                  srai         t2, a7, 27
                  sltu         t5, t5, a5
                  slli         t1, t4, 22
                  blt          t5, sp, 2365f
                  xori         s4, a0, -841
                  sra          gp, zero, tp
2356:             srli         a2, t0, 1
2358:             xori         a3, a1, -1142
2359:             bne          s0, a6, 2365f
                  bne          s2, s10, 2369f
                  bltu         s3, s3, 2369f
                  sltiu        s3, a3, 732
2365:             srl          s10, a5, s10
                  sub          t1, s5, a3
                  andi         s2, t2, 1455
                  and          a5, a2, t3
                  xori         gp, s9, 1991
                  srai         s3, a6, 8
                  srai         s10, t2, 11
                  lui          s0, 223784
                  bge          t6, a7, 2395f
                  blt          s2, a2, 2396f
                  srai         s10, s2, 19
                  srai         t3, a0, 23
                  xori         a4, s11, -1358
                  slli         tp, s7, 14
                  sltiu        s5, sp, 1232
                  slti         a5, t6, -111
                  addi         s1, s1, 585
                  sub          t5, sp, t3
                  ori          sp, tp, 978
2395:             slli         t6, s6, 30
                  addi         s3, ra, -863
                  bge          a3, t0, 2416f
                  or           t5, a3, t1
                  or           a3, s0, t2
                  slti         s9, s7, -1147
                  blt          s10, t3, 2415f
                  and          t6, t3, s6
                  bgeu         a7, a1, 2405f
                  or           s10, s2, a5
                  lui          t6, 725308
                  srai         s4, t5, 29
                  lui          s1, 21976
                  bgeu         s7, s8, 2419f
                  sltiu        sp, s9, -1340
2415:             srl          a1, a6, s3
2416:             sll          sp, a3, a2
                  bltu         s4, a4, 2425f
                  nop
2419:             sub          s3, a4, a7
                  sll          a4, a6, s11
                  slli         t1, t0, 15
                  blt          s2, s11, 2427f
                  srli         a0, a4, 6
                  srai         s10, a4, 5
2425:             blt          a2, s5, 2427f
                  bltu         s1, s9, 2427f
2427:             add          t2, a0, zero
                  lui          a5, 312288
                  srli         s9, t2, 31
                  bne          zero, s7, 2451f
                  blt          s3, a7, 2443f
                  srai         gp, s1, 12
                  slt          t4, t4, s5
                  bge          s1, s0, 2453f
                  beq          a3, t1, 2455f
                  auipc        a3, 547806
                  srl          gp, s2, s5
                  bne          s7, a6, 2459f
                  srai         t2, a3, 12
                  addi         gp, a3, -775
                  andi         a1, ra, -1317
                  and          s11, a5, a3
                  sub          s10, t3, t3
                  auipc        t4, 602578
                  sub          s5, s4, s2
                  or           s5, a0, gp
2451:             andi         s9, zero, 1914
                  slli         s2, t4, 13
2453:             bltu         t0, a6, 2464f
                  slt          s1, s6, a1
2455:             add          a3, a7, a4
                  srli         a4, t6, 10
                  bgeu         s0, a2, 2475f
                  lui          tp, 372254
2459:             srli         s4, t5, 0
                  addi         t2, t6, 1528
                  slli         s0, s0, 18
2464:             srli         a1, s5, 0
                  xor          ra, s3, a7
                  bge          t4, s1, 2483f
                  andi         t5, s3, 634
                  slti         s3, a2, -1757
                  slti         s9, sp, 402
                  srli         a6, t6, 1
                  or           s10, a5, a2
                  bltu         ra, s8, 2475f
                  srl          s1, a1, s0
                  bltu         s9, t3, 2493f
                  srli         tp, ra, 29
                  bne          s10, ra, 2498f
2483:             and          s1, s6, s1
                  ori          a7, t0, 124
                  sltu         s1, a2, a1
                  bge          s10, s3, 2505f
                  or           a2, t0, zero
                  srl          a2, s10, t5
                  xor          s0, s5, t3
                  lui          gp, 959307
                  auipc        a0, 821222
2493:             srai         a3, a3, 19
                  bgeu         t4, s5, 2514f
                  andi         a3, s7, -250
                  add          t1, t4, s10
                  bltu         s8, s1, 2520f
                  andi         s11, s2, 1485
                  xor          t4, a1, s3
                  srli         a0, a2, 13
                  bgeu         t2, a1, 2508f
                  slti         s10, a4, 1245
2508:             and          gp, gp, tp
                  or           a4, a1, t6
                  bne          a4, a7, 2528f
                  slli         s2, a0, 8
                  srl          s9, t2, t1
                  and          s5, s1, s11
                  nop
                  bgeu         a4, t4, 2525f
                  bgeu         sp, a7, 2535f
                  bne          s8, s6, 2533f
                  slli         s8, s3, 23
2520:             blt          s8, s1, 2521f
2521:             add          s9, a0, s5
                  srl          s3, a1, t0
                  blt          a4, zero, 2537f
2525:             blt          a6, s4, 2526f
                  sra          s2, t3, a2
                  lui          s10, 47827
                  andi         s4, s6, 1216
2533:             sra          s2, t6, s4
                  sub          a0, t6, t0
2535:             bltu         s5, s4, 2541f
                  ori          s2, t0, 1697
2537:             nop
                  sltu         a6, t0, gp
                  sltu         ra, t0, a0
2541:             xori         s4, s0, 81
                  or           tp, a7, a5
                  lui          s5, 63681
                  bge          s1, sp, 2557f
                  nop
                  srai         a7, a0, 16
                  auipc        zero, 172506
                  nop
                  blt          t1, a7, 2564f
                  xori         s4, s3, 1495
                  addi         s1, gp, -540
                  beq          ra, s10, 2559f
                  sltu         a3, sp, s4
                  srl          ra, a0, gp
2557:             or           a6, ra, s10
                  slt          a6, a5, s4
2559:             bgeu         t0, t1, 2566f
                  and          a3, tp, s9
                  srl          s5, s2, a0
                  andi         zero, sp, 339
                  andi         a4, sp, -323
                  addi         a3, a7, -1336
                  add          s3, a6, s4
                  xori         s11, a3, -872
                  sltiu        s1, a7, 907
                  xori         s10, t5, -1724
                  blt          s3, a7, 2587f
                  xori         s5, s9, 968
                  xori         s11, a5, 1431
                  bne          s3, s11, 2581f
                  xori         s4, s10, 883
2581:             bgeu         s7, t3, 2589f
                  sra          a6, t6, s4
                  add          t4, sp, a2
                  bne          t5, zero, 2602f
                  sltu         a6, sp, s5
2587:             ori          a4, s6, -1355
                  bge          t2, s11, 2598f
2589:             ori          a4, t6, 1109
                  ori          s4, a5, -1524
                  xor          t4, a3, s4
                  sub          a6, s8, a3
                  beq          t5, s6, 2606f
                  ori          gp, tp, 157
                  slli         a3, a3, 7
2598:             blt          gp, tp, 2616f
                  srai         t4, sp, 24
                  sub          a4, tp, a1
2602:             addi         s9, s5, -1944
                  and          t5, s4, a1
                  and          s1, s2, s11
                  slli         t1, s10, 3
2606:             beq          s2, t0, 2612f
                  sltiu        zero, s0, 1554
                  nop
                  blt          a4, s10, 2628f
                  auipc        a3, 413299
2612:             sra          s5, a2, tp
                  srli         s2, s0, 30
                  andi         gp, s6, -283
                  add          s11, a3, a3
                  or           a4, gp, tp
                  xori         a5, t5, 664
                  bne          s9, s8, 2630f
                  sltu         s0, s6, s1
2628:             srl          a5, a7, tp
                  blt          a2, t3, 2638f
2630:             addi         zero, a3, -114
                  ori          s1, a7, -1833
                  xor          a3, s4, s11
                  lui          s4, 570093
                  blt          s8, s4, 2650f
2638:             auipc        a3, 677278
                  bge          sp, t1, 2644f
                  xori         t2, sp, 1811
                  auipc        s8, 351528
                  add          s3, ra, a6
2644:             blt          t1, sp, 2662f
                  bltu         s2, t1, 2655f
                  slli         s8, s2, 14
                  beq          a4, t5, 2658f
                  blt          s0, t1, 2662f
2650:             addi         s8, a2, -664
                  sub          s3, s1, s4
                  xori         t4, a1, -365
                  xor          gp, a5, s7
2655:             bltu         a3, s6, 2661f
                  bge          s1, a2, 2674f
2658:             bge          sp, t1, 2669f
                  sra          s10, s11, s9
2661:             slt          sp, s3, s11
2662:             bltu         s6, t3, 2675f
                  sra          s11, s4, s3
                  sll          a7, tp, a0
                  bgeu         t3, a1, 2667f
                  beq          s9, gp, 2685f
2669:             auipc        a0, 134593
                  sra          s10, t1, t5
                  auipc        a1, 404622
                  srli         a3, t5, 18
2674:             bgeu         s4, s6, 2675f
                  srai         sp, s8, 17
                  ori          s11, t5, -1658
                  sltiu        ra, s10, -1883
                  srai         ra, s2, 26
                  slli         a3, s10, 29
                  sltu         t3, ra, ra
2685:             bge          s11, s3, 2703f
                  and          ra, s7, a5
                  and          t4, s0, s0
                  blt          a1, a6, 2706f
                  addi         s9, s6, -1569
                  srl          a3, s5, t5
                  ori          s2, s10, -298
                  blt          a4, zero, 2710f
                  bltu         s8, s1, 2695f
                  add          a0, ra, s0
                  andi         s9, s3, -193
                  slli         t2, t0, 5
                  auipc        a4, 216271
                  slti         t1, t4, 1724
                  addi         s3, t4, 1172
                  srli         a7, t4, 7
2703:             srl          a7, s4, t0
                  auipc        s1, 876213
                  lui          a6, 244066
2706:             bne          s1, t1, 2726f
                  xori         a2, s4, 773
                  or           a0, s2, sp
                  sll          s9, s11, a1
2710:             bgeu         t0, a6, 2730f
                  slti         s4, a1, 1602
                  srli         zero, t0, 8
                  srl          tp, s9, s8
                  xor          zero, t3, a5
                  nop
                  bltu         t1, a3, 2723f
                  slt          a6, a6, t3
                  slti         ra, a2, -1413
                  srai         gp, a3, 2
2723:             sltiu        a2, a0, -1648
                  beq          s9, t4, 2730f
                  srai         a7, t4, 16
2730:             sltu         t2, a6, s10
                  srli         zero, a2, 12
                  bgeu         s0, s11, 2750f
                  bge          s6, s2, 2741f
                  sltiu        gp, s2, -321
                  xor          a7, t0, t0
                  addi         s4, a2, 1569
                  bgeu         ra, s9, 2753f
                  add          t2, s0, a1
2741:             auipc        t5, 1024001
                  srl          t1, t1, s6
                  andi         s8, zero, 1965
                  srai         t1, a3, 16
                  sub          a4, t3, t6
                  srai         a6, s3, 18
                  nop
2753:             xori         t6, t6, 1401
                  lui          s2, 273180
                  bgeu         tp, s0, 2763f
                  beq          s4, a6, 2758f
                  la           sp, region_1+17833
                  and          s1, s3, s4
                  nop
                  nop
                  srl          s0, a2, tp
                  lbu          t6, 6(sp)
                  lbu          s1, -7(sp)
                  xori         a3, t5, 51
                  sltu         t2, t2, t2
                  lh           zero, -5(sp)
                  lb           tp, 8(sp)
                  sb           a3, 8(sp)
                  lb           s1, -8(sp)
                  lb           s3, 15(sp)
                  sb           a6, -10(sp)
                  nop
                  lh           s3, -9(sp)
                  lb           a2, -13(sp)
                  lbu          t3, 14(sp)
                  sb           s9, 9(sp)
                  sll          tp, s8, t2
                  lbu          a6, 12(sp)
                  sra          s1, a4, ra
                  lb           t4, -5(sp)
                  lb           s9, -6(sp)
                  xor          a5, t3, t0
                  sw           tp, 15(sp)
                  sb           t4, -1(sp)
                  lbu          s10, 0(sp)
                  sb           s7, -12(sp)
                  sb           s7, 2(sp)
                  lh           s9, -1(sp)
                  and          s1, a7, s9
                  xor          a5, a5, t6
                  sb           a4, 1(sp)
                  lb           s4, 8(sp)
                  sb           a3, 16(sp)
                  and          t3, t1, sp
                  slli         zero, s6, 16
                  lb           s8, 16(sp)
                  sltu         s0, t0, s8
                  lb           gp, -4(sp)
                  slt          s4, t1, s1
                  slti         a6, s4, -925
                  slti         t2, s9, 1898
                  srl          s10, t3, t6
                  sltiu        a0, s11, 1716
2763:             sll          tp, a2, sp
                  xor          t2, a2, a2
                  sltiu        s8, sp, -115
                  slt          s8, s7, t6
                  srai         zero, gp, 9
                  srli         s10, ra, 22
                  beq          t6, s0, 2792f
                  bltu         s6, zero, 2776f
2776:             sra          s3, zero, a3
                  slti         s4, s11, -764
                  srai         s4, t3, 19
                  lui          t5, 355147
                  srli         a0, sp, 8
                  andi         a7, sp, -72
                  xori         ra, a3, 1021
                  sub          a0, s8, a7
                  nop
                  blt          t2, s3, 2803f
                  sll          s8, t3, s6
                  bgeu         tp, s0, 2797f
2792:             nop
                  sll          tp, s0, s10
                  lui          s9, 629283
                  sub          a5, s1, s11
2797:             lui          a7, 576273
                  andi         t4, t3, -615
                  blt          s4, a3, 2805f
                  add          a2, a6, ra
                  sra          t1, s7, t3
2803:             srl          t3, s9, a2
2805:             ori          s1, t5, -392
                  slt          ra, s9, t5
                  ori          s1, t2, -352
                  and          a7, t3, a7
                  slti         s5, a3, -1145
                  sll          gp, a0, s0
                  srl          t5, s1, t3
                  sltiu        t1, s5, -1543
                  addi         a0, tp, 541
                  nop
                  beq          s4, a4, 2823f
                  addi         t1, t0, -1379
                  nop
                  srai         gp, ra, 3
                  auipc        a1, 436862
                  srai         s10, a4, 17
2823:             ori          a2, s4, 419
                  bge          t1, t4, 2825f
                  slli         t1, a4, 16
                  xor          ra, s11, a6
                  and          t4, s5, t4
                  beq          s4, t2, 2844f
                  bgeu         s10, a5, 2850f
                  xor          a1, t6, a0
                  blt          a2, a2, 2845f
                  auipc        s5, 574108
                  srl          ra, a2, s2
                  blt          t2, s2, 2858f
                  beq          t3, s7, 2855f
                  lui          s0, 553777
                  and          a5, s3, t6
                  addi         s4, a0, 1548
2844:             bne          t1, t0, 2857f
                  slt          t4, a1, t5
                  slli         a7, a0, 26
                  sll          t1, a7, a1
                  bge          s5, s1, 2867f
2850:             slt          s8, a7, s10
                  beq          s4, t6, 2858f
                  sll          a3, s10, s10
                  slt          zero, tp, t4
2858:             slti         a6, s9, -1159
                  bltu         s11, a5, 2860f
2860:             add          a4, a7, t0
                  slti         a5, s0, -298
                  sll          a2, a6, tp
                  bltu         s9, s1, 2881f
                  auipc        s11, 403358
                  beq          s2, s6, 2880f
                  lui          a4, 615679
2867:             beq          a5, t0, 2868f
2868:             slli         sp, s2, 21
                  auipc        sp, 926585
                  sub          s5, s3, zero
                  bgeu         s6, t0, 2882f
                  slt          a1, ra, s10
                  srli         gp, a6, 9
                  srl          s10, s11, s1
                  srl          s2, s4, s8
                  sltu         s4, a3, a3
                  xor          s0, s8, t4
2881:             or           s0, t5, s11
2882:             auipc        sp, 449222
                  add          a7, s5, a0
                  srai         t4, s3, 27
                  slli         t1, t2, 27
                  sltiu        s2, a5, 52
                  bge          a0, t3, 2905f
                  sub          s9, s7, tp
                  lui          s10, 512506
                  sll          t3, s7, sp
                  or           tp, s1, t4
                  bgeu         s3, t3, 2897f
2897:             nop
                  addi         tp, gp, -1420
                  addi         a6, a1, -541
                  srai         s1, a0, 29
                  bgeu         ra, a5, 2919f
                  beq          s11, gp, 2908f
                  blt          tp, a1, 2921f
                  andi         t2, zero, -1816
                  srli         s0, t5, 11
                  auipc        gp, 240919
                  add          s11, gp, t5
                  ori          s10, t6, -19
                  or           s4, a5, t2
                  xori         ra, s4, 1829
                  and          t4, s1, s6
                  srai         a4, s1, 14
2921:             lui          a1, 763631
                  bltu         sp, a5, 2926f
                  addi         sp, t0, -22
2926:             andi         s9, t3, -169
                  srli         s8, s4, 7
                  add          a3, s0, t6
                  sra          s3, tp, a4
                  addi         a2, s8, -449
                  add          s9, t5, a5
                  bgeu         s4, s0, 2951f
                  bge          s8, a6, 2940f
                  addi         s11, s1, -1809
                  sltiu        t2, sp, 2009
                  bne          a6, gp, 2948f
                  sub          t6, s6, ra
                  ori          a1, t3, -1227
2940:             beq          t3, a7, 2957f
                  bltu         s11, gp, 2954f
                  srai         s9, t2, 3
                  ori          t5, t2, 1933
                  blt          a6, s7, 2955f
                  auipc        t5, 91913
                  slli         a0, t3, 20
2948:             nop
                  xori         tp, s0, 446
2951:             bne          a5, a4, 2971f
                  bgeu         s6, t1, 2959f
2954:             srai         ra, s11, 4
2955:             auipc        s3, 241691
                  xor          a1, a1, s6
2957:             slt          a0, s10, a5
                  srai         t6, ra, 6
                  xor          t4, a6, a5
                  blt          t0, gp, 2979f
                  nop
                  sll          t1, zero, s8
                  bltu         a7, s9, 2979f
                  bgeu         s0, t4, 2977f
                  srli         s5, s0, 4
                  slti         s11, sp, 379
                  and          ra, a0, s4
2971:             nop
                  bgeu         s2, t4, 2983f
                  slli         s11, s7, 10
                  slli         tp, s4, 30
2977:             sll          a3, a0, a6
                  bge          t4, ra, 2979f
                  sra          a3, sp, s0
                  auipc        a5, 856543
                  auipc        a7, 416235
2983:             sra          s4, tp, s6
                  sltu         s1, t1, s11
                  bge          s0, s8, 2987f
                  beq          ra, a4, 3004f
2987:             sra          a1, s5, s11
                  beq          t5, t6, 3005f
                  sltiu        a0, s11, 386
                  and          s1, s9, s2
                  srai         a4, t0, 25
                  ori          a6, s3, -1465
                  sub          a1, a3, s9
                  addi         s11, s10, 753
                  sub          s4, sp, s4
                  sltiu        t3, a4, -1112
                  srl          s3, t6, t6
                  srai         s4, t0, 21
3004:             or           a2, s1, a2
3005:             srai         s3, t2, 11
                  xori         a6, gp, -1759
                  blt          s9, a0, 3008f
3008:             sub          tp, s10, a3
                  sra          s0, t4, s11
                  beq          a2, a0, 3016f
                  bne          a0, t2, 3030f
                  addi         s11, a7, 970
                  or           gp, s4, ra
                  auipc        s5, 568546
3016:             xori         s9, sp, 655
                  xor          t3, a4, a5
                  nop
                  blt          ra, s7, 3030f
                  bne          s3, s10, 3036f
                  sll          s2, a5, zero
                  slt          zero, a1, s7
                  sub          s4, s10, a5
                  beq          a7, t0, 3033f
                  srli         s3, s2, 17
                  slt          sp, a0, t2
3030:             sltiu        s1, t3, 1008
                  srai         s3, s7, 22
                  xori         t5, a7, 1109
                  auipc        t5, 886617
                  or           s0, t6, tp
                  or           tp, s5, a6
                  srai         t1, s1, 23
                  bne          s9, s10, 3056f
                  auipc        s9, 1028977
                  nop
                  ori          sp, a4, 1531
                  addi         tp, t6, 28
                  bltu         s6, a0, 3063f
                  bltu         a5, s5, 3057f
                  sltu         gp, a3, a5
                  sltu         t1, s6, s8
                  bne          t0, s5, 3070f
                  xor          t1, a7, t6
                  or           a2, gp, a0
                  srli         a0, a0, 3
3056:             sll          a5, a4, tp
3057:             srl          a3, s7, s3
                  ori          a1, s7, -1793
                  sll          s3, sp, s11
                  beq          s0, zero, 3061f
                  lui          gp, 656636
3063:             xori         a1, s5, -1918
                  slli         t6, s0, 7
                  xori         a0, tp, -1123
                  sltiu        s8, s5, -1287
                  auipc        a4, 579694
                  andi         a4, s3, 1670
3070:             andi         a2, t5, -1573
                  beq          t0, s3, 3077f
                  blt          a4, a3, 3079f
                  auipc        zero, 878763
                  bne          a3, s2, 3092f
                  addi         a4, s10, 1536
3077:             and          s1, s3, gp
                  srl          gp, s1, a1
3079:             slti         a2, s3, 1551
                  auipc        sp, 378201
                  bne          a7, a6, 3089f
                  ori          zero, tp, 1947
                  or           s10, tp, s0
                  blt          zero, t5, 3086f
                  auipc        s4, 358798
3086:             andi         zero, t2, -775
                  xori         s3, gp, 2032
                  sub          a6, s4, t6
3089:             srl          s10, s2, s5
                  srl          a7, s10, s10
                  nop
3092:             bge          ra, s2, 3110f
                  andi         t4, s1, -1877
                  bltu         t6, t4, 3114f
                  srai         sp, s5, 3
                  auipc        s4, 935395
                  or           s10, s1, s10
                  sltiu        zero, t0, -524
                  slli         s9, s11, 14
                  ori          a2, s2, -868
                  sltiu        s0, s9, 1625
                  bltu         a7, s7, 3123f
                  slt          s9, zero, s7
                  nop
                  nop
                  sll          a5, a6, a5
                  xor          t5, t2, s3
                  and          a0, s5, ra
3110:             auipc        s11, 461995
                  auipc        t1, 747339
                  auipc        t6, 43967
                  xori         t4, s3, 878
3114:             slti         t4, a0, 159
                  add          s0, a5, a2
                  sll          s3, sp, sp
                  bgeu         s0, a2, 3130f
                  sub          tp, t1, s9
                  srai         s3, s6, 0
                  srl          a2, gp, t2
                  nop
                  xor          a7, s10, a6
3123:             srli         a1, s3, 15
                  slti         t3, sp, 1476
                  beq          ra, s3, 3139f
                  slli         a0, t0, 28
                  beq          t5, a3, 3146f
                  addi         a5, a5, -1136
3130:             sltiu        s5, a7, 282
                  sll          a3, t0, t5
                  ori          a4, s1, 304
                  sll          sp, s11, t1
                  sltiu        s2, s8, 1050
                  and          s9, s4, s3
                  auipc        s2, 341435
                  nop
                  slti         ra, ra, 1782
                  blt          t2, a3, 3146f
                  slli         s4, a0, 15
                  addi         s4, a3, 652
                  and          t4, sp, ra
3146:             sra          s11, gp, s11
                  xor          a7, s3, t2
                  slt          s1, ra, t0
                  bgeu         a6, t2, 3158f
                  slli         t2, s11, 17
                  sll          a0, s8, s1
                  or           s3, t2, s8
                  auipc        gp, 837104
                  sltu         a0, s5, ra
                  lui          t4, 290085
                  xor          t1, s4, tp
3158:             srli         s9, sp, 31
                  bgeu         t4, s11, 3177f
                  and          s0, a3, t0
                  andi         s4, s1, -667
                  sra          gp, tp, a7
                  srai         ra, t2, 2
                  ori          s5, a1, 1341
                  srai         s3, a2, 25
                  srai         a2, sp, 13
                  or           t2, a7, s7
                  srai         s8, t0, 30
                  sra          sp, a5, ra
                  and          t2, t3, a2
                  slli         s8, s7, 25
                  xor          a6, ra, s0
                  slti         tp, sp, -1401
                  slti         a0, a5, 1206
                  or           a6, s8, zero
3177:             sub          a3, a2, s10
                  sltu         a4, s5, s0
                  or           zero, a6, t0
                  ori          s5, a3, -1364
                  bltu         s4, s10, 3189f
                  blt          s10, s2, 3187f
                  sra          t3, sp, s1
3187:             slli         a5, t4, 29
                  xor          a6, s3, s11
                  slt          s3, s11, sp
                  addi         gp, s8, 873
                  addi         t4, s5, 645
                  slt          s0, sp, a7
                  srai         a5, t0, 14
                  and          s5, s9, zero
                  add          s1, tp, s5
                  sra          a0, a6, tp
                  bne          s2, a2, 3211f
                  bne          s10, t1, 3222f
                  sltu         ra, s2, gp
                  sll          a2, t2, t1
                  and          a3, s0, t1
                  andi         a5, s5, -798
3211:             bgeu         s9, a3, 3213f
3213:             addi         t1, t3, -1259
                  sltu         t2, t0, t2
                  blt          s4, s11, 3218f
3218:             nop
                  bgeu         zero, s8, 3229f
                  addi         a5, s11, 1327
3222:             nop
                  sltu         a3, a5, s2
                  or           t4, t3, a5
                  andi         t1, t4, -1914
                  andi         s10, t4, 899
                  nop
3229:             slt          zero, t0, gp
                  ori          s11, s0, -770
                  srai         a4, t6, 1
                  lui          sp, 848288
                  srli         s1, s9, 20
                  add          s11, t4, s7
                  ori          a5, s9, -1676
                  add          a0, t2, tp
                  sll          t3, s3, a0
                  sra          s3, s10, gp
                  andi         a2, a1, 1985
                  sltu         s9, s7, a5
                  ori          a1, a2, 1552
                  slt          sp, s6, a4
                  lui          gp, 430678
                  auipc        s8, 374765
                  xor          a4, t1, t3
                  slti         s8, s2, -535
                  sltiu        s10, s2, 1982
                  lui          t3, 881733
                  auipc        s0, 230553
                  bgeu         s4, s0, 3272f
                  bltu         t6, s1, 3275f
                  srli         a1, s0, 7
                  bge          a0, s7, 3264f
3264:             and          t6, sp, s10
                  sltiu        t1, a3, -1651
                  beq          ra, s11, 3272f
                  bgeu         a7, s7, 3284f
                  sll          s5, tp, sp
                  xori         t2, t4, -1271
                  xori         tp, a7, -134
3275:             sll          sp, zero, s1
                  auipc        a2, 619338
                  beq          s10, s3, 3285f
                  bne          s6, t6, 3291f
                  slli         s5, s1, 23
                  slli         s0, a0, 18
                  sltiu        tp, s11, 1550
3284:             sltiu        tp, s9, -92
                  srli         zero, s7, 29
                  xori         a7, s11, -1677
                  la           a4, region_1+56771
                  la           s0, region_0+3546
                  lhu          a5, -1419(a4)
                  sw           a2, 14(s0)
                  lb           a6, 276(a4)
                  sw           a2, 14(s0)
                  sb           s2, 1389(a4)
                  lhu          s2, 6(s0)
                  sb           s11, 1067(a4)
                  lb           a0, 1(s0)
                  lw           t3, -1955(a4)
                  lhu          a7, 10(s0)
                  lbu          a5, 10(s0)
                  lbu          s11, -3(s0)
                  lb           t2, -4(s0)
                  lb           a6, 1785(a4)
                  sh           s5, 8(s0)
                  lw           t2, -2(s0)
                  sb           t2, -450(a4)
                  srli         s9, a7, 16
                  auipc        t6, 542838
3291:             sub          s3, a1, sp
                  blt          sp, sp, 3310f
                  beq          s9, ra, 3311f
                  slli         a0, tp, 30
                  nop
                  nop
                  sll          zero, s6, t6
                  sra          t2, t6, t2
                  sra          zero, s3, t3
                  srai         a3, a7, 0
                  srl          s0, s4, gp
                  ori          t2, gp, 954
                  bltu         s0, sp, 3325f
                  beq          s6, a1, 3324f
                  sll          t1, s7, zero
3310:             slti         s0, a7, 1250
3311:             xor          zero, s9, tp
                  sra          a7, t0, s2
                  slli         s4, s8, 4
                  and          tp, gp, ra
                  auipc        t2, 878880
                  sll          s4, zero, zero
                  and          t1, s10, s8
                  add          gp, a5, a2
                  sll          s4, t6, a1
3325:             bltu         t0, s5, 3336f
                  bne          a7, a2, 3344f
                  sub          s11, s3, t4
                  ori          s8, gp, 507
                  blt          a0, t3, 3330f
3330:             lui          a1, 197118
                  and          t5, a3, a2
                  sra          s0, t1, a1
                  srl          s4, a5, t3
                  and          t6, sp, ra
                  nop
                  srli         s2, a4, 5
                  addi         s11, t6, 1883
                  sll          ra, sp, sp
                  sltu         t4, a2, zero
                  sub          s1, s2, a7
                  andi         ra, zero, 1136
                  srai         sp, t1, 14
                  sub          ra, s11, t6
                  bltu         s5, a3, 3361f
                  sub          tp, s11, s5
                  xori         a1, t2, -908
                  add          t1, ra, s3
                  bne          s8, s3, 3372f
                  or           t1, gp, s8
                  andi         sp, a5, 1189
                  bltu         gp, t2, 3370f
                  slt          a2, tp, s11
                  bgeu         sp, s0, 3379f
                  srai         s11, t0, 14
                  add          t5, s11, s9
                  sub          s1, t5, s8
                  sltu         s9, gp, a2
                  addi         a1, t5, 1546
3370:             blt          s8, a0, 3376f
                  srl          a5, t0, tp
                  srai         s5, sp, 0
3376:             slti         zero, t1, 1403
                  addi         t4, s5, 1269
                  blt          gp, ra, 3386f
                  beq          s7, s6, 3398f
                  sub          s3, t1, t3
                  bne          s9, s8, 3391f
                  xori         a5, gp, -893
                  beq          a2, s2, 3402f
                  beq          a1, ra, 3394f
                  bgeu         s8, s2, 3398f
                  add          a0, gp, t3
                  srli         s4, s11, 28
3391:             add          sp, t3, s1
                  slti         s1, t6, 325
                  bgeu         s1, a5, 3404f
3394:             srai         t2, tp, 17
                  bge          s5, s7, 3397f
                  nop
3402:             blt          t3, tp, 3422f
                  srli         a7, t6, 28
3404:             beq          s7, t6, 3422f
                  nop
                  slt          a1, tp, s2
                  sra          s3, a5, tp
                  srai         s3, tp, 12
                  andi         t4, gp, 1015
                  blt          s3, t6, 3424f
                  sltiu        s3, zero, 704
                  sra          a6, tp, s9
                  auipc        a2, 430553
                  srl          t1, s9, s11
                  auipc        s5, 796219
                  slt          s8, s4, t3
                  slti         t1, s3, 1123
                  nop
                  beq          t0, t3, 3428f
3428:             xor          t1, sp, s10
                  sltu         t5, s11, s10
                  blt          t4, s2, 3433f
                  blt          t1, a7, 3443f
                  ori          a5, s11, 1760
                  bltu         t3, t5, 3442f
                  slt          s8, s10, t2
                  sll          zero, t4, ra
                  sltu         t3, s7, s4
                  slti         a1, a4, 1234
                  blt          s7, t4, 3457f
                  add          s0, zero, s5
                  srl          t6, t5, a6
                  sub          s4, s5, a3
                  sltu         a3, t0, s6
                  nop
                  sub          t3, t0, a1
                  sltu         s2, a5, s10
                  sltu         s2, sp, s5
                  srl          s3, zero, a2
                  sll          t2, tp, s6
                  bgeu         a5, gp, 3475f
                  lui          a2, 1035325
3457:             addi         t5, s0, -1343
                  beq          s1, ra, 3459f
3459:             auipc        a3, 460888
                  sll          t4, ra, a4
                  sll          gp, t5, t3
                  srai         t1, a1, 13
                  blt          a7, s4, 3481f
                  sra          t6, s10, s11
                  nop
                  slti         t4, a3, -1652
                  addi         t1, a1, -771
                  sub          a2, s11, s5
                  sltu         a7, s4, tp
                  bne          t1, ra, 3489f
                  auipc        s10, 436564
                  bne          sp, ra, 3482f
                  la           s2, region_1+49253
                  sb           t6, -188(s2)
                  lb           a5, -188(s2)
                  sb           a0, -188(s2)
                  sb           s9, 250(s2)
                  sub          tp, a0, ra
                  andi         a7, t0, -167
                  or           s8, gp, a7
                  lb           t1, -254(s2)
                  nop
                  ori          s0, s6, -308
                  lb           t5, -70(s2)
                  lbu          a0, -206(s2)
                  lb           a2, -74(s2)
                  sb           s7, -74(s2)
                  lbu          t3, -236(s2)
                  bltu         t3, s4, 3487f
3475:             andi         gp, a2, -1317
                  or           t3, t2, zero
                  ori          s8, a3, -979
                  srai         a0, s3, 17
                  addi         ra, t0, 888
3481:             nop
3482:             bltu         s0, t3, 3500f
                  bgeu         gp, a1, 3498f
                  sll          t3, t5, s2
                  srli         s4, sp, 5
3487:             or           s8, sp, s10
                  lui          a4, 285537
3489:             sra          zero, s8, s2
                  add          s5, tp, a6
                  slt          t5, s1, s2
                  sltu         gp, s6, gp
                  lui          s10, 936152
                  blt          t5, a5, 3508f
                  addi         gp, tp, 297
3498:             beq          sp, s3, 3516f
                  add          s9, s5, s7
3500:             and          t5, s2, t0
                  srai         s2, t5, 1
                  sltu         a4, t2, s8
                  bltu         zero, t5, 3522f
                  slli         s0, s6, 29
                  andi         a0, a4, 640
3508:             slt          a2, a6, s8
                  nop
                  slt          a1, t6, s0
                  sltiu        a1, s1, 38
3516:             lui          s10, 895890
                  xori         s4, a1, -1311
                  addi         tp, t2, -1201
                  srai         t3, a0, 2
                  srai         gp, a4, 23
                  beq          gp, a5, 3529f
                  sra          a5, s7, a7
                  slt          s10, s1, a7
                  or           a2, t2, sp
                  slti         t1, s0, -465
3529:             sra          s5, t5, t0
                  auipc        a1, 216771
                  xor          s10, t3, s2
                  addi         t4, a4, -971
                  sltu         sp, a7, s0
                  andi         a0, a7, 1657
                  auipc        s9, 621584
                  sltiu        a6, sp, -1461
                  sll          s3, s4, s8
                  andi         s10, s7, 389
                  addi         ra, zero, 743
                  sltu         a3, s5, a2
                  bgeu         s3, s5, 3544f
3544:             auipc        a6, 661425
                  andi         s8, s0, -1742
                  bge          sp, s0, 3551f
                  addi         s0, sp, -1132
                  bltu         a3, t5, 3550f
                  andi         s4, s7, 1448
3550:             srl          s8, t4, a3
                  srai         a7, gp, 23
                  sll          t5, t3, gp
                  sltiu        s0, a2, -1239
                  bgeu         s5, t5, 3569f
                  xori         s2, sp, -2004
                  bgeu         a3, t2, 3568f
                  xor          a4, s10, tp
                  bne          s2, ra, 3565f
                  bltu         s8, t3, 3568f
                  srl          a5, t3, s0
3565:             sub          t2, s10, t2
                  auipc        s5, 312594
3568:             bge          s6, s10, 3577f
3569:             bgeu         t4, s7, 3584f
                  srli         tp, a6, 29
                  slt          t1, t4, a6
                  auipc        t3, 259430
                  xori         a0, a6, 925
                  bltu         s7, s3, 3587f
3577:             bne          zero, s9, 3595f
                  sltiu        zero, s11, 1881
                  blt          s11, t0, 3596f
                  srli         t5, s6, 15
                  slli         zero, t2, 29
3584:             ori          s8, t1, 1021
                  sltu         t1, a5, a4
                  and          s1, a1, a4
3587:             auipc        s9, 338131
                  add          s11, s7, a2
                  srai         s0, t2, 9
                  slti         s4, t1, -261
                  and          s3, t2, tp
                  srai         a1, s5, 13
3595:             srai         s3, t1, 19
                  bltu         t5, a7, 3598f
3598:             lui          s2, 518690
                  srl          s8, zero, s5
                  beq          s1, a6, 3608f
                  andi         s0, a4, -1950
                  beq          zero, sp, 3614f
                  slli         s11, s7, 9
                  sub          s1, t4, ra
                  sll          t4, t5, a4
3608:             srl          s8, a3, s8
                  sltu         a0, a3, s4
                  beq          a2, t0, 3630f
                  slli         t2, t6, 9
3614:             srli         a6, s2, 31
                  xor          s5, a0, t6
                  slti         t4, a1, 1887
                  blt          a5, s2, 3635f
                  xori         s2, sp, -1680
                  bltu         t0, a5, 3637f
                  xor          a6, t0, a6
                  sll          a3, s5, a7
                  srli         a3, zero, 22
                  bltu         a7, s3, 3638f
                  blt          a4, zero, 3644f
                  xori         ra, tp, 1415
                  blt          t1, t0, 3635f
3630:             bltu         a5, a3, 3647f
                  srl          a3, a5, a2
                  sll          s1, zero, t3
                  addi         a4, sp, -649
3635:             slt          t5, t3, s10
3637:             andi         zero, s5, -1831
                  bge          t1, s2, 3658f
                  slt          a6, a0, s5
                  sltu         s4, tp, t0
                  la           sp, region_0+3699
                  lh           s2, -61(sp)
                  sra          a5, a4, a4
                  andi         tp, s2, 723
                  lui          s11, 540591
                  sb           s0, -22(sp)
                  lbu          s2, -58(sp)
                  slt          a4, s2, a5
                  lb           s0, -10(sp)
                  sb           s0, -47(sp)
                  lb           s11, -60(sp)
                  ori          tp, a4, 5
                  lw           tp, -11(sp)
                  ori          a4, a5, -225
                  andi         a4, a5, 1384
                  and          s11, s11, s11
                  sb           s11, -58(sp)
                  lw           s2, -31(sp)
                  and          s2, s0, s0
                  lbu          s11, -26(sp)
                  sltu         a5, s0, s0
                  srl          a5, s11, tp
                  xor          s0, s0, a4
                  sltiu        a5, a4, 1827
                  slli         tp, s11, 20
                  andi         s2, s0, -889
                  slti         a4, a5, -1442
                  lui          s11, 627704
                  srl          s11, s11, a5
                  lh           a5, 23(sp)
                  ori          s0, s0, -1712
                  lb           s0, 2(sp)
                  add          a5, s2, s0
                  or           a4, s0, s2
                  srl          a4, s2, a5
                  lbu          a4, 37(sp)
                  nop
                  lb           s0, -35(sp)
                  lbu          a4, -32(sp)
                  lh           s2, -3(sp)
                  xori         tp, a4, -240
                  lbu          s11, 48(sp)
                  sh           tp, 59(sp)
                  srli         s11, t5, 22
                  addi         a6, s11, -160
                  bltu         t4, t0, 3647f
3647:             add          a0, a3, a6
                  slti         s9, s4, -446
                  sub          s0, a0, a1
                  addi         t2, a2, 1158
                  bge          a0, a7, 3665f
                  sra          a7, s3, ra
                  bgeu         a7, t1, 3655f
3655:             sltu         t5, s2, s6
                  bgeu         s6, s4, 3662f
                  or           a0, a2, t0
3658:             xori         a6, zero, -860
                  andi         t6, s9, 1098
                  la           s2, region_1+21975
                  sltiu        s5, s1, 1484
                  add          s5, s1, s1
                  sb           tp, 811(s2)
                  sra          a3, s5, a1
                  auipc        a1, 565953
                  sb           t2, 1885(s2)
                  lbu          a3, -1590(s2)
                  xor          s1, s1, s5
                  sb           tp, 401(s2)
                  lw           tp, -1823(s2)
                  sb           a1, 1282(s2)
                  lbu          a3, 1821(s2)
                  slt          tp, t2, s1
                  sub          a3, a1, tp
                  xori         a1, t2, 1332
                  lbu          s1, 50(s2)
                  sb           t2, 381(s2)
                  lb           t2, 1339(s2)
                  sb           a1, 326(s2)
                  sb           s1, 66(s2)
                  lbu          a3, -748(s2)
                  add          a3, s1, a1
                  lb           s5, 1179(s2)
                  add          s5, s5, s5
                  srl          a3, a1, s5
                  ori          t2, a3, -574
                  xor          s1, s1, s1
                  sb           t2, 1506(s2)
                  srl          tp, s5, a3
                  lbu          a1, -974(s2)
                  sb           t2, -1816(s2)
                  xori         a3, a1, 1468
                  sb           t2, -1280(s2)
                  lbu          t2, -755(s2)
                  sb           a3, 634(s2)
                  sb           a3, -1035(s2)
                  lbu          a1, 1828(s2)
                  ori          s1, s5, -393
                  xor          a1, tp, t2
                  sb           tp, -1273(s2)
                  lb           a3, -1314(s2)
                  lb           s1, 1148(s2)
                  ori          a3, a1, -1508
3662:             or           t3, s11, s10
                  bne          a4, s10, 3670f
3665:             beq          a5, s9, 3685f
                  xor          t1, s11, s10
                  sll          t5, a6, zero
                  lui          a5, 198740
                  lui          t5, 818738
                  bltu         s0, t2, 3674f
                  slli         sp, s2, 1
3674:             bne          t3, t5, 3690f
                  beq          a0, s1, 3695f
                  xor          t3, s5, s2
                  bge          a0, tp, 3683f
                  sltiu        a0, s9, 918
                  slti         s10, a4, -1194
                  sltiu        a6, s8, 1233
                  andi         a2, a1, -1109
                  xori         a7, t1, 324
3683:             ori          ra, a5, 1036
                  bge          t4, s10, 3686f
3685:             slti         gp, ra, 1729
                  add          a1, t2, a4
                  bge          ra, a3, 3698f
                  bgeu         t4, tp, 3691f
3690:             slt          a0, gp, tp
3691:             beq          gp, t3, 3708f
                  sub          t2, a2, s2
                  bne          s2, a5, 3707f
3695:             slli         s1, t4, 23
                  srai         a3, s5, 11
                  bgeu         s11, t4, 3713f
3698:             bltu         s9, s9, 3703f
                  bltu         s2, a7, 3712f
                  slti         tp, a0, 1063
3703:             bge          s7, t3, 3709f
                  bltu         s7, sp, 3722f
                  bltu         s10, ra, 3714f
3707:             sltu         a5, a4, a1
3708:             slt          a1, s2, a0
3709:             ori          s3, s1, -1963
                  xor          tp, t4, s0
3712:             xor          a1, s5, t3
3713:             bltu         ra, s8, 3731f
3714:             lui          a6, 872743
                  sltiu        t6, s0, 650
                  add          a2, s1, s1
                  bne          s0, t1, 3726f
                  sltiu        gp, a0, -80
                  and          t4, zero, a5
                  lui          s0, 221849
                  slt          zero, gp, t1
                  xor          ra, a1, s4
3726:             addi         a4, s2, -975
                  sub          sp, s8, s2
                  auipc        a3, 716541
3731:             slt          zero, t3, s0
                  sltu         a7, ra, t6
                  srli         s3, s9, 2
                  add          ra, a5, s0
                  sra          tp, a7, s2
                  sub          t5, t4, a6
                  sll          a3, s8, s6
                  and          s8, a1, gp
                  ori          gp, t6, -1553
                  sra          s5, t6, a0
                  bge          s11, s0, 3746f
3746:             slti         s4, gp, -1692
                  nop
                  and          a0, a5, s4
                  bge          a3, tp, 3767f
                  sltiu        a7, s0, -151
                  andi         a3, a6, 2009
                  bltu         a6, s5, 3770f
                  andi         a6, s4, -656
                  blt          a2, s6, 3770f
                  bne          a1, a1, 3771f
                  sra          tp, s1, s7
                  and          a4, ra, a4
                  auipc        ra, 423874
                  sltiu        s0, t0, 396
                  beq          a6, gp, 3764f
                  bgeu         s7, t1, 3771f
                  srli         t4, s4, 20
3767:             sll          a5, a3, s4
                  xori         t6, s2, 1488
                  sub          t1, t0, ra
                  and          gp, s0, s8
                  ori          a1, a0, -1357
                  andi         s11, a3, -1346
                  xor          s0, s5, s11
                  sll          s8, s3, s11
                  sra          gp, a3, a0
                  lui          s10, 1013933
                  slt          s11, s4, t2
                  slli         zero, a2, 30
                  sra          s1, zero, a3
                  auipc        a7, 112592
                  auipc        gp, 623
                  or           s1, t0, s1
                  lui          sp, 942243
                  sub          ra, t6, s8
                  sltu         t5, tp, tp
                  bltu         a5, ra, 3812f
                  srli         s2, s4, 26
                  and          t4, gp, t6
                  bge          a4, s3, 3802f
                  or           sp, a7, t1
                  srl          s1, t3, a7
                  auipc        s4, 76017
3802:             addi         a0, a1, -1472
                  lui          a2, 620591
                  xor          sp, s11, t4
                  xor          t1, s6, s9
                  addi         t1, a2, -616
                  auipc        a4, 962081
                  bgeu         t1, t0, 3827f
3812:             slti         t4, t1, -1725
                  sltiu        s11, t1, 25
                  bltu         tp, a2, 3815f
3815:             sll          a5, tp, s9
                  nop
                  sltu         a6, ra, s11
                  blt          a7, gp, 3831f
                  lui          t2, 603098
                  slli         s2, a2, 13
                  sltiu        gp, t3, -1776
                  slli         t1, s7, 6
                  srli         ra, a3, 24
                  sub          a7, tp, zero
                  bgeu         a6, zero, 3837f
3827:             auipc        t6, 663560
                  srl          a3, gp, a4
                  srai         a5, sp, 4
                  slti         s5, s3, -1155
3831:             or           s0, a1, gp
                  sub          s4, a7, t0
                  bne          tp, a7, 3853f
                  srai         s4, a6, 23
                  bge          t3, s1, 3854f
3837:             slti         a5, s5, 1376
                  addi         a6, t2, 1502
                  slli         s9, t4, 30
                  slt          tp, s4, sp
                  sra          t6, t5, a5
                  sub          s2, t4, t1
                  slti         a5, a2, 173
                  slli         s0, t6, 26
                  srli         s4, s8, 26
                  sra          a7, t5, t0
                  slli         a2, a7, 30
                  lui          sp, 907316
3853:             add          a0, tp, s8
3854:             andi         a0, ra, -2025
                  bltu         s1, a3, 3872f
                  nop
                  srai         a5, a7, 0
                  auipc        s3, 103054
                  srai         s2, gp, 27
                  srai         sp, a0, 15
                  ori          t1, s0, -1058
                  slti         s9, s8, -1261
                  srl          a7, gp, s2
                  xor          t5, t6, a0
                  srli         s5, a0, 21
                  srai         a3, a1, 23
                  sltu         s11, s0, ra
                  blt          a0, s4, 3877f
                  bgeu         s4, t1, 3885f
                  add          t4, s2, s3
3877:             srai         t4, t2, 20
                  xori         t1, a0, 1201
                  and          s11, a6, s7
                  sltiu        gp, s8, -965
                  xor          tp, s4, t6
3885:             add          a7, t0, tp
                  sltu         zero, t0, t5
                  xori         s10, a5, -1131
                  add          s5, s7, zero
                  slli         a7, s9, 16
                  andi         a7, s5, -941
                  auipc        s5, 357897
                  xori         a1, s6, -616
                  sltu         t5, s11, s2
                  add          a1, a2, t5
                  sra          s11, t5, s7
                  or           s8, s10, t6
                  sltu         s8, a6, ra
                  bne          t1, t3, 3911f
                  addi         s8, ra, 216
                  srl          s10, a4, gp
                  srli         a3, t1, 11
                  slti         a1, s4, 1702
                  bltu         s8, s5, 3923f
                  bge          tp, s4, 3919f
                  sub          ra, t2, zero
3911:             bgeu         s10, s3, 3918f
                  slli         t4, a1, 26
                  addi         s1, a5, -1913
                  sub          t2, s8, t2
3918:             srai         s9, a7, 6
                  bge          a7, s4, 3928f
                  sub          a4, t2, s9
                  blt          t3, zero, 3939f
3923:             slt          a1, a5, s6
                  addi         s4, s0, 480
                  sltu         a1, s0, t3
                  and          t5, t3, s9
                  nop
                  andi         a5, sp, 1942
                  bgeu         a3, zero, 3948f
                  xori         t3, a4, -855
                  add          a3, a6, zero
                  bltu         tp, s4, 3934f
                  srai         a1, t4, 6
                  bgeu         ra, a2, 3954f
                  sub          sp, s0, t6
                  and          a1, s1, a2
3939:             blt          s10, s4, 3959f
                  sltiu        ra, a7, 610
                  srl          ra, a6, s4
                  bne          s4, s9, 3951f
                  sll          t2, gp, t1
                  lui          a2, 87288
3948:             andi         s10, a6, 583
                  sltiu        s11, s0, -788
                  bgeu         a5, s8, 3967f
                  beq          t0, a3, 3968f
                  sub          t4, t5, s3
                  srl          s4, s8, s9
3959:             sra          zero, t6, ra
                  and          t4, t0, a0
                  beq          s10, s8, 3981f
                  blt          t0, s2, 3963f
                  sll          a1, s3, a4
                  sltiu        s2, t2, -668
3967:             addi         s8, ra, 1825
3968:             nop
                  srli         t1, a1, 9
                  andi         zero, a0, 309
                  srli         s10, s3, 20
                  la           tp, region_1+48162
                  srli         t6, a2, 27
                  lb           s4, -11(tp)
                  srai         s11, t5, 24
                  slli         s2, s9, 30
                  sb           s11, 10(tp)
                  sb           t6, 7(tp)
                  nop
                  sb           t0, -7(tp)
                  sw           s0, -10(tp)
                  lbu          t3, 15(tp)
                  sb           a3, 15(tp)
                  sb           a6, -7(tp)
                  lhu          gp, -10(tp)
                  srli         t6, zero, 31
                  lbu          s9, 8(tp)
                  addi         s5, a0, 1473
                  lhu          a6, -6(tp)
                  xor          a0, s10, gp
                  xor          gp, t1, a2
                  sll          t2, a0, s4
                  or           t5, a1, s1
                  lbu          s9, 7(tp)
                  lw           a0, 10(tp)
                  add          a0, s4, s2
                  add          s8, s2, ra
                  lbu          gp, -5(tp)
                  nop
                  sb           s9, 8(tp)
                  sb           t5, -11(tp)
                  sb           t1, -12(tp)
                  srai         s2, t0, 10
                  sw           t5, -14(tp)
                  sub          t1, s2, s11
                  sltiu        s4, a3, -816
                  addi         ra, ra, 453
                  sra          s8, a1, t5
                  bge          s7, tp, 3982f
                  bge          t0, s7, 3995f
                  or           a2, s6, t4
3981:             bge          t0, t3, 3983f
3982:             bne          a2, s9, 3995f
3983:             sll          s5, a5, t3
                  bltu         a3, t2, 3990f
                  xor          a2, t1, s6
                  sltiu        t3, s6, -566
                  addi         tp, a0, 1896
                  ori          zero, s3, -555
3990:             slti         tp, a2, -540
                  srl          ra, a3, t5
                  bne          a6, a3, 4010f
                  bne          s2, a0, 4010f
                  nop
3995:             bge          a0, a6, 4011f
                  bge          s7, s0, 4014f
                  xori         sp, a0, 1419
                  bltu         gp, t3, 3999f
3999:             add          s11, t3, s11
                  or           t1, s11, a6
                  slti         zero, s8, 1741
                  ori          a0, s7, 1384
                  xor          s5, tp, sp
                  beq          s6, a0, 4014f
                  or           a3, t6, t1
                  bgeu         s2, t5, 4013f
                  srai         zero, s8, 31
                  slt          zero, s6, ra
4010:             nop
4011:             or           tp, s5, tp
                  or           a6, a3, t2
4013:             bge          s4, t0, 4015f
4014:             beq          s10, s1, 4027f
4015:             srai         t5, s4, 3
                  sltu         gp, t4, a5
                  sra          a2, gp, a7
                  sltu         t2, a3, s4
                  srl          a5, s11, t1
                  addi         a2, a3, 896
                  sra          s4, s11, a2
                  bge          s10, tp, 4035f
                  xori         sp, a6, -425
                  bne          ra, s7, 4034f
                  srl          s3, s9, t5
                  bltu         a3, s7, 4038f
                  addi         a1, t4, 1322
                  bge          s7, s3, 4039f
4035:             sub          t6, s5, a7
                  srai         s4, s9, 7
                  sltiu        s10, t0, -1381
4038:             add          t4, t3, s6
4039:             bge          t0, s5, 4057f
                  xori         t6, t0, 1260
                  bltu         t0, t3, 4047f
                  blt          a6, s4, 4060f
                  srai         s5, t4, 5
                  srai         a5, t6, 28
                  slt          s10, zero, s6
4047:             blt          a3, s0, 4064f
                  sra          s2, a7, a2
                  srl          s10, t2, a0
                  srli         zero, a3, 13
                  slli         tp, s3, 7
                  sltu         a1, sp, s2
                  xori         ra, t4, -1832
4057:             xori         sp, s10, 1955
                  add          a4, zero, gp
4060:             ori          t3, s10, 905
                  auipc        s1, 628174
                  sll          t4, a4, t6
                  sub          a4, s6, a0
4064:             sltiu        s10, s2, -47
                  beq          a6, a1, 4081f
                  slli         s3, s0, 6
                  or           a5, a4, s5
                  or           s10, t2, s11
                  xor          s10, s0, s5
                  ori          t1, a7, -1306
                  bne          s0, s0, 4076f
                  lui          s9, 582021
                  slli         s5, ra, 4
                  lui          a0, 283890
                  sltu         s4, t6, s0
4076:             sub          a6, a3, s10
                  blt          t6, t0, 4097f
                  bne          a1, zero, 4082f
4081:             add          s3, t5, s4
4082:             ori          a2, gp, 1455
                  bge          s8, s1, 4101f
                  nop
                  srai         a7, t5, 3
                  andi         a4, t3, 256
                  bne          tp, sp, 4093f
                  lui          s4, 933890
                  slli         s3, s2, 26
                  slt          s3, a7, a7
                  slli         s0, tp, 5
4093:             beq          s11, s5, 4104f
                  sll          s11, t1, s9
                  nop
4097:             slli         tp, t0, 24
                  add          a3, s1, t4
                  slt          s0, s1, a6
                  add          t1, t1, t6
4101:             auipc        t2, 180672
                  bne          t5, a4, 4109f
                  and          s3, t5, t1
4104:             and          s0, s3, a1
                  and          sp, s3, s0
                  nop
                  xor          t3, a3, s5
                  lui          ra, 609008
4109:             slt          s2, s5, zero
                  or           t6, t5, sp
                  srli         a1, s9, 3
                  xor          s3, s6, s11
                  slti         t4, s7, 744
                  andi         t4, t5, -107
                  bltu         a3, a0, 4133f
                  addi         t1, s4, 1943
                  sltu         s5, a7, t0
                  sltiu        s2, sp, -132
                  auipc        s2, 797643
                  slti         t5, t4, 1969
                  blt          ra, a2, 4124f
4124:             addi         ra, a5, 1850
                  bge          t3, t3, 4145f
                  srai         a3, s1, 3
                  bge          tp, sp, 4137f
                  beq          t0, s5, 4143f
                  xori         ra, gp, -656
                  bge          s0, a5, 4132f
4132:             srai         s0, s8, 16
4133:             xori         s1, a7, -1751
                  ori          s8, s7, -1526
                  sll          s11, s7, s5
                  and          sp, gp, t5
                  sltiu        a5, s6, -18
                  bltu         zero, a3, 4158f
                  beq          sp, zero, 4154f
                  xori         gp, ra, 1628
4143:             or           t1, s5, s6
                  nop
4145:             lui          t4, 94881
                  srai         a6, a7, 25
                  srli         a4, s10, 31
                  sra          s1, a5, s9
                  and          t2, t5, ra
                  bltu         a3, a5, 4152f
4152:             srl          s8, s10, s0
                  sub          s3, a4, t5
4154:             lui          a6, 619644
                  bgeu         s2, t1, 4156f
4156:             sub          t4, a1, s4
                  andi         a5, t6, -1915
                  bltu         t0, t1, 4172f
                  xori         s8, t3, -1355
                  sra          tp, t5, s10
                  andi         a6, tp, -1913
                  addi         a0, s6, -839
                  and          s8, a4, gp
                  bltu         a3, t6, 4189f
                  ori          t3, s4, -374
                  add          t6, sp, s0
                  slt          t4, a2, t3
                  andi         a3, t3, 965
                  add          a3, a5, t4
                  add          a5, t6, a7
                  addi         t5, a0, -1983
                  blt          s9, a6, 4193f
                  ori          a7, a7, -1231
                  bgeu         s6, t5, 4193f
                  slti         a1, t6, 508
                  xor          t5, tp, s6
                  ori          a4, a0, -934
                  auipc        a4, 465965
                  sltu         t4, a6, a5
                  beq          s10, t6, 4193f
                  bge          s9, s7, 4193f
                  bgeu         t3, t1, 4193f
4193:             srl          t4, a4, t2
                  slti         a0, a1, 262
                  xor          s9, s11, s2
                  sub          s2, s1, tp
                  add          s3, s0, s0
                  and          s11, t3, s4
                  lw           ra, 4(s7)
                  auipc        t1, 1003757
                  slt          s3, s1, a1
                  addi         s7, s7, 12
                  slti         s5, a5, -943
7355:             addi x10, x1, 0
7355:             jalr x10, x10, 0
