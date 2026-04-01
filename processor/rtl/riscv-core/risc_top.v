`timescale 1ns / 1ps

module risc_top(
    input clk,
    input rst
);

wire [31:0] alu_result_wb, mem_result_wb;
wire [4:0] rd_wb;
wire reg_write_wb, mem_to_reg_wb;

wire [31:0] alu_result_mem, write_data_mem;
wire [4:0] rd_mem;
wire reg_write_mem, mem_write_mem, mem_read_mem, mem_to_reg_mem;

// ======================= IF STAGE =======================

wire [31:0] pc, next_pc, pc_plus_4, pc_target;
wire [31:0] instruction_code_if;

wire pc_src, pc_write, if_id_write, flush;

// PC MUX
mux mux_if (
    pc_plus_4,
    pc_target,
    pc_src,
    next_pc
);

// PC
pc pc_if (
    clk,
    rst,
    pc_write,
    next_pc,
    pc
);

// Instruction Memory
instruction_memory imem_if (
    pc,
    instruction_code_if
);

// PC + 4
adder add_if (
    pc,
    pc_plus_4
);

// ======================= IF/ID =======================

wire [31:0] instruction_code_id, pc_id, pc_plus_4_id;

IF_ID if_id_reg (
    clk,
    rst,
    flush,
    if_id_write,
    instruction_code_if,
    pc,
    pc_plus_4,
    instruction_code_id,
    pc_id,
    pc_plus_4_id
);

// ======================= ID STAGE =======================

// Instruction fields extraction
wire [6:0] opcode_id, funct7_id;
wire [2:0] funct3_id;
wire [4:0] rs1_id, rs2_id, rd_id;

assign opcode_id = instruction_code_id[6:0];
assign rd_id     = instruction_code_id[11:7];
assign funct3_id = instruction_code_id[14:12];
assign rs1_id    = instruction_code_id[19:15];
assign rs2_id    = instruction_code_id[24:20];
assign funct7_id = instruction_code_id[31:25];

// Control signals
wire reg_write_id, alu_src_id, branch_id;
wire mem_write_id, mem_read_id, mem_to_reg_id, jump_id;
wire [2:0] alu_op_id;

// Muxed control signals (for stall)
wire reg_write_id_mux, alu_src_id_mux, branch_id_mux;
wire mem_write_id_mux, mem_read_id_mux, mem_to_reg_id_mux, jump_id_mux;
wire [2:0] alu_op_id_mux;
wire control_mux_sel_id;

// Register file
wire [31:0] read_data_1_id, read_data_2_id;
wire [31:0] write_data_wb;

reg_file rf (
    clk,
    rst,
    reg_write_wb,
    rs1_id,
    rs2_id,
    rd_wb,
    write_data_wb,
    read_data_1_id,
    read_data_2_id
);

// Immediate generator
wire [31:0] imm_val_id;

imm_gen imm1 (
    instruction_code_id,
    imm_val_id
);

// Control Unit
control ctrl (
    opcode_id,
    reg_write_id,
    alu_src_id,
    alu_op_id,
    branch_id,
    mem_write_id,
    mem_read_id,
    mem_to_reg_id,
    jump_id
);

// Control MUX (for stall)
control_mux cmux (
    control_mux_sel_id,
    reg_write_id,
    alu_src_id,
    alu_op_id,
    branch_id,
    mem_write_id,
    mem_read_id,
    mem_to_reg_id,
    jump_id,
    reg_write_id_mux,
    alu_src_id_mux,
    alu_op_id_mux,
    branch_id_mux,
    mem_write_id_mux,
    mem_read_id_mux,
    mem_to_reg_id_mux,
    jump_id_mux
);

// ======================= ID/EX =======================

wire [31:0] pc_ex, read_data_1_ex, read_data_2_ex, imm_val_ex;
wire [4:0] rs1_ex, rs2_ex, rd_ex;
wire [2:0] funct3_ex, alu_op_ex;
wire [6:0] funct7_ex;

wire reg_write_ex, alu_src_ex, branch_ex;
wire mem_write_ex, mem_read_ex, mem_to_reg_ex, jump_ex;

ID_EX id_ex1 (
    .clk(clk),
    .rst(rst),
    .stall(control_mux_sel_id),
    .flush(flush),

    .pc_id(pc_id),

    .rs1_id(rs1_id),
    .rs2_id(rs2_id),
    .rd_id(rd_id),

    .read_data1_id(read_data_1_id),
    .read_data2_id(read_data_2_id),
    .imm_val_id(imm_val_id),

    .funct3_id(funct3_id),
    .funct7_id(funct7_id),

    // 🔥 CONTROL INPUTS
    .regWrite_id(reg_write_id_mux),
    .aluSrc_id(alu_src_id_mux),
    .aluOp_id(alu_op_id_mux),
    .branch_id(branch_id_mux),
    .memWrite_id(mem_write_id_mux),
    .memRead_id(mem_read_id_mux),
    .memToReg_id(mem_to_reg_id_mux),
    .jump_id(jump_id_mux),

    // 🔥 OUTPUTS
    .pc_ex(pc_ex),

    .rs1_ex(rs1_ex),
    .rs2_ex(rs2_ex),
    .rd_ex(rd_ex),

    .read_data1_ex(read_data_1_ex),
    .read_data2_ex(read_data_2_ex),
    .imm_val_ex(imm_val_ex),

    .funct3_ex(funct3_ex),
    .funct7_ex(funct7_ex),

    .regWrite_ex(reg_write_ex),
    .aluSrc_ex(alu_src_ex),
    .aluOp_ex(alu_op_ex),
    .branch_ex(branch_ex),   // 🔥 IMPORTANT
    .memWrite_ex(mem_write_ex),
    .memRead_ex(mem_read_ex),
    .memToReg_ex(mem_to_reg_ex),
    .jump_ex(jump_ex)        // 🔥 IMPORTANT
);
// ======================= EX STAGE =======================

// Forwarding
wire [1:0] forwardA, forwardB;

forwarding fwd (
    rs1_ex,
    rs2_ex,
    rd_mem,
    rd_wb,
    reg_write_mem,
    reg_write_wb,
    forwardA,
    forwardB
);

// Forwarded sources
wire [31:0] src1, src2_forwarded, src2;

// MUX A
muxSrc1 m1 (
    read_data_1_ex,
    alu_result_mem,
    write_data_wb,
    forwardA,
    src1
);

// MUX B (forwarding)
muxSrc2 m2 (
    read_data_2_ex,
    alu_result_mem,
    write_data_wb,
    forwardB,
    src2_forwarded
);

// ALU SRC MUX
muxSrcImm m3 (
    alu_src_ex,
    src2_forwarded,
    imm_val_ex,
    src2
);

// ALU control
wire [5:0] operation;

alu_control alu_ctrl (
    alu_op_ex,
    funct3_ex,
    funct7_ex,
    operation
);

// ALU
wire [31:0] alu_result_ex;
wire branch_condn_ex;

alu alu1 (
    src1,
    src2,
    operation,
    alu_result_ex,
    branch_condn_ex
);

// Branch target
pc_offset pco (
    pc_ex,
    imm_val_ex,
    pc_target
);

// Branch decision
branch_decision bd (
    branch_condn_ex,
    jump_ex,
    branch_ex,
    pc_src,
    flush
);

// ======================= EX/MEM =======================



ex_mem ex_mem1 (
    .clk(clk),
    .rst(rst),

    .alu_result_in(alu_result_ex),
    .write_data_in(src2_forwarded),// earlier scr2 was forwarded .. but for store instruction it created mess 
    .rd_in(rd_ex),

    .mem_read_in(mem_read_ex),
    .mem_write_in(mem_write_ex),
    .mem_to_reg_in(mem_to_reg_ex),
    .reg_write_in(reg_write_ex),

    .alu_result_out(alu_result_mem),
    .write_data_out(write_data_mem),
    .rd_out(rd_mem),

    .mem_read_out(mem_read_mem),
    .mem_write_out(mem_write_mem),
    .mem_to_reg_out(mem_to_reg_mem),
    .reg_write_out(reg_write_mem)
);

// ======================= MEM STAGE =======================

wire [31:0] mem_result_mem;

data_memory dmem (
    .clk(clk),
   .rst(rst),
    .addr(alu_result_mem),
   .w_data (write_data_mem),
    .mem_read(mem_read_mem),
   .mem_write(mem_write_mem),
   .r_data(mem_result_mem)
);

// ======================= MEM/WB =======================



mem_wb mem_wb1 (
    .clk(clk),
    .rst(rst),
    .alu_result_mem(alu_result_mem),
    .read_data_mem(mem_result_mem),
    .reg_write_mem(reg_write_mem),
    .mem_to_reg_mem(mem_to_reg_mem),
    .rd_mem(rd_mem),

    .alu_result_wb(alu_result_wb),
    .read_data_wb(mem_result_wb),
    .reg_write_wb(reg_write_wb),
    .mem_to_reg_wb(mem_to_reg_wb),
    .rd_wb(rd_wb)
);

// ======================= WB STAGE =======================

mux_wb wb_mux (
    alu_result_wb,
    mem_result_wb,
    mem_to_reg_wb,
    write_data_wb
);

// ======================= HAZARD UNIT =======================

hazard_detection hz (
    rs1_id,
    rs2_id,
    rd_ex,
    mem_read_ex,
    pc_write,
    if_id_write,
    control_mux_sel_id
);

endmodule
