`timescale 1ns/1ps

module tb_apb_top;

////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////

parameter CLK_PERIOD = 10;

////////////////////////////////////////////////////////////
// Clock & Reset
////////////////////////////////////////////////////////////

reg clk;
reg rst;

////////////////////////////////////////////////////////////
// CPU Interface
////////////////////////////////////////////////////////////

reg  [31:0] addr;
reg  [31:0] wdata;

reg mem_read;
reg mem_write;

wire [31:0] rdata;
wire stall_mem;

////////////////////////////////////////////////////////////
// Memory Model Interface
////////////////////////////////////////////////////////////

reg [31:0] mem_rdata;

////////////////////////////////////////////////////////////
// Peripheral Read Data
////////////////////////////////////////////////////////////

reg [31:0] uart_PRDATA;
reg [31:0] gpio_PRDATA;
reg [31:0] spi_PRDATA;
reg [31:0] ascon_PRDATA;
reg [31:0] i2c_PRDATA;
reg [31:0] plic_PRDATA;
reg [31:0] timer_PRDATA;
reg [31:0] clint_PRDATA;

////////////////////////////////////////////////////////////
// Peripheral Ready
////////////////////////////////////////////////////////////

reg uart_PREADY;
reg gpio_PREADY;
reg spi_PREADY;
reg ascon_PREADY;
reg i2c_PREADY;
reg plic_PREADY;
reg timer_PREADY;
reg clint_PREADY;

////////////////////////////////////////////////////////////
// APB Outputs
////////////////////////////////////////////////////////////

wire uart_PSEL;

wire PENABLE_out;
wire PWRITE_out;

wire [31:0] PADDR_out;
wire [31:0] PWDATA_out;

////////////////////////////////////////////////////////////
// DUT
////////////////////////////////////////////////////////////

apb_top dut(

    .clk(clk),
    .rst(rst),

    //-----------------------------
    // CPU Side
    //-----------------------------

    .addr(addr),
    .wdata(wdata),

    .mem_read(mem_read),
    .mem_write(mem_write),

    .rdata(rdata),
    .stall_mem(stall_mem),

    //-----------------------------
    // Memory
    //-----------------------------

    .mem_rdata(mem_rdata),

    //-----------------------------
    // UART
    //-----------------------------

    .uart_PRDATA(uart_PRDATA),
    .uart_PREADY(uart_PREADY),

    //-----------------------------
    // GPIO
    //-----------------------------

    .gpio_PRDATA(gpio_PRDATA),
    .gpio_PREADY(gpio_PREADY),

    //-----------------------------
    // SPI
    //-----------------------------

    .spi_PRDATA(spi_PRDATA),
    .spi_PREADY(spi_PREADY),

    //-----------------------------
    // ASCON
    //-----------------------------

    .ascon_PRDATA(ascon_PRDATA),
    .ascon_PREADY(ascon_PREADY),

    //-----------------------------
    // I2C
    //-----------------------------

    .i2c_PRDATA(i2c_PRDATA),
    .i2c_PREADY(i2c_PREADY),

    //-----------------------------
    // PLIC
    //-----------------------------

    .plic_PRDATA(plic_PRDATA),
    .plic_PREADY(plic_PREADY),

    //-----------------------------
    // TIMER
    //-----------------------------

    .timer_PRDATA(timer_PRDATA),
    .timer_PREADY(timer_PREADY),

    //-----------------------------
    // CLINT
    //-----------------------------

    .clint_PRDATA(clint_PRDATA),
    .clint_PREADY(clint_PREADY),

    //-----------------------------
    // APB Outputs
    //-----------------------------

    .uart_PSEL(uart_PSEL),

    .PENABLE_out(PENABLE_out),
    .PWRITE_out(PWRITE_out),

    .PADDR_out(PADDR_out),
    .PWDATA_out(PWDATA_out)
);

////////////////////////////////////////////////////////////
// Clock Generation
////////////////////////////////////////////////////////////

initial begin

    clk = 0;

    forever #(CLK_PERIOD/2)
        clk = ~clk;

end

////////////////////////////////////////////////////////////
// Reset Generation
////////////////////////////////////////////////////////////

initial begin

    rst = 1;

    addr = 32'h0;
    wdata = 32'h0;

    mem_read = 0;
    mem_write = 0;

    repeat(5)
        @(posedge clk);

    rst = 0;

end // see here for ;


////////////////////////////////////////////////////////////
// Dummy Memory Model
////////////////////////////////////////////////////////////

always @(*) begin

    case(addr)

        32'h0000_0000 : mem_rdata = 32'h11111111;
        32'h0000_0004 : mem_rdata = 32'h22222222;
        32'h0000_0008 : mem_rdata = 32'h33333333;
        32'h0000_000C : mem_rdata = 32'h44444444;

        default : mem_rdata = 32'hDEADBEEF;

    endcase

end

////////////////////////////////////////////////////////////
// Dummy Peripheral Data
////////////////////////////////////////////////////////////

initial begin

    spi_PRDATA   = 32'hDDDDDDDD;
    uart_PRDATA  = 32'hBBBBBBBB;
    gpio_PRDATA  = 32'hCCCCCCCC;
    ascon_PRDATA = 32'hAAAAAAAA;
    i2c_PRDATA   = 32'hEEEEEEEE;
    plic_PRDATA  = 32'h12345678;
    timer_PRDATA = 32'h87654321;
    clint_PRDATA = 32'hCAFEBABE;

end

////////////////////////////////////////////////////////////
// Peripheral Ready Signals
////////////////////////////////////////////////////////////

reg spi_wait_enable;
integer spi_wait_count;

initial begin

    ascon_PREADY = 1'b1;
    uart_PREADY  = 1'b1;
    gpio_PREADY  = 1'b1;
    i2c_PREADY   = 1'b1;
    plic_PREADY  = 1'b1;
    timer_PREADY = 1'b1;
    clint_PREADY = 1'b1;

end

////////////////////////////////////////////////////////////
// SPI Wait State Generator
////////////////////////////////////////////////////////////

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        spi_wait_count <= 0;
        spi_PREADY     <= 1'b1;
    end

    else
    begin

        if(spi_wait_enable)
        begin

            if(dut.u_apb_master.debug_state == 2'b10)   // ACCESS State
            begin

                if(spi_wait_count < 3)
                begin
                    spi_wait_count <= spi_wait_count + 1;
                    spi_PREADY <= 1'b0;
                end
                else
                begin
                    spi_PREADY <= 1'b1;
                end

            end
            else
            begin
                spi_wait_count <= 0;
                spi_PREADY <= 1'b1;
            end

        end

        else
        begin
            spi_wait_count <= 0;
            spi_PREADY <= 1'b1;
        end

    end

end

////////////////////////////////////////////////////////////
// PASS / FAIL Counters
////////////////////////////////////////////////////////////

integer pass_count;
integer fail_count;
integer test_num;

initial begin
    pass_count = 0;
    fail_count = 0;
    test_num   = 0;
end

////////////////////////////////////////////////////////////
// PASS Task
////////////////////////////////////////////////////////////

task automatic pass_test;

begin
    pass_count = pass_count + 1;

    $display("\n========================================");
    $display("TEST %0d : PASS", test_num);
    $display("========================================\n");
end

endtask

////////////////////////////////////////////////////////////
// FAIL Task
////////////////////////////////////////////////////////////

task automatic fail_test;

input [256*8-1:0] msg;

begin

    fail_count = fail_count + 1;

    $display("\n========================================");
    $display("TEST %0d : FAIL", test_num);
    $display("%s",msg);
    $display("========================================\n");

end

endtask

////////////////////////////////////////////////////////////
// Memory Read Task
////////////////////////////////////////////////////////////

task automatic mem_read_task;

input [31:0] address;

begin

    @(posedge clk);

    addr      <= address;
    mem_read  <= 1'b1;
    mem_write <= 1'b0;

    @(posedge clk);

    mem_read <= 1'b0;

end

endtask

////////////////////////////////////////////////////////////
// Memory Write Task
////////////////////////////////////////////////////////////

task automatic mem_write_task;

input [31:0] address;
input [31:0] data;

begin

    @(posedge clk);

    addr      <= address;
    wdata     <= data;
    mem_write <= 1'b1;
    mem_read  <= 1'b0;

    @(posedge clk);

    mem_write <= 1'b0;

end

endtask

////////////////////////////////////////////////////////////
// Peripheral Read Task
////////////////////////////////////////////////////////////

task automatic peripheral_read_task;

input [31:0] address;

begin

    @(posedge clk);

    addr      <= address;
    mem_read  <= 1'b1;
    mem_write <= 1'b0;

    wait(stall_mem);

    wait(!stall_mem);
    // @(posedge clk);
    // @(posedge clk);
    

    @(posedge clk);

    mem_read <= 1'b0;

end

endtask

////////////////////////////////////////////////////////////
// Peripheral Write Task
////////////////////////////////////////////////////////////

task automatic peripheral_write_task;

input [31:0] address;
input [31:0] data;

begin

    @(posedge clk);

    addr      <= address;
    wdata     <= data;
    mem_write <= 1'b1;
    mem_read  <= 1'b0;

    wait(stall_mem);

    wait(!stall_mem);

    @(posedge clk);

    mem_write <= 1'b0;

end

endtask

////////////////////////////////////////////////////////////
// Check Equal Task
////////////////////////////////////////////////////////////

task automatic check_equal;

input [31:0] expected;
input [31:0] actual;
input [256*8-1:0] msg;

begin

    test_num = test_num + 1;

    if(expected === actual)
        pass_test();
    else
    begin

        $display("Expected = %h",expected);
        $display("Actual   = %h",actual);

        fail_test(msg);

    end

end

endtask

////////////////////////////////////////////////////////////
// Check Bit Task
////////////////////////////////////////////////////////////

task automatic check_bit;

input expected;
input actual;
input [256*8-1:0] msg;

begin

    test_num = test_num + 1;

    if(expected === actual)
        pass_test();
    else
    begin

        $display("Expected = %b",expected);
        $display("Actual   = %b",actual);

        fail_test(msg);

    end

end

endtask

////////////////////////////////////////////////////////////
// Waveform Dump
////////////////////////////////////////////////////////////

initial begin

    $dumpfile("apb_top.vcd");
    $dumpvars(0, tb_apb_top);

end

////////////////////////////////////////////////////////////
// APB Monitor
////////////////////////////////////////////////////////////

// always @(posedge clk)
// begin

//     if(!rst)
//     begin

//         $display("-------------------------------------------------------------");
//         $display("TIME      : %0t",$time);
//         $display("ADDR      : %h",addr);
//         $display("MEM_RD    : %b",mem_read);
//         $display("MEM_WR    : %b",mem_write);
//         $display("STALL     : %b",stall_mem);

//         $display("PADDR     : %h",PADDR_out);
//         $display("PWDATA    : %h",PWDATA_out);
//         $display("PENABLE   : %b",PENABLE_out);
//         $display("PWRITE    : %b",PWRITE_out);

//         $display("UART_PSEL : %b",uart_PSEL);

//         $display("RDATA     : %h",rdata);

//     end

// end

////////////////////////////////////////////////////////////
// Main Test Sequence
////////////////////////////////////////////////////////////

initial
begin

    //--------------------------------------------------------
    // Wait for Reset
    //--------------------------------------------------------

    wait(rst==0);

    repeat(2) @(posedge clk);

    ///////////////////////////////////////////////////////////
    // TEST-1 : Memory Read
    ///////////////////////////////////////////////////////////

    $display("\nTEST-1 : MEMORY READ\n");

    mem_read_task(32'h0000_0000);

    check_equal(32'h11111111,
                rdata,
                "Memory Read Failed");

    ///////////////////////////////////////////////////////////
    // TEST-2 : Memory Write
    ///////////////////////////////////////////////////////////

    $display("\nTEST-2 : MEMORY WRITE\n");

    mem_write_task(32'h0000_0008,
                   32'hA5A5A5A5);

    check_bit(1'b0,
              stall_mem,
              "Memory Write should not stall");

    ///////////////////////////////////////////////////////////
    // TEST-3 : No Read No Write (Memory Address)
    ///////////////////////////////////////////////////////////

    $display("\nTEST-3 : IDLE MEMORY ADDRESS\n");

    @(posedge clk);

    addr      <= 32'h00000004;
    mem_read  <= 0;
    mem_write <= 0;

    repeat(2) @(posedge clk);

    check_bit(1'b0,
              stall_mem,
              "Idle Memory generated stall");

    ///////////////////////////////////////////////////////////
    // TEST-4 : No Read No Write (Peripheral Address)
    ///////////////////////////////////////////////////////////

    $display("\nTEST-4 : IDLE PERIPHERAL ADDRESS\n");

    @(posedge clk);

    addr      <= 32'h40003000;
    mem_read  <= 0;
    mem_write <= 0;

    repeat(2) @(posedge clk);

    check_bit(1'b0,
              stall_mem,
              "Idle Peripheral generated stall");

    ///////////////////////////////////////////////////////////
    // TEST-5 : SPI READ
    ///////////////////////////////////////////////////////////

    $display("\nTEST-5 : SPI READ\n");

    peripheral_read_task(32'h40003000);

    @(posedge clk);

    check_equal(32'hDDDDDDDD,
                rdata,
                "SPI Read Failed");

    ///////////////////////////////////////////////////////////
    // TEST-6 : SPI WRITE
    ///////////////////////////////////////////////////////////

    $display("\nTEST-6 : SPI WRITE\n");

    peripheral_write_task(
                32'h40003000,
                32'h55AA1234);

    check_equal(32'h40003000,
                PADDR_out,
                "Wrong APB Address");

    check_equal(32'h55AA1234,
                PWDATA_out,
                "Wrong APB Write Data");

    check_bit(1'b1,
              PWRITE_out,
              "PWRITE not asserted");

    ///////////////////////////////////////////////////////////
    // Wait
    ///////////////////////////////////////////////////////////

    repeat(5)
        @(posedge clk);

    ///////////////////////////////////////////////////////////
    // TEST-7 : UART READ
    ///////////////////////////////////////////////////////////

    $display("\nTEST-7 : UART READ\n");

    peripheral_read_task(32'h40001000);

    @(posedge clk);

    check_equal(32'hBBBBBBBB,
                rdata,
                "UART Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-8 : GPIO READ
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-8 : GPIO READ\n");

    peripheral_read_task(32'h40002000);

        @(posedge clk);


    check_equal(32'hCCCCCCCC,
                rdata,
                "GPIO Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-9 : ASCON READ
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-9 : ASCON READ\n");

    peripheral_read_task(32'h40000000);

        @(posedge clk);


    check_equal(32'hAAAAAAAA,
                rdata,
                "ASCON Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-10 : I2C READ
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-10 : I2C READ\n");

    peripheral_read_task(32'h40004000);

        @(posedge clk);


    check_equal(32'hEEEEEEEE,
                rdata,
                "I2C Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-11 : PLIC READ
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-11 : PLIC READ\n");

    peripheral_read_task(32'h40005000);

    check_equal(32'h12345678,
                rdata,
                "PLIC Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-12 : TIMER READ
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-12 : TIMER READ\n");

    peripheral_read_task(32'h40006000);

        @(posedge clk);


    check_equal(32'h87654321,
                rdata,
                "Timer Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-13 : CLINT READ
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-13 : CLINT READ\n");

    peripheral_read_task(32'h40007000);

        @(posedge clk);


    check_equal(32'hCAFEBABE,
                rdata,
                "CLINT Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-14 : SPI WAIT STATE
    // ///////////////////////////////////////////////////////////

    // $display("\nTEST-14 : SPI WAIT STATE\n");

    // spi_wait_enable = 1;

    // peripheral_read_task(32'h40003000);

    // spi_wait_enable = 0;

    // check_equal(32'hDDDDDDDD,
    //             rdata,
    //             "SPI Wait-State Read Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-15 : Back-to-Back Peripheral Reads
    // ///////////////////////////////////////////////////////////

    $display("\nTEST-15 : BACK-TO-BACK PERIPHERAL READS\n");

    peripheral_read_task(32'h40001000);
    peripheral_read_task(32'h40002000);
    peripheral_read_task(32'h40003000);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);

    check_equal(32'hDDDDDDDD,
                rdata,
                "Back-to-Back Peripheral Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-16 : Back-to-Back Memory Reads
    // ///////////////////////////////////////////////////////////

    // $display("\nTEST-16 : BACK-TO-BACK MEMORY READS\n");

    mem_read_task(32'h00000000);
    mem_read_task(32'h00000004);
    mem_read_task(32'h00000008);
    mem_read_task(32'h0000000C);

    check_equal(32'h44444444,
                rdata,
                "Back-to-Back Memory Failed");

    // ///////////////////////////////////////////////////////////
    // // TEST-17 : Invalid Address
    // ///////////////////////////////////////////////////////////

    // $display("\nTEST-17 : INVALID ADDRESS\n");

    // addr      <= 32'h90000000;
    // mem_read  <= 1'b1;
    // mem_write <= 1'b0;

    // repeat(3)
    //     @(posedge clk);

    // mem_read <= 1'b0;

    // check_bit(1'b0,
    //           stall_mem,
    //           "Invalid Address Generated Stall");

    // ///////////////////////////////////////////////////////////
    // // FINAL SUMMARY
    // ///////////////////////////////////////////////////////////

    // $display("\n");
    // $display("=======================================");
    // $display("         TEST SUMMARY");
    // $display("=======================================");
    // $display("TOTAL TESTS : %0d", test_num);
    // $display("PASS        : %0d", pass_count);
    // $display("FAIL        : %0d", fail_count);
    // $display("=======================================");

    // if(fail_count == 0)
    //     $display("******** ALL TESTS PASSED ********");
    // else
    //     $display("******** SOME TESTS FAILED ********");

    repeat(10)
        @(posedge clk);

    $finish;

end

endmodule