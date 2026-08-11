# 🔐 ASCON Hardware Accelerator (Verilog)

## 📌 Overview

This project implements a **hardware accelerator for the ASCON authenticated encryption algorithm** using Verilog.
It supports both **encryption and decryption** with authentication tag generation and verification.

The design is built as a **memory-mapped peripheral using APB protocol**, making it suitable for integration with processors like **RISC-V SoCs**.

---

## 🚀 Features

* ✔️ ASCON permutation (320-bit state)
* ✔️ Authenticated Encryption (AEAD)
* ✔️ Encryption + Decryption support
* ✔️ Tag generation and verification
* ✔️ APB (Advanced Peripheral Bus) interface
* ✔️ FSM-based control logic
* ✔️ Modular round-based architecture
* ✔️ Self-checking testbenches

---

## 🧠 Architecture

```
CPU (APB Master)
           ↓
+-----------------------+
|   APB Interface       |
+-----------------------+
           ↓
+-----------------------+
| Control + Status Regs |
+-----------------------+
           ↓
+-----------------------+
|        FSM            |
+-----------------------+
           ↓
+-----------------------+
|   ASCON Round Core    |
+-----------------------+
           ↓
+-----------------------+
| Data / Tag Output     |
+-----------------------+
```

---

## 🔧 Core Components

### 1. `ascon_accelerator.v`

* Top-level module
* Implements:

  * APB interface
  * Control/Status registers
  * FSM
  * Datapath integration

---

### 2. `ascon_round.v`

* Core permutation block
* Operates on 5 × 64-bit state registers:

  ```
  x0, x1, x2, x3, x4
  ```
* Implements 3 stages:

  * **pC** → round constant addition
  * **pS** → non-linear substitution (S-box)
  * **pL** → diffusion (rotation + XOR)

---

### 3. Testbenches

* `tb_ascon_encryption.v`
* `tb_ascon_decryption.v`

Features:

* APB transaction modeling
* Timeout detection
* Self-checking outputs

---

## 🔄 FSM Flow

| State         | Description                 |
| ------------- | --------------------------- |
| IDLE          | Wait for start signal       |
| LOAD_INIT     | Load IV, key, nonce         |
| INIT_PERMUTE  | 12 rounds permutation       |
| INIT_KEY_XOR  | Key mixing                  |
| PT_PROCESS    | Data absorption + 6 rounds  |
| FINAL_KEY_XOR | Final key mixing            |
| FINAL_PERMUTE | 12 rounds                   |
| TAG_OUT       | Generate authentication tag |
| TAG_VERIFY    | Verify tag (decrypt mode)   |
| DONE_STATE    | Operation complete          |

---

## 🔌 APB Register Map

### 🔹 Control & Status

| Address | Name    | Description                       |
| ------- | ------- | --------------------------------- |
| `0x00`  | CONTROL | [0]=start, [1]=decrypt            |
| `0x04`  | STATUS  | [0]=done, [1]=busy, [2]=tag_valid |

---

### 🔹 Data Registers

| Address     | Description          |
| ----------- | -------------------- |
| `0x08–0x0C` | Input data (64-bit)  |
| `0x10–0x14` | Output data (64-bit) |

---

### 🔹 Key (128-bit)

| Address     |
| ----------- |
| `0x18–0x24` |

---

### 🔹 Nonce (128-bit)

| Address     |
| ----------- |
| `0x28–0x34` |

---

### 🔹 Tag

| Address     | Description         |
| ----------- | ------------------- |
| `0x38–0x44` | Generated tag       |
| `0x48–0x54` | Input tag (decrypt) |

---

## ⚙️ Operation Flow

### 🔐 Encryption

1. Load key
2. Load nonce
3. Load plaintext
4. Write `CONTROL = 1`
5. Wait for `STATUS.done`
6. Read:

   * Ciphertext
   * Tag

---

### 🔓 Decryption

1. Load key
2. Load nonce
3. Load ciphertext
4. Load received tag
5. Write `CONTROL = 3`
6. Wait for `STATUS.done`
7. Read:

   * Plaintext
   * `STATUS.tag_valid`

---

## 🧪 Simulation

### Compile

```bash
iverilog *.v
```

### Run

```bash
vvp a.out
```

---

## 📊 Verification Strategy

* ✔️ Functional simulation using testbenches
* ✔️ Encryption → Decryption loopback check
* ✔️ Tag verification
* ✔️ Timeout detection for FSM failures
* ✔️ Waveform analysis (recommended)

---



## 🏭 Applications

* IoT security
* Lightweight cryptography
* Secure communication modules
* Embedded systems (RISC-V SoCs)
* Hardware security accelerators

---

## 🔮 Future Improvements

* Pipeline optimization for higher throughput
* Multi-block processing
* AXI interface support
* Integration with RISC-V core
* Formal verification

---

## 📚 References

* ASCON specification (NIST Lightweight Crypto)
* Hardware-oriented cryptography design practices

---

## 👨‍💻 Author

**Team:Vault-V**
Electronics & Communication Engineering

---

## ⭐ Notes

This project focuses on **hardware-first thinking**:

* FSM-driven control
* Modular crypto core
* Real-world bus interface (APB)

---
