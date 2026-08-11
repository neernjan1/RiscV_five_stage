`timescale 1ns/1ps
module IF_ID (
    input clk,
    input rst,

    // control signals
    input IF_flush,
    input IF_ID_write,

    // data from IF stage
    input [31:0] IF_instr,
    input [31:0] IF_pc,
    input [31:0] IF_pcplus4,

    // outputs to ID stage
    output reg [31:0] Instr_ID,
    output reg [31:0] pc_ID,
    output reg [31:0] pc_plus_4_ID
);

always @(posedge clk ) begin
    if (rst) begin

        Instr_ID      <= 32'b0;
        pc_ID         <= 32'h80000000;
        pc_plus_4_ID  <= 32'h80000000;
    end
      else if (IF_flush) begin //flush at 1 ,earlier set to 0
        // Bubble the instruction only. pc_ID/pc_plus_4_ID deliberately
        // hold their previous value here (same as the stall case below)
        // instead of resetting to a fixed constant: pc_ID feeds
        // interrupted_pc for mepc, and an interrupt can land on the very
        // cycle a taken branch flushes this stage (e.g. a spin-loop
        // branch taken every iteration) -- stomping pc_ID to a fixed
        // address here would corrupt mepc with that constant instead of
        // a real resume PC, sending mret to a bogus address.
        Instr_ID      <= 32'b0;

    end

    else if (IF_ID_write) begin //IF_ID_write == 0 will lead to stall
        // Normal operation
        Instr_ID      <= IF_instr;
        pc_ID         <= IF_pc;
        pc_plus_4_ID  <= IF_pcplus4;
    end
    // as its register .. it will hold itself ..that is stalling
end

endmodule