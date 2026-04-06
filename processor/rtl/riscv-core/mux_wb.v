`timescale 1ns / 1ps

module mux_wb(
input [31:0] alu_result ,
input [31:0] r_data ,

input memToReg , // 🔥 NEW


output [31:0] data_out 
    );
    
assign data_out = (memToReg) ? r_data : alu_result; // if memToReg is 1, select read data from memory; otherwise, select ALU result
endmodule
