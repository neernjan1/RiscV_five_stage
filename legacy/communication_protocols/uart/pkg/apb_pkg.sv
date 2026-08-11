`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2026 01:03:52
// Design Name: 
// Module Name: apb_pkg
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


package apb_pkg;

  typedef logic [2:0]  prot_t;

  localparam RESP_OKAY   = 1'b0;
  localparam RESP_SLVERR = 1'b1;

endpackage
