`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2026 10:51:46 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
input clk , input rst,
input reg_write ,
input [4:0] rs1 , 
input [4:0] rs2 , 
input [4:0] rd ,
input [31:0] write_data ,
output  [31:0] read_data1 , 
output  [31:0] read_data2 
    );
   reg [31:0] register [31:0] ; 
   integer i;
    
    
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                register[i] <= 32'b0;
        end
        else begin
            if (reg_write && rd != 0)
                register[rd] <= write_data;
        end
    
        register[0] <= 32'b0; // always enforce x0
    end
    
    assign read_data1 = (rs1 == 0) ? 32'b0 : register[rs1];
    assign read_data2 = (rs2 == 0) ? 32'b0 : register[rs2];

endmodule
