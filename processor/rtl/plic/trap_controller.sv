// =============================================================
//  trap_controller.sv
//
//  Purely combinational trap decision logic.
//  Decides WHEN to enter or leave a trap; it never touches any
//  CSR storage itself — csr_file.sv owns all the state and
//  performs the actual register updates based on the signals
//  this module drives.
//
//  Priority order implemented here:
//    1) mret in decode  -> trap_return (return path wins ties,
//       since an ISR finishing and a new interrupt arriving in
//       the same cycle should still retire the mret first)
//    2) pending, enabled interrupt -> trap_enter, highest source
//       priority wins a same-cycle tie: external > software >
//       timer (RISC-V priv spec 3.1.9, machine-mode order).
//       trap_cause is selected here too, since this module
//       already owns the priority decision.
// =============================================================

module trap_controller (

    // Interrupt-pending / enable inputs (from CSR file)
    input  logic        meip,          // mip.MEIP  (PLIC pending)
    input  logic        mtip,          // mip.MTIP  (CLINT timer pending)
    input  logic        msip,          // mip.MSIP  (CLINT software pending)
    input  logic        mstatus_mie,   // mstatus.MIE (global enable)
    input  logic        mie_meie,      // mie.MEIE  (external-int enable)
    input  logic        mie_mtie,      // mie.MTIE  (timer-int enable)
    input  logic        mie_msie,      // mie.MSIE  (software-int enable)

    // PC / target inputs
    input  logic [31:0] current_pc,    // PC of instruction that would
                                        // be interrupted (for mepc)
    input  logic [31:0] mtvec,         // trap vector base
    input  logic [31:0] mepc,          // saved return PC

    // Decode-stage control
    input  logic        mret_execute,  // asserted when decode sees MRET

    // Outputs to pipeline / CSR file
    output logic        trap_taken,    // 1 => redirect next_pc
    output logic [31:0] trap_pc,       // PC to redirect to
    output logic        trap_enter,    // pulse: entering a trap
    output logic        trap_return,   // pulse: returning via mret
    output logic [31:0] trap_cause     // mcause value for the source taken
);

    // Standard M-mode interrupt cause codes (interrupt bit set, RISC-V
    // priv spec table 3.6): software=3, timer=7, external=11.
    localparam logic [31:0] CAUSE_MSI = 32'h80000003;
    localparam logic [31:0] CAUSE_MTI = 32'h80000007;
    localparam logic [31:0] CAUSE_MEI = 32'h8000000B;

    // Per-source pending-and-enabled conditions.
    logic ext_pending, soft_pending, timer_pending, irq_pending;
    assign ext_pending   = meip && mie_meie;
    assign soft_pending  = msip && mie_msie;
    assign timer_pending = mtip && mie_mtie;
    assign irq_pending   = mstatus_mie && (ext_pending || soft_pending || timer_pending);

    always_comb begin
        // Defaults
        trap_taken  = 1'b0;
        trap_pc     = 32'b0;
        trap_enter  = 1'b0;
        trap_return = 1'b0;
        trap_cause  = 32'b0;

        if (mret_execute) begin
            // MRET has priority: finish returning before taking
            // a fresh interrupt.
            trap_taken  = 1'b1;
            trap_pc     = mepc;
            trap_return = 1'b1;
        end
        else if (irq_pending) begin
            trap_taken  = 1'b1;
            trap_pc     = mtvec;
            trap_enter  = 1'b1;

            // Highest-priority pending source wins a same-cycle tie.
            if (ext_pending)
                trap_cause = CAUSE_MEI;
            else if (soft_pending)
                trap_cause = CAUSE_MSI;
            else
                trap_cause = CAUSE_MTI;
        end
    end

endmodule