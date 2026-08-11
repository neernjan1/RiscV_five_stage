#!/usr/bin/env python3
"""
Automatic PASS/FAIL checker for directed tests.

Reads the final register-file dump tb.v prints at the end of every run
and compares it against a small expectations file, if one exists.

Usage:
    python3 check_test.py <test_name> <sim_output_file>

<test_name> is the test's basename with no extension (e.g. "plic_test");
run.sh/run_assembly.sh pass this automatically. Looks for
tests/directed/<test_name>.expect -- see any .expect file for the format.
If none exists, this is a silent no-op (exit 0): not every test has
documented expected values (e.g. spi_*.s, ascon_*.s), and tests/coverage/
+ tests/generated/ are already checked against Spike instead.
"""

import re
import sys
from pathlib import Path

def parse_registers(sim_output: str) -> dict[int, int]:
    regs = {}
    for m in re.finditer(r"^x(\d+)\s*=\s*([0-9a-fA-F]+)$", sim_output, re.MULTILINE):
        regs[int(m.group(1))] = int(m.group(2), 16)
    return regs

def parse_expect(expect_text: str) -> list[tuple[int, int, str]]:
    checks = []
    for lineno, line in enumerate(expect_text.splitlines(), 1):
        line = line.split("#", 1)[0].strip()
        if not line:
            continue
        m = re.match(r"^x(\d+)\s*=\s*(0[xX][0-9a-fA-F]+|\d+)$", line)
        if not m:
            print(f"check_test.py: malformed line {lineno} in expect file: {line!r}")
            sys.exit(2)
        reg = int(m.group(1))
        val = int(m.group(2), 0)
        checks.append((reg, val, line))
    return checks

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 check_test.py <test_name> <sim_output_file>")
        sys.exit(2)

    test_name, sim_output_path = sys.argv[1], sys.argv[2]
    expect_path = Path("tests/directed") / f"{test_name}.expect"

    if not expect_path.exists():
        # No documented expected values for this test -- nothing to check.
        sys.exit(0)

    sim_output = Path(sim_output_path).read_text()
    actual = parse_registers(sim_output)
    checks = parse_expect(expect_path.read_text())

    if not checks:
        sys.exit(0)

    print()
    print("==============================================================")
    print(f" PASS/FAIL check: {test_name} ({expect_path})")
    print("==============================================================")

    failures = []
    for reg, expected, raw in checks:
        got = actual.get(reg)
        if got is None:
            failures.append(f"  x{reg}: expected 0x{expected:08x}, but x{reg} never appeared in the register dump")
        elif got != expected:
            failures.append(f"  x{reg}: expected 0x{expected:08x}, got 0x{got:08x}")
        else:
            print(f"  [PASS] x{reg} = 0x{expected:08x}")

    if failures:
        print()
        for f in failures:
            print(f"  [FAIL] {f.lstrip()}")
        print()
        print(f"TEST RESULT: FAIL ({len(checks) - len(failures)}/{len(checks)} checks passed)")
        print("==============================================================")
        sys.exit(1)
    else:
        print()
        print(f"TEST RESULT: PASS ({len(checks)}/{len(checks)} checks passed)")
        print("==============================================================")
        sys.exit(0)

if __name__ == "__main__":
    main()
