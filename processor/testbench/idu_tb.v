`timescale 1ns / 1ps
`include "defines.vh"

module idu_tb;

    reg clk;
    reg rst;

    reg [31:0] instruction;
    reg [31:0] pc_id;

    reg regWrite_wb;
    reg [4:0] rd_wb;
    reg [31:0] write_data_wb;

    reg stall;
    reg flush;
    reg control_mux_sel;

    wire [31:0] pc_ex;
    wire [31:0] imm_val_ex;

   
    idu dut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .pc_id(pc_id),

        .regWrite_wb(regWrite_wb),
        .rd_wb(rd_wb),
        .write_data_wb(write_data_wb),

        .stall(stall),
        .flush(flush),
        .control_mux_sel(control_mux_sel),

        .pc_ex(pc_ex),
        .imm_val_ex(imm_val_ex)
    );

    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        stall = 0;
        flush = 0;
        control_mux_sel = 0;
        regWrite_wb = 0;
        rd_wb = 0;
        write_data_wb = 0;
        instruction = 0;
        pc_id = 0;

        
        #10 rst = 0;


        instruction = 32'b0000000_00010_00001_000_00011_0110011;
        pc_id = 32'h1000;
        #10;

        
        instruction = 32'b000000000101_00001_000_00100_0010011;
        #10;

        
        instruction = 32'b000000000000_00001_010_00101_0000011;
        #10;

       
        stall = 1;
        instruction = 32'b0000000_00011_00001_000_00100_0110011;
        #10;
        stall = 0;

      
        flush = 1;
        #10;
        flush = 0;

        control_mux_sel = 1;
        #10;
        control_mux_sel = 0;

        regWrite_wb = 1;
        rd_wb = 5'd1;
        write_data_wb = 32'd25;
        #10;

        $finish;
    end

endmodule