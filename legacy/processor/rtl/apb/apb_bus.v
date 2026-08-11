module apb_bus (

    // From APB master
    input PSEL,
    input PENABLE,
    input PWRITE,
    input [31:0] PADDR,
    input [31:0] PWDATA,

    output reg [31:0] PRDATA,
    output reg PREADY,

    // Decoder selects
    input sel_ascon,
    input sel_uart,
    input sel_gpio,
    input sel_spi,
    input sel_i2c,
    input sel_plic,
    input sel_timer,
    input sel_clint,

    // Peripheral inputs
    input [31:0] ascon_PRDATA,
    input [31:0] uart_PRDATA,
    input [31:0] gpio_PRDATA,
    input [31:0] spi_PRDATA,
    input [31:0] i2c_PRDATA,
    input [31:0] plic_PRDATA,
    input [31:0] timer_PRDATA,
    input [31:0] clint_PRDATA,

    input ascon_PREADY,
    input uart_PREADY,
    input gpio_PREADY,
    input spi_PREADY,
    input i2c_PREADY,
    input plic_PREADY,
    input timer_PREADY,
    input clint_PREADY,

    // Outputs to peripherals
    output ascon_PSEL,
    output uart_PSEL,
    output gpio_PSEL,
    output spi_PSEL,
    output i2c_PSEL,
    output plic_PSEL,
    output timer_PSEL,
    output clint_PSEL,

    output PENABLE_out,
    output PWRITE_out,
    output [31:0] PADDR_out,
    output [31:0] PWDATA_out
);

    // =========================
    // SIGNAL FORWARDING
    // =========================
    assign PENABLE_out = PENABLE;
    assign PWRITE_out  = PWRITE;
    assign PADDR_out   = PADDR;
    assign PWDATA_out  = PWDATA;

    // =========================
    // PSEL GENERATION
    // =========================
    assign ascon_PSEL = PSEL & sel_ascon;
    assign uart_PSEL  = PSEL & sel_uart;
    assign gpio_PSEL  = PSEL & sel_gpio;
    assign spi_PSEL   = PSEL & sel_spi;
    assign i2c_PSEL   = PSEL & sel_i2c;
    assign plic_PSEL  = PSEL & sel_plic;
    assign timer_PSEL = PSEL & sel_timer;
    assign clint_PSEL = PSEL & sel_clint;

    // =========================
    // READ DATA MUX
    // =========================
    always @(*) begin
        case (1'b1)
            sel_ascon: PRDATA = ascon_PRDATA;
            sel_uart : PRDATA = uart_PRDATA;
            sel_gpio : PRDATA = gpio_PRDATA;
            sel_spi  : PRDATA = spi_PRDATA;
            sel_i2c  : PRDATA = i2c_PRDATA;
            sel_plic : PRDATA = plic_PRDATA;
            sel_timer: PRDATA = timer_PRDATA;
            sel_clint: PRDATA = clint_PRDATA;
            default  : PRDATA = 32'h0;
        endcase
    end

    // =========================
    // READY MUX
    // =========================
    always @(*) begin
        case (1'b1)
            sel_ascon: PREADY = ascon_PREADY;
            sel_uart : PREADY = uart_PREADY;
            sel_gpio : PREADY = gpio_PREADY;
            sel_spi  : PREADY = spi_PREADY;
            sel_i2c  : PREADY = i2c_PREADY;
            sel_plic : PREADY = plic_PREADY;
            sel_timer: PREADY = timer_PREADY;
            sel_clint: PREADY = clint_PREADY;
            default  : PREADY = 1'b1;
        endcase
    end

endmodule