`timescale 1ns / 1ps


module branch_decision(
    input branch_condn_ex,
    input jump_ex,
    input branch_ex,
    output pc_src,
    output flush
);

assign pc_src = ((branch_ex == 1'b1) && (branch_condn_ex == 1'b1)) 
                || (jump_ex == 1'b1) ? 1'b1 : 1'b0;

assign flush = pc_src;

endmodule