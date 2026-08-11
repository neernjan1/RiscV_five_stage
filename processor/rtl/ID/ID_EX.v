`timescale 1ns / 1ps

module ID_EX(

  
    // INPUTS (ID STAGE)
  
    input clk,
    input rst,
    input stall,
    // True freeze: an instruction already latched into this register's
    // OUTPUT must stay there unchanged (not even its control signals
    // rippling to a bubble) because downstream (EX_MEM) is itself frozen
    // by the same condition and hasn't accepted it yet. Driven by
    // stall_mem -- see the comment on the `stall` branch below for why
    // this has to be separate from a bubble-insert.
    input freeze,
    input flush,
     // Control signal to stall the pipeline by preventing the ID/EX register from updating

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
     input jalr_sel_id,     
   input alu_pc_sel_id ,
   input csr_read_out ,
   input [31:0] csr_rdata ,
   input csr_we_id ,
   input [11:0] csr_addr_id ,


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
     output reg jalr_sel_ex,    
   output reg alu_pc_sel_ex ,
   output reg csr_read_ex ,
   output reg [31:0] csr_rdata_ex ,
   output reg csr_we_ex ,
   output reg [11:0] csr_addr_ex

);

    always @(posedge clk) begin

      
        // RESET
      
        if (rst) begin
            pc_ex           <= 32'h80000000;
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
              jalr_sel_ex <= 0;     
             alu_pc_sel_ex <= 0;
             csr_read_ex <=0;
             csr_rdata_ex <= 0;
             csr_we_ex <= 0;
             csr_addr_ex <= 0;

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
            pc_ex           <= 32'h80000000; //see afterwards
            rs1_ex          <= 0;
            rs2_ex          <= 0;
            rd_ex           <= 0;
            read_data1_ex   <= 0;
            read_data2_ex   <= 0;
            imm_val_ex      <= 0;
            funct3_ex       <= 0;
            funct7_ex       <= 0;
                jalr_sel_ex <= 0;      
                alu_pc_sel_ex <= 0;
                csr_read_ex <=0;
             csr_rdata_ex <= 0;
             csr_we_ex <= 0;
             csr_addr_ex <= 0;
        end


        // FREEZE (genuine hold -- nothing in this register changes,
        // control signals included). Used when stall_mem is why we're
        // stalling: EX_MEM is frozen too and hasn't accepted whatever
        // this register is currently holding, so zeroing aluOp_ex etc.
        // here would corrupt that instruction's still-combinational
        // alu_result before it ever reaches EX_MEM -- the exact bug this
        // branch exists to avoid (see soc_integration_test.s Stage 4).
        else if (freeze) begin
            // Intentionally empty: every output keeps its current value.
        end

        // STALL (INSERT BUBBLE)
        //
        // Used for the load-use hazard (control_mux_sel_id): the
        // instruction currently in ID must NOT execute yet, and IF_ID
        // is held so it can be decoded fresh once the hazard clears --
        // so here we discard it going into EX and clear control signals
        // to a NOP rather than freezing (there's nothing valid already
        // in this register's output that a freeze would need to protect).
        else if (stall) begin
            regWrite_ex     <= 0;
            aluSrc_ex       <= 0;
            aluOp_ex        <= 0;
            branch_ex       <= 0;
            memWrite_ex     <= 0;
            memRead_ex      <= 0;
            memToReg_ex     <= 0;
            jump_ex         <= 0;
              jalr_sel_ex <= 0;
             alu_pc_sel_ex <= 0;
             csr_read_ex <=0;
             csr_we_ex <= 0;


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
                jalr_sel_ex <= jalr_sel_id; 
                 alu_pc_sel_ex <= alu_pc_sel_id;
                 csr_read_ex <=csr_read_out;
             csr_rdata_ex <= csr_rdata;
             csr_we_ex <= csr_we_id;
             csr_addr_ex <= csr_addr_id;

        end

    end

endmodule


