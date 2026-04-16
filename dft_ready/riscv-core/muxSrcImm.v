module muxSrcImm (
    input alu_src,
    input [31:0]src2_in,
    input [31:0] imm,
    output reg [31:0] src2
);

always @(*) begin 
    if(alu_src) 
        src2 =imm;
    else 
        src2=src2_in;
end 
endmodule