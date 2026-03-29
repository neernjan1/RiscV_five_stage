`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 12:26:55 PM
// Design Name: 
// Module Name: branch_decision
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


module branch_decision(
input branch_condn ,
input jump ,
input branch ,
output pc_src ,
output flush 
    );
    
   assign pc_src = (branch_condn & branch)| jump ;
   assign flush = pc_src ;
endmodule
