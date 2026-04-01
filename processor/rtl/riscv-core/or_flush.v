`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 04:53:15 PM
// Design Name: 
// Module Name: or_flush
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module or_flush(
input flush_hazard ,
input flush_branch,
output flush_out
    );
    assign flush_out = flush_hazard | flush_branch ;
endmodule
