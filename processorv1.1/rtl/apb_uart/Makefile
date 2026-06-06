TOP := tb
VFILE := tb.sv
F_FILE := files.f

all: build

build:
	@echo "Running V E R I L A T O R .... "
	@verilator --sv --binary -f $(F_FILE) $(VFILE) --top $(TOP) --Wno-MODDUP --Wno-PINMISSING --Wno-LATCH --Wno-WIDTH --Wno-INITIALDLY --trace --quiet
# 	@verilator --sv --binary $(VFILE) --top $(TOP) --Wno-MODDUP --Wno-PINMISSING --Wno-LATCH --Wno-WIDTH --trace --quiet
	@./obj_dir/V$(TOP) +trace --quiet

clean:
	rm -rf ./obj_dir
	clear
