`timescale 1ns / 1ps

module ID_EX(

  
    // INPUTS (ID STAGE)
  
    input clk,
    input rst,
    input stall, 
    input flush,
    input id_ex_write, // Control signal to stall the pipeline by preventing the ID/EX register from updating

    input [31:0] pc_id ,

    input [4:0] rs1_id ,
    input [4:0] rs2_id ,
    input [4:0] rd_id ,

    input [31:0] read_data1_id , 
    input [31:0] read_data2_id ,
    input [31:0] imm_val_id  ,

    input [2:0] funct3_id,
    input [6:0] funct7_id,

    // Control signals
    input regWrite_id , 
    input aluSrc_id , 
    input [2:0] aluOp_id ,
    input branch_id , 
    input memWrite_id ,
    input memRead_id,
    input memToReg_id ,
    input jump_id,
     input jalr_sel_id, // NEW      
   input alu_pc_sel_id ,//

  
    // OUTPUTS (EX STAGE)
  
    output reg [31:0] pc_ex ,

    output reg [4:0] rs1_ex ,
    output reg [4:0] rs2_ex ,
    output reg [4:0] rd_ex ,

    output reg [31:0] read_data1_ex , 
    output reg [31:0] read_data2_ex ,
    output reg [31:0] imm_val_ex  ,

    output reg [2:0] funct3_ex,
    output reg [6:0] funct7_ex,

    // Control signals
    output reg regWrite_ex , 
    output reg aluSrc_ex , 
    output reg [2:0] aluOp_ex ,
    output reg branch_ex , 
    output reg memWrite_ex ,
    output reg memRead_ex,
    output reg memToReg_ex ,
    output reg jump_ex ,
     output reg jalr_sel_ex, // NEW      
   output reg alu_pc_sel_ex ,//

  //  input  [31:0] pc_plus_4_id, // 🔥 NEW
   // output reg [31:0] pc_plus_4_ex,// 🔥 NEW
    // 🔥 ADD
  //  input [1:0] result_src_id,// 🔥 NEW
   // output reg [1:0] result_src_ex// 🔥 NEW
);

    always @(posedge clk) begin

      
        // RESET
      
        if (rst) begin
            pc_ex           <= 0;
            rs1_ex          <= 0;
            rs2_ex          <= 0;
            rd_ex           <= 0;
            read_data1_ex   <= 0;
            read_data2_ex   <= 0;
            imm_val_ex      <= 0;
            funct3_ex       <= 0;
            funct7_ex       <= 0;

            regWrite_ex     <= 0;
            aluSrc_ex       <= 0;
            aluOp_ex        <= 0;
            branch_ex       <= 0;
            memWrite_ex     <= 0;
            memRead_ex      <= 0;
            memToReg_ex     <= 0;
            jump_ex         <= 0;
              jalr_sel_ex <= 0; // NEW      
             alu_pc_sel_ex <= 0;// NEW
        //  pc_plus_4_ex    <= 0;// 🔥 NEW
          //  result_src_ex   <= 0 ;// 🔥 NEW
        end

      
        // FLUSH (INSERT NOP)
      
        else if (flush) begin
            // Control signals cleared → NOP
            regWrite_ex     <= 0;
            aluSrc_ex       <= 0;
            aluOp_ex        <= 0;
            branch_ex       <= 0;
            memWrite_ex     <= 0;
            memRead_ex      <= 0;
            memToReg_ex     <= 0;
            jump_ex         <= 0;

            // Data (optional clear)
            pc_ex           <= 0;
            rs1_ex          <= 0;
            rs2_ex          <= 0;
            rd_ex           <= 0;
            read_data1_ex   <= 0;
            read_data2_ex   <= 0;
            imm_val_ex      <= 0;
            funct3_ex       <= 0;
            funct7_ex       <= 0;
                jalr_sel_ex <= 0; // NEW      
                alu_pc_sel_ex <= 0;// NEW
         // pc_plus_4_ex    <= 0;// 🔥 NEW
          //  result_src_ex   <= 0 ;// 🔥 NEW
        end

      
        // STALL (HOLD VALUE)
      
        else if (stall) begin
            // Do nothing → retain previous values
             // Control signals cleared → NOP //added by me to prevent unintended writes during stall
            regWrite_ex     <= 0;
            aluSrc_ex       <= 0;
            aluOp_ex        <= 0;
            branch_ex       <= 0;
            memWrite_ex     <= 0;
            memRead_ex      <= 0;
            memToReg_ex     <= 0;
            jump_ex         <= 0;
              jalr_sel_ex <= 0; // NEW      
             alu_pc_sel_ex <= 0;// NEW
         // pc_plus_4_ex    <= 0;// 🔥 NEW
          //  result_src_ex   <= 0 ;// 🔥 NEW
        end

      
        // NORMAL PIPELINE FLOW
      
        else begin
            pc_ex           <= pc_id;

            rs1_ex          <= rs1_id;
            rs2_ex          <= rs2_id;
            rd_ex           <= rd_id;

            read_data1_ex   <= read_data1_id;
            read_data2_ex   <= read_data2_id;
            imm_val_ex      <= imm_val_id;

            funct3_ex       <= funct3_id;
            funct7_ex       <= funct7_id;

            regWrite_ex     <= regWrite_id;
            aluSrc_ex       <= aluSrc_id;
            aluOp_ex        <= aluOp_id;
            branch_ex       <= branch_id;
            memWrite_ex     <= memWrite_id;
            memRead_ex      <= memRead_id;
            memToReg_ex     <= memToReg_id;
            jump_ex         <= jump_id;
                jalr_sel_ex <= jalr_sel_id; // NEW      
                 alu_pc_sel_ex <= alu_pc_sel_id;// NEW
           //pc_plus_4_ex    <= pc_plus_4_id ; // 🔥 NEW
           // result_src_ex   <= result_src_id ;// 🔥 NEW
        end

    end

endmodule
