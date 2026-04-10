`include "defines.vh"
`timescale 1ns / 1ps

module control(
input [6:0] opcode ,
output  reg regWrite , 
output reg aluSrc , 
output reg [2:0] aluOp ,
output reg branch , 
output reg memWrite ,
output reg memRead,
output reg memToReg,
output reg jump ,
output reg jalr_sel,    
output reg alu_pc_sel 

    );
    
    always @(*) begin
        regWrite = 0;
        aluSrc   = 0;
        aluOp    = 3'b000;
        branch   = 0;
        memWrite = 0;
        memRead  = 0;
        memToReg = 0;
        jump = 0;
        jalr_sel = 0;   
        alu_pc_sel = 0;
        
    case(opcode)
    
    `OPCODE_R_TYPE: 
    begin
         regWrite = 1 ;
         aluSrc = 0; // rs2 used
         aluOp = `ALUOP_R_TYPE;
         branch = 0; 
         memWrite = 0;
         memRead = 0;
         memToReg = 0;
         jump = 0;
          jalr_sel = 0;   
           alu_pc_sel = 0;
               
    end
    
     `OPCODE_I_TYPE: 
    begin
         regWrite = 1 ;
         aluSrc = 1; //imm used
         aluOp = `ALUOP_I_TYPE;
         branch = 0; 
         memWrite = 0;
         memRead = 0;
         memToReg = 0;
         jump = 0;
                jalr_sel = 0; 
           alu_pc_sel = 0;
               

    end
    
     `OPCODE_LOAD: 
    begin
         regWrite = 1 ;
         aluSrc = 1;
         aluOp = `ALUOP_LOAD_STORE;
         branch = 0; 
         memWrite = 0;
         memRead = 1;
         memToReg = 1;
         jump = 0;
                  jalr_sel = 0; 
           alu_pc_sel = 0;
            

    end
     
     `OPCODE_STORE: 
    begin
         regWrite = 0 ;
         aluSrc = 1;
         aluOp = `ALUOP_LOAD_STORE;
         branch = 0; 
         memWrite = 1;
         memRead = 0;
         memToReg = 0;
         jump = 0;
         jalr_sel = 0;     
         alu_pc_sel = 0;
               
    end
     `OPCODE_BRANCH: 
    begin
         regWrite = 0 ;
         aluSrc = 0;
         aluOp = `ALUOP_BRANCH;
         branch = 1; 
         memWrite = 0;
         memRead = 0;
         memToReg = 0;
         jump = 0;
         jalr_sel = 0; 
           alu_pc_sel = 0;
        

    end

  
     `OPCODE_JAL: 
    begin
         regWrite = 1 ;
         aluSrc = 0;
         aluOp = `ALUOP_JAL;
         branch = 0; 
         memWrite = 0;
         memRead = 0;
         memToReg = 0;
         jump = 1;
         jalr_sel = 0; 
         alu_pc_sel = 1;
             

    end

  
     `OPCODE_JALR: 
    begin
         regWrite = 1 ;
         aluSrc = 1;
         aluOp = `ALUOP_JALR;
         branch = 0; 
         memWrite = 0;
         memRead = 0;
         memToReg = 0;
         jump = 1;
         jalr_sel = 1; // NEW
         alu_pc_sel = 1;// NEW
                //  result_src = 2'b10;// 🔥 NEW

    end

   
     `OPCODE_LUI: 
    begin
         regWrite=1 ;
         aluSrc=1;
         aluOp=`ALUOP_LUI;
         branch=0; 
         memWrite=0;
         memRead=0;
         memToReg=0;
         jump = 0;
        jalr_sel = 0; 
         alu_pc_sel = 0;
              

    end

  
     `OPCODE_AUIPC: 
    begin
         regWrite = 1 ;
         aluSrc = 1;
         aluOp = `ALUOP_AUIPC;
         branch = 0; 
         memWrite = 0;
         memRead = 0;
         memToReg = 0;
         jump = 0;
         jalr_sel = 0; 
         alu_pc_sel = 1;
           

    end

    default : begin
    // set safe defaults FIRST
        regWrite = 0;
        aluSrc   = 0;
        aluOp    = 3'b000;
        branch   = 0;
        memWrite = 0;
        memRead  = 0;
        memToReg = 0;
        jump = 0;
        jalr_sel = 0; 
         alu_pc_sel = 0;
              

    end 

    endcase
    end 
endmodule
