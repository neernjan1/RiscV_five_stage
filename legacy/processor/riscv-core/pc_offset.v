module pc_offset(
    input [31:0] pc,
    input [31:0] imm,
    output reg [31:0] pc_offset_out
);

always @(*) begin
    pc_offset_out = pc + imm;
end

endmodule