# RISC-V 5-Stage Pipeline Processor

A RISC-V (RV32I + Zicsr) 5-stage pipelined core with an APB-based SoC:
CSR/trap controller, SPI, ASCON accelerator, CLINT (timer/software
interrupts), GPIO, and UART peripherals.

## Prerequisites

| Tool | Used for | Version this project was verified against |
|---|---|---|
| [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain) (`riscv64-unknown-elf-gcc`) | Compiling test programs to ELF | 13.2.0 |
| [Spike](https://github.com/riscv-software-src/riscv-isa-sim) (`spike`, `spike-dasm`) | Golden-model ISA simulator, used to cross-check RTL execution | any recent build |
| [Verilator](https://www.veripool.org/verilator/) | Main RTL simulator (drives `tests/` through the SoC) | 5.046 |
| [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`iverilog`, `vvp`) | Standalone self-checking testbenches (e.g. `tb/tb_csr_hazard.v`) that instantiate the core directly, without the full SoC/toolchain flow | 12.0 |
| Python 3 | `compare_logs1.py` (RTL vs. Spike log diff) | 3.12 |
| `hexdump` | Converting compiled binaries into `$readmemh`-style memory images | any (part of `bsdmainutils`/`util-linux`) |
| [Bender](https://github.com/pulp-platform/bender) | Optional. Only needed if you want to re-fetch/update the UART IP's vendored dependencies under `rtl/apb_uart/.bender/` — the checkouts are already committed, so a normal build doesn't need it | 0.31 |

## Installation

On Ubuntu/Debian, the simulator tooling is packaged:

```bash
sudo apt update
sudo apt install verilator iverilog python3 bsdmainutils
```

Spike and the RISC-V GNU toolchain are usually not in the default
package repos and need to be built from source (or installed via a
prebuilt release if your distro provides one):

```bash
# RISC-V GNU toolchain (newlib/bare-metal target is enough for this project)
git clone https://github.com/riscv-collab/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv
make -j"$(nproc)"
export PATH="/opt/riscv/bin:$PATH"

# Spike
git clone https://github.com/riscv-software-src/riscv-isa-sim.git
cd riscv-isa-sim
mkdir build && cd build
../configure --prefix=/opt/riscv
make -j"$(nproc)" && make install
```

Add `/opt/riscv/bin` to your `PATH` (e.g. in `~/.bashrc`) so
`riscv64-unknown-elf-gcc`, `spike`, and `spike-dasm` are on it.

Verify everything is reachable:

```bash
riscv64-unknown-elf-gcc --version
spike --help
verilator --version
iverilog -V
python3 --version
```

## Project layout

```
processor/
├── run_assembly.sh        # main entry point: build -> Spike -> Verilator
├── run.sh                  # RTL-only: build -> Verilator (Spike skipped)
├── compare_logs1.py        # diffs rtl.log against spike_commit.log
├── check_test.py            # PASS/FAIL vs. tests/directed/<name>.expect
├── rtl/                     # core + peripheral RTL (apb, EX/ID/IF/MA/WB,
│                             #   spi, ascon, CLINT, gpio, apb_uart, plic)
├── tb/                      # testbenches
│   ├── tb.v                 #   Verilator top: full SoC, driven by run_assembly.sh
│   └── tb_csr_hazard.v      #   Icarus, self-checking, core-only (no toolchain needed)
├── tests/
│   ├── directed/            # hand-written feature tests (csr, spi, ascon,
│   │                         #   clint, gpio, uart)
│   ├── coverage/             # memory/APB/instruction-coverage tests
│   └── generated/            # riscv-dv-generated instruction corpus
├── gcc_files/                # linker scripts + crt0 used by the build
│   └── drivers/               # peripheral drivers (UART/GPIO/SPI/CLINT/
│                               #   PLIC init + basic ops), linked into
│                               #   every C build; crt0.S calls their
│                               #   board_init() before main()
├── memory_files/              # generated $readmemh images (build output)
├── verilator/                 # Verilator Makefile + build output (obj_dir/, *.vcd)
└── legacy/                    # superseded run.sh/testbench/verification flow,
                                #   kept for reference, not part of the active build
```

## Running a test

`run_assembly.sh` takes a single assembly file, builds it for both the
RTL toolchain and Spike, runs Spike, then runs the RTL through
Verilator:

```bash
./run_assembly.sh tests/directed/csr_hazard_test.s
python3 compare_logs1.py
```

`compare_logs1.py` reads `rtl.log` and `spike_commit.log` (both written
to the project root by the previous step) and reports `PASS`/`FAIL`
plus the first mismatching commit, if any.

Try any file under `tests/directed/`, `tests/coverage/`, or
`tests/generated/` the same way, e.g.:

```bash
./run_assembly.sh tests/coverage/all_instructions_coverage.s
./run_assembly.sh tests/generated/rv32i_loop_only.S
```

**Note:** Spike has no model of this project's memory-mapped
peripherals (SPI, ASCON, CLINT, GPIO, UART, PLIC), so tests that
exercise those will legitimately diverge from Spike after the
peripheral access. Every one of those tests still gets a real
automatic PASS/FAIL — see "Testbench output" below.

## RTL-only run (bypass Spike)

For peripheral tests (where a Spike comparison isn't meaningful
anyway) or just a faster inner loop while iterating on RTL, `run.sh`
does the build + Verilator run without touching Spike at all:

```bash
./run.sh tests/directed/gpio_test.s
```

This produces `rtl.log` only (no `spike_commit.log`, so
`compare_logs1.py` doesn't apply) — inspect `rtl.log` directly, or
just read the PASS/FAIL check printed at the end (see below).

It also accepts a C source file, in which case it links
`gcc_files/crt0.S` (startup stub: zeroes `.bss`, sets `sp`, calls
`board_init()` then `main()`) and `gcc_files/drivers/` (real
UART/GPIO/SPI/CLINT/PLIC bring-up — see `drivers/board_init.c` for
exactly what it does and doesn't touch) alongside it automatically:

```bash
./run.sh gcc_files/tst.c
```

Pass `-v` (before the file) for full bus-level debug tracing (SPI
transaction bytes, every DMEM STORE/LOAD, AUIPC decode) — off by
default since it's mostly noise once a test is working:

```bash
./run.sh -v tests/directed/spi_read.s
```

## Testbench output

Every run — `run.sh` or `run_assembly.sh` — prints, in order:

1. A `Running Test: <name>` banner (the test's basename, no
   extension).
2. The bus-level debug traces, only with `-v` (`run.sh`) or
   `VERBOSE=1` (`run_assembly.sh`/`make verilate` directly).
3. The final register-file dump (`x0`–`x31`).
4. A functional-coverage report (`tb/tb.v`'s `print_coverage()`):
   which RV32I instructions executed at least once, branch taken/not-
   taken coverage, hazard/forwarding-path coverage, and DMEM first/last-
   address coverage — a quick answer to "what did this run actually
   exercise."
5. A `Test Complete: <name>` banner.
6. If `tests/directed/<name>.expect` exists, an automatic PASS/FAIL
   check (`check_test.py`) against the register values documented in
   that test's own header comment. `run.sh` exits non-zero on FAIL;
   `run_assembly.sh` prints it as an extra signal alongside
   `compare_logs1.py`, which stays the primary check there.

Not every test has a `.expect` file — `spi_*.s`/`ascon_*.s` don't have
independently-verified expected register values documented, and
anything Spike-compares (`tests/coverage/`, `tests/generated/`, the
`csr_*` tests) is already checked by `compare_logs1.py`. Adding one for
a new directed test is just a few lines, e.g.
`tests/directed/plic_test.expect`:

```
x20=1
x22=1
x24=0x41
```

## Running the standalone core testbench

`tb/tb_csr_hazard.v` instantiates the core directly (no SoC/APB/GCC
toolchain in the loop) and self-checks its own results — useful for a
fast regression on the CSR/pipeline forwarding logic:

```bash
cd tb
iverilog -g2012 -o /tmp/tb_csr_hazard.vvp -I ../rtl/include \
  ../rtl/include/defines.vh tb_csr_hazard.v ../rtl/top/riscv_core.v \
  ../rtl/IF/*.v ../rtl/ID/*.v ../rtl/EX/*.v ../rtl/MA/MEM_WB.v \
  ../rtl/WB/*.v ../rtl/hazard_unit/*.v ../rtl/plic/csr_file.sv \
  ../rtl/plic/trap_controller.sv
vvp /tmp/tb_csr_hazard.vvp
```
Expect `TESTBENCH: PASS (8 checks)` at the end.

## Cleaning build artifacts

```bash
rm -f test.bin rtl.log spike_commit.log sim_output.log
rm -rf verilator/obj_dir verilator/riscv.vcd
rm -f gcc_files/tst.elf gcc_files/tst_spike.elf memory_files/*.mem
```

(or `cd verilator && make clean`, which removes `obj_dir/`.)
