#!/bin/bash

# ============================================================
# Run RISC-V DV generated assembly on RTL and Spike
#
# Usage:
# ./run_riscdv.sh rv32i_2_only.S
# ============================================================

if [ $# -ne 1 ]; then
    echo "Usage: ./run_riscdv.sh <assembly_file.S>"
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

riscv64-unknown-elf-gcc \
    -march=rv32i_zicsr \
    -mabi=ilp32 \
    -nostdlib \
    -T gcc_files/link.ld \
    "$ASM_FILE" \
    -o gcc_files/tst.elf

if [ $? -ne 0 ]; then
    echo "RTL compilation failed!"
    exit 1
fi

echo
echo "======================================="
echo "Building Spike ELF"
echo "======================================="

riscv64-unknown-elf-gcc \
    -march=rv32i_zicsr \
    -mabi=ilp32 \
    -nostdlib \
    -T gcc_files/link_spike.ld \
    "$ASM_FILE" \
    -o gcc_files/tst_spike.elf

if [ $? -ne 0 ]; then
    echo "Spike compilation failed!"
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
echo "Running Spike"
echo "======================================="

spike \
    -l \
    --log-commits \
    --isa=rv32i \
    --instructions=500 \
    gcc_files/tst_spike.elf \
    > spike_commit.log 2>&1

if [ $? -ne 0 ]; then
    echo "Spike execution failed!"
    exit 1
fi

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
echo "Verification Flow Completed"
echo "======================================="

echo
echo "Generated Files:"
echo "----------------------------"
echo "gcc_files/tst.elf"
echo "gcc_files/tst_spike.elf"
echo "memory_files/imem.mem"
echo "spike_commit.log"
echo "rtl.log"
echo
echo "Next Command:"
echo "python3 compare_logs1.py"