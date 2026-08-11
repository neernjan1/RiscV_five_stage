`timescale 1ns/1ps

module soc_top(

    input clk,
    input rst,

    // SPI Inputs
    input  spi_sdi0,
    input  spi_sdi1,
    input  spi_sdi2,
    input  spi_sdi3,

    // SPI Outputs
    output spi_clk,

    output spi_csn0,
    output spi_csn1,
    output spi_csn2,
    output spi_csn3,

    output spi_sdo0,
    output spi_sdo1,
    output spi_sdo2,
    output spi_sdo3,

    // GPIO
    input  [31:0] gpio_in,
    output [31:0] gpio_out,
    output [31:0] gpio_tx_en,   // 0 -> pin is an input, 1 -> pin is an output

    // UART
    output uart_tx,
    input  uart_rx

);

// Shared APB request/response struct type for peripherals that use the
// struct-based APB port style (gpio_apb_wrap, apb_uart_wrap) rather than
// this SoC's native flat-signal style (spi/ascon/clint). Reuses the
// canonical PULP `APB_TYPEDEF_ALL macro already vendored in via
// rtl/apb_uart's Bender checkout instead of hand-rolling a struct, so the
// field names/widths are guaranteed to match what those wrap modules
// actually expect.
`include "apb/typedef.svh"
`APB_TYPEDEF_ALL(soc_apb, logic [31:0], logic [31:0], logic [3:0])



///////////////////////////////////////////////////////////
// CPU <-> Instruction Memory Interface
///////////////////////////////////////////////////////////

wire [31:0] instr_addr;
wire [31:0] instruction;

///////////////////////////////////////////////////////////
// CPU <-> Data Memory Interface
///////////////////////////////////////////////////////////

wire [31:0] data_addr;
wire [31:0] data_wdata;
wire [31:0] data_rdata;
wire  [31:0] rdata;
wire mem_read;
wire mem_write;

wire [1:0] mem_size;
wire load_sign_ext;

wire stall_mem ;

///////////////////////////////////////////////////////////
// CPU
///////////////////////////////////////////////////////////

riscv_core cpu(

    .clk(clk),
    .rst(rst),

    //--------------------------
    // Instruction Interface
    //--------------------------

    .instr_addr(instr_addr),
    .instruction(instruction),

    //--------------------------
    // Data Interface
    //--------------------------

    .data_addr(data_addr),
    .data_wdata(data_wdata),
    .data_rdata(rdata),

    .mem_read(mem_read),
    .mem_write(mem_write),

    .mem_size(mem_size),
    .load_sign_ext(load_sign_ext),
    .stall_mem(stall_mem),

    //--------------------------
    // Interrupts
    //--------------------------
    .external_irq(plic_eip_targets[0]),
    .mtip(clint_timer_irq),
    .msip(clint_ipi)
);

///////////////////////////////////////////////////////////
// Instruction Memory
///////////////////////////////////////////////////////////

instruction_memory imem(

    .pc(instr_addr),

    .instruction_code(instruction)

);

///////////////////////////////////////////////////////////
// Data Memory
///////////////////////////////////////////////////////////

wire [31:0] dmem_rdata;

data_memory dmem(

    .clk(clk),
    .rst(rst),

    .addr(data_addr),
    .w_data(data_wdata),

    .mem_read(mem_read),
    .mem_write(mem_write),

    .mem_size(mem_size),
    .load_sign_ext(load_sign_ext),

    .r_data(dmem_rdata)

);

///////////////////////////////////////////////////////////
// APB
///////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////
// APB wires
///////////////////////////////////////////////////////////

wire [31:0] uart_PRDATA;
wire uart_PREADY;

wire [31:0] gpio_PRDATA;
wire gpio_PREADY;

wire [31:0] spi_PRDATA;
wire spi_PREADY;

wire [31:0] ascon_PRDATA;
wire ascon_PREADY;

wire [31:0] i2c_PRDATA;
wire i2c_PREADY;

wire [31:0] plic_PRDATA;
wire plic_PREADY;

wire [31:0] timer_PRDATA;
wire timer_PREADY;

wire [31:0] clint_PRDATA;
wire clint_PREADY;

wire uart_PSEL;
wire spi_PSEL;
wire ascon_PSEL;
wire clint_PSEL;
wire gpio_PSEL;
wire plic_PSEL;

wire PENABLE;
wire PWRITE;

wire [31:0] PADDR;
wire [31:0] PWDATA;

apb_top apb(

    .clk(clk),
    .rst(rst),

    .addr(data_addr),
    .wdata(data_wdata),

    .mem_read(mem_read),
    .mem_write(mem_write),

    .rdata(rdata),

    .stall_mem(stall_mem),

    .mem_rdata(dmem_rdata),

    .uart_PRDATA(uart_PRDATA),
    .uart_PREADY(uart_PREADY),

    .gpio_PRDATA(gpio_PRDATA),
    .gpio_PREADY(gpio_PREADY),

    .spi_PRDATA(spi_PRDATA),
    .spi_PREADY(spi_PREADY),

    .ascon_PRDATA(ascon_PRDATA),
    .ascon_PREADY(ascon_PREADY),

    .i2c_PRDATA(i2c_PRDATA),
    .i2c_PREADY(i2c_PREADY),

    .plic_PRDATA(plic_PRDATA),
    .plic_PREADY(plic_PREADY),

    .timer_PRDATA(timer_PRDATA),
    .timer_PREADY(timer_PREADY),

    .clint_PRDATA(clint_PRDATA),
    .clint_PREADY(clint_PREADY),

    .uart_PSEL(uart_PSEL),
    .spi_PSEL(spi_PSEL),
    .ascon_PSEL(ascon_PSEL),
    .clint_PSEL(clint_PSEL),
    .gpio_PSEL(gpio_PSEL),
    .plic_PSEL(plic_PSEL),

    .PENABLE_out(PENABLE),
    .PWRITE_out(PWRITE),
    .PADDR_out(PADDR),
    .PWDATA_out(PWDATA)

);

// assign spi_PRDATA = 32'h12345678;
// assign spi_PREADY = 1'b1;


// assign ascon_PRDATA = 32'b0;
// assign ascon_PREADY = 1'b1;

assign i2c_PRDATA = 32'b0;
assign i2c_PREADY = 1'b1;

assign timer_PRDATA = 32'b0;
assign timer_PREADY = 1'b1;




wire [1:0] spi_mode;
wire [1:0] spi_events;

wire spi_PSLVERR;

apb_spi_master #(
    .BUFFER_DEPTH(10),
    .APB_ADDR_WIDTH(12)
) spi (

    .HCLK(clk),
    .HRESETn(~rst),

    // APB Slave Interface
    .PADDR(PADDR[11:0]),
    .PWDATA(PWDATA),
    .PWRITE(PWRITE),

    .PSEL(spi_PSEL),
    .PENABLE(PENABLE),

    .PRDATA(spi_PRDATA),
    .PREADY(spi_PREADY),
    .PSLVERR(spi_PSLVERR),

    // SPI pins

    .spi_clk(spi_clk),

    .spi_csn0(spi_csn0),
    .spi_csn1(spi_csn1),
    .spi_csn2(spi_csn2),
    .spi_csn3(spi_csn3),

    .spi_mode(spi_mode),

    .spi_sdo0(spi_sdo0),
    .spi_sdo1(spi_sdo1),
    .spi_sdo2(spi_sdo2),
    .spi_sdo3(spi_sdo3),

    .spi_sdi0(spi_sdi0),
    .spi_sdi1(spi_sdi1),
    .spi_sdi2(spi_sdi2),
    .spi_sdi3(spi_sdi3),

    .events_o(spi_events)
);

//ASCON ACCELERATOR
wire ascon_PSLVERR;

ascon_accelerator ascon (

    .PCLK(clk),
    .PRESETn(~rst),

    .PADDR(PADDR),
    .PSEL(ascon_PSEL),

    .PENABLE(PENABLE),

    .PWRITE(PWRITE),

    .PWDATA(PWDATA),

    .PRDATA(ascon_PRDATA),

    .PREADY(ascon_PREADY),

    .PSLVERR(ascon_PSLVERR)

);

//CLINT (timer + software interrupt controller)
wire clint_PSLVERR;
wire [1:0] clint_timer_irq_vec, clint_ipi_vec;
wire clint_timer_irq, clint_ipi;

// Single-hart design: only hart 0's lines matter.
assign clint_timer_irq = clint_timer_irq_vec[0];
assign clint_ipi       = clint_ipi_vec[0];

// rtc_i must NOT be tied straight to clk: clint.sv's rising-edge detector
// (clint_sync_wedge) samples rtc_i with flip-flops clocked by that same
// clk, so an identical signal is a degenerate same-clock race, not a
// clean toggle -- mtime never reliably increments. A small free-running
// divider gives it a genuinely distinguishable edge to detect while still
// ticking fast enough for directed tests to hit small mtimecmp values
// quickly.
reg [3:0] rtc_div;
always @(posedge clk or posedge rst) begin
    if (rst) rtc_div <= 4'b0;
    else     rtc_div <= rtc_div + 4'b1;
end
wire rtc_tick = rtc_div[3];

apb_clint_wrapper clint (

    .PCLK(clk),
    .PRESETn(~rst),

    .PSEL(clint_PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),
    .PSTRB(4'hF),  // this SoC has no byte-strobe concept elsewhere either

    .PRDATA(clint_PRDATA),
    .PREADY(clint_PREADY),
    .PSLVERR(clint_PSLVERR),

    .rtc_i(rtc_tick),

    .timer_irq_o(clint_timer_irq_vec),
    .ipi_o(clint_ipi_vec)
);

//GPIO
soc_apb_req_t  gpio_apb_req;
soc_apb_resp_t gpio_apb_rsp;
wire [31:0] gpio_in_sync;         // unused: sampled/synced copy of gpio_in
wire        gpio_global_irq;      // PLIC source 2 (see PLIC section below)
wire [31:0] gpio_pin_level_irq;   // unused: only the global line feeds PLIC so far

assign gpio_apb_req.paddr   = PADDR;
assign gpio_apb_req.pprot   = '0;
assign gpio_apb_req.psel    = gpio_PSEL;
assign gpio_apb_req.penable = PENABLE;
assign gpio_apb_req.pwrite  = PWRITE;
assign gpio_apb_req.pwdata  = PWDATA;
assign gpio_apb_req.pstrb   = 4'hF;  // this SoC has no byte-strobe concept elsewhere either

assign gpio_PRDATA = gpio_apb_rsp.prdata;
assign gpio_PREADY = gpio_apb_rsp.pready;

gpio_apb_wrap #(
    .ADDR_WIDTH ( 32 ),
    .DATA_WIDTH ( 32 ),
    .apb_req_t  ( soc_apb_req_t ),
    .apb_rsp_t  ( soc_apb_resp_t )
) gpio (

    .clk_i  ( clk  ),
    .rst_ni ( ~rst ),

    .gpio_in         ( gpio_in            ),
    .gpio_out        ( gpio_out           ),
    .gpio_tx_en_o    ( gpio_tx_en         ),
    .gpio_in_sync_o  ( gpio_in_sync       ),

    .global_interrupt_o     ( gpio_global_irq    ),
    .pin_level_interrupts_o ( gpio_pin_level_irq ),

    .apb_req_i ( gpio_apb_req ),
    .apb_rsp_o ( gpio_apb_rsp )
);

//UART
soc_apb_req_t  uart_apb_req;
soc_apb_resp_t uart_apb_rsp;
wire uart_intr;   // PLIC source 1 (see PLIC section below)

assign uart_apb_req.paddr   = PADDR;
assign uart_apb_req.pprot   = '0;
assign uart_apb_req.psel    = uart_PSEL;
assign uart_apb_req.penable = PENABLE;
assign uart_apb_req.pwrite  = PWRITE;
assign uart_apb_req.pwdata  = PWDATA;
assign uart_apb_req.pstrb   = 4'hF;  // this SoC has no byte-strobe concept elsewhere either

assign uart_PRDATA = uart_apb_rsp.prdata;
assign uart_PREADY = uart_apb_rsp.pready;

apb_uart_wrap #(
    .apb_req_t ( soc_apb_req_t ),
    .apb_rsp_t ( soc_apb_resp_t )
) uart (

    .clk_i  ( clk  ),
    .rst_ni ( ~rst ),

    .apb_req_i ( uart_apb_req ),
    .apb_rsp_o ( uart_apb_rsp ),

    .intr_o  ( uart_intr ),
    .out1_no (           ),  // modem-control lines: not used by this SoC
    .out2_no (           ),
    .rts_no  (           ),
    .dtr_no  (           ),
    .cts_ni  ( 1'b1 ),       // active-low: tied inactive (no flow control)
    .dsr_ni  ( 1'b1 ),
    .dcd_ni  ( 1'b1 ),
    .rin_ni  ( 1'b1 ),

    .sin_i  ( uart_rx ),
    .sout_o ( uart_tx )
);

//PLIC (external interrupt controller)
//
// Source 1 (register-visible numbering) = uart_intr (UART RX-data-ready /
// line-status / THR-empty, whichever the UART's own IER has enabled).
// Source 2 = gpio_global_irq (GPIO's OR of all its per-pin interrupt
// causes). Sources 3..30 are wired zero -- free for future peripherals.
// Target 0's eip line feeds the core's meip (mip.MEIP); target 1 is
// unused (this is a single-hart, single-context design).
wire [29:0] plic_irq_sources;
wire [1:0]  plic_eip_targets;

assign plic_irq_sources = {28'b0, gpio_global_irq, uart_intr};

apb_plic_wrapper plic (

    .PCLK(clk),
    .PRESETn(~rst),

    .PSEL(plic_PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),

    .PRDATA(plic_PRDATA),
    .PREADY(plic_PREADY),

    .irq_sources_i(plic_irq_sources),
    .eip_targets_o(plic_eip_targets)
);

endmodule