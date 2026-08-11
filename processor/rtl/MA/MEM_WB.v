`timescale 1ns / 1ps

module mem_wb(
input clk,
input rst,
input stall,

input [31:0] alu_result_mem,
input [31:0] read_data_mem,
input reg_write_mem,
input mem_to_reg_mem,
input [4:0] rd_mem,

// just pass on signal
input [31:0] pc_mem,
output reg [31:0] pc_wb,

output reg [31:0] alu_result_wb,
output reg [31:0] read_data_wb,
output reg reg_write_wb,
output reg mem_to_reg_wb,
output reg [4:0] rd_wb ,
//For CSR new
    input csr_read_mem,
   input [31:0] csr_rdata_mem ,
   output reg csr_read_wb ,
   output reg [31:0] csr_rdata_wb


);

always @(posedge clk) begin
    if (rst) begin
        alu_result_wb <= 32'b0;
        read_data_wb  <= 32'b0;
        reg_write_wb  <= 1'b0;
        mem_to_reg_wb <= 1'b0;
        rd_wb         <= 5'b0;
        pc_wb         <= 32'h80000000;
        csr_read_wb   <= 0;
        csr_rdata_wb  <= 32'b0;
    end
    else if (!stall) begin
        alu_result_wb <= alu_result_mem;
        read_data_wb  <= read_data_mem;
        reg_write_wb  <= reg_write_mem;
        mem_to_reg_wb <= mem_to_reg_mem;
        rd_wb         <= rd_mem;
        pc_wb         <= pc_mem;
        csr_read_wb   <= csr_read_mem;
        csr_rdata_wb  <= csr_rdata_mem;
    end
    // else: hold previous values during stall
end

endmodule