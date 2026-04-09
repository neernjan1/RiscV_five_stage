#--------------------------------------
# 🔹 Tools
#--------------------------------------
IVERILOG = iverilog -I ../rtl/include
VVP = vvp

#--------------------------------------
# 🔹 Paths
#--------------------------------------
RTL_DIR = ../rtl/riscv-core
TB = ../testbench/top_tb.v
OUT = ../simulations/out.vvp

# Collect all RTL sources
RTL_SRC = $(shell find $(RTL_DIR) -name "*.v")

#--------------------------------------
# 🔹 Quiet / Verbose Mode
#--------------------------------------
QUIET ?= 1

ifeq ($(QUIET),1)
    ECHO = @
    REDIRECT = 2>/dev/null
else
    ECHO =
    REDIRECT =
endif

#--------------------------------------
# 🔹 Targets
#--------------------------------------
all: run

compile:
	$(ECHO)echo "▶ Compiling..."
	$(ECHO)$(IVERILOG) -o $(OUT) $(RTL_SRC) $(TB) $(REDIRECT)

run: compile
	$(ECHO)echo "▶ Running simulation..."
	$(ECHO)$(VVP) $(OUT)

clean:
	$(ECHO)echo "🧹 Cleaning..."
	$(ECHO)rm -rf ../simulations/*

#--------------------------------------
# 🔹 Help
#--------------------------------------
help:
	@echo "Usage:"
	@echo "  make run           → Quiet mode (default)"
	@echo "  make run QUIET=0   → Show full compile logs"
	@echo "  make clean         → Remove simulation files"

# IVERILOG = iverilog -I ../rtl/include
# VVP = vvp

# RTL_DIR = ../rtl/riscv-core
# TB = ../testbench/top_tb.v
# OUT = ../simulations/out.vvp

# # Collect only core RTL files
# RTL_SRC = $(shell find $(RTL_DIR) -name "*.v")

# all: run

# compile:
# 	$(IVERILOG) -o $(OUT) $(RTL_SRC) $(TB) 
# run: compile 
# 	$(VVP) $(OUT)

# clean:
# 	rm -rf ../simulations/*