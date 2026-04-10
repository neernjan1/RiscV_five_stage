module muxSrc2 (
    input [31:0] rd2,
    input [31:0] alu_result,
    input [31:0] mem_result,
    input [1:0] forward_B,
    output reg [31:0] src2
);

always @(*) begin
    case (forward_B) 
        2'b00: src2 = rd2;
        2'b01: src2 = alu_result;   
        2'b10: src2 = mem_result;  
        default: src2 = rd2;     
    endcase
end 

endmodule