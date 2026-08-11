#!/bin/bash

# ============================================================
# Run a single test through RTL only (Verilator) -- no Spike
# build/run/compare. Useful for peripheral tests (SPI, ASCON,
# CLINT, GPIO, UART) that Spike can't model anyway, a C test
# (gcc_files/tst.c), or just a faster inner loop while
# iterating on RTL.
#
# Usage:
# ./run.sh tests/directed/gpio_test.s
# ./run.sh gcc_files/tst.c
# ============================================================

if [ $# -ne 1 ]; then
    echo "Usage: ./run.sh <assembly_file.s | gcc_files/tst.c>"
    exit 1
fi

ASM_FILE="$1"

if [ ! -f "$ASM_FILE" ]; then
    echo "Error: $ASM_FILE not found."
    exit 1
fi

echo "======================================="
echo "Building RTL ELF"
echo "======================================="

if [ "${ASM_FILE##*.}" = "c" ]; then
    # C source has no _start of its own -- link crt0.S's startup
    # stub (sets sp, calls main()) alongside it.
    riscv64-unknown-elf-gcc \
        -march=rv32i_zicsr \
        -mabi=ilp32 \
        -nostdlib \
        -ffreestanding \
        -T gcc_files/link.ld \
        gcc_files/crt0.S \
        "$ASM_FILE" \
        -o gcc_files/tst.elf
else
    riscv64-unknown-elf-gcc \
        -march=rv32i_zicsr \
        -mabi=ilp32 \
        -nostdlib \
        -T gcc_files/link.ld \
        "$ASM_FILE" \
        -o gcc_files/tst.elf
fi

if [ $? -ne 0 ]; then
    echo "RTL compilation failed!"
    exit 1
fi

echo
echo "======================================="
echo "Generating Instruction Memory"
echo "======================================="

echo "@00000000" > memory_files/imem.mem

riscv64-unknown-elf-objcopy \
    -O binary \
    gcc_files/tst.elf \
    test.bin

if [ $? -ne 0 ]; then
    echo "Objcopy failed!"
    exit 1
fi

hexdump -v -e '1/4 "%08X\n"' test.bin \
>> memory_files/imem.mem

echo
echo "======================================="
echo "Running RTL"
echo "======================================="

cd verilator || exit 1

make verilate

if [ $? -ne 0 ]; then
    echo "RTL simulation failed!"
    exit 1
fi

cd ..

echo
echo "======================================="
echo "RTL-only run completed (Spike skipped)"
echo "======================================="
echo
echo "Generated Files:"
echo "----------------------------"
echo "gcc_files/tst.elf"
echo "memory_files/imem.mem"
echo "rtl.log"
echo
echo "Note: rtl.log has no spike_commit.log to compare against --"
echo "inspect it directly, or use ./run_assembly.sh for a Spike-checked run."
