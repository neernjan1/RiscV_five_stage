# ==============================
# RISC-V Processor Makefile
# ==============================

# Top module
TOP = riscv_top

# Simulator
IVERILOG = iverilog
VVP = vvp

# Directories
RTL_DIR = ../rtl
TB_DIR = ../testbench
SIM_DIR = ../simulations
IVERILOG = iverilog -I ../rtl/include

# Output
OUT = $(SIM_DIR)/out.vvp
VCD = $(SIM_DIR)/dump.vcd

# Source files (auto collect)
RTL_SRC = $(shell find $(RTL_DIR) -name "*.v")
TB_SRC  = $(shell find $(TB_DIR) -name "*.v")

# ==============================
# Targets
# ==============================

all: run

compile:
	$(IVERILOG) -o $(OUT) $(RTL_SRC) $(TB_SRC)

run: compile
	$(VVP) $(OUT)

wave:
	gtkwave $(VCD)

clean:
	rm -rf $(SIM_DIR)/*