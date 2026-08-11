# TOP := tb
# TOPF := ../tb/tb.v
# SRC1 := ../rtl/apb/*.v
# SRC2 := ../rtl/EX/*.v
# SRC3 := ../rtl/hazard_unit/*.v
# SRC4 := ../rtl/ID/*.v
# SRC5 := ../rtl/IF/*.v
# SRC6 := ../rtl/include/defines.vh
# SRC7 := ../rtl/MA/*.v
# SRC8 := ../rtl/top/*.v
# SRC9 := ../rtl/WB/*.v
# UART_F := ../rtl/apb_uart/files.f

# MEM := ../memory_files/*.mem

# SRC = $(SRC6) $(TOPF) $(SRC1) $(SRC2) $(SRC3) $(SRC4) $(SRC5) $(SRC7) $(SRC8) $(SRC9) 

# .PHONY: all verilate clean
# all: slang_test verilate


# slang_test:
# 	slang $(SRC)

# verilate:
# 	@echo "Running V E R I L A T O R....."
# 	@verilator --sv --binary $(SRC) --top $(TOP) --trace   --quiet
# 	@cp $(MEM) ./
# 	@./obj_dir/V$(TOP) +trace --quiet

# clean:
# 	rm -rf obj_dir
# 	clear

TOP := tb
TOPF := ../tb/tb.v

SRC1 := ../rtl/apb/*.v
SRC2 := ../rtl/EX/*.v
SRC3 := ../rtl/hazard_unit/*.v
SRC4 := ../rtl/ID/*.v
SRC5 := ../rtl/IF/*.v
SRC6 := ../rtl/include/defines.vh
SRC7 := ../rtl/MA/*.v
SRC8 := ../rtl/top/*.v
SRC9 := ../rtl/WB/*.v
SRC10 := ../rtl/spi/*.sv
SRC11 := ../rtl/ascon/*.v
SRC12 := ../rtl/plic/*.sv
SRC13 := ../rtl/CLINT/pkg/*.sv ../rtl/CLINT/rtl/*.sv
SRC14 := ../rtl/gpio/pkg/*.sv ../rtl/gpio/rtl/*.sv
SRC15 := ../rtl/i2c/apb_i2c.sv ../rtl/i2c/i2c_master_bit_ctrl.sv ../rtl/i2c/i2c_master_byte_ctrl.sv ../rtl/i2c/i2c_defines.sv

CLINT_INCDIR := +incdir+../rtl/CLINT/dependencies +incdir+../rtl/CLINT/rtl
GPIO_INCDIR := +incdir+../rtl/gpio/dependency

UART_F := ../rtl/apb_uart/files.f   # ✅ important

MEM := ../memory_files/*.mem

SRC = $(SRC6) $(TOPF) $(SRC1) $(SRC2) $(SRC3) $(SRC4) $(SRC5) $(SRC7) $(SRC8) $(SRC9) $(SRC10) $(SRC11) $(SRC12) $(SRC13) $(SRC14) $(SRC15) $(CLINT_INCDIR) $(GPIO_INCDIR)

# Passed through to the sim binary as plusargs -- see tb.v's header
# comment. run.sh/run_assembly.sh set TESTNAME automatically; VERBOSE is
# opt-in (make verilate VERBOSE=1) for full bus-level tracing.
TESTNAME ?= unknown
VERBOSE  ?=

.PHONY: all verilate clean

all: slang_test verilate

slang_test:
	slang $(SRC)

verilate:
	@echo "Running V E R I L A T O R....."
	@verilator -Wno-MODDUP -Wno-PINMISSING -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC -Wno-LATCH -Wno-fatal --sv --binary $(SRC) -f $(UART_F) --top $(TOP) --trace --quiet
	@cp $(MEM) ./
	@./obj_dir/V$(TOP) +trace --quiet +TESTNAME=$(TESTNAME) $(if $(filter 1,$(VERBOSE)),+VERBOSE)

clean:
	rm -rf obj_dir
	
	clear