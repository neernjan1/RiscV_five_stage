# =====================================================================
# csr_hazard_test.s
#
# Regression test for the csrrw RAW-hazard / forwarding fix.
# Every case below has ZERO nop instructions between the hazard and its
# use -- each exercises a distinct forwarding/stall path that used to
# require manually inserted nops before csr_wdata was moved onto the
# EX-stage forwarded operand (src1) and csr_file gained a same-cycle
# write bypass.
#
# All CSR write values are chosen with bits[1:0] = 00 so mtvec's
# Direct-mode masking can't itself cause an RTL/Spike mismatch
# unrelated to the hazard being tested.
#
# Verify with:
#   ./run_assembly.sh csr_hazard_test.s
#   python3 compare_logs1.py
# =====================================================================

# ---- Case 1: EX/MEM forward (producer 1 instruction ahead) into csrrw's rs1 ----
addi x1, x0, 0x100        # x1 = 0x100
csrrw x2, mtvec, x1        # x2 = old mtvec (0x0);      mtvec <- 0x100

# ---- Case 2: back-to-back csrrw to the SAME csr, 0 nops (CSR-internal same-cycle bypass) ----
csrrw x3, mtvec, x0         # x3 = old mtvec (0x100, from Case 1); mtvec <- 0x0

# ---- Case 3: MEM/WB forward (producer 2 instructions ahead) into csrrw's rs1 ----
addi x4, x0, 0x200          # x4 = 0x200
addi x0, x0, 0                # spacer -- writes x0, touches nothing
csrrw x5, mtvec, x4          # x5 = old mtvec (0x0);      mtvec <- 0x200

# ---- Case 4: load-use hazard directly into csrrw's rs1, 0 nops ----
lui   x6, 0x80010            # x6 = 0x80010000 (DMEM base)
addi  x7, x0, 0x300           # x7 = 0x300
sw    x7, 0(x6)                # mem[0x80010000] = 0x300
lw    x8, 0(x6)                # x8 = mem[0x80010000] = 0x300
csrrw x9, mtvec, x8            # x9 = old mtvec (0x200);   mtvec <- 0x300

done:
beq x0, x0, done
