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

MEM := ../memory_files/*.mem

SRC = $(SRC6) $(TOPF) $(SRC1) $(SRC2) $(SRC3) $(SRC4) $(SRC5) $(SRC7) $(SRC8) $(SRC9)

.PHONY: all verilate clean
all: slang_test verilate


slang_test:
	slang $(SRC)

verilate:
	@echo "Running V E R I L A T O R....."
	@verilator --sv --binary $(SRC) --top $(TOP) --trace   --quiet
	@cp $(MEM) ./
	@./obj_dir/V$(TOP) +trace --quiet

clean:
	rm -rf obj_dir
	clear