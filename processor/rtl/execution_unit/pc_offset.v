module pc_offset(
    input [31:0] pc,
    input [31:0] imm,
    output wire [31:0] pc_offset_out
);


    assign pc_offset_out = pc + imm;

endmodule