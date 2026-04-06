module control_mux( // full change due to jal , jalr additon

    input control_mux_sel,

    // INPUT CONTROL SIGNALS
    input regWrite,
    input aluSrc,
    input [2:0] aluOp,
    input branch,
    input memWrite,
    input memRead,
    input memToReg,
    input jump,
   // input [1:0] result_src,   // 🔥 NEW

   input jalr_sel, // NEW      
   input alu_pc_sel ,// NEW
                //  result_src = 2'b00;// 🔥 NEW

    // OUTPUT CONTROL SIGNALS
    output reg regWrite_mux_out,
    output reg aluSrc_mux_out,
    output reg [2:0] aluOp_mux_out,
    output reg branch_mux_out,
    output reg memWrite_mux_out,
    output reg memRead_mux_out,
    output reg memToReg_mux_out,
    output reg jump_mux_out,
     output reg jalr_sel_out, // NEW      
   output reg alu_pc_sel_out // NEW
                  //  output reg [1:0] result_src_mux_out   // 🔥 NEW
   
);
always @(*) begin

    if (control_mux_sel) begin
        // 🔥 STALL → INSERT NOP
        regWrite_mux_out = 0;
        aluSrc_mux_out   = 0;
        aluOp_mux_out    = 3'b000;
        branch_mux_out   = 0;
        memWrite_mux_out = 0;
        memRead_mux_out  = 0;
        memToReg_mux_out = 0;
        jump_mux_out     = 0;
        jalr_sel_out = 0; // NEW      
        alu_pc_sel_out = 0;// NEW
       // result_src_mux_out = 2'b00;   // 🔥 IMPORTANT
    end
    else begin
        // NORMAL FLOW
        regWrite_mux_out = regWrite;
        aluSrc_mux_out   = aluSrc;
        aluOp_mux_out    = aluOp;
        branch_mux_out   = branch;
        memWrite_mux_out = memWrite;
        memRead_mux_out  = memRead;
        memToReg_mux_out = memToReg;
        jump_mux_out     = jump;
        jalr_sel_out = jalr_sel; // NEW      
        alu_pc_sel_out = alu_pc_sel;// NEW
      //  result_src_mux_out = result_src;   // 🔥 IMPORTANT
    end

end

endmodule
