`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 11:48:36 AM
// Design Name: 
// Module Name: mux_wb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_wb(
input [31:0] alu_result ,
input [31:0] r_data ,
input mem_to_reg ,
output [31:0] data_out 
    );
    assign data_out = (mem_to_reg == 1'b1) ? r_data : alu_result;
endmodule
