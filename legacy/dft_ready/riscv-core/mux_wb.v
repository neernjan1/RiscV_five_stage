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
input [31:0] pc_plus_4_wb,// 🔥 NEW
input [1:0] result_src, // 🔥 NEW


output reg [31:0] data_out 
    );
    always @(*) begin// 🔥 NEW
    case(result_src)
        2'b00: data_out = alu_result;
        2'b01: data_out = r_data;
        2'b10: data_out = pc_plus_4_wb;  // 🔥 JAL/JALR
        default: data_out = alu_result;
    endcase
end
endmodule
