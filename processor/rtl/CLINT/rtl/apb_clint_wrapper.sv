`include "typdef.vh"

module apb_clint_wrapper #(
    parameter int ADDR_WIDTH = 32
)(
    input  logic                  PCLK,
    input  logic                  PRESETn,

    // APB Slave Interface
    input  logic                  PSEL,
    input  logic                  PENABLE,
    input  logic                  PWRITE,
    input  logic [ADDR_WIDTH-1:0] PADDR,
    input  logic [31:0]           PWDATA,
    input  logic [3:0]            PSTRB,

    output logic [31:0]           PRDATA,
    output logic                  PREADY,
    output logic                  PSLVERR,

    // RTC clock input
    input  logic                  rtc_i,

    // Interrupt outputs
    output logic [1:0]            timer_irq_o,
    output logic [1:0]            ipi_o
);

    // ------------------------------------------------------------------
    // Create the exact register request/response types used by PULP CLINT
    // ------------------------------------------------------------------
    typedef logic [15:0] addr_t;
    typedef logic [31:0] data_t;
    typedef logic [3:0]  strb_t;

    `REG_BUS_TYPEDEF_ALL(clint_reg, addr_t, data_t, strb_t)

    clint_reg_req_t reg_req;
    clint_reg_rsp_t reg_rsp;

    // ------------------------------------------------------------------
    // APB -> PULP Register Interface
    // ------------------------------------------------------------------

    // A valid APB access occurs in the ACCESS phase
    assign reg_req.valid = PSEL & PENABLE;
    assign reg_req.write = PWRITE;
    // This SoC's address decoder gives every peripheral a 4KB (12-bit)
    // slot (rtl/apb/addr_decoder.v decodes on addr[31:12]) -- clint_reg_top
    // expects a small in-block offset (its largest CLINT_*_OFFSET is
    // 0x1C), so only the low 12 bits of PADDR are the real register
    // offset. Passing PADDR[15:0] through unmasked would leak the SoC's
    // own 4KB block-select bits (e.g. the "7" in 0x40007018) into the
    // offset compared against CLINT_MTIME_LOW_OFFSET etc., and nothing
    // would ever address-hit.
    assign reg_req.addr  = {4'b0, PADDR[11:0]};
    assign reg_req.wdata = PWDATA;
    assign reg_req.wstrb = PSTRB;

    // ------------------------------------------------------------------
    // PULP Register Interface -> APB
    // ------------------------------------------------------------------
    assign PRDATA  = reg_rsp.rdata;
    assign PREADY  = reg_rsp.ready;
    assign PSLVERR = reg_rsp.error;

    // ------------------------------------------------------------------
    // Instantiate the original PULP CLINT (UNMODIFIED)
    // ------------------------------------------------------------------
    clint #(
        .reg_req_t (clint_reg_req_t),
        .reg_rsp_t (clint_reg_rsp_t)
    ) u_clint (
        .clk_i       (PCLK),
        .rst_ni      (PRESETn),
        .testmode_i  (1'b0),

        .reg_req_i   (reg_req),
        .reg_rsp_o   (reg_rsp),

        .rtc_i       (rtc_i),

        .timer_irq_o (timer_irq_o),
        .ipi_o       (ipi_o)
    );

endmodule