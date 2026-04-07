`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2026 12:25:34 AM
// Design Name: 
// Module Name: mux_jalr
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


module mux_jalr (
    input [31:0] read_data_1_ex,  //input from id_ex register (rs1 value)
    input [31:0] pc,    // input from id_ex register
    input jalr_sel, // control signal to select between rs1 and pc
    output reg [31:0] pc_offset_in
);

always @(*) begin
    if (jalr_sel) 
        pc_offset_in = read_data_1_ex;  // For JALR, we want to use PC as the source for ALU
    else 
        pc_offset_in = pc ; // For other instructions, use the regular PC value from id_ex register
end


endmodule