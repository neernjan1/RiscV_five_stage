# 🚀 RISC-V 5-Stage Pipeline Processor

## 📌 Overview

This repository contains the design and implementation of a **5-stage pipelined RISC-V processor (RV32I)** written in Verilog.

The processor follows the classic pipeline stages:

* IF (Instruction Fetch)
* ID (Instruction Decode)
* EX (Execute)
* MEM (Memory Access)
* WB (Write Back)

It also includes **hazard detection and forwarding mechanisms** to handle pipeline hazards.

---

## 🧠 Key Features

* ✅ 5-stage pipelined architecture
* ✅ RV32I instruction support
* ✅ Data hazard handling (forwarding)
* ✅ Load-use hazard detection (stalling)
* ✅ Modular RTL design
* ✅ Separate testbench and simulation setup

---

## 📁 Repository Structure

```
processor/
│
├── docs/              # Reference materials, diagrams, PDFs
│
├── rtl/               # Main RTL implementation
│   ├── ifu/           # Instruction Fetch Unit
│   ├── idu/           # Instruction Decode Unit
│   ├── ex/            # Execute stage (ALU, forwarding, branch)
│   ├── mem/           # Data memory
│   ├── wb/            # Write-back stage
│   ├── hazard/        # Hazard detection unit
│   ├── include/       # Global definitions (defines.vh)
│   └── riscv-core/    # Top-level integration
│
├── testbench/         # Testbench files
│
├── simulations/       # Simulation outputs (VCD, dumps)
│
├── scripts/           # Automation / helper scripts
│
└── README.md
```

---

## ⚙️ Pipeline Architecture

### 🔹 Instruction Fetch (IF)

* Program Counter (PC)
* Instruction Memory
* PC update logic

### 🔹 Instruction Decode (ID)

* Register File
* Control Unit
* Immediate Generator

### 🔹 Execute (EX)

* ALU operations
* Branch decision logic
* Forwarding logic

### 🔹 Memory (MEM)

* Data memory access (load/store)

### 🔹 Write Back (WB)

* Writes result back to register file

---

## ⚠️ Hazard Handling

### 🔸 Data Hazards

Handled using:

* **Forwarding Unit**
* Bypasses data from EX/MEM or MEM/WB stages

### 🔸 Load-Use Hazard

Handled using:

* **Hazard Detection Unit**
* Pipeline stall (PC freeze + bubble insertion)

---

## ▶️ How to Run (Basic Flow)

### 1. Compile RTL

Use your preferred simulator (ModelSim / Icarus / Verilator)

Example (Icarus Verilog):

```bash
iverilog -o out.vvp rtl\ code/**/*.v testbench/*.v
vvp out.vvp
```

---

### 2. View Waveforms

```bash
gtkwave dump.vcd
```

---

## 🧪 Testbench

* Located in `testbench/`
* Includes unit-level and stage-level testing
* Generates waveform outputs for debugging

---

## 📊 Simulation Outputs

* Stored in `simulations/`
* Includes:

  * `.vcd` waveform files
  * memory dumps

---

## 📚 References

* Computer Organization and Design (Patterson & Hennessy)
* RISC-V ISA Specification
* Course materials and lecture notes

---

## 🚧 Future Improvements

* [ ] Branch prediction
* [ ] Instruction cache / data cache
* [ ] Exception handling
* [ ] CSR support
* [ ] Out-of-order execution (advanced)

---

## 👨‍💻 Author

Team-Vault-V

---

## ⭐ Notes

This project is built for learning and understanding **pipeline design, hazards, and processor architecture** at a practical level.
