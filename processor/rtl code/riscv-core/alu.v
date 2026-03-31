`include "defines.vh"

module alu (
    input [31:0] src1,
    input [31:0] src2,
    input [5:0] operation,
    output reg [31:0] alu_result ,
    output reg branch_condn // new added by irfan
);

always @(*) begin
    branch_condn = 1'b0;
    case (operation)

        // --- R-Type ---
        `ALU_ADD:  alu_result = src1 + src2;
        `ALU_SUB:  alu_result = src1 - src2;
        `ALU_SLL:  alu_result = src1 << src2[4:0];
        `ALU_SLT:  alu_result = ($signed(src1) < $signed(src2)) ? 1 : 0;
        `ALU_SLTU: alu_result = (src1 < src2) ? 1 : 0;
        `ALU_XOR:  alu_result = src1 ^ src2;
        `ALU_SRL:  alu_result = src1 >> src2[4:0];
        `ALU_SRA:  alu_result = $signed(src1) >>> src2[4:0];
        `ALU_OR:   alu_result = src1 | src2;
        `ALU_AND:  alu_result = src1 & src2;

        // --- I-Type (same ops, different source of src2) ---
        `ALU_ADDI: alu_result = src1 + src2;
        `ALU_SLLI: alu_result = src1 << src2[4:0];
        `ALU_SLTI: alu_result = ($signed(src1) < $signed(src2)) ? 1 : 0;
        `ALU_XORI: alu_result = src1 ^ src2;
        `ALU_SRLI: alu_result = src1 >> src2[4:0];
        `ALU_ORI:  alu_result = src1 | src2;
        `ALU_ANDI: alu_result = src1 & src2;
        `ALU_ANDI_ALT: alu_result = src1 & src2;

        // --- Load/Store (Address calculation only) ---
        `ALU_L_BYTE,
        `ALU_L_HALF,
        `ALU_L_WORD,
        `ALU_L_BU,
        `ALU_L_HU,
        `ALU_S_BYTE,
        `ALU_S_HALF,
        `ALU_S_WORD:
            alu_result = src1 + src2;  // base + offset

        // --- Branch (comparison result) ---
        `ALU_BEQ: begin   branch_condn = (src1 == src2) ; alu_result = 32'b0 ; end // this block change by irfan
        `ALU_BNE: begin  branch_condn = (src1 != src2) ; alu_result = 32'b0 ; end
        `ALU_BLT: begin branch_condn = ($signed(src1) < $signed(src2)) ; alu_result = 32'b0 ;end
        `ALU_BGE: begin branch_condn = ($signed(src1) >= $signed(src2)) ; alu_result = 32'b0 ;end
        `ALU_BLTU:begin  branch_condn = (src1 < src2); alu_result = 32'b0 ; end 
        `ALU_BGEU:begin branch_condn = (src1 >= src2) ; alu_result = 32'b0 ;end 

        // --- Special ---
        `ALU_LUI: alu_result = src2;   // immediate << 12 already done in decode
        `ALU_JAL: alu_result = src1 + 4; // return address

        default: alu_result = 32'hDEADBEEF;
    endcase
end

endmodule