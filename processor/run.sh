#!/bin/bash

# ============================================================
# Run a single test through RTL only (Verilator) -- no Spike
# build/run/compare. Useful for peripheral tests (SPI, ASCON,
# CLINT, GPIO, UART) that Spike can't model anyway, a C test
# (gcc_files/tst.c), or just a faster inner loop while
# iterating on RTL.
#
# The sim prints a "Running Test: <name>" banner, the register
# dump, the functional-coverage report, and a matching "Test
# Complete" banner. If tests/directed/<name>.expect exists,
# check_test.py automatically checks the final register values
# against it and prints PASS/FAIL. Pass -v for full bus-level
# debug tracing (SPI/STORE/LOAD/AUIPC), off by default.
#
# Usage:
# ./run.sh tests/directed/gpio_test.s
# ./run.sh -v tests/directed/gpio_test.s
# ./run.sh gcc_files/tst.c
# ============================================================

VERBOSE=0
if [ "$1" = "-v" ]; then
    VERBOSE=1
    shift
fi

if [ $# -ne 1 ]; then
    echo "Usage: ./run.sh [-v] <assembly_file.s | gcc_files/tst.c>"
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
    # C source has no _start of its own -- link crt0.S's startup stub
    # (sets sp, copies .data, zeros .bss, calls board_init() then
    # main()) alongside it, plus gcc_files/drivers/ so crt0.S's call
    # to board_init() resolves to the real peripheral bring-up in
    # drivers/board_init.c instead of crt0.S's own weak no-op default.
    # (Not done in run_assembly.sh's Spike-side build: Spike has no
    # model of these peripherals, so real MMIO writes to their
    # addresses would fault there.)
    riscv64-unknown-elf-gcc \
        -march=rv32i_zicsr \
        -mabi=ilp32 \
        -nostdlib \
        -ffreestanding \
        -T gcc_files/link.ld \
        -I gcc_files/drivers \
        gcc_files/crt0.S \
        gcc_files/drivers/board_init.c \
        gcc_files/drivers/uart_driver.c \
        gcc_files/drivers/gpio_driver.c \
        gcc_files/drivers/spi_driver.c \
        gcc_files/drivers/clint_driver.c \
        gcc_files/drivers/plic_driver.c \
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

make verilate TESTNAME="$TEST_NAME" VERBOSE="$VERBOSE" 2>&1 | tee ../sim_output.log
SIM_STATUS=${PIPESTATUS[0]}

cd ..

if [ "$SIM_STATUS" -ne 0 ]; then
    echo "RTL simulation failed!"
    exit 1
fi

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
echo "sim_output.log"
echo
echo "Note: rtl.log has no spike_commit.log to compare against --"
echo "inspect it directly, or use ./run_assembly.sh for a Spike-checked run."

python3 check_test.py "$TEST_NAME" sim_output.log
CHECK_STATUS=$?
exit $CHECK_STATUS
