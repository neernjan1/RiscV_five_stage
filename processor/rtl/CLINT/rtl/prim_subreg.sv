package clint_prim_subreg_pkg;

  // Register access specifier
  typedef enum logic [2:0] {
    SwAccessRW  = 3'd0, // Read-write
    SwAccessRO  = 3'd1, // Read-only
    SwAccessWO  = 3'd2, // Write-only
    SwAccessW1C = 3'd3, // Write 1 to clear
    SwAccessW1S = 3'd4, // Write 1 to set
    SwAccessW0C = 3'd5, // Write 0 to clear
    SwAccessRC  = 3'd6  // Read to clear. Do not use, only exists for compatibility.
  } sw_access_e;
endpackage

`include "prim_subreg_arb.sv"

module clint_prim_subreg
  import clint_prim_subreg_pkg::*;
#(
  parameter int         DW       = 32,
  parameter string      SWACCESS = "RW",
  parameter sw_access_e SwAccess = (SWACCESS == "RO")  ? SwAccessRO  :
                                   (SWACCESS == "WO")  ? SwAccessWO  :
                                   (SWACCESS == "W1C") ? SwAccessW1C :
                                   (SWACCESS == "W1S") ? SwAccessW1S :
                                   (SWACCESS == "W0C") ? SwAccessW0C :
                                   (SWACCESS == "RC")  ? SwAccessRC  : SwAccessRW,
  parameter logic [DW-1:0] RESVAL  = '0 ,   // reset value
  parameter bit            Mubi    = 1'b0
) (
  input clk_i,
  input rst_ni,

  // From SW: valid for RW, WO, W1C, W1S, W0C, RC
  // In case of RC, Top connects Read Pulse to we
  input          we,
  input [DW-1:0] wd,

  // From HW: valid for HRW, HWO
  input          de,
  input [DW-1:0] d,

  // output to HW and Reg Read
  output logic          qe,
  output logic [DW-1:0] q,

  // ds and qs have slightly different timing.
  // ds is the data that will be written into the flop,
  // while qs is the current flop value exposed to software.
  output logic [DW-1:0] ds,
  output logic [DW-1:0] qs
);

  logic          wr_en;
  logic [DW-1:0] wr_data;

  clint_prim_subreg_arb #(
    .DW       ( DW       ),
    .SwAccess ( SwAccess ),
    .Mubi     ( Mubi     )
  ) wr_en_data_arb (
    .we,
    .wd,
    .de,
    .d,
    .q,
    .wr_en,
    .wr_data
  );

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      q <= RESVAL;
    end else if (wr_en) begin
      q <= wr_data;
    end
  end

  // feed back out for consolidation
  assign ds = wr_en ? wr_data : qs;
  assign qe = we;

  if (SwAccess == SwAccessRC) begin : gen_rc
    // In case of a SW RC colliding with a HW write, SW gets the value written by HW
    // but the register is cleared to 0. See #5416 for a discussion.
    assign qs = de && we ? d : q;
  end else begin : gen_no_rc
    assign qs = q;
  end

endmodule