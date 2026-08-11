`include "common_cells_registers.vh"

package clint_reg_pkg;

  // Param list
  parameter int NumCores = 1;

  // Address widths within the block
  parameter int BlockAw = 16;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    struct packed {
      logic        q;
    } p;
  } clint_reg2hw_msip_mreg_t;

  typedef struct packed {
    logic [31:0] q;
  } clint_reg2hw_mtimecmp_low0_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } clint_reg2hw_mtimecmp_high0_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } clint_reg2hw_mtimecmp_low1_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } clint_reg2hw_mtimecmp_high1_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } clint_reg2hw_mtime_low_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } clint_reg2hw_mtime_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } clint_hw2reg_mtime_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } clint_hw2reg_mtime_high_reg_t;

  // Register -> HW type
  typedef struct packed {
    clint_reg2hw_msip_mreg_t [1:0] msip; // [193:192]
    clint_reg2hw_mtimecmp_low0_reg_t mtimecmp_low0; // [191:160]
    clint_reg2hw_mtimecmp_high0_reg_t mtimecmp_high0; // [159:128]
    clint_reg2hw_mtimecmp_low1_reg_t mtimecmp_low1; // [127:96]
    clint_reg2hw_mtimecmp_high1_reg_t mtimecmp_high1; // [95:64]
    clint_reg2hw_mtime_low_reg_t mtime_low; // [63:32]
    clint_reg2hw_mtime_high_reg_t mtime_high; // [31:0]
  } clint_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    clint_hw2reg_mtime_low_reg_t mtime_low; // [65:33]
    clint_hw2reg_mtime_high_reg_t mtime_high; // [32:0]
  } clint_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] CLINT_MSIP_0_OFFSET = 16'h 20;
  parameter logic [BlockAw-1:0] CLINT_MSIP_1_OFFSET = 16'h 4;
  parameter logic [BlockAw-1:0] CLINT_MTIMECMP_LOW0_OFFSET = 16'h 8;
  parameter logic [BlockAw-1:0] CLINT_MTIMECMP_HIGH0_OFFSET = 16'h C;
  parameter logic [BlockAw-1:0] CLINT_MTIMECMP_LOW1_OFFSET = 16'h 10;
  parameter logic [BlockAw-1:0] CLINT_MTIMECMP_HIGH1_OFFSET = 16'h 14;
  parameter logic [BlockAw-1:0] CLINT_MTIME_LOW_OFFSET = 16'h 18;
  parameter logic [BlockAw-1:0] CLINT_MTIME_HIGH_OFFSET = 16'h 1c;

  // Register index
  typedef enum int {
    CLINT_MSIP_0,
    CLINT_MSIP_1,
    CLINT_MTIMECMP_LOW0,
    CLINT_MTIMECMP_HIGH0,
    CLINT_MTIMECMP_LOW1,
    CLINT_MTIMECMP_HIGH1,
    CLINT_MTIME_LOW,
    CLINT_MTIME_HIGH
  } clint_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] CLINT_PERMIT [8] = '{
    4'b 1111, // index[0] CLINT_MSIP_0
    4'b 1111, // index[1] CLINT_MSIP_1
    4'b 1111, // index[2] CLINT_MTIMECMP_LOW0
    4'b 1111, // index[3] CLINT_MTIMECMP_HIGH0
    4'b 1111, // index[4] CLINT_MTIMECMP_LOW1
    4'b 1111, // index[5] CLINT_MTIMECMP_HIGH1
    4'b 1111, // index[6] CLINT_MTIME_LOW
    4'b 1111  // index[7] CLINT_MTIME_HIGH
  };

endpackage

module clint import clint_reg_pkg::*; #(
    parameter type reg_req_t = logic,
    parameter type reg_rsp_t = logic
) (
    input  logic                clk_i,       // Clock
    input  logic                rst_ni,      // Asynchronous reset active low
    input  logic                testmode_i,
    input  reg_req_t            reg_req_i,
    output reg_rsp_t            reg_rsp_o,
    input  logic                rtc_i,       // Real-time clock in (usually 32.768 kHz)
    output logic [1:0] timer_irq_o, // Timer interrupts
    output logic [1:0] ipi_o        // software interrupt (a.k.a inter-process-interrupt)
);

    logic [63:0]               mtime_q;
    logic [1:0][63:0] mtimecmp_q;
    // increase the timer
    logic increase_timer;

    clint_reg_pkg::clint_reg2hw_t reg2hw;
    clint_reg_pkg::clint_hw2reg_t hw2reg;

    clint_reg_top #(
      .reg_req_t (reg_req_t),
      .reg_rsp_t (reg_rsp_t)
    ) i_clint_reg_top (
      .clk_i,
      .rst_ni,
      .reg_req_i,
      .reg_rsp_o,
      .reg2hw (reg2hw), // Write
      .hw2reg (hw2reg), // Read
      .devmode_i (1'b0)
    );

    assign mtime_q = {reg2hw.mtime_high.q, reg2hw.mtime_low.q};
    assign mtimecmp_q[0] = {reg2hw.mtimecmp_high0.q, reg2hw.mtimecmp_low0.q};
    assign ipi_o[0] = reg2hw.msip[0].p.q;
    assign mtimecmp_q[1] = {reg2hw.mtimecmp_high1.q, reg2hw.mtimecmp_low1.q};
    assign ipi_o[1] = reg2hw.msip[1].p.q;

    assign {hw2reg.mtime_high.d, hw2reg.mtime_low.d} = mtime_q + 1;
    assign hw2reg.mtime_low.de = increase_timer;
    assign hw2reg.mtime_high.de = increase_timer;

    // -----------------------------
    // IRQ Generation
    // -----------------------------
    // The mtime register has a 64-bit precision on all RV32, RV64, and RV128 systems. Platforms provide a 64-bit
    // memory-mapped machine-mode timer compare register (mtimecmp), which causes a timer interrupt to be posted when the
    // mtime register contains a value greater than or equal (mtime >= mtimecmp) to the value in the mtimecmp register.
    // The interrupt remains posted until it is cleared by writing the mtimecmp register. The interrupt will only be taken
    // if interrupts are enabled and the MTIE bit is set in the mie register.
    always_comb begin : irq_gen
        // check that the mtime cmp register is set to a meaningful value
        for (int unsigned i = 0; i < 2; i++) begin
            if (mtime_q >= mtimecmp_q[i]) begin
                timer_irq_o[i] = 1'b1;
            end else begin
                timer_irq_o[i] = 1'b0;
            end
        end
    end

    // -----------------------------
    // RTC time tracking facilities
    // -----------------------------
    // 1. Put the RTC input through a classic two stage edge-triggered synchronizer to filter out any
    //    metastability effects (or at least make them unlikely :-))
    clint_sync_wedge i_sync_edge (
        .clk_i,
        .rst_ni,
        .serial_i  ( rtc_i          ),
        .r_edge_o  ( increase_timer ),
        .f_edge_o  (                ), // left open
        .serial_o  (                )  // left open
    );


endmodule

// TODO(zarubaf): Replace by common-cells 2.0
module clint_sync_wedge #(
    parameter int unsigned STAGES = 2
) (
    input  logic clk_i,
    input  logic rst_ni,
    input  logic serial_i,
    output logic r_edge_o,
    output logic f_edge_o,
    output logic serial_o
);
    logic serial, serial_q;

    assign serial_o =  serial_q;
    assign f_edge_o = (~serial) & serial_q;
    assign r_edge_o =  serial & (~serial_q);

    clint_sync #(
        .STAGES (STAGES)
    ) i_sync (
        .clk_i,
        .rst_ni,
        .serial_i,
        .serial_o (serial)
    );

    `CLINT_FF(serial_q, serial, 1'b0)
endmodule

module clint_sync #(
    parameter int unsigned STAGES = 2
) (
    input  logic clk_i,
    input  logic rst_ni,
    input  logic serial_i,
    output logic serial_o
);

  logic [STAGES-1:0] reg_q;
  `CLINT_FF(reg_q, {reg_q[STAGES-2:0], serial_i}, 'h0)
  assign serial_o = reg_q[STAGES-1];

endmodule