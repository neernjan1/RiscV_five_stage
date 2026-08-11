// `include "defines.vh"
`timescale 1ns / 1ps

module imm_gen(
    input  [31:0] instruction, 
    output reg [31:0] imm_val 
);

always @(*) begin
    case (instruction[6:0])   // opcode

        
        // I-TYPE, LOAD, JALR
         
        `OPCODE_I_TYPE,
        `OPCODE_LOAD,
        `OPCODE_JALR:
            imm_val = {{20{instruction[31]}}, instruction[31:20]};


         
        // S-TYPE (STORE)
         
        `OPCODE_STORE:
            imm_val = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};


         
        // B-TYPE (BRANCH)
         
        `OPCODE_BRANCH:
            imm_val = {{19{instruction[31]}}, instruction[31], instruction[7],
                       instruction[30:25], instruction[11:8], 1'b0};


         
        // U-TYPE (LUI, AUIPC) // changed in this due to auipc issue
        `OPCODE_LUI:
            imm_val = {instruction[31:12],12'b0};

        `OPCODE_AUIPC: begin
            imm_val = {{12{instruction[31]}}, instruction[31:12], 12'b0};
            $display("AUIPC instr=%h imm=%h",instruction,imm_val);
        end

         
        // J-TYPE (JAL)
         
        `OPCODE_JAL:
            imm_val = {{11{instruction[31]}}, instruction[31],
                       instruction[19:12], instruction[20],
                       instruction[30:21], 1'b0};


         
        // DEFAULT
         
        default:
            imm_val = 32'b0;

    endcase
end

endmodule