// =============================================================
//  csr_file.sv
//
//  Minimal CSR block: owns all machine-state registers needed
//  for the bring-up path
//
//      External/timer/software interrupt -> CPU jumps to ISR ->
//      ISR executes -> MRET returns
//
//  Two separate interfaces talk to this module:
//    1) CSR instructions from the pipeline (csr_we/addr/wdata/rdata)
//    2) The trap controller (trap_enter / trap_return), which
//       drives the hardware-managed side-effects on trap entry
//       and mret.
//
//  Registers implemented: mstatus (MIE, MPIE), mie (MSIE, MTIE, MEIE),
//  mtvec, mepc, mcause, mip (MSIP, MTIP, MEIP -- all hardware-driven,
//  from CLINT's msip/timer_irq lines and PLIC's meip line respectively).
//  Everything else on the CSR address map, and every unimplemented bit
//  within a register, reads as zero.
//
//  Software may write: mstatus, mie, mtvec -- but only the specific
//  bits listed above; other bits in csr_wdata are ignored so a
//  write with reserved bits set can't corrupt unbuilt fields.
//  Hardware-only (not software-writable): mepc, mcause, mip.
//
//  mtvec is Direct-mode only: writes force mtvec[1:0] = 2'b00.
//
//  Trap entry/return follow the standard RISC-V interrupt-enable
//  flow: entry saves MIE into MPIE then clears MIE; mret restores
//  MIE from MPIE then sets MPIE back to 1.
// =============================================================

module csr_file (

    input  logic        clk,
    input  logic        rst_n,

    // ---- CSR instruction interface (from pipeline) ----
    // csr_addr:  ID-stage address, drives the read mux (csr_rdata) that
    //            feeds the "old value" written into rd for csrrw.
    // csr_we / csr_waddr / csr_wdata: EX-stage write port. Split from
    //            csr_addr so the write can be forwarded/hazard-resolved
    //            one stage later than the read without the two colliding
    //            on a single shared address port.
    input  logic        csr_we,
    input  logic [11:0]  csr_addr,
    input  logic [11:0]  csr_waddr,
    input  logic [31:0]  csr_wdata,
    output logic [31:0]  csr_rdata,

    // ---- Trap controller interface ----
    input  logic         trap_enter,   // pulse: entering a trap
    input  logic         trap_return,  // pulse: mret executing

    input  logic [31:0]  interrupted_pc, // PC to save into mepc on entry
                                          // (renamed from trap_pc to avoid
                                          // colliding with trap_controller's
                                          // trap_pc OUTPUT, which is the
                                          // redirect target, not this value)
    input  logic [31:0]  trap_cause,   // cause value to latch on entry

    input  logic         meip,         // PLIC pending line -> mip.MEIP
    input  logic         mtip,         // CLINT timer pending -> mip.MTIP
    input  logic         msip,         // CLINT software-int pending -> mip.MSIP

    // ---- Decoded fields exposed to trap controller / pipeline ----
    output logic         global_ie,    // mstatus.MIE
    output logic         external_ie,  // mie.MEIE
    output logic         timer_ie,     // mie.MTIE
    output logic         software_ie,  // mie.MSIE
    output logic [31:0]  mtvec,        // trap vector base
    output logic [31:0]  mepc          // dedicated read path for the trap
                                        // controller's mret redirect target,
                                        // separate from the shared csr_rdata
                                        // mux used by CSR instructions
);

    // CSR addresses
    localparam logic [11:0] ADDR_MSTATUS = 12'h300;
    localparam logic [11:0] ADDR_MIE     = 12'h304;
    localparam logic [11:0] ADDR_MTVEC   = 12'h305;
    localparam logic [11:0] ADDR_MEPC    = 12'h341;
    localparam logic [11:0] ADDR_MCAUSE  = 12'h342;
    localparam logic [11:0] ADDR_MIP     = 12'h344;

    // Bit positions
    localparam int MSTATUS_MIE_BIT  = 3;
    localparam int MSTATUS_MPIE_BIT = 7;
    localparam int MIE_MSIE_BIT     = 3;
    localparam int MIE_MTIE_BIT     = 7;
    localparam int MIE_MEIE_BIT     = 11;
    localparam int MIP_MSIP_BIT     = 3;
    localparam int MIP_MTIP_BIT     = 7;
    localparam int MIP_MEIP_BIT     = 11;

    // ---- Register storage ----
    logic [31:0] mstatus_q;
    logic [31:0] mie_q;
    logic [31:0] mtvec_q;
    logic [31:0] mepc_q;
    logic [31:0] mcause_q;
    logic [31:0] mip_q;

    // mip is not really "stored" in the sense of holding old value across
    // cycles independent of meip - it always tracks the live pending line.
    // Modeled as combinational to keep a single source of truth.
    always_comb begin
        mip_q = '0;
        mip_q[MIP_MSIP_BIT] = msip;
        mip_q[MIP_MTIP_BIT] = mtip;
        mip_q[MIP_MEIP_BIT] = meip;
    end

    // ---- Combinational "next value" a software write would produce ----
    // csr_we/csr_waddr/csr_wdata now land here in the EX stage rather than
    // ID, so a csrrw immediately followed by another csrrw to the *same*
    // address (the register's own read-modify-write pattern) would
    // otherwise see the read mux still holding the pre-write value for one
    // extra cycle. These _next signals are shared by the sequential write
    // below and the read-mux bypass, so a same-cycle, same-address read
    // observes the write in flight -- mirrors reg_file.v's own
    // read-during-write bypass for GPRs.
    logic [31:0] mstatus_next, mie_next, mtvec_next;
    always_comb begin
        mstatus_next = mstatus_q;
        mstatus_next[MSTATUS_MIE_BIT]  = csr_wdata[MSTATUS_MIE_BIT];
        mstatus_next[MSTATUS_MPIE_BIT] = csr_wdata[MSTATUS_MPIE_BIT];

        mie_next = mie_q;
        mie_next[MIE_MSIE_BIT] = csr_wdata[MIE_MSIE_BIT];
        mie_next[MIE_MTIE_BIT] = csr_wdata[MIE_MTIE_BIT];
        mie_next[MIE_MEIE_BIT] = csr_wdata[MIE_MEIE_BIT];

        // Direct mode only: force mtvec[1:0] = 2'b00.
        mtvec_next = {csr_wdata[31:2], 2'b00};
    end

    // ---- Sequential update ----
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mstatus_q <= 32'b0;
            mie_q     <= 32'b0;
            mtvec_q   <= 32'b0;
            mepc_q    <= 32'b0;
            mcause_q  <= 32'b0;
        end
        else begin
            // ---- Hardware-driven updates take priority ----
            if (trap_enter) begin
                mepc_q                       <= interrupted_pc;
                mcause_q                     <= trap_cause;
                // Standard RISC-V trap-entry interrupt-enable flow:
                // stash the current MIE into MPIE, then clear MIE so
                // the ISR itself runs with interrupts disabled.
                mstatus_q[MSTATUS_MPIE_BIT]  <= mstatus_q[MSTATUS_MIE_BIT];
                mstatus_q[MSTATUS_MIE_BIT]   <= 1'b0;
            end
            else if (trap_return) begin
                // mret: restore MIE from the MPIE we saved on entry,
                // then set MPIE back to 1 (its reset/idle value) per spec.
                mstatus_q[MSTATUS_MIE_BIT]  <= mstatus_q[MSTATUS_MPIE_BIT];
                mstatus_q[MSTATUS_MPIE_BIT] <= 1'b1;
            end
            // ---- Software CSR writes (only when not overridden above) ----
            else if (csr_we) begin
                case (csr_waddr)
                    // Write only the bits we actually implement, so a
                    // software write with reserved/unused bits set can't
                    // corrupt fields we haven't built yet.
                    ADDR_MSTATUS: mstatus_q <= mstatus_next;
                    ADDR_MIE:     mie_q     <= mie_next;
                    ADDR_MTVEC:   mtvec_q   <= mtvec_next;
                    // mepc, mcause, mip: not software-writable in this version
                    default: ; // no-op for unimplemented addresses
                endcase
            end
        end
    end

    // ---- CSR read mux ----
    // Bypasses to the EX-stage write's _next value when a read (ID stage,
    // csr_addr) and an in-flight write (EX stage, csr_waddr) target the
    // same register this cycle -- see the _next comment above.
    always_comb begin
        case (csr_addr)
            ADDR_MSTATUS: csr_rdata = (csr_we && csr_waddr == ADDR_MSTATUS) ? mstatus_next : mstatus_q;
            ADDR_MIE:     csr_rdata = (csr_we && csr_waddr == ADDR_MIE)     ? mie_next     : mie_q;
            ADDR_MTVEC:   csr_rdata = (csr_we && csr_waddr == ADDR_MTVEC)   ? mtvec_next   : mtvec_q;
            ADDR_MEPC:    csr_rdata = mepc_q;
            ADDR_MCAUSE:  csr_rdata = mcause_q;
            ADDR_MIP:     csr_rdata = mip_q;
            default:      csr_rdata = 32'b0;
        endcase
    end

    // ---- Decoded outputs to trap controller ----
    assign global_ie   = mstatus_q[MSTATUS_MIE_BIT];
    assign external_ie = mie_q[MIE_MEIE_BIT];
    assign timer_ie    = mie_q[MIE_MTIE_BIT];
    assign software_ie = mie_q[MIE_MSIE_BIT];
    assign mtvec       = mtvec_q;
    assign mepc        = mepc_q;

endmodule