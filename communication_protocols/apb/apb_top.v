module apb_top (

    input clk,
    input rst,

    // =========================
    // CPU INTERFACE (from MEM stage)
    // =========================
    input [31:0] addr,
    input [31:0] wdata,
    input mem_read,
    input mem_write,

    output [31:0] rdata,
    output stall_mem,

    // =========================
    // MEMORY INTERFACE
    // =========================
    input [31:0] mem_rdata,

    // =========================
    // PERIPHERAL SIDE (example inputs)
    // =========================
    input [31:0] uart_PRDATA,
    input uart_PREADY,

    input [31:0] gpio_PRDATA,
    input gpio_PREADY,

    input [31:0] spi_PRDATA,
    input spi_PREADY,

    input [31:0] ascon_PRDATA,
    input ascon_PREADY,

    input [31:0] i2c_PRDATA,
    input i2c_PREADY,

    input [31:0] plic_PRDATA,
    input plic_PREADY,

    input [31:0] timer_PRDATA,
    input timer_PREADY,

    input [31:0] clint_PRDATA,
    input clint_PREADY

);

    // =========================
    // DECODER SIGNALS
    // =========================
    wire sel_mem, sel_ascon, sel_uart, sel_gpio;
    wire sel_spi, sel_i2c, sel_plic, sel_timer, sel_clint;
// ADD THIS WIRE
wire [1:0] apb_state;

wire apb_busy;


    // =========================
    // APB MASTER SIGNALS
    // =========================
    wire PSEL, PENABLE, PWRITE;
    wire [31:0] PADDR, PWDATA;
    wire [31:0] PRDATA;
    wire PREADY;
    wire [31:0] apb_rdata;
    wire apb_ready;

    // =========================
    // BUS → PERIPHERAL SIGNALS
    // =========================
    wire ascon_PSEL, uart_PSEL, gpio_PSEL, spi_PSEL;
    wire i2c_PSEL, plic_PSEL, timer_PSEL, clint_PSEL;

    wire PENABLE_out, PWRITE_out;
    wire [31:0] PADDR_out, PWDATA_out;

    // ============================================================
    // 1. ADDRESS DECODER
    // ============================================================
    addr_decoder u_decoder (
        .addr(addr),

        .sel_mem(sel_mem),
        .sel_ascon(sel_ascon),
        .sel_uart(sel_uart),
        .sel_gpio(sel_gpio),
        .sel_spi(sel_spi),
        .sel_i2c(sel_i2c),
        .sel_plic(sel_plic),
        .sel_timer(sel_timer),
        .sel_clint(sel_clint)
    );

    // ============================================================
    // 2. APB MASTER (only active for peripherals)
    // ============================================================
  apb_master u_apb_master (
    .clk(clk),
    .rst(rst),

    .addr(addr),
    .wdata(wdata),

    .mem_read(mem_read & ~sel_mem),
    .mem_write(mem_write & ~sel_mem),

    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),

    .PRDATA(PRDATA),
    .PREADY(PREADY),

    .rdata(apb_rdata),
    .ready(apb_ready),

    .debug_state(apb_state),
    .busy(apb_busy)
);
    // ============================================================
    // 3. APB BUS
    // ============================================================
    apb_bus u_apb_bus (

        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),

        .PRDATA(PRDATA),
        .PREADY(PREADY),

        // decoder selects
        .sel_ascon(sel_ascon),
        .sel_uart(sel_uart),
        .sel_gpio(sel_gpio),
        .sel_spi(sel_spi),
        .sel_i2c(sel_i2c),
        .sel_plic(sel_plic),
        .sel_timer(sel_timer),
        .sel_clint(sel_clint),

        // peripheral inputs
        .ascon_PRDATA(ascon_PRDATA),
        .uart_PRDATA(uart_PRDATA),
        .gpio_PRDATA(gpio_PRDATA),
        .spi_PRDATA(spi_PRDATA),
        .i2c_PRDATA(i2c_PRDATA),
        .plic_PRDATA(plic_PRDATA),
        .timer_PRDATA(timer_PRDATA),
        .clint_PRDATA(clint_PRDATA),

        .ascon_PREADY(ascon_PREADY),
        .uart_PREADY(uart_PREADY),
        .gpio_PREADY(gpio_PREADY),
        .spi_PREADY(spi_PREADY),
        .i2c_PREADY(i2c_PREADY),
        .plic_PREADY(plic_PREADY),
        .timer_PREADY(timer_PREADY),
        .clint_PREADY(clint_PREADY),

        // outputs to peripherals
        .ascon_PSEL(ascon_PSEL),
        .uart_PSEL(uart_PSEL),
        .gpio_PSEL(gpio_PSEL),
        .spi_PSEL(spi_PSEL),
        .i2c_PSEL(i2c_PSEL),
        .plic_PSEL(plic_PSEL),
        .timer_PSEL(timer_PSEL),
        .clint_PSEL(clint_PSEL),

        .PENABLE_out(PENABLE_out),
        .PWRITE_out(PWRITE_out),
        .PADDR_out(PADDR_out),
        .PWDATA_out(PWDATA_out)
    );

    // ============================================================
    // 4. MEM/APB MUX
    // ============================================================
  mem_apb_mux u_mux (
    .sel_mem(sel_mem),
    .mem_read(mem_read),

    .r_data_mem(mem_rdata),
    .r_data_periph(apb_rdata),

    .busy_apb(apb_busy),

    .r_data_out(rdata),
    .stall_mem(stall_mem)
);

endmodule