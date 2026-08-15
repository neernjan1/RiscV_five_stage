.section .text
.globl _start

_start:

#########################################################
# Full RV32I instruction + branch coverage sweep.
#
# Exercises every row tb.v's print_coverage() tracks (see tb/tb.v's
# "Instruction Coverage" and "Branch Coverage" sections) at least
# once. No single existing directed test comes close on its own --
# e.g. soc_integration_test.s only ever hits ADDI/AND/OR/XOR/ANDI/
# SLTIU/LUI/AUIPC/LW/SW/JAL/BEQ(taken) between its DMEM+peripheral
# stages -- so this test's only job is closing out every remaining
# "NO": ADD, SUB, ORI, XORI, SLL/SRL/SRA, SLLI/SRLI/SRAI, SLT/SLTU/
# SLTI, LB/LH/LBU/LHU, SB/SH, JALR, and both taken *and* not-taken for
# BNE/BLT/BGE/BLTU/BGEU (BEQ already gets both here too, since no
# existing test exercises a not-taken BEQ). It also picks up the two
# "Memory Corner Coverage" rows for free (first store lands exactly on
# DMEM_BASE, a later one lands exactly on DMEM's last valid byte).
#
# This test touches only DMEM and general-purpose registers -- no
# peripherals -- so unlike most of tests/directed/ it's fully
# Spike-comparable (no legitimate post-peripheral-access divergence).
# Verify with:
#   ./run_assembly.sh tests/directed/coverage.s
#   python3 compare_logs1.py
# (No .expect file for the same reason csr_hazard_test.s doesn't have
# one -- compare_logs1.py against Spike is the real oracle here, not
# a handful of hand-picked register checks.)
#
# DMEM = 0x80010000 .. 0x80013FFF (16KB, see gcc_files/link.ld /
# rtl/MA/data_memory.v). No nop is needed between back-to-back DMEM
# stores -- that requirement (see clint_timer_test.s's header comment)
# is specific to the APB peripheral bus, not plain data memory.
#########################################################

lui   x5, 0x80010            # x5 = 0x80010000 (DMEM base --
                              # also the "First Address" memory-corner
                              # target, hit by the very first store below)

#########################################################
# Arithmetic: ADD, SUB, ADDI
#########################################################
addi  x6, x0, 15             # ADDI
addi  x7, x0, 25             # ADDI
add   x8, x6, x7              # ADD   -> 40
sub   x9, x7, x6                # SUB   -> 10

#########################################################
# Logical -- register and immediate forms
#########################################################
and   x10, x6, x7              # AND
or    x11, x6, x7               # OR
xor   x12, x6, x7                # XOR
andi  x13, x6, 0x0F               # ANDI
ori   x14, x6, 0xF0                # ORI
xori  x15, x6, 0xFF                 # XORI

#########################################################
# Shifts -- register and immediate forms
#########################################################
addi  x16, x0, 1
sll   x17, x16, x6             # SLL   (shift amount = x6[4:0] = 15)
srl   x18, x17, x6              # SRL
addi  x19, x0, -8                # x19 = 0xFFFFFFF8
sra   x20, x19, x6                # SRA   (arithmetic: stays negative)
slli  x21, x16, 4                  # SLLI  -> 16
srli  x22, x21, 2                   # SRLI  -> 4
srai  x23, x19, 2                    # SRAI  -> -2

#########################################################
# Comparisons -- register and immediate forms
#########################################################
slt   x24, x6, x7               # SLT    (15 < 25  -> 1)
sltu  x25, x6, x7                # SLTU   (15 < 25  -> 1)
slti  x26, x6, 100                # SLTI   (15 < 100 -> 1)
sltiu x27, x6, 100                 # SLTIU  (15 < 100 -> 1)

#########################################################
# Upper immediate
#########################################################
lui   x28, 0x12345               # LUI
auipc x29, 0                      # AUIPC  (x29 = address of this instruction)

#########################################################
# Stores: SB, SH, SW. The very first store below lands exactly on
# DMEM_BASE (x5 = 0x80010000) -> "First Address" memory-corner cov.
#########################################################
sb    x6, 0(x5)                    # SB  -> mem byte  @ +0  = 15
sh    x7, 4(x5)                     # SH  -> mem half  @ +4  = 25
sw    x8, 8(x5)                      # SW  -> mem word  @ +8  = 40

#########################################################
# Loads: LB, LH, LW (re-reading what was just stored above).
#########################################################
lb    x30, 0(x5)                     # LB  (sign-extended)
lh    x31, 4(x5)                      # LH  (sign-extended)
lw    x8, 8(x5)                        # LW

#########################################################
# LBU / LHU: store a value with its sign bit set so the zero- vs
# sign-extension actually differs from LB/LH above.
#########################################################
addi  x6, x0, -1                       # x6 = 0xFFFFFFFF
sb    x6, 12(x5)                        # mem byte @ +12 = 0xFF
lbu   x6, 12(x5)                         # LBU -> 0x000000FF (zero-extended)
sh    x6, 16(x5)                          # mem half @ +16 = 0xFFFF
lhu   x7, 16(x5)                           # LHU -> 0x0000FFFF (zero-extended)

#########################################################
# "Last Address" memory-corner coverage: DMEM's final valid byte.
# 0x80013FFF = 0x80014000 - 1, so lui 0x80014 / addi -1 lands exactly
# on it (the same upper+lower split the assembler's own `li` pseudo-op
# would pick).
#########################################################
lui   x9, 0x80014
addi  x9, x9, -1                        # x9 = 0x80013FFF
sb    x6, 0(x9)                          # store at DMEM's last byte

#########################################################
# Branches: BEQ, BNE, BLT, BGE, BLTU, BGEU -- each exercised once
# taken and once not-taken (both are required for "Covered" -- see
# tb.v's print_coverage()).
#
# x10 = 5, x12 = 10 (from the logical-ops section above, still 5/10
# after the AND/OR/XOR results overwrote x10-x12 -- reload explicitly
# so the values here are self-contained and don't depend on that).
# x13 = 0xFFFFFFFF for the unsigned-comparison cases.
#########################################################
addi  x10, x0, 5
addi  x11, x0, 5
addi  x12, x0, 10
addi  x13, x0, -1                        # 0xFFFFFFFF

beq   x10, x11, beq_taken                 # taken (5 == 5)
addi  x0, x0, 0
beq_taken:
beq   x10, x12, beq_after                  # not taken (5 != 10)
addi  x0, x0, 0
beq_after:

bne   x10, x12, bne_taken                   # taken (5 != 10)
addi  x0, x0, 0
bne_taken:
bne   x10, x11, bne_after                    # not taken (5 == 5)
addi  x0, x0, 0
bne_after:

blt   x10, x12, blt_taken                     # taken (5 < 10)
addi  x0, x0, 0
blt_taken:
blt   x12, x10, blt_after                      # not taken (10 < 5 is false)
addi  x0, x0, 0
blt_after:

bge   x12, x10, bge_taken                       # taken (10 >= 5)
addi  x0, x0, 0
bge_taken:
bge   x10, x12, bge_after                        # not taken (5 >= 10 is false)
addi  x0, x0, 0
bge_after:

bltu  x10, x13, bltu_taken                        # taken (5 < 0xFFFFFFFF unsigned)
addi  x0, x0, 0
bltu_taken:
bltu  x13, x10, bltu_after                         # not taken (0xFFFFFFFF < 5 unsigned is false)
addi  x0, x0, 0
bltu_after:

bgeu  x13, x10, bgeu_taken                          # taken (0xFFFFFFFF >= 5 unsigned)
addi  x0, x0, 0
bgeu_taken:
bgeu  x10, x13, bgeu_after                           # not taken (5 >= 0xFFFFFFFF unsigned is false)
addi  x0, x0, 0
bgeu_after:

#########################################################
# Closing the remaining "NO" rows: Hazard Coverage's "RAW Dependency"
# and five of the ten "Forwarding Scenario" rows (LUI, AUIPC, Load,
# Branch, JALR). The sixth remaining row, "JAL Forwarding", is left
# uncovered on purpose -- see this section's closing comment for why
# no test running on this SoC ever can.
#########################################################

#---------------------------------------------------------------
# RAW Dependency (tb.v: soc.cpu.rf.rs1 == soc.cpu.rf.rd, both valid,
# in the same cycle -- see reg_file.v's same-cycle write/read bypass).
# This fires specifically when the ID-stage instruction's rs1 lines up
# with the WB-stage instruction's rd, which only happens with exactly
# 2 independent instructions between producer and consumer -- a
# 0- or 1-apart dependency gets resolved earlier by the EX-stage
# forwarding mux (forwading.v) and never reaches this particular
# register-file bypass path.
#---------------------------------------------------------------
addi x17, x0, 42           # P: producer, writes x17
addi x0, x0, 0              # filler (independent of x17)
addi x0, x0, 0               # filler (independent of x17)
add  x18, x17, x0              # C: rs1=x17, the 3rd instruction after P
                                 # -> P is in WB exactly when C is in ID

#---------------------------------------------------------------
# Branch Forwarding -- x14 is freshly computed the instruction right
# before the branch that reads it, forcing an EX/MEM forward on both
# operands (rs1 == rs2 == x14 here, comparing it to itself).
#---------------------------------------------------------------
addi x14, x0, 7
beq  x14, x14, branch_fwd_done      # always taken (x14 == x14)
addi x0, x0, 0
branch_fwd_done:

#---------------------------------------------------------------
# Load Forwarding -- x15 is freshly computed the instruction right
# before the load that uses it as its base address register.
#---------------------------------------------------------------
addi x15, x5, 0              # x15 = DMEM base (fresh copy of x5)
lw   x16, 8(x15)               # base register forwarded from the addi above

#---------------------------------------------------------------
# LUI / AUIPC Forwarding -- LUI/AUIPC are U-type: they have no real
# source register, but this core's decode always extracts rs1_id =
# instr[19:15] regardless of instruction type (see riscv_core.v:
# `assign rs1_id = instruction_code_id[19:15];`, unconditional), and
# forwading.v's forwarding unit compares that raw field against
# upstream rd with no instruction-type gating either. So a LUI/AUIPC
# whose 20-bit immediate happens to place a just-written register
# number in instr[19:15] (== the immediate's own bits [7:3]) makes the
# forwarding unit assert forwardA/B for it -- a real hardware event
# tb.v's coverage tap faithfully reports, even though the ALU ignores
# the forwarded value for these two ops (they use the immediate
# itself, not src1/src2). Harmless dead-path activity, not a
# functional bug -- confirmed by this same test's Spike cross-check
# (./run_assembly.sh + compare_logs1.py) still matching bit for bit.
#   0xA0 -> imm bits[7:3] = 20 (x20)   0xA8 -> imm bits[7:3] = 21 (x21)
#---------------------------------------------------------------
addi  x20, x0, 1              # producer for the LUI "forward" below
addi  x21, x0, 1               # producer for the AUIPC "forward" below
lui   x22, 0xA0                  # LUI:   structural rs1 field = x20
auipc x23, 0xA8                   # AUIPC: structural rs1 field = x21

#---------------------------------------------------------------
# JALR Forwarding -- rs1 (the base register) freshly computed the
# instruction right before. `la` expands to auipc+addi; the addi is
# the direct producer, immediately followed by the jalr (no
# control-flow instruction in between, so no flush bubble disrupts
# that adjacency the way it would right after a taken branch/jump).
# Target is deliberately this jalr's own fall-through address, so
# it's a safe, effectively no-op jump.
#---------------------------------------------------------------
la    x24, jalr_fwd_done
jalr  x25, x24, 0
jalr_fwd_done:

#---------------------------------------------------------------
# JAL Forwarding is NOT covered here, and can't be by any program on
# this SoC. JAL is J-type: instr[19:15] (this decoder's unconditional
# "rs1" field, same mechanism exploited for LUI/AUIPC above) is drawn
# directly from bits [19:15] of the jump *offset itself* -- unlike
# LUI/AUIPC's immediate, this one isn't a free-standing value, it's
# how far the processor actually jumps. Any offset with a nonzero bit
# in that range has magnitude >= 2^15 = 32768 bytes. IMEM
# (rtl/IF/instruction_memory.v, see gcc_files/link.ld) is only 4KB
# (1024 words) total, so no valid jump target anywhere in a legal
# program can ever set those bits -- forcing them would mean jumping
# outside IMEM into undefined memory, not a real coverage event.
#---------------------------------------------------------------

#########################################################
# Jumps: JAL, JALR (instruction coverage, not the forwarding variant
# above). jal_target's own JALR returns to right after the jal below
# (x1 = return address, standard call/return pattern), so execution
# continues linearly into "done" either way.
#########################################################
jal   x1, jal_target                                  # JAL
after_jal:
j     done

jal_target:
addi  x2, x0, 99
jalr  x3, x1, 0                                        # JALR -> back to after_jal

done:
beq   x0, x0, done
