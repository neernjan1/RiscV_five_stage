module pc_offset(
    input [31:0] pc_offset_in, // input from mux_jalr
    input [31:0] imm,
    output reg [31:0] pc_offset_out
);

always @(*) begin
    pc_offset_out = pc_offset_in + imm;
end

endmodule