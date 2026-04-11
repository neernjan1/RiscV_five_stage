`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2026 21:19:02
// Design Name: 
// Module Name: apb_uart
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


`include "apb_typedef.svh"

/// A legacy APB wrapper of the OBI UART.
module apb_uart(
  input  wire         CLK,
  input  wire         RSTN,
  input  wire         PSEL,
  input  wire         PENABLE,
  input  wire         PWRITE,
  input  wire  [2:0]  PADDR,
  input  wire  [31:0] PWDATA,
  output logic [31:0] PRDATA,
  output logic        PREADY,
  output logic        PSLVERR,
  output logic        INT,
  output logic        OUT1N,
  output logic        OUT2N,
  output logic        RTSN,
  output logic        DTRN,
  input  wire         CTSN,
  input  wire         DSRN,
  input  wire         DCDN,
  input  wire         RIN,
  input  wire         SIN,
  output logic        SOUT
);

  `APB_TYPEDEF_ALL(apb, logic [4:0], logic [31:0], logic [3:0])
  apb_req_t  apb_req;
  apb_resp_t apb_rsp;

  assign apb_req = '{       //grouping the request signals from APB to UART
    paddr:   {PADDR, 2'b0},  //3 bits become 5 bits because UART registers are word aligned
    pprot:   '0, // confirm, protection signal
    psel:    PSEL,
    penable: PENABLE,
    pwrite:  PWRITE,
    pwdata:  PWDATA,
    pstrb:   '1     //all bits are valid
  };

  assign PREADY  = apb_rsp.pready;      //grouping the response signals from UART to APB
  assign PRDATA  = apb_rsp.prdata;
  assign PSLVERR = apb_rsp.pslverr;

  apb_uart_wrap #(
    .apb_req_t ( apb_req_t  ),
    .apb_rsp_t ( apb_resp_t )
  ) i_apb_uart_wrap (
    .clk_i     ( CLK     ),
    .rst_ni    ( RSTN    ),
    .apb_req_i ( apb_req ),
    .apb_rsp_o ( apb_rsp ),
    .intr_o    ( INT     ),
    .out1_no   ( OUT1N   ),
    .out2_no   ( OUT2N   ),
    .rts_no    ( RTSN    ),
    .dtr_no    ( DTRN    ),
    .cts_ni    ( CTSN    ),
    .dsr_ni    ( DSRN    ),
    .dcd_ni    ( DCDN    ),
    .rin_ni    ( RIN     ),
    .sin_i     ( SIN     ),
    .sout_o    ( SOUT    )
  );

endmodule
