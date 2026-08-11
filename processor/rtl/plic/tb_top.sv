`timescale 1ns/1ps

// =============================================================
//  tb_top.sv
//
//  Integration test for the three-module interrupt path:
//      plic_top  --meip-->  trap_controller  --enter/return-->  csr_file
//
//  Optimized for Verilator 5.037 / 5.046 timing models.
// =============================================================

module tb_top;

import reg_pkg::*;

parameter N_SOURCE = 30;
parameter N_TARGET = 2;

logic clk;
logic rst_ni;
logic rst_n;

assign rst_n = rst_ni;

reg_req_t req;
reg_rsp_t rsp;

logic [N_SOURCE-1:0] irq_sources;
logic [N_SOURCE-1:0] le;
logic [N_TARGET-1:0] eip;

//////////////////////////////////////////////////////
// Stand-ins for signals the real pipeline will drive
//////////////////////////////////////////////////////

logic [31:0] current_pc;      // simulated fetch/decode PC
logic        mret_execute;    // simulated decode MRET detect

logic        csr_we;
logic [11:0] csr_addr;
logic [31:0] csr_wdata;
logic [31:0] csr_rdata;

//////////////////////////////////////////////////////
// Inter-module wires
//////////////////////////////////////////////////////

logic        global_ie;
logic        external_ie;
logic [31:0] mtvec_w;
logic [31:0] mepc_w;

logic        trap_taken;
logic [31:0] trap_pc_w;      // redirect target from trap_controller
logic        trap_enter;
logic        trap_return;

localparam logic [31:0] MEXT_CAUSE = 32'h8000000B;

//////////////////////////////////////////////////////
// DUTs
//////////////////////////////////////////////////////

plic_top #(
    .N_SOURCE(N_SOURCE),
    .N_TARGET(N_TARGET),
    .MAX_PRIO(7),
    .reg_req_t(reg_req_t),
    .reg_rsp_t(reg_rsp_t)
) u_plic (
    .clk_i(clk),
    .rst_ni(rst_ni),

    .req_i(req),
    .resp_o(rsp),

    .le_i(le),
    .irq_sources_i(irq_sources),

    .eip_targets_o(eip)
);

trap_controller u_trap_ctrl (
    .meip         (eip[0]),
    .mstatus_mie  (global_ie),
    .mie_meie     (external_ie),
    .current_pc   (current_pc),
    .mtvec        (mtvec_w),
    .mepc         (mepc_w),
    .mret_execute (mret_execute),

    .trap_taken   (trap_taken),
    .trap_pc      (trap_pc_w),
    .trap_enter   (trap_enter),
    .trap_return  (trap_return)
);

csr_file u_csr (
    .clk            (clk),
    .rst_n          (rst_n),

    .csr_we         (csr_we),
    .csr_addr       (csr_addr),
    .csr_wdata      (csr_wdata),
    .csr_rdata      (csr_rdata),

    .trap_enter     (trap_enter),
    .trap_return    (trap_return),

    .interrupted_pc (current_pc),
    .trap_cause     (MEXT_CAUSE),

    .meip           (eip[0]),

    .global_ie      (global_ie),
    .external_ie    (external_ie),
    .mtvec          (mtvec_w),
    .mepc           (mepc_w)
);

//////////////////////////////////////////////////////
// Clock
//////////////////////////////////////////////////////

initial clk = 0;
always #5 clk = ~clk;

//////////////////////////////////////////////////////
// Logging
//////////////////////////////////////////////////////

integer log_fd;
int pass_count = 0;
int fail_count = 0;

initial begin
    log_fd = $fopen("tb_top.log", "w");
    $dumpfile("waves.vcd");
    $dumpvars(0, tb_top);
end

final begin
    $display("\n==== SUMMARY: %0d passed, %0d failed ====", pass_count, fail_count);
    $fdisplay(log_fd, "\n==== SUMMARY: %0d passed, %0d failed ====", pass_count, fail_count);
    $fclose(log_fd);
end

task check(input string label, input logic [31:0] actual, input logic [31:0] expected);
begin
    if (actual === expected) begin
        pass_count++;
        $display("[%0t] PASS: %s (=%0h)", $time, label, actual);
        $fdisplay(log_fd, "[%0t] PASS: %s (=%0h)", $time, label, actual);
    end else begin
        fail_count++;
        $display("[%0t] FAIL: %s -- got %0h, expected %0h", $time, label, actual, expected);
        $fdisplay(log_fd, "[%0t] FAIL: %s -- got %0h, expected %0h", $time, label, actual, expected);
    end
end
endtask

//////////////////////////////////////////////////////
// APB tasks (PLIC side)
//////////////////////////////////////////////////////

logic [31:0] last_rdata;

task apb_write(input [31:0] addr, input [31:0] data);
begin
    @(posedge clk);
    req.valid = 1;
    req.write = 1;
    req.addr  = addr;
    req.wdata = data;
    @(posedge clk);
    #1;
    req.valid = 0;
    req.write = 0;

    $display("[%0t] PLIC WRITE Addr=%08h Data=%08h", $time, addr, data);
    $fdisplay(log_fd, "[%0t] PLIC WRITE Addr=%08h Data=%08h", $time, addr, data);
end
endtask

task apb_read(input [31:0] addr);
begin
    @(posedge clk);
    req.valid = 1;
    req.write = 0;
    req.addr  = addr;
    
    // Wait for response/ack cycle from PLIC
    @(posedge clk);
    #1;
    last_rdata = rsp.rdata;                // Sample bus output

    $display("[%0t] PLIC READ Addr=%08h Data=%08h", $time, addr, rsp.rdata);
    $fdisplay(log_fd, "[%0t] PLIC READ Addr=%08h Data=%08h", $time, addr, rsp.rdata);
    
    req.valid = 0;
end
endtask
//////////////////////////////////////////////////////
// CSR tasks
//////////////////////////////////////////////////////

task csr_write(input [11:0] addr, input [31:0] data);
begin
    @(posedge clk);
    csr_we    = 1;
    csr_addr  = addr;
    csr_wdata = data;
    @(posedge clk);
    #1;
    csr_we    = 0;

    $display("[%0t] CSR WRITE Addr=%03h Data=%08h", $time, addr, data);
    $fdisplay(log_fd, "[%0t] CSR WRITE Addr=%03h Data=%08h", $time, addr, data);
end
endtask

// //////////////////////////////////////////////////////
// // Test Execution
// //////////////////////////////////////////////////////

// initial begin

// //     req          = '0;
// //     irq_sources  = '0;
// //     le           = '0;
// //     current_pc   = 32'h0000_1000;
// //     mret_execute = 0;
// //     csr_we       = 0;
// //     csr_addr     = '0;
// //     csr_wdata    = '0;

// //     rst_ni = 0;
// //     repeat(5) @(posedge clk);
// //     #1;
// //     rst_ni = 1;

// //     $display("\n==============================");
// //     $display(" RESET RELEASED ");
// //     $display("==============================");

// //     // Boot setup
// //     csr_write(12'h305, 32'h0000_0230);   // mtvec
// //     csr_write(12'h304, 32'h0000_0800);   // mie.MEIE
// //     csr_write(12'h300, 32'h0000_0008);   // mstatus.MIE

// //     check("mtvec programmed",       mtvec_w,     32'h0000_0230);
// //     check("global_ie enabled",      global_ie,   1'b1);
// //     check("external_ie enabled",    external_ie, 1'b1);

// //    // Program PLIC source 2
// //     apb_write(32'h0C000008, 32'h3);        // priority for Source 2
// //     apb_write(32'h0C200000, 32'h0);        // threshold = 0
// //     apb_write(32'h0C002000, 32'h4);        // enable source 2 (bit 2 = 1)
    
// //     // Fix: Match zero-indexed array to Source 2 ID (Source ID = index + 1)
// //     le[1] = 1'b1;                          // Source 2 edge-triggered

// //     //--------------------------------------------
// //     // Step 1: Fire Interrupt (Keep IRQ high until claimed)
// //     //--------------------------------------------

// //     @(posedge clk);
// //     irq_sources[1] <= 1'b1;                // Correctly drives Source 2
   
// //     // Advance 1 clock cycle to evaluate EIP & trap pulse
// //     @(posedge clk);
// //     #1; 
    
// //     check("PLIC target IRQ asserted", eip[0],     1'b1);
// //     check("trap_taken asserted",      trap_taken, 1'b1);
// //     check("trap_enter asserted",      trap_enter, 1'b1);
// //     check("redirect target = mtvec",   trap_pc_w,  32'h0000_0100);

// //     // Advance to next cycle where MIE clears and MEPC updates
// //     @(posedge clk);
// //     #1;
// //     check("mepc captured current_pc",     mepc_w,    32'h0000_1000);
// //     check("mstatus.MIE cleared on entry", global_ie, 1'b0);

// //     //--------------------------------------------
// //     // Step 2: ISR Execution (Claim -> Lower IRQ -> Complete)
// //     //--------------------------------------------

// //     current_pc = mtvec_w;   // core jumps to ISR

// //     // Read claim register while interrupt is active
// //     apb_read(32'h0C200004);
// //     check("claimed source ID", last_rdata, 32'd2);

// //     // De-assert external IRQ line now that claim has completed
// //     irq_sources[1] <= 1'b0;

// //     repeat(2) @(posedge clk);
// //     apb_write(32'h0C200004, 32'h2);   // complete source 2
    
// //     repeat(5) @(posedge clk);
// //     #1;
// //     check("PLIC target IRQ cleared", eip[0], 1'b0);

// //     //--------------------------------------------
// //     // Step 3: MRET Return Execution
// //     //--------------------------------------------

// //     @(posedge clk);
// //     mret_execute <= 1'b1;

// //     // Evaluate trap_return output on active cycle
// //     #1;
// //     check("trap_return asserted on mret", trap_return, 1'b1);
// //     check("redirect target = mepc",       trap_pc_w,   32'h0000_1000);

// //     @(posedge clk);
// //     mret_execute <= 1'b0;

// //     // Check MIE restoration cycle
// //     #1;
// //     check("mstatus.MIE restored after mret", global_ie, 1'b1);

// //     repeat(10) @(posedge clk);
// //     $finish;

// // end

// // //////////////////////////////////////////////////////
// // // Monitor
// // //////////////////////////////////////////////////////

// // logic prev_trap_enter, prev_trap_return;
// // logic [1:0] prev_eip;

// // initial begin
// //     prev_trap_enter  = 0;
// //     prev_trap_return = 0;
// //     prev_eip         = '0;
// // end

// // always @(posedge clk) begin
// //     if (trap_enter !== prev_trap_enter ||
// //         trap_return !== prev_trap_return ||
// //         eip !== prev_eip) begin

// //         $display("[%0t] EIP=%b TRAP_ENTER=%b TRAP_RETURN=%b TRAP_PC=%08h MEPC=%08h MIE=%b",
// //                   $time, eip, trap_enter, trap_return, trap_pc_w, mepc_w, global_ie);
// //         $fdisplay(log_fd, "[%0t] EIP=%b TRAP_ENTER=%b TRAP_RETURN=%b TRAP_PC=%08h MEPC=%08h MIE=%b",
// //                   $time, eip, trap_enter, trap_return, trap_pc_w, mepc_w, global_ie);

// //         prev_trap_enter  = trap_enter;
// //         prev_trap_return = trap_return;
// //         prev_eip         = eip;
// //     end
// end


// //=============================================================
// //=============================================================
// //CSR VERIFICATION
// //==============================================================
// //==============================================================

// initial begin
// // //-----------------------------------------------------
// // // TEST 1 : RESET VALUES
// // //-----------------------------------------------------
//     rst_ni = 0;
    

// // $display("\n====================================");
// // $display("TEST 1 : RESET VALUES");
// // $display("====================================");

// // check("mstatus reset", u_csr.mstatus_q, 32'h00000000);
// // check("mie reset",     u_csr.mie_q,     32'h00000000);
// // check("mtvec reset",   u_csr.mtvec_q,   32'h00000000);
// // check("mepc reset",    u_csr.mepc_q,    32'h00000000);
// // check("mcause reset",  u_csr.mcause_q,  32'h00000000);

// // check("global_ie reset",   global_ie,   0);
// // check("external_ie reset", external_ie, 0);
// repeat(2) @(posedge clk);
//     #1;
//     rst_ni = 1;

// // //-----------------------------------------------------
// // // TEST 2 : MTVEC WRITE
// // //-----------------------------------------------------

// // $display("\n====================================");
// // $display("TEST 2 : MTVEC");
// // $display("====================================");

// // csr_write(12'h305,32'h00000123);

// // check("mtvec aligned",mtvec_w,32'h00000120);

// // //-----------------------------------------------------
// // // TEST 3 : MSTATUS WRITE
// // //-----------------------------------------------------

// // $display("\n====================================");
// // $display("TEST 3 : MSTATUS");
// // $display("====================================");

// // csr_write(12'h300,32'h00000088);

// // check("MIE bit",u_csr.mstatus_q[3],1'b1);
// // check("MPIE bit",u_csr.mstatus_q[7],1'b1);

// // //-----------------------------------------------------
// // // TEST 4 : MIE WRITE
// // //-----------------------------------------------------

// // $display("\n====================================");
// // $display("TEST 4 : MIE");
// // $display("====================================");

// // csr_write(12'h304,32'h00000800);

// // check("MEIE",external_ie,1'b1);

// // //-----------------------------------------------------
// // // TEST 5 : RESERVED BITS
// // //-----------------------------------------------------

// // $display("\n====================================");
// // $display("TEST 5 : RESERVED BITS");
// // $display("====================================");

// // csr_write(12'h300,32'hFFFFFFFF);

// // check("MIE",u_csr.mstatus_q[3],1'b1);
// // check("MPIE",u_csr.mstatus_q[7],1'b1);

// // check("Reserved bits ignored",
// //       u_csr.mstatus_q,
// //       32'h00000088);

// //       eip[0]=1;

// // //-----------------------------------------------------
// // // TEST 6 : MIP
// // //-----------------------------------------------------

// // $display("\n====================================");
// // $display("TEST 6 : MIP");
// // $display("====================================");

// // force eip[0]=1;

// // #2;

// // check("MEIP bit",
// //       u_csr.mip_q[11],
// //       1'b1);

// // release eip[0];


// // //-----------------------------------------------------
// // // TEST 7 : CSR READ
// // //-----------------------------------------------------

// // $display("\n====================================");
// // $display("TEST 7 : CSR READ");
// // $display("====================================");

// // csr_addr=12'h305;
// // #1;
// // check("Read MTVEC",
// //       csr_rdata,
// //       mtvec_w);

// // csr_addr=12'h304;
// // #1;
// // check("Read MIE",
// //       csr_rdata,
// //       u_csr.mie_q);

// // csr_addr=12'h300;
// // #1;
// // check("Read MSTATUS",
// //       csr_rdata,
// //       u_csr.mstatus_q);


// // //===================================
// // //Test - 8 
// // //===================================
// // $display("\n====================================");
// // $display("TEST 8 : Trap enter");
// // $display("====================================");

// // trap_enter=1;
// // @(posedge clk);
// // #1;

// // check("MEPC",
// //       mepc_w,
// //       current_pc);

// // check("MCAUSE",
// //       u_csr.mcause_q,
// //       MEXT_CAUSE);

// // check("MIE cleared",
// //       global_ie,
// //       0);

// // check("MPIE saved",
// //       u_csr.mstatus_q[7],
// //       1);


// // //==================================
// // //Test 9
// // //==================================
// // $display("\n====================================");
// // $display("TEST 9 : return");
// // $display("====================================");
// // mret_execute=1;
// // @(posedge clk);
// // #1;

// // check("MIE restored",
// //       global_ie,
// //       1);

// // check("MPIE set",
// //       u_csr.mstatus_q[7],
// //       1);

// // // //==================================
// // // //Test 10
// // // //==================================
// // // csr_write(12'h341,32'hAAAAAAAA);

// // // check("MEPC protected",
// // //       mepc_w,
// // //       old_mepc);



// //=============================================================
// //=============================================================
// //TRAP VERIFICATION
// //==============================================================
// //==============================================================


// // ----------------------------
// // Clean previous test state
// // ----------------------------
// irq_sources   = '0;
// le            = '0;
// mret_execute  = 0;
// current_pc    = 32'h100;

// // Give gateway time to clear
// repeat(3) @(posedge clk);


// // //------------------------------------
// // // Clean previous state
// // //------------------------------------
// // irq_sources='0;
// // le='0;
// // repeat(3) @(posedge clk);

// // csr_write(12'h305,32'h100);
// // csr_write(12'h304,32'h0);      // MEIE disabled
// // csr_write(12'h300,32'h8);      // Global MIE enabled

// // repeat(2) @(posedge clk);

// // apb_write(32'h0C000008,32'd3);
// // apb_write(32'h0C200000,32'd0);
// // apb_write(32'h0C002000,32'h4);

// // le[1]=1;

// // @(posedge clk);
// // irq_sources[1]=1;

// // repeat(2) @(posedge clk);

// // check("PLIC interrupt pending",eip[0],1'b1);
// // check("Trap NOT taken",trap_taken,1'b0);
// // check("Trap enter low",trap_enter,1'b0);








// // //------------------------------------
// // // Clean previous state
// // //------------------------------------
// // irq_sources='0;
// // le='0;
// // repeat(3) @(posedge clk);

// // apb_write(32'h0C000008,3);

// // apb_write(32'h0C200000,4);

// // le[1]=1;

// // @(posedge clk);
// // irq_sources[1]=1;

// // repeat(2) @(posedge clk);

// // check("No interrupt",eip[0],0);

// // irq_sources[1]=0;
// // repeat(2) @(posedge clk);

// // // Lower threshold

// // apb_write(32'h0C200000,2);

// // @(posedge clk);
// // irq_sources[1]=1;

// // repeat(2) @(posedge clk);

// // check("Interrupt appears",eip[0],1);

// // //------------------------------------
// // // Clean previous state
// // //------------------------------------
// // irq_sources='0;
// // le='0;
// // repeat(3) @(posedge clk);

// // le[1]=1;

// // @(posedge clk);

// // irq_sources[1]=1;

// // @(posedge clk);

// // irq_sources[1]=0;

// // repeat(3) @(posedge clk);

// // check("Pending",eip[0],1);

// // //------------------------------------
// // // Clean previous state , test 3
// // //------------------------------------
// // irq_sources='0;
// // le='0;
// // repeat(3) @(posedge clk);

// // csr_write(12'h305,32'h100);
// // csr_write(12'h304,32'h800);
// // csr_write(12'h300,32'h8);

// // repeat(2) @(posedge clk);

// // apb_write(32'h0C000008,32'd3);
// // apb_write(32'h0C200000,32'd0);
// // apb_write(32'h0C002000,32'h4);

// // le[1]=1;

// // current_pc=32'h200;

// // @(posedge clk);
// // irq_sources[1]=1;

// // repeat(2) @(posedge clk);

// // check("EIP",eip[0],1'b1);
// // check("Trap Taken",trap_taken,1'b1);
// // check("Trap Enter",trap_enter,1'b1);
// // check("Redirect",trap_pc_w,32'h100);

// // @(posedge clk);

// // check("MEPC",mepc_w,32'h200);
// // check("Global IE Cleared",global_ie,1'b0);

// // ===========================================================

// // ------------------------------------
// // Clean previous state , problem wuth this one
// // ------------------------------------
// irq_sources='0;
// le='0;
// repeat(3) @(posedge clk);

// apb_write(32'h0C000008,32'd2);    // Source2 priority

// apb_write(32'h0C00000C,32'd5);    // Source3 priority

// apb_write(32'h0C200000,0);

// apb_write(32'h0C002000,32'hC);

// le[1]=1;
// le[2]=1;

// @(posedge clk);
// irq_sources[1]=1;
// irq_sources[2]=1;

// repeat(3) @(posedge clk);

// apb_read(32'h0C200004);

// check("Highest priority source",last_rdata,32'd3);

// //============================================================


// repeat(2) @(posedge clk);
// $finish ;

// end


//============================================================================
//Single Interrupt Full Verification
//=============================================================================

// initial
// begin
//     rst_ni =0;
//     repeat(2) @(posedge clk);
//     #1;
//     rst_ni = 1;

// $display("\n====================================");
// $display("TEST 1 : Configure Interrupt System");
// $display("====================================");

// // Clean everything
// irq_sources   = '0;
// le            = '0;
// mret_execute  = 0;
// current_pc    = 32'h200;

// repeat(3) @(posedge clk);

// // Program CSR registers
// csr_write(12'h305,32'h100);     // MTVEC = 0x100
// csr_write(12'h304,32'h800);     // Enable MEIE
// csr_write(12'h300,32'h8);       // Enable global MIE

// repeat(2) @(posedge clk);

// // Configure PLIC
// apb_write(32'h0C000008,32'd3);  // Source2 priority =3
// apb_write(32'h0C200000,32'd0);  // Threshold =0
// apb_write(32'h0C002000,32'h4);  // Enable Source2

// le[1] = 1;                      // Edge triggered

// repeat(2) @(posedge clk);

// // Verify configuration
// check("Global IE",global_ie,1'b1);

// // TEST 2 : Generate Interrupt

// $display("\n====================================");
// $display("TEST 2 : Generate Interrupt");
// $display("====================================");

// // Generate edge
// @(posedge clk);
// irq_sources[1] = 1;

// @(posedge clk);
// irq_sources[1] = 0;

// repeat(1) @(posedge clk);

// // Gateway + Target
// check("Pending",eip[0],1'b1);

// // Trap
// check("Trap Taken",trap_taken,1'b1);
// check("Trap Enter",trap_enter,1'b1);

// // Redirect
// check("Redirect PC",trap_pc_w,32'h100);

// // // TEST 3 : CSR Update

// $display("\n====================================");
// $display("TEST 3 : CSR Update");
// $display("====================================");



// repeat(2) @(posedge clk);

// check("MEPC Saved",mepc_w,32'h200);

// check("Global IE Cleared",global_ie,1'b0);

// // Optional if exposed
// // check("MCAUSE",mcause_w,32'h8000000B);

// // TEST 4 : ISR Claims Interrupt



// $display("\n====================================");
// $display("TEST 4 : Claim Interrupt");
// $display("====================================");

// apb_read(32'h0C200004);

// check("Claim ID",last_rdata,32'd2);

// repeat(1) @(posedge clk);

// // Pending should disappear
// check("Pending Cleared",eip[0],1'b0);

// // TEST 5 : ISR Clears Peripheral


// $display("\n====================================");
// $display("TEST 5 : Clear Peripheral");
// $display("====================================");

// irq_sources[1]=0;

// repeat(2) @(posedge clk);

// check("No New Pending",eip[0],1'b0);

// // TEST 6 : Complete Interrupt



// $display("\n====================================");
// $display("TEST 6 : Complete");
// $display("====================================");

// apb_write(32'h0C200004,32'd2);

// repeat(2) @(posedge clk);

// // Active bit should clear internally.
// // No new interrupt.
// check("No Pending",eip[0],1'b0);

// // // TEST 7 : Execute MRET

// $display("\n====================================");
// $display("TEST 7 : MRET");
// $display("====================================");

// mret_execute = 1;

// @(posedge clk);
// #1;

// check("Trap Return",trap_return,1'b1);

// check("Redirect to MEPC",trap_pc_w,mepc_w);

// mret_execute = 0;

// repeat(2) @(posedge clk);

// check("Global IE Restored",global_ie,1'b1);

// // // TEST 8 : Generate Interrupt Again


// $display("\n====================================");
// $display("TEST 8 : Re-trigger");
// $display("====================================");

// @(posedge clk);
// irq_sources[1]=1;

// @(posedge clk);
// irq_sources[1]=0;

// repeat(1) @(posedge clk);

// check("Pending Again",eip[0],1'b1);

// check("Trap Again",trap_taken,1'b1);


// repeat(2) @(posedge clk);
// $finish;

// end


//=====================================================================
//Multiple Interrupt verification
//=====================================================================

initial begin

    //--------------------------------------------------
    // Reset
    //--------------------------------------------------

    rst_ni = 0;

    repeat(2) @(posedge clk);
    #1;

    rst_ni = 1;

    //--------------------------------------------------
    // TEST 1 : Configure System
    //--------------------------------------------------

    $display("\n====================================");
    $display("MULTIPLE INTERRUPT TEST");
    $display("====================================");

    irq_sources  = '0;
    le           = '0;
    mret_execute = 0;
    current_pc   = 32'h200;

    repeat(3) @(posedge clk);

    //--------------------------------------------------
    // Configure CSR
    //--------------------------------------------------

    csr_write(12'h305,32'h100);      // MTVEC
    csr_write(12'h304,32'h800);      // MEIE
    csr_write(12'h300,32'h8);        // Global MIE

    repeat(2) @(posedge clk);

    //--------------------------------------------------
    // Configure PLIC
    //--------------------------------------------------

    apb_write(32'h0C000008,32'd2);   // Source2 Priority =2

    apb_write(32'h0C00000C,32'd5);   // Source3 Priority =5

    apb_write(32'h0C000010,32'd4);   // Source4 Priority =4

    apb_write(32'h0C200000,32'd0);   // Threshold =0

    apb_write(32'h0C002000,32'h1C);  // Enable Source2/3/4

    le[1]=1;
    le[2]=1;
    le[3]=1;

    repeat(2) @(posedge clk);

    check("Global IE",global_ie,1'b1);

    //--------------------------------------------------
    // Generate Three Interrupts
    //--------------------------------------------------

    $display("\n====================================");
    $display("Generate Three Interrupts");
    $display("====================================");

    @(posedge clk);

    irq_sources[1]=1;
    irq_sources[2]=1;
    irq_sources[3]=1;

    @(posedge clk);

    irq_sources[1]=0;
    irq_sources[2]=0;
    irq_sources[3]=0;

    repeat(1) @(posedge clk);

    check("External Interrupt",eip[0],1'b1);

    check("Trap Taken",trap_taken,1'b1);

    check("Trap Enter",trap_enter,1'b1);

    check("Trap PC",trap_pc_w,32'h100);

    //--------------------------------------------------
    // First Claim
    //--------------------------------------------------

    $display("\n====================================");
    $display("FIRST CLAIM");
    $display("====================================");

    apb_read(32'h0C200004);

    check("Highest Priority",last_rdata,32'd3);

    repeat(1) @(posedge clk);

    check("Interrupt Still Pending",eip[0],1'b1);

    //--------------------------------------------------
    // First Complete
    //--------------------------------------------------

    $display("\n====================================");
    $display("FIRST COMPLETE");
    $display("====================================");

    apb_write(32'h0C200004,32'd3);

    repeat(2) @(posedge clk);

    check("Interrupt Still Pending",eip[0],1'b1);

    //--------------------------------------------------
    // Second Claim
    //--------------------------------------------------

    $display("\n====================================");
    $display("SECOND CLAIM");
    $display("====================================");

    apb_read(32'h0C200004);

    check("Second Highest",last_rdata,32'd4);

    repeat(1) @(posedge clk);

    check("Interrupt Still Pending",eip[0],1'b1);

    //--------------------------------------------------
    // Second Complete
    //--------------------------------------------------

    $display("\n====================================");
    $display("SECOND COMPLETE");
    $display("====================================");

    apb_write(32'h0C200004,32'd4);

    repeat(2) @(posedge clk);

    check("Interrupt Still Pending",eip[0],1'b1);

    //--------------------------------------------------
    // Third Claim
    //--------------------------------------------------

    $display("\n====================================");
    $display("THIRD CLAIM");
    $display("====================================");

    apb_read(32'h0C200004);

    check("Third Highest",last_rdata,32'd2);

    repeat(1) @(posedge clk);

    //--------------------------------------------------
    // Third Complete
    //--------------------------------------------------

    $display("\n====================================");
    $display("THIRD COMPLETE");
    $display("====================================");

    apb_write(32'h0C200004,32'd2);

    repeat(2) @(posedge clk);

    check("No Pending Interrupt",eip[0],1'b0);

    //--------------------------------------------------
    // Execute MRET
    //--------------------------------------------------

    $display("\n====================================");
    $display("EXECUTE MRET");
    $display("====================================");

    mret_execute = 1;

    @(posedge clk);
    #1;

    check("Trap Return",trap_return,1'b1);

    check("Return PC",trap_pc_w,mepc_w);

    mret_execute = 0;

    repeat(2) @(posedge clk);

    check("Global IE Restored",global_ie,1'b1);

    //--------------------------------------------------
    // Finish
    //--------------------------------------------------

    $display("\n====================================");
    $display("MULTIPLE INTERRUPT TEST COMPLETE");
    $display("====================================");

    repeat(2) @(posedge clk);

    $finish;

end



endmodule