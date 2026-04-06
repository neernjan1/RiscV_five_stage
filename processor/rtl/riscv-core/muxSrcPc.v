module muxSrc1Pc (
    input [31:0] src1_in,  //input from muxSrc1
    input [31:0] pc,    // input from id_ex register
    input alu_pc_sel, // control signal to select between src1 and pc
    output reg [31:0] src1
);

always @(*) begin
    if (alu_pc_sel) 
        src1 = pc;  // For JAL, we want to use PC as the source for ALU
    else 
        src1 = src1_in ; // For other instructions, use the regular src1
end
endmodule