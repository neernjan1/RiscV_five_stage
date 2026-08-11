`timescale 1ns/1ps
module ex_mem (
    input clk,
    input rst,
    input stall,

    // Data signals
    input [31:0] alu_result_in,
    input [31:0] write_data_in,
    input [4:0] rd_in,

    // Control signals
    input mem_read_in,
    input mem_write_in,
    input mem_to_reg_in,
    input reg_write_in,

    // just pass_on signal
    input [31:0] pc_ex,
    output reg [31:0] pc_mem,

    // Outputs
    output reg [31:0] alu_result_out,
    output reg [31:0] write_data_out,
    output reg [4:0] rd_out,

    output reg mem_read_out,
    output reg mem_write_out,
    output reg mem_to_reg_out,
    output reg reg_write_out,

    // operation passed for load/store
    input [1:0] mem_size_ex,
    input load_sign_ext_ex,
    output reg [1:0] mem_size_mem,
    output reg load_sign_ext_mem ,

    //For CSR new
    input csr_read_ex,
   input [31:0] csr_rdata_ex ,
   output reg csr_read_mem ,
   output reg [31:0] csr_rdata_mem
);

always @(posedge clk) begin
    if (rst) begin
        alu_result_out <= 0;
        write_data_out <= 0;
        rd_out <= 0;
        pc_mem <= 32'h80000000;

        mem_read_out <= 0;
        mem_write_out <= 0;
        mem_to_reg_out <= 0;
        reg_write_out <= 0;
        mem_size_mem <= 0;
        load_sign_ext_mem <= 0;
        csr_read_mem <=0;
        csr_rdata_mem <=0;
    end
    else if (!stall) begin
        alu_result_out <= alu_result_in;
        write_data_out <= write_data_in;
        rd_out <= rd_in;
        pc_mem <= pc_ex;

        mem_read_out <= mem_read_in;
        mem_write_out <= mem_write_in;
        mem_to_reg_out <= mem_to_reg_in;
        reg_write_out <= reg_write_in;
        mem_size_mem <= mem_size_ex;
        load_sign_ext_mem <= load_sign_ext_ex;
        csr_read_mem <=  csr_read_ex;
        csr_rdata_mem <=   csr_rdata_ex;
    end
    // else: hold previous values during stall
end

endmodule