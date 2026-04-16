#--------------------------------------
# 🔹 Tools
#--------------------------------------
IVERILOG = iverilog -I ../../rtl/include
VVP = vvp

#--------------------------------------
# 🔹 Paths
#--------------------------------------
RTL_DIR = ../../rtl
#TB = ../../testbench/top_tb.v
TB = ../../tb/icarus/top_tb.v
OUT = ../../results/out.vvp

# Collect all RTL sources (recursive)
RTL_SRC = $(shell find $(RTL_DIR) -type f -name "*.v")

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
	$(ECHO)echo "▶ Compiling RTL from $(RTL_DIR)..."
	$(ECHO)$(IVERILOG) -o $(OUT) $(RTL_SRC) $(TB) $(REDIRECT)

run: compile
	$(ECHO)echo "▶ Running simulation..."
	$(ECHO)$(VVP) $(OUT)

clean:
	$(ECHO)echo "🧹 Cleaning..."
	$(ECHO)rm -rf ../simulations/*

#--------------------------------------
# 🔹 Optional: Use old riscv-core
#--------------------------------------
core:
	$(ECHO)echo "▶ Compiling legacy riscv-core..."
	$(ECHO)$(IVERILOG) -o $(OUT) \
	    $(shell find ../riscv-core -name "*.v") \
	    $(TB)

#--------------------------------------
# 🔹 Help
#--------------------------------------
help:
	@echo "Usage:"
	@echo "  make run           → Run modular RTL (quiet)"
	@echo "  make run QUIET=0   → Show full logs"
	@echo "  make core          → Run legacy riscv-core"
	@echo "  make clean         → Clean outputs"