`timescale 1ns / 1ps

module mux_wb(
input [31:0] alu_result ,
input [31:0] r_data ,
input mem_to_reg ,
output [31:0] data_out 
    );
    assign data_out = (mem_to_reg == 1'b1) ? r_data : alu_result;
endmodule
