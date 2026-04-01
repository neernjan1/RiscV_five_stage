module top (
    input clk,
    input rst,

    // Control signals
    input wb,
    input mem_read,
    input mem_write,
    input [2:0] ALUOp,
    input alu_src,
    input branch,

    // Instruction fields
    input [2:0] func3,
    input [6:0] func7,

    // Register file inputs
    input [31:0] rd1,
    input [31:0] rd2,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    // Immediate
    input [31:0] imm,

    // Forwarding inputs (from later stages)
    input [31:0] ex_mem_alu_result,
    input [31:0] mem_wb_result,
    input [4:0] ex_mem_rd,
    input [4:0] mem_wb_rd,
    input ex_mem_reg_write,
    input mem_wb_reg_write,

    // Outputs
    output [31:0] alu_result_out,
    output wb_out,
    output mem_read_out,
    output mem_write_out,
    output [4:0] rd_out
);

    // =========================
    // Internal wires
    // =========================
    wire [1:0] forward_A, forward_B;
    wire [31:0] src1, src2_forwarded, src2_final;
    wire [5:0] operation;
    wire [31:0] alu_result;

    // =========================
    // Forwarding Unit
    // =========================
    forwarding forwarding1(
        .id_ex_rs1(rs1),
        .id_ex_rs2(rs2),
        .ex_mem_rd(ex_mem_rd),
        .mem_wb_rd(mem_wb_rd),
        .ex_mem_reg_write(ex_mem_reg_write),
        .mem_wb_reg_write(mem_wb_reg_write),
        .forward_A(forward_A),
        .forward_B(forward_B)
    );

    // =========================
    // Forwarding MUX (src1)
    // =========================
    muxSrc1 muxSrc1_inst(
        .rd1(rd1),
        .alu_result(ex_mem_alu_result),
        .mem_result(mem_wb_result),
        .forward_A(forward_A),
        .src1(src1)
    );

    // =========================
    // Forwarding MUX (src2)
    // =========================
    muxSrc2 muxSrc2_inst(
        .rd2(rd2),
        .alu_result(ex_mem_alu_result),
        .mem_result(mem_wb_result),
        .forward_B(forward_B),
        .src2(src2_forwarded)
    );

    // =========================
    // Immediate MUX
    // =========================
    muxSrcImm muxSrcImm1(
        .alu_src(alu_src),
        .src2_in(src2_forwarded),
        .imm(imm),
        .src2(src2_final)
    );

    // =========================
    // ALU Control
    // =========================
    alu_control alu_control1(
        .alu_op(ALUOp),
        .func3(func3),
        .func7(func7),
        .operation(operation)
    );

    // =========================
    // ALU
    // =========================
    alu alu1(
        .src1(src1),
        .src2(src2_final),
        .operation(operation),
        .alu_result(alu_result)
    );

    // =========================
    // EX/MEM Pipeline Register
    // =========================
    ex_mem ex_mem1(
        .clk(clk),
        .rst(rst),

        .alu_result_in(alu_result),
        .mem_in({mem_read, mem_write}), // packed
        .wb_in(wb),
        .branch_in(branch),
        .rd_in(rd),

        .alu_result_out(alu_result_out),
        .mem_out({mem_read_out, mem_write_out}),
        .wb_out(wb_out),
        .branch_out(), // optional
        .rd_out(rd_out)
    );

endmodule