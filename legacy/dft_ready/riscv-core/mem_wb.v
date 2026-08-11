`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 12:26:55 PM
// Design Name: 
// Module Name: branch_decision
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 11:38:49 AM
// Design Name: 
// Module Name: mem_wb
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


module mem_wb(
input clk,
input rst ,
input scan_clk,
input test_mode,

input [31:0] alu_result_mem,
input [31:0] read_data_mem,
input reg_write_mem,
input mem_to_reg_mem,
input [4:0] rd_mem,

output reg[31:0] alu_result_wb,
output reg [31:0] read_data_wb,
output reg reg_write_wb,
output reg  mem_to_reg_wb,
output reg [4:0] rd_wb , 

    input  [31:0] pc_plus_4_mem, // 🔥 NEW
    output reg [31:0] pc_plus_4_wb,// 🔥 NEW
    // 🔥 ADD
    input [1:0] result_src_mem,// 🔥 NEW
    output reg [1:0] result_src_wb// 🔥 NEW
    );
    wire clk_dft;
  wire rst_dft;
  assign clk_dft = test_mode ? scan_clk : clk;
assign rst_dft = test_mode ? 1'b0 : rst;
    always @(posedge clk_dft ) begin
                if (rst_dft) begin
            alu_result_wb <= 32'b0;
            read_data_wb  <= 32'b0;
            reg_write_wb  <= 1'b0;
            mem_to_reg_wb <= 1'b0;
            rd_wb         <= 5'b0;
            pc_plus_4_wb  <= 0;// 🔥 NEW
            result_src_wb <= 0;// 🔥 NEW
        end 
        else begin
            alu_result_wb <= alu_result_mem;
            read_data_wb <= read_data_mem;
             reg_write_wb <= reg_write_mem;
             mem_to_reg_wb <= mem_to_reg_mem;
             rd_wb <= rd_mem ;
             pc_plus_4_wb <= pc_plus_4_mem ;// 🔥 NEW
             result_src_wb <= result_src_mem ;// 🔥 NEW
        end
    end 
endmodule