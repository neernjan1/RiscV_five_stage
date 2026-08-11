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
TEST_NAME="$(basename "$ASM_FILE")"
TEST_NAME="${TEST_NAME%.*}"

if [ ! -f "$ASM_FILE" ]; then
    echo "Error: $ASM_FILE not found."
    exit 1
fi

echo "======================================="
echo "Building RTL ELF"
echo "======================================="

if [ "${ASM_FILE##*.}" = "c" ]; then
    # C source has no _start of its own -- link crt0.S's startup
    # stub (sets sp, copies .data, zeros .bss, calls main()) alongside it.
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
echo "Building Spike ELF"
echo "======================================="

if [ "${ASM_FILE##*.}" = "c" ]; then
    riscv64-unknown-elf-gcc \
        -march=rv32i_zicsr \
        -mabi=ilp32 \
        -nostdlib \
        -ffreestanding \
        -T gcc_files/link_spike.ld \
        gcc_files/crt0.S \
        "$ASM_FILE" \
        -o gcc_files/tst_spike.elf
else
    riscv64-unknown-elf-gcc \
        -march=rv32i_zicsr \
        -mabi=ilp32 \
        -nostdlib \
        -T gcc_files/link_spike.ld \
        "$ASM_FILE" \
        -o gcc_files/tst_spike.elf
fi

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
    --instructions=10000 \
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

make verilate TESTNAME="$TEST_NAME" 2>&1 | tee ../sim_output.log
SIM_STATUS=${PIPESTATUS[0]}

cd ..

if [ "$SIM_STATUS" -ne 0 ]; then
    echo "RTL simulation failed!"
    exit 1
fi

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
echo "sim_output.log"
echo
echo "Next Command:"
echo "python3 compare_logs1.py"

python3 check_test.py "$TEST_NAME" sim_output.log