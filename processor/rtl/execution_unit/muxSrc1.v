module muxSrc1 (
    input [31:0] rd1,
    input [31:0] alu_result,
    input [31:0] mem_result,
    input [1:0] forward_A,
    output reg [31:0] src1
);

always @(*) begin
    case (forward_A) 
        2'b00: src1 = rd1;
        2'b01: src1 = alu_result;   
        2'b10: src1 = mem_result;  
        default: src1 = rd1;     
    endcase
end 

endmodule