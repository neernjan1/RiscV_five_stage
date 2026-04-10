`include "defines.vh"
`timescale 1ns / 1ps

module idu(

    input clk,
    input rst,

    // From IF stage
    input [31:0] instruction,
    input [31:0] pc_id,

    // From WB stage 
    input regWrite_wb,
    input [4:0] rd_wb,
    input [31:0] write_data_wb,
    input stall,
    input flush,
    input control_mux_sel,

    output [31:0] pc_ex,
    output [4:0] rs1_ex,
    output [4:0] rs2_ex,
    output [4:0] rd_ex,
    output [31:0] read_data1_ex,
    output [31:0] read_data2_ex,
    output [31:0] imm_val_ex,
    output [2:0] funct3_ex,
    output [6:0] funct7_ex,

    output regWrite_ex,
    output aluSrc_ex,
    output [2:0] aluOp_ex,
    output branch_ex,
    output memWrite_ex,
    output memRead_ex,
    output memToReg_ex,
    output jump_ex
);

   
    wire [6:0] opcode = instruction[6:0];
    wire [4:0] rs1 = instruction[19:15];
    wire [4:0] rs2 = instruction[24:20];
    wire [4:0] rd  = instruction[11:7];
    wire [2:0] funct3 = instruction[14:12];
    wire [6:0] funct7 = instruction[31:25];

   
    wire regWrite, aluSrc, branch, memWrite, memRead, memToReg, jump;
    wire [2:0] aluOp;

    control ctrl_unit (
        .opcode(opcode),
        .regWrite(regWrite),
        .aluSrc(aluSrc),
        .aluOp(aluOp),
        .branch(branch),
        .memWrite(memWrite),
        .memRead(memRead),
        .memToReg(memToReg),
        .jump(jump)
    );

    
    wire regWrite_mux, aluSrc_mux, branch_mux, memWrite_mux;
    wire memRead_mux, memToReg_mux, jump_mux;
    wire [2:0] aluOp_mux;

    control_mux ctrl_mux (
        .control_mux_sel(control_mux_sel),

        .regWrite(regWrite),
        .aluSrc(aluSrc),
        .aluOp(aluOp),
        .branch(branch),
        .memWrite(memWrite),
        .memRead(memRead),
        .memToReg(memToReg),
        .jump(jump),

        .regWrite_mux_out(regWrite_mux),
        .aluSrc_mux_out(aluSrc_mux),
        .aluOp_mux_out(aluOp_mux),
        .branch_mux_out(branch_mux),
        .memWrite_mux_out(memWrite_mux),
        .memRead_mux_out(memRead_mux),
        .memToReg_mux_out(memToReg_mux),
        .jump_mux_out(jump_mux)
    );

   
    wire [31:0] read_data1, read_data2;

    reg_file rf (
        .clk(clk),
        .rst(rst),
        .reg_write(regWrite_wb),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd_wb),
        .write_data(write_data_wb),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

   
    wire [31:0] imm_val;

    imm_gen immgen (
        .instruction(instruction),
        .imm_val(imm_val)
    );

    
    ID_EX id_ex_reg (
        .clk(clk),
        .rst(rst),
        .stall(stall),
        .flush(flush),

        .pc_id(pc_id),

        .rs1_id(rs1),
        .rs2_id(rs2),
        .rd_id(rd),

        .read_data1_id(read_data1),
        .read_data2_id(read_data2),
        .imm_val_id(imm_val),

        .funct3_id(funct3),
        .funct7_id(funct7),

        .regWrite_id(regWrite_mux),
        .aluSrc_id(aluSrc_mux),
        .aluOp_id(aluOp_mux),
        .branch_id(branch_mux),
        .memWrite_id(memWrite_mux),
        .memRead_id(memRead_mux),
        .memToReg_id(memToReg_mux),
        .jump_id(jump_mux),

        .pc_ex(pc_ex),
        .rs1_ex(rs1_ex),
        .rs2_ex(rs2_ex),
        .rd_ex(rd_ex),

        .read_data1_ex(read_data1_ex),
        .read_data2_ex(read_data2_ex),
        .imm_val_ex(imm_val_ex),

        .funct3_ex(funct3_ex),
        .funct7_ex(funct7_ex),

        .regWrite_ex(regWrite_ex),
        .aluSrc_ex(aluSrc_ex),
        .aluOp_ex(aluOp_ex),
        .branch_ex(branch_ex),
        .memWrite_ex(memWrite_ex),
        .memRead_ex(memRead_ex),
        .memToReg_ex(memToReg_ex),
        .jump_ex(jump_ex)
    );

endmodule
