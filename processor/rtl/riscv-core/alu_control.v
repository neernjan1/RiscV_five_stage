`include "defines.vh"

module alu_control (
    input [2:0] alu_op,
    input [2:0] func3,
    input [6:0] func7,
    output reg [5:0] operation,
    
    input mem_write_ex //added for load and store differ
);
initial begin
    $display("JAL   = %b", `ALU_JAL);
    $display("JALR  = %b", `ALU_JALR);
    $display("AUIPC = %b", `ALU_AUIPC);
end
always @(*) begin 

    operation = `ALU_ADD;

    case (alu_op)

   `ALUOP_LOAD_STORE: begin
            if (mem_write_ex) begin // It's a STORE
                case (func3)
                    3'b000: operation = `ALU_S_BYTE;
                    3'b001: operation = `ALU_S_HALF;
                    3'b010: operation = `ALU_S_WORD;
                    default: operation = `ALU_ADD;
                endcase
            end else begin      // It's a LOAD
                case (func3)
                    3'b000: operation = `ALU_L_BYTE;
                    3'b001: operation = `ALU_L_HALF;
                    3'b010: operation = `ALU_L_WORD;
                    3'b100: operation = `ALU_L_BU;
                    3'b101: operation = `ALU_L_HU;
                    default: operation = `ALU_ADD;
                endcase
            end
        end

        `ALUOP_BRANCH: begin 
            case (func3)
                3'b000: operation = `ALU_BEQ;
                3'b001: operation = `ALU_BNE;
                3'b100: operation = `ALU_BLT;
                3'b101: operation = `ALU_BGE;
                3'b110: operation = `ALU_BLTU;
                3'b111: operation = `ALU_BGEU;
                default: operation = `ALU_BEQ; // to avoid latch 
            endcase 
        end

        `ALUOP_R_TYPE: begin 
            case (func3)
                3'b000: operation = (func7 == 7'b0100000) ? `ALU_SUB : `ALU_ADD;
                3'b001: operation = `ALU_SLL;
                3'b010: operation = `ALU_SLT;
                3'b011: operation = `ALU_SLTU;
                3'b100: operation = `ALU_XOR;
                3'b101: operation = (func7 == 7'b0100000) ? `ALU_SRA : `ALU_SRL;
                3'b110: operation = `ALU_OR;
                3'b111: operation = `ALU_AND;
                default: operation = `ALU_ADD;
            endcase
        end

        `ALUOP_I_TYPE: begin
            case (func3)
                3'b000: operation = `ALU_ADDI;
                3'b010: operation = `ALU_SLTI;   // signed
                3'b011: operation = `ALU_SLTIU;  // 🔥 ADD THIS
                3'b100: operation = `ALU_XORI;
                3'b110: operation = `ALU_ORI;
                3'b111: operation = `ALU_ANDI;
                3'b001: operation = `ALU_SLLI;
                3'b101: begin
                    if (func7 == 7'b0000000)
                        operation = `ALU_SRLI;
                    else if (func7 == 7'b0100000)
                        operation = `ALU_SRAI;   // 🔥 ADD THIS
                end
                
                           
                  default: operation = `ALU_ADDI;
            endcase
        end
         
        `ALUOP_JAL: operation = `ALU_JAL; // new addition for JAL

        `ALUOP_JALR: operation = `ALU_JALR;// new addition for JALR

        `ALUOP_LUI: operation = `ALU_LUI;
      
        `ALUOP_AUIPC: operation = `ALU_AUIPC;// new addition for AUIPC
   
         default: operation = `ALU_ADD;

    endcase
end 

endmodule