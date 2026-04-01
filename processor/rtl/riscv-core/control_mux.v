`timescale 1ns / 1ps

module control_mux(
input control_mux_sel ,

input regWrite , 
input aluSrc , 
input [2:0] aluOp ,
input branch , 
input memWrite ,
input memRead,
input memToReg,
input jump ,

output reg regWrite_mux_out , 
output reg aluSrc_mux_out , 
output reg [2:0] aluOp_mux_out ,
output reg branch_mux_out , 
output reg memWrite_mux_out ,
output reg memRead_mux_out,
output reg memToReg_mux_out ,
output reg jump_mux_out 
);

always @(*) begin
    if (control_mux_sel) begin
        // Insert bubble (NOP)
        regWrite_mux_out = 0;
        aluSrc_mux_out   = 0;
        aluOp_mux_out    = 0;
        branch_mux_out   = 0;
        memWrite_mux_out = 0;
        memRead_mux_out  = 0;
        memToReg_mux_out = 0;
        jump_mux_out = 0;
        
    end
    else begin
        // Normal operation
        regWrite_mux_out = regWrite;
        aluSrc_mux_out   = aluSrc;
        aluOp_mux_out    = aluOp;
        branch_mux_out   = branch;
        memWrite_mux_out = memWrite;
        memRead_mux_out  = memRead;
        memToReg_mux_out = memToReg;
        jump_mux_out = jump ;
    end
end

endmodule