`timescale 1ns/1ps

module pc(
    input clk,
    input rst,
    input pc_write,
    input [31:0] next_pc,
    output reg [31:0] pc
);

always @(posedge clk or posedge rst) begin
    if (rst)
        pc <= 32'h80000000;
    else if (pc_write)
        pc <= next_pc;
    // else: hold previous value automatically
end

endmodule