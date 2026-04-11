`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2026 17:33:53
// Design Name: 
// Module Name: apb_uart_tb
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

module apb_uart_tb;

  // ==============================
  // Signals
  // ==============================
  reg CLK;
  reg RSTN;

  reg        PSEL;
  reg        PENABLE;
  reg        PWRITE;
  reg [2:0]  PADDR;
  reg [31:0] PWDATA;

  wire [31:0] PRDATA;
  wire        PREADY;
  wire        PSLVERR;

  wire SOUT;
  wire SIN;

  // 🔁 LOOPBACK
  assign SIN = SOUT;    //TX output is directly fed into the RX input

  // ==============================
  // DUT
  // ==============================
  apb_uart dut (
    .CLK(CLK),
    .RSTN(RSTN),

    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),

    .PRDATA(PRDATA),
    .PREADY(PREADY),
    .PSLVERR(PSLVERR),

    .SIN(SIN),
    .SOUT(SOUT),

    .CTSN(1'b0),
    .DSRN(1'b0),
    .DCDN(1'b0),
    .RIN(1'b0),

    .INT(),
    .OUT1N(),
    .OUT2N(),
    .RTSN(),
    .DTRN()
  );

  // ==============================
  // Clock
  // ==============================
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  // ==============================
  // Reset
  // ==============================
  initial begin
    RSTN = 0;
    #50;
    RSTN = 1;
  end

  // ==============================
  // APB WRITE
  // ==============================
  task apb_write(input [2:0] addr, input [31:0] data);
    begin
      @(posedge CLK);       //SETUP phase
      PSEL    = 1;
      PENABLE = 0;
      PWRITE  = 1;
      PADDR   = addr;
      PWDATA  = data;

      @(posedge CLK);       //ENABLE phase
      PENABLE = 1;

      wait(PREADY);         //wait until UART finishes operation(through OBI)

      @(posedge CLK);
      PSEL    = 0;
      PENABLE = 0;
    end
  endtask

  // ==============================
  // APB READ
  // ==============================
  task apb_read(input [2:0] addr);
    begin
      @(posedge CLK);
      PSEL    = 1;
      PENABLE = 0;
      PWRITE  = 0;
      PADDR   = addr;

      @(posedge CLK);
      PENABLE = 1;

      wait(PREADY);

      @(posedge CLK);
      $display("READ [%0t] ADDR=%0d DATA=%h", $time, addr, PRDATA);

      PSEL    = 0;
      PENABLE = 0;
    end
  endtask

  // ==============================
  // TEST
  // ==============================
  initial begin

    // Init
    PSEL = 0;
    PENABLE = 0;
    PWRITE = 0;
    PADDR = 0;
    PWDATA = 0;

    wait(RSTN);
    #20;

    // =============================
    // UART CONFIG
    // =============================
    apb_write(3'b011, 32'h00000080); // DLAB
    apb_write(3'b000, 32'h00000002); // DLL
    apb_write(3'b001, 32'h00000000); // DLM
    apb_write(3'b011, 32'h00000003); // 8-bit
    apb_write(3'b010, 32'h00000001); // FIFO enable

    #5000;

    // =============================
    // TEST 1: SINGLE CHAR
    // =============================
    $display("---- TEST 1: SINGLE CHAR ----");

    apb_write(3'b000, 32'h00000041); // 'A'

    #100000;

    apb_read(3'b101); // LSR
    apb_read(3'b000); // RHR

    // =============================
    // TEST 2: MULTIPLE CHARS
    // =============================
    $display("---- TEST 2: MULTIPLE CHARS ----");
    
    //$monitor("TIME=%0t | SOUT=%b", $time, SOUT);

    apb_write(3'b000, 32'h00000042); // 'B'
    apb_write(3'b000, 32'h00000043); // 'C'
    apb_write(3'b000, 32'h00000044); // 'D'

    #200000;

    apb_read(3'b000);
    apb_read(3'b000);
    apb_read(3'b000);

    // =============================
    // TEST 3: STATUS CHECK
    // =============================
    $display("---- TEST 3: STATUS ----");

    apb_read(3'b101); // LSR

    #50000;

    $finish;
  end

endmodule