`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2026 23:47:09
// Design Name: 
// Module Name: gpio_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module gpio_tb;

  import apb_pkg::*;

  //-----------------------------------
  // Clock & Reset
  //-----------------------------------
  logic pclk;
  logic rst_n;

  //-----------------------------------
  // GPIO
  //-----------------------------------
  logic [31:0] gpio_in;
  logic [31:0] gpio_out;

  //-----------------------------------
  // APB Interface
  //-----------------------------------
  APB apb_if();

  //-----------------------------------
  // Clock Generation
  //-----------------------------------
  initial pclk = 0;
  always #5 pclk = ~pclk;

  //-----------------------------------
  // DUT
  //-----------------------------------
  gpio_apb_wrap_intf DUT (
    .clk_i                (pclk),
    .rst_ni               (rst_n),
    .gpio_in              (gpio_in),
    .gpio_out             (gpio_out),
    .gpio_tx_en_o         (),
    .gpio_in_sync_o       (),
    .global_interrupt_o   (),
    .pin_level_interrupts_o(),
    .apb_slave            (apb_if)
  );

  //-----------------------------------
  // APB WRITE TASK
  //-----------------------------------
  task automatic apb_write(
    input [31:0] addr,
    input [31:0] data
  );
  begin

    @(posedge pclk);

    apb_if.psel    <= 1'b1;
    apb_if.penable <= 1'b0;
    apb_if.pwrite  <= 1'b1;
    apb_if.paddr   <= addr;
    apb_if.pwdata  <= data;
    apb_if.pprot   <= 3'b000;
    apb_if.pstrb   <= 4'hF;

    @(posedge pclk);
    apb_if.penable <= 1'b1;

    @(posedge pclk);

    apb_if.psel    <= 1'b0;
    apb_if.penable <= 1'b0;
    apb_if.pwrite  <= 1'b0;

    $display("[%0t] WRITE ADDR=%h DATA=%h",
             $time, addr, data);

  end
  endtask

  //-----------------------------------
  // APB READ TASK
  //-----------------------------------
  task automatic apb_read(
    input [31:0] addr
  );
  begin

    @(posedge pclk);

    apb_if.psel    <= 1'b1;
    apb_if.penable <= 1'b0;
    apb_if.pwrite  <= 1'b0;
    apb_if.paddr   <= addr;
    apb_if.pprot   <= 3'b000;

    @(posedge pclk);
    apb_if.penable <= 1'b1;

    @(posedge pclk);

    $display("[%0t] READ ADDR=%h DATA=%h",
             $time, addr, apb_if.prdata);

    apb_if.psel    <= 1'b0;
    apb_if.penable <= 1'b0;

  end
  endtask

  //-----------------------------------
  // Test Sequence
  //-----------------------------------
  initial begin

    //--------------------------------
    // Initialization
    //--------------------------------
    gpio_in = 32'h0;

    apb_if.psel    = 0;
    apb_if.penable = 0;
    apb_if.pwrite  = 0;
    apb_if.paddr   = 0;
    apb_if.pwdata  = 0;
    apb_if.pprot   = 0;
    apb_if.pstrb   = 0;

    //--------------------------------
    // Reset
    //--------------------------------
    rst_n = 0;

    repeat(5) @(posedge pclk);

    rst_n = 1;

    repeat(2) @(posedge pclk);

    $display("\n================================");
    $display(" GPIO APB TEST START ");
    $display("================================\n");

    //--------------------------------
    // Read INFO Register
    //--------------------------------
    apb_read(32'h000);

    //--------------------------------
    // Configure GPIO Mode
    // 01 = OUTPUT_ACTIVE
    //--------------------------------
    apb_write(32'h008, 32'h55555555);
    apb_write(32'h00C, 32'h55555555);

    //--------------------------------
    // Enable GPIOs
    //--------------------------------
    apb_write(32'h080, 32'hFFFFFFFF);

    //--------------------------------
    // Write GPIO_OUT
    //--------------------------------
    apb_write(32'h180, 32'hAAAAAAAA);

    #20;

    $display("\nGPIO_OUT = %h\n", gpio_out);

    //--------------------------------
    // Read GPIO_OUT
    //--------------------------------
    apb_read(32'h180);

    //--------------------------------
    // SET Register Test
    //--------------------------------
    apb_write(32'h200, 32'h0000000F);

    #20;

    $display("\nAfter SET GPIO_OUT = %h\n",
             gpio_out);

    //--------------------------------
    // CLEAR Register Test
    //--------------------------------
    apb_write(32'h280, 32'h00000001);

    #20;

    $display("\nAfter CLEAR GPIO_OUT = %h\n",
             gpio_out);

    //--------------------------------
    // TOGGLE Register Test
    //--------------------------------
    apb_write(32'h300, 32'h00000002);

    #20;

    $display("\nAfter TOGGLE GPIO_OUT = %h\n",
             gpio_out);

    //--------------------------------
    // INPUT Test
    //--------------------------------
    gpio_in = 32'hF0F0F0F0;

    #20;

    apb_read(32'h100);

    //--------------------------------
    // Another Input Pattern
    //--------------------------------
    gpio_in = 32'h12345678;

    #20;

    apb_read(32'h100);

    //--------------------------------
    // Read GPIO Enable
    //--------------------------------
    apb_read(32'h080);

    //--------------------------------
    // Read Mode Registers
    //--------------------------------
    apb_read(32'h008);
    apb_read(32'h00C);

    //--------------------------------
    // End Simulation
    //--------------------------------
    #100;

    $display("\n================================");
    $display(" GPIO APB TEST END ");
    $display("================================\n");

    $finish;

  end

endmodule