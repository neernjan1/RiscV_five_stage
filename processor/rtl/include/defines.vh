// =============================================================================
//  VAULT-V DEFINITIONS (defines.vh)
//  Central Dictionary for RISC-V Opcodes and Control Signals
// =============================================================================

`ifndef DEFINES_VH
`define DEFINES_VH

// =============================================================================
// 1. RISC-V OPCODES (7-bit)
//    (Taken from standard RISC-V Green Card - CONFIRMED CORRECT)
// =============================================================================

`define OPCODE_R_TYPE    7'b0110011
`define OPCODE_I_TYPE    7'b0010011
`define OPCODE_LOAD      7'b0000011
`define OPCODE_STORE     7'b0100011
`define OPCODE_BRANCH    7'b1100011
`define OPCODE_LUI       7'b0110111
`define OPCODE_JAL       7'b1101111
`define OPCODE_JALR      7'b1100111
`define OPCODE_AUIPC     7'b0010111


// =============================================================================
// 2. ALU CONTROL SIGNALS (6-bit)
// =============================================================================

// --- Standard Arithmetic & Logic ---
`define ALU_ADD          6'b000001
`define ALU_SUB          6'b000010
`define ALU_SLL          6'b000011
`define ALU_SLT          6'b000100
`define ALU_SLTU         6'b000101
`define ALU_XOR          6'b000110
`define ALU_SRL          6'b000111
`define ALU_SRA          6'b001000
`define ALU_OR           6'b001001
`define ALU_AND          6'b001010
`define ALU_SRAI         6'bXXXXXX
// --- Immediate Instructions ---
`define ALU_ADDI         6'b001011
`define ALU_SLLI         6'b001100
`define ALU_SLTI         6'b001101
`define ALU_ANDI         6'b001110
`define ALU_XORI         6'b001111
`define ALU_SRLI         6'b010000
`define ALU_ORI          6'b010001
`define ALU_ANDI_ALT     6'b010010

// --- Load Instructions ---
`define ALU_L_BYTE       6'b010011
`define ALU_L_HALF       6'b010100
`define ALU_L_WORD       6'b010101
`define ALU_L_BU         6'b010110
`define ALU_L_HU         6'b010111

// --- Store Instructions ---
`define ALU_S_BYTE       6'b011000
`define ALU_S_HALF       6'b011001
`define ALU_S_WORD       6'b011010

// --- Branch Checks ---
`define ALU_BEQ          6'b011011
`define ALU_BNE          6'b011100
`define ALU_BLT          6'b011101
`define ALU_BGE          6'b011110
`define ALU_BLTU         6'b100000
`define ALU_BGEU         6'b011111

// --- Special Instructions ---
`define ALU_LUI          6'b100001
`define ALU_JAL          6'b100010
`define ALU_JALR         6'b100011
`define ALU_AUIPC        6'b100100

// =============================================================================
// 3. ALUOp (Instruction Category for ALU Control)
// =============================================================================

`define ALUOP_LOAD_STORE   3'b000  // address calc (ADD)
`define ALUOP_BRANCH       3'b001  // branch compare
`define ALUOP_R_TYPE       3'b010  // use funct3 + funct7
`define ALUOP_I_TYPE       3'b011  // use funct3
`define ALUOP_JAL          3'b100  // PC + imm
`define ALUOP_JALR         3'b101  // rs1 + imm
`define ALUOP_LUI          3'b110  // imm << 12
`define ALUOP_AUIPC        3'b111  // PC + imm

`endif // DEFINES_VH