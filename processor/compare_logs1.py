#!/usr/bin/env python3

import re

RTL_LOG   = "rtl.log"
SPIKE_LOG = "spike_commit.log"

PROGRAM_BASE = 0x80000000

# ==========================================================
# Parse RTL Log
# ==========================================================
def parse_rtl(fname):

    commits = []

    with open(fname) as f:

        for line in f:

            # Register write
            m = re.search(
                r"PC=([0-9A-Fa-f]+)\s+x(\d+)=([0-9A-Fa-f]+)",
                line)

            if m:

                commits.append((
                    "reg",
                    int(m.group(1),16),
                    int(m.group(2)),
                    int(m.group(3),16)
                ))
                continue

            # Memory write
            m = re.search(
                r"PC=([0-9A-Fa-f]+)\s+mem\[([0-9A-Fa-f]+)\]=([0-9A-Fa-f]+)",
                line)

            if m:

                commits.append((
                    "mem",
                    int(m.group(1),16),
                    int(m.group(2),16),
                    int(m.group(3),16)
                ))

    return commits


# ==========================================================
# Parse Spike Log
# ==========================================================
def parse_spike(fname):

    commits = []
    started = False

    with open(fname) as f:

        for line in f:

            if "core" not in line:
                continue

            if ": 3 " not in line:
                continue

            # Extract PC
            pc_match = re.search(r"0x([0-9A-Fa-f]+)", line)

            if not pc_match:
                continue

            commit_pc = int(pc_match.group(1),16)

            # Ignore boot code before our program
            if not started:

                if commit_pc >= PROGRAM_BASE:
                    started = True
                else:
                    continue

            # -----------------------------
            # Memory write
            # -----------------------------
            m = re.search(
                r"0x([0-9A-Fa-f]+).*mem\s+0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)",
                line)

            if m:

                commits.append((
                    "mem",
                    int(m.group(1),16),
                    int(m.group(2),16),
                    int(m.group(3),16)
                ))

                continue

            # -----------------------------
            # Register write
            # -----------------------------
            m = re.search(
                r"0x([0-9A-Fa-f]+).*x([0-9]+)\s+0x([0-9A-Fa-f]+)",
                line)

            if m:

                commits.append((
                    "reg",
                    int(m.group(1),16),
                    int(m.group(2)),
                    int(m.group(3),16)
                ))

    return commits


# ==========================================================
# Read logs
# ==========================================================

rtl = parse_rtl(RTL_LOG)
spike = parse_spike(SPIKE_LOG)


# ==========================================================
# Print RTL
# ==========================================================

print("\nRTL commits")
print("TYPE   PC        RD/ADDR      DATA")
print("---------------------------------------")

for x in rtl:

    if x[0] == "reg":
        print(f"{x[0]:<6} {x[1]:08x}  x{x[2]:<10} {x[3]:08x}")
    else:
        print(f"{x[0]:<6} {x[1]:08x}  {x[2]:08x}   {x[3]:08x}")


# ==========================================================
# Print Spike
# ==========================================================

print("\nSpike commits")
print("TYPE   PC        RD/ADDR      DATA")
print("---------------------------------------")

for x in spike:

    if x[0] == "reg":
        print(f"{x[0]:<6} {x[1]:08x}  x{x[2]:<10} {x[3]:08x}")
    else:
        print(f"{x[0]:<6} {x[1]:08x}  {x[2]:08x}   {x[3]:08x}")


# ==========================================================
# Compare
# ==========================================================

print("\n====================")
print("CHECKING")
print("====================")

if len(rtl) != len(spike):

    print("\nFAIL")
    print("Different number of commits")
    print("RTL   =", len(rtl))
    print("Spike =", len(spike))
    exit(1)

for i in range(len(rtl)):

    if rtl[i] != spike[i]:

        print("\nFAIL")
        print("Mismatch at commit", i)
        print("Total commit : ", len(rtl))

        print("RTL   :", rtl[i])
        print("Spike :", spike[i])

        lo = max(0, i-3)
        hi = min(len(rtl), i+4)

        print("\nContext")
        print("---------------------------------------")

        for j in range(lo, hi):

            marker = " <--- mismatch" if j == i else ""

            print(f"{j:4d} RTL:{rtl[j]}    Spike:{spike[j]}{marker}")

        exit(1)

print("\nPASS")
print("RTL and Spike logs match")
print("No of Logs are: ",len(rtl))