`timescale 1ns / 1ps


module mem_wb(
input clk,
input rst ,
input [31:0] alu_result_mem,
input [31:0] read_data_mem,
input reg_write_mem,
input mem_to_reg_mem,
input [4:0] rd_mem,

output reg[31:0] alu_result_wb,
output reg [31:0] read_data_wb,
output reg reg_write_wb,
output reg  mem_to_reg_wb,
output reg [4:0] rd_wb
    );
    
    always @(posedge clk ) begin
                if (rst) begin
            alu_result_wb <= 32'b0;
            read_data_wb  <= 32'b0;
            reg_write_wb  <= 1'b0;
            mem_to_reg_wb <= 1'b0;
            rd_wb         <= 5'b0;
        end 
        else begin
            alu_result_wb <= alu_result_mem;
            read_data_wb <= read_data_mem;
             reg_write_wb <= reg_write_mem;
             mem_to_reg_wb <= mem_to_reg_mem;
             rd_wb <= rd_mem ;
        end
    end 
endmodule
