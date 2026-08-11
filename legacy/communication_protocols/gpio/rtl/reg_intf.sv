`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2026 23:27:06
// Design Name: 
// Module Name: reg_intf
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


interface REG_BUS #(
  /// The width of the address.
  parameter int ADDR_WIDTH = -1,
  /// The width of the data.
  parameter int DATA_WIDTH = -1
)(
  input logic clk_i
);

  logic [ADDR_WIDTH-1:0]   addr;
  logic                    write; // 0=read, 1=write
  logic [DATA_WIDTH-1:0]   rdata;
  logic [DATA_WIDTH-1:0]   wdata;
  logic [DATA_WIDTH/8-1:0] wstrb; // byte-wise strobe
  logic                    error; // 0=ok, 1=error
  logic                    valid;
  logic                    ready;

  modport in  (input  addr, write, wdata, wstrb, valid, output rdata, error, ready);
  modport out (output addr, write, wdata, wstrb, valid, input  rdata, error, ready);

endinterface