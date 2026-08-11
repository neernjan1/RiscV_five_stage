#!/usr/bin/env python3

import sys
import re

if len(sys.argv) != 3:
    print("Usage:")
    print("python3 extract_rv32i.py input.S output.S")
    sys.exit(1)

inp = sys.argv[1]
outp = sys.argv[2]

inside_main = False
test_done_exists = False

with open(inp) as fin, open(outp, "w") as fout:

    # --------------------------------------------------
    # RV32I Entry
    # --------------------------------------------------

    fout.write(".section .text\n")
    fout.write(".globl _start\n")
    fout.write("_start:\n\n")

    fout.write("""\
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

""")

    for line in fin:

        # -------------------------------
        # Start copying after main:
        # -------------------------------

        if re.match(r"^\s*main:", line):
            inside_main = True
            continue

        # -------------------------------
        # Stop before host code
        # -------------------------------

        if re.match(r"^\s*write_tohost:", line):
            break

        if not inside_main:
            continue

        # Remove comments
        line = line.split("#")[0].rstrip()

        if not line:
            continue

        # Skip assembler directives
        if line.lstrip().startswith("."):
            continue

        # Keep all labels
        if re.match(r"^\s*[A-Za-z_][A-Za-z0-9_]*:\s*$", line):
            if line.strip() == "test_done:":
                test_done_exists = True
            fout.write(line + "\n")
            continue

        if re.match(r"^\s*\d+:\s*$", line):
            fout.write(line + "\n")
            continue

        # ------------------------------------------------
        # Remove unsupported instructions
        # ------------------------------------------------

        if re.search(r"\becall\b", line):
            continue

        if re.search(r"\bebreak\b", line):
            continue

        if re.search(r"\bmret\b", line):
            continue

        if re.search(r"\bsret\b", line):
            continue

        if re.search(r"\buret\b", line):
            continue

        if re.search(r"\bwfi\b", line):
            continue

        # CSR instructions
        if re.search(r"\bcsr\w*\b", line):
            continue

        # Fence instructions
        if re.search(r"\bfence(\.i)?\b", line):
            continue

        if re.search(r"\bsfence\w*\b", line):
            continue

        fout.write(line + "\n")

    # --------------------------------------------------
    # Infinite loop if test_done not present
    # --------------------------------------------------

    if not test_done_exists:
        fout.write("\n")
        fout.write("test_done:\n")
        fout.write("    beq x0, x0, test_done\n")

print(f"Created {outp}")