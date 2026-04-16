TOP = tb_risc

RTL_DIR = ../../rtl
TB_DIR = ../../tb

RTL_SRC = $(shell find $(RTL_DIR) -name "*.v")

VERILATOR = verilator

all: build run

build:
	$(VERILATOR) -Wall -Wno-fatal \
	--cc $(RTL_SRC) $(TB_DIR)/tb_risc.v \
	-I$(RTL_DIR)/include \
	--exe main.cpp \
	--trace \
	--top-module $(TOP)

	make -C obj_dir -f V$(TOP).mk

run:
	./obj_dir/V$(TOP)

clean:
	rm -rf obj_dir *.vcd