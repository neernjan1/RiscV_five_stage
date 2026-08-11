`timescale 1ns / 1ps

module reg_file(
input clk , 
input rst,
input scan_clk,
input test_mode,
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
    
     wire clk_dft;
  wire rst_dft;
  assign clk_dft = test_mode ? scan_clk : clk;
assign rst_dft = test_mode ? 1'b0 : rst;
    always @(posedge clk_dft) begin
        if (rst_dft) begin
            for (i = 0; i < 32; i = i + 1)
                register[i] <= 32'b0;
        end
        else begin
            if ((reg_write || test_mode) && (rd != 0))
                register[rd] <= write_data;
        end
    
        register[0] <= 32'b0; // always enforce x0
    end
    
    assign read_data1 = (rs1 == 0) ? 32'b0 : register[rs1];
    assign read_data2 = (rs2 == 0) ? 32'b0 : register[rs2];

endmodule