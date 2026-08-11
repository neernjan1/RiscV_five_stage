`timescale 1ns/1ps

module pc(
    input clk,
    input rst,
    input pc_write,
    input [31:0] next_pc,
    output reg [31:0] pc
);

// Synchronous reset, matching every other pipeline register in the
// core (IF_ID/ID_EX/EX_MEM/MEM_WB, reg_file.v, csr_file.sv) -- a
// single, consistent reset style within the core's clock domain is
// what a scan/ATPG flow wants.
always @(posedge clk) begin
    if (rst)
        pc <= 32'h80000000;
    else if (pc_write)
        pc <= next_pc;
    // else: hold previous value automatically
end

endmodule