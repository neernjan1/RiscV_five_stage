IVERILOG = iverilog -I ../rtl/include
VVP = vvp

RTL_DIR = ../rtl/riscv-core
TB = ../testbench/top_tb.v
OUT = ../simulations/out.vvp

# Collect only core RTL files
RTL_SRC = $(shell find $(RTL_DIR) -name "*.v")

all: run

compile:
	$(IVERILOG) -o $(OUT) $(RTL_SRC) $(TB)

run: compile
	$(VVP) $(OUT)

clean:
	rm -rf ../simulations/*