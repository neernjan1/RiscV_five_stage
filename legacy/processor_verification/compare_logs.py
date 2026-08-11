#!/usr/bin/env python3

import re

RTL_LOG   = "rtl.log"
SPIKE_LOG = "spike_commit.log"

BASE = 0x80000000


# ==========================================================
# Parse RTL log
# ==========================================================

def parse_rtl(fname):

    commits = []

    with open(fname) as f:

        for line in f:

            m = re.search(
                r"PC=([0-9A-Fa-f]+)\s+x(\d+)=([0-9A-Fa-f]+)",
                line)

            if m:

                pc   = int(m.group(1),16)
                rd   = int(m.group(2))
                data = int(m.group(3),16)

                commits.append(
                    ("reg", pc, rd, data)
                )

                continue

            m = re.search(
                r"PC=([0-9A-Fa-f]+)\s+mem\[([0-9A-Fa-f]+)\]=([0-9A-Fa-f]+)",
                line)

            if m:

                pc   = int(m.group(1),16)
                addr = int(m.group(2),16)
                data = int(m.group(3),16)

                commits.append(
                    ("mem", pc, addr, data)
                )

    return commits

def parse_spike(fname):

    commits = []
    started = False

    with open(fname) as f:

        for line in f:

            if "core" not in line:
                continue

            if ": 3 " not in line:
                continue

            # ----------------------------------
            # Get PC
            # ----------------------------------
            pc_match = re.search(
                r"0x([0-9A-Fa-f]+)",
                line)

            if not pc_match:
                continue

            commit_pc = int(pc_match.group(1),16)

            # ----------------------------------
            # Skip boot ROM
            # ----------------------------------
            if not started:

                if commit_pc >= BASE:
                    started = True
                else:
                    continue

            # ----------------------------------
            # REGISTER WRITE
            #
            # Handles:
            #   add
            #   sub
            #   addi
            #   lui
            #   auipc
            #   jal
            #   lw
            # etc.
            #
            # Even if line contains "mem"
            # (load instructions do)
            # ----------------------------------
            # ----------------------------------
# MEMORY WRITE (STORE)
# ----------------------------------
            m = re.search(
                r"0x([0-9A-Fa-f]+).*mem\s+0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)",
                line)

            if m:

                pc   = int(m.group(1),16)
                addr = int(m.group(2),16)
                data = int(m.group(3),16)

                pc -= BASE

                if addr >= BASE:
                    addr -= BASE

                if data >= BASE:
                    data -= BASE

                commits.append(
                    ("mem", pc, addr, data)
                )

                continue


            # ----------------------------------
            # REGISTER WRITE
            # ----------------------------------
            m = re.search(
                r"0x([0-9A-Fa-f]+).*x([0-9]+)\s+0x([0-9A-Fa-f]+)",
                line)

            if m:

                pc   = int(m.group(1),16)
                rd   = int(m.group(2))
                data = int(m.group(3),16)

                pc -= BASE

                if data >= BASE:
                    data -= BASE

                commits.append(
                    ("reg", pc, rd, data)
                )

                continue

    return commits

# ==========================================================
# Compare
# ==========================================================

rtl   = parse_rtl(RTL_LOG)
spike = parse_spike(SPIKE_LOG)

print("\nRTL commits")
print("TYPE   PC        RD/ADDR      DATA")
print("---------------------------------------")

for x in rtl:
    if x[0] == "reg":
        print(f"{x[0]:<6} {x[1]:08x}  x{x[2]:<10} {x[3]:08x}")
    else:
        print(f"{x[0]:<6} {x[1]:08x}  {x[2]:08x}   {x[3]:08x}")

print("\nSpike commits")
print("TYPE   PC        RD/ADDR      DATA")
print("---------------------------------------")

for x in spike:
    if x[0] == "reg":
        print(f"{x[0]:<6} {x[1]:08x}  x{x[2]:<10} {x[3]:08x}")
    else:
        print(f"{x[0]:<6} {x[1]:08x}  {x[2]:08x}   {x[3]:08x}")
print("\n====================")
print("CHECKING")
print("====================")

if len(rtl) != len(spike):

    print("\nFAIL")
    print("Different number of commits")

    print("RTL   =", len(rtl))
    print("Spike =", len(spike))

    exit(1)


fail = False

for i in range(len(rtl)):

    if rtl[i] != spike[i]:

        print("\nFAIL")
        print("Mismatch at commit", i)

        print("RTL   :", rtl[i])
        print("Spike :", spike[i])

        fail = True
        break


if not fail:

    print("\nPASS")
    print("RTL and Spike logs match")