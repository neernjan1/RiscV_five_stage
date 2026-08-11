// apb_plic_wrapper.sv
//
// Bridges this SoC's flat APB signals (rtl/apb/addr_decoder.v gives PLIC a
// 4KB decode window at 0x40005000-0x40005FFF, same convention as every
// other peripheral) onto plic_top's reg_pkg::reg_req_t/rsp_t bus.
//
// plic_top's own register block (plic_regmap.sv, auto-generated) is hard-
// coded to the classic absolute PLIC memory map -- priority[0..30] at
// 0x0C00_0000 + 4*src, pending at 0x0C00_1000, enable at 0x0C00_2000 (target
// 0) / 0x0C00_2080 (target 1), threshold/claim at 0x0C20_0000 / 0x0C20_1000
// per target -- which spans far more address space than this SoC's 4KB
// window. This wrapper translates a compact in-block offset (0x000-0x098)
// into those fixed absolute addresses; it's a lookup, not a real bus
// bridge, since the two address spaces never need to overlap.
module apb_plic_wrapper (
    input  logic         PCLK,
    input  logic         PRESETn,

    input  logic         PSEL,
    input  logic         PENABLE,
    input  logic         PWRITE,
    input  logic [31:0]  PADDR,
    input  logic [31:0]  PWDATA,

    output logic [31:0]  PRDATA,
    output logic         PREADY,

    // Interrupt sources 1..30 (register-visible numbering); source 0 is
    // always tied zero inside plic_top, matching the RISC-V PLIC spec.
    input  logic [29:0]  irq_sources_i,
    // One line per PLIC target context; target 0 is this core's meip.
    output logic [1:0]   eip_targets_o
);

    reg_pkg::reg_req_t req;
    reg_pkg::reg_rsp_t rsp;

    // Priority regs sit at a linear 4-byte stride (0x000-0x078, one per
    // source including the tied-zero source 0), so they translate
    // arithmetically; everything else is a handful of fixed offsets.
    logic [31:0] plic_addr;
    always_comb begin
        if (PADDR[11:0] <= 12'h078)
            plic_addr = 32'h0C00_0000 + {20'b0, PADDR[11:0]};
        else begin
            case (PADDR[11:0])
                12'h080: plic_addr = 32'h0C00_1000;  // pending          (ip)
                12'h084: plic_addr = 32'h0C00_2000;  // enable target 0  (ie)
                12'h088: plic_addr = 32'h0C00_2080;  // enable target 1  (ie)
                12'h08C: plic_addr = 32'h0C20_0000;  // threshold target 0
                12'h090: plic_addr = 32'h0C20_1000;  // threshold target 1
                12'h094: plic_addr = 32'h0C20_0004;  // claim/complete target 0
                12'h098: plic_addr = 32'h0C20_1004;  // claim/complete target 1
                default: plic_addr = 32'hFFFF_FFFF;  // misses every plic_regs case -> resp.error
            endcase
        end
    end

    assign req.valid = PSEL & PENABLE;
    assign req.write = PWRITE;
    assign req.addr  = plic_addr;
    assign req.wdata = PWDATA;

    assign PRDATA = rsp.rdata;
    assign PREADY = rsp.ready;

    plic_top #(
        .N_SOURCE  (30),
        .N_TARGET  (2),
        .MAX_PRIO  (7),
        .reg_req_t (reg_pkg::reg_req_t),
        .reg_rsp_t (reg_pkg::reg_rsp_t)
    ) u_plic (
        .clk_i  (PCLK),
        .rst_ni (PRESETn),

        .req_i  (req),
        .resp_o (rsp),

        .le_i          (30'b0),   // all sources level-triggered
        .irq_sources_i (irq_sources_i),

        .eip_targets_o (eip_targets_o)
    );

endmodule
