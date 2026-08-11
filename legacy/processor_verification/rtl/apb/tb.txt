`timescale 1ns/1ps

module apb_top_tb;

    reg clk;
    reg rst;

    // CPU signals
    reg [31:0] addr;
    reg [31:0] wdata;
    reg mem_read;
    reg mem_write;

    wire [31:0] rdata;
    wire stall_mem;

    // Memory
    reg [31:0] mem_rdata;

    // Peripheral mocks
    reg [31:0] uart_PRDATA;
    reg uart_PREADY;

    reg [31:0] gpio_PRDATA;
    reg gpio_PREADY;

    reg [31:0] spi_PRDATA;
    reg spi_PREADY;

    reg [31:0] ascon_PRDATA;
    reg ascon_PREADY;

    reg [31:0] i2c_PRDATA;
    reg i2c_PREADY;

    reg [31:0] plic_PRDATA;
    reg plic_PREADY;

    reg [31:0] timer_PRDATA;
    reg timer_PREADY;

    reg [31:0] clint_PRDATA;
    reg clint_PREADY;

    // DUT
    apb_top dut (
        .clk(clk),
        .rst(rst),

        .addr(addr),
        .wdata(wdata),
        .mem_read(mem_read),
        .mem_write(mem_write),

        .rdata(rdata),
        .stall_mem(stall_mem),

        .mem_rdata(mem_rdata),

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
        .clint_PREADY(clint_PREADY)
    );

    // CLOCK
    always #5 clk = ~clk;

    // =========================
    // TEST SEQUENCE
    // =========================
   initial begin
    $dumpfile("apb_top.vcd");
    $dumpvars(0, apb_top_tb);

    clk = 0;
    rst = 1;

    addr = 0;
    wdata = 0;
    mem_read = 0;
    mem_write = 0;

    // Default peripheral behavior
    uart_PRDATA  = 32'hAABBCCDD;
    gpio_PRDATA  = 32'h12345678;
    spi_PRDATA   = 32'hCAFEBABE;
    ascon_PRDATA = 32'hDEADBEEF;
    i2c_PRDATA   = 32'h0BADBEEF;
    plic_PRDATA  = 32'hFEEDFACE;
    timer_PRDATA = 32'h11221122;
    clint_PRDATA = 32'h33443344;

    mem_rdata    = 32'h11223344;

    uart_PREADY = 1;
    gpio_PREADY = 1;
    spi_PREADY  = 1;
    ascon_PREADY = 1;
    i2c_PREADY = 1;
    plic_PREADY = 1;
    timer_PREADY = 1;
    clint_PREADY = 1;

    #20 rst = 0;

    // =========================================================
    // TEST 1: MEMORY READ
    // =========================================================
    $display("\n=== TEST 1: MEMORY READ ===");

    addr = 32'h0000_0004;
    mem_read = 1;
    #10;
    $display("MEM READ -> rdata=%h stall=%b", rdata, stall_mem);
    mem_read = 0;

    #20;

    // =========================================================
    // TEST 2: MEMORY WRITE (sanity)
    // =========================================================
    $display("\n=== TEST 2: MEMORY WRITE ===");

    addr = 32'h0000_0008;
    wdata = 32'hDEADBEEF;
    mem_write = 1;
    #10;
    $display("MEM WRITE -> stall=%b", stall_mem);
    mem_write = 0;

    #20;

    // =========================================================
    // TEST 3: APB READ (UART with delay)
    // =========================================================
    $display("\n=== TEST 3: APB READ (UART delayed) ===");

    addr = 32'h4000_1000;
    mem_read = 1;

    uart_PREADY = 0;
    #10 $display("Cycle1 stall=%b", stall_mem);
    #10 $display("Cycle2 stall=%b", stall_mem);

    uart_PREADY = 1;
    #10 $display("APB DONE -> rdata=%h stall=%b", rdata, stall_mem);

    mem_read = 0;

    #20;

    // =========================================================
    // TEST 4: APB WRITE
    // =========================================================
    $display("\n=== TEST 4: APB WRITE ===");

    addr = 32'h4000_1000;
    wdata = 32'hCAFED00D;
    mem_write = 1;

    uart_PREADY = 0;
    #10;
    uart_PREADY = 1;
    #10;

    $display("APB WRITE DONE stall=%b", stall_mem);
    mem_write = 0;

    #20;

    // =========================================================
    // TEST 5: BACK-TO-BACK (APB → MEM)
    // =========================================================
    $display("\n=== TEST 5: BACK-TO-BACK ===");

    // APB first
    addr = 32'h4000_1000;
    mem_read = 1;
    uart_PREADY = 0;

    #10;

    // Immediately switch to memory
    addr = 32'h0000_0004;
    mem_read = 1;

    uart_PREADY = 1;
    #10;

    $display("After switch -> rdata=%h stall=%b", rdata, stall_mem);

    mem_read = 0;

    #20;

    // =========================================================
    // TEST 6: MULTI PERIPHERAL SWITCH
    // =========================================================
    $display("\n=== TEST 6: MULTI PERIPHERAL SWITCH ===");

    addr = 32'h4000_1000; // UART
    mem_read = 1;
    #10;

    addr = 32'h4000_2000; // GPIO
    #10;

    addr = 32'h4000_3000; // SPI
    #10;

    $display("SPI READ -> rdata=%h", rdata);

    mem_read = 0;

    #20;

    // =========================================================
    // TEST 7: RANDOM PREADY (STRESS)
    // =========================================================
    $display("\n=== TEST 7: RANDOM PREADY ===");

    addr = 32'h4000_1000;
    mem_read = 1;

    repeat (5) begin
        uart_PREADY = $random % 2;
        #10;
        $display("Random cycle stall=%b ready=%b", stall_mem, uart_PREADY);
    end

    uart_PREADY = 1;
    #10;
    $display("Final READ -> rdata=%h", rdata);

    mem_read = 0;

    #20;

    // =========================================================
    // TEST 8: INVALID ADDRESS
    // =========================================================
    $display("\n=== TEST 8: INVALID ADDRESS ===");

    addr = 32'h9000_0000;
    mem_read = 1;

    #10;
    $display("INVALID ADDR -> rdata=%h stall=%b", rdata, stall_mem);

    mem_read = 0;

    #20;

    // =========================================================
    // TEST COMPLETE
    // =========================================================
    $display("\n=== ALL TESTS DONE ===");
    $finish;
end
initial begin
    $monitor("T=%0t state=%b busy=%b PSEL=%b PENABLE=%b PREADY=%b ready=%b stall=%b",
              $time,
              dut.apb_state,
              dut.apb_busy,
              dut.PSEL,
              dut.PENABLE,
              dut.PREADY,
              dut.apb_ready,
              dut.stall_mem);
end
endmodule