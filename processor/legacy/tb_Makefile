CROSS     ?= riscv64-unknown-elf
CC        := $(CROSS)-gcc
OBJDUMP   := $(CROSS)-objdump
OBJCOPY   := $(CROSS)-objcopy
SIZE      := $(CROSS)-size

ARCH      ?= rv32i
ABI       ?= ilp32
ARCHFLAGS = -march=$(ARCH) -mabi=$(ABI)

PARENT_DIR := $(abspath $(CURDIR)/..)
GCC_DIR    := $(PARENT_DIR)/gcc_files
RTL_DIR    := $(PARENT_DIR)/top_module

# ============================================================
# Source Files
# ============================================================

C_SRC      := $(GCC_DIR)/tst.c
ASM_SRC    := $(GCC_DIR)/crt0.S

OBJ        := $(ASM_SRC:.S=.o) $(C_SRC:.c=.o)

# ============================================================
# Linker Scripts
# ============================================================

RTL_LINKER   := $(GCC_DIR)/link.ld
SPIKE_LINKER := $(GCC_DIR)/link_spike.ld

# ============================================================
# Output Files
# ============================================================

ELF          := $(GCC_DIR)/tst.elf
SPIKE_ELF    := $(GCC_DIR)/tst_spike.elf

BIN          := $(GCC_DIR)/tst.bin

DISASM       := $(GCC_DIR)/disasm.txt
SPIKE_DISASM := $(GCC_DIR)/spike_disasm.txt

IMEM_HEX     := $(PARENT_DIR)/memory_files/imem.mem
DMEM_HEX     := $(PARENT_DIR)/memory_files/dmem.mem

TB           := $(RTL_DIR)/Testbench.v
SIMV         := $(RTL_DIR)/simv
SIM_OUT      := $(RTL_DIR)/sim_output.txt

# ============================================================
# Compiler / Linker Flags
# ============================================================

CFLAGS = $(ARCHFLAGS) \
         -O2 \
         -Wall \
         -Wextra \
         -ffreestanding \
         -fdata-sections \
         -ffunction-sections \
         -c

ASFLAGS = $(ARCHFLAGS) \
          -ffreestanding \
          -c

RTL_LDFLAGS = $(ARCHFLAGS) \
              -T $(RTL_LINKER) \
              -nostdlib \
              -nostartfiles

SPIKE_LDFLAGS = $(ARCHFLAGS) \
                -T $(SPIKE_LINKER) \
                -nostdlib \
                -nostartfiles

# ============================================================
# Targets
# ============================================================

.PHONY: all clean size dump spike_dump

all: $(ELF) $(SPIKE_ELF) $(DISASM) $(SPIKE_DISASM) $(IMEM_HEX) $(DMEM_HEX)

# ============================================================
# ELF Generation
# ============================================================

$(ELF): $(OBJ) $(RTL_LINKER)
	@echo "Linking RTL ELF..."
	@$(CC) $(RTL_LDFLAGS) -o $@ $(OBJ)
	@$(SIZE) $@

$(SPIKE_ELF): $(OBJ) $(SPIKE_LINKER)
	@echo "Linking Spike ELF..."
	@$(CC) $(SPIKE_LDFLAGS) -o $@ $(OBJ)

# ============================================================
# Disassembly
# ============================================================

$(DISASM): $(ELF)
	@echo "Generating RTL disassembly..."
	@$(OBJDUMP) -d -S $< > $@

$(SPIKE_DISASM): $(SPIKE_ELF)
	@echo "Generating Spike disassembly..."
	@$(OBJDUMP) -d -S $< > $@

# ============================================================
# Binary
# ============================================================

$(BIN): $(ELF)
	@$(OBJCOPY) -O binary $< $@

# ============================================================
# Instruction Memory
# ============================================================

$(IMEM_HEX): $(ELF)
	@echo "Generating Instruction Memory HEX..."
	@mkdir -p $(dir $@)

	@$(OBJCOPY) -O binary \
		--only-section=.init \
		--only-section=.text \
		$< $(GCC_DIR)/imem.bin

	@echo "@00000000" > $@
	@hexdump -v -e '1/4 "%08x" "\n"' \
		$(GCC_DIR)/imem.bin >> $@

	@rm -f $(GCC_DIR)/imem.bin

# ============================================================
# Data Memory
# ============================================================

$(DMEM_HEX): $(ELF)
	@echo "Generating Data Memory HEX..."

	@if $(OBJDUMP) -h $< | grep -E "\.data|\.sdata|\.rodata" > /dev/null; then \
		echo "  > Data sections found"; \
		$(OBJCOPY) -O binary \
			--only-section=.rodata \
			--only-section=.data \
			--only-section=.sdata \
			$< $(GCC_DIR)/dmem.bin; \
		echo "" > $@; \
		hexdump -v -e '1/1 "%02x" "\n"' $(GCC_DIR)/dmem.bin >> $@; \
		rm -f $(GCC_DIR)/dmem.bin; \
	else \
		echo "  > No data sections found"; \
		touch $@; \
	fi

# ============================================================
# Object Generation
# ============================================================

$(GCC_DIR)/%.o: $(GCC_DIR)/%.c
	@$(CC) $(CFLAGS) -o $@ $<

$(GCC_DIR)/%.o: $(GCC_DIR)/%.S
	@$(CC) $(ASFLAGS) -o $@ $<

# ============================================================
# Utility Targets
# ============================================================

size: $(ELF)
	@$(SIZE) $(ELF)

dump: $(ELF)
	@$(OBJDUMP) -d -S $(ELF) | less

spike_dump: $(SPIKE_ELF)
	@$(OBJDUMP) -d -S $(SPIKE_ELF) | less

# ============================================================
# Clean
# ============================================================

clean:
	rm -f \
	$(OBJ) \
	$(ELF) \
	$(SPIKE_ELF) \
	$(BIN) \
	$(DISASM) \
	$(SPIKE_DISASM) \
	$(IMEM_HEX) \
	$(DMEM_HEX) \
	$(SIMV) \
	$(SIM_OUT) \
	$(GCC_DIR)/imem.bin \
	$(GCC_DIR)/dmem.bin \
	$(GCC_DIR)/dmem_tmp1.elf \
	$(GCC_DIR)/dmem_tmp2.elf