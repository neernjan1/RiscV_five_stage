`timescale 1ns/1ps

module tb_spi_master;

  //---------------------------------------------------------------------------
  // Parameters
  //---------------------------------------------------------------------------
  parameter BUFFER_DEPTH      = 10;
  parameter APB_ADDR_WIDTH    = 12;
  parameter LOG_BUFFER_DEPTH  = 4;

  //---------------------------------------------------------------------------
  // Clock & Reset
  //---------------------------------------------------------------------------
  logic HCLK;
  logic HRESETn;

  //---------------------------------------------------------------------------
  // APB Interface Signals
  //---------------------------------------------------------------------------
  logic [APB_ADDR_WIDTH-1:0] PADDR;
  logic [31:0]               PWDATA;
  logic                      PWRITE;
  logic                      PSEL;
  logic                      PENABLE;
  logic [31:0]               PRDATA;
  logic                      PREADY;
  logic                      PSLVERR;

  //---------------------------------------------------------------------------
  // SPI Interface Signals
  //---------------------------------------------------------------------------
  logic spi_clk;

  logic spi_csn0;
  logic spi_csn1;
  logic spi_csn2;
  logic spi_csn3;

  logic spi_sdo0;
  logic spi_sdo1;
  logic spi_sdo2;
  logic spi_sdo3;

  logic spi_sdi0;
  logic spi_sdi1;
  logic spi_sdi2;
  logic spi_sdi3;

  logic [1:0] events_o;
  logic [1:0] spi_mode;

  logic [31:0] rdata;


  logic [7:0] byte_reg;
    integer bit_cnt;
    integer byte_cnt;

    logic [7:0] cmd_rx;
    logic [7:0] addr_rx;
    logic [7:0] data_rx;


    logic [7:0] slave_data = 8'hB2;

    integer rx_bit;


    //--------------------------------------------------------------------
    // APB WRITE
    //--------------------------------------------------------------------
    task automatic apb_write;

        input [APB_ADDR_WIDTH-1:0] addr;
        input [31:0] data;

    begin

        // ---------------- Setup Phase ----------------
        @(posedge HCLK);

        PADDR   <= addr;
        PWDATA  <= data;
        PWRITE  <= 1'b1;
        PSEL    <= 1'b1;
        PENABLE <= 1'b0;

        // ---------------- Access Phase ----------------
        @(posedge HCLK);

        PENABLE <= 1'b1;

        // ---------------- End Transfer ----------------
        @(posedge HCLK);

        PSEL    <= 1'b0;
        PENABLE <= 1'b0;
        PWRITE  <= 1'b0;
        PADDR   <= '0;
        PWDATA  <= '0;

        $display("[%0t] APB WRITE : ADDR = 0x%0h DATA = 0x%08h",
                $time, addr, data);

    end

    endtask


    //--------------------------------------------------------------------
    // APB READ
    //--------------------------------------------------------------------
    task automatic apb_read;

        input  [APB_ADDR_WIDTH-1:0] addr;
        output [31:0] data;

    begin

        // ---------------- Setup Phase ----------------
        @(posedge HCLK);

        PADDR   <= addr;
        PWRITE  <= 1'b0;
        PSEL    <= 1'b1;
        PENABLE <= 1'b0;

        // ---------------- Access Phase ----------------
        @(posedge HCLK);

        PENABLE <= 1'b1;

        // Read data from slave
        @(posedge HCLK);
        // $display("[%0t] TB: PSEL=%b PENABLE=%b PREADY=%b PRDATA=%08h",
        //  $time, PSEL, PENABLE, PREADY, PRDATA);//for debug
        data = PRDATA;
        // data = dut.u_axiregs.PRDATA;

        // ---------------- End Transfer ----------------
        PSEL    <= 1'b0;
        PENABLE <= 1'b0;
        PADDR   <= '0;

        $display("[%0t] APB READ  : ADDR = 0x%0h DATA = 0x%08h",
                $time, addr, data);

    end

    endtask


  //---------------------------------------------------------------------------
  // DUT
  //---------------------------------------------------------------------------
  apb_spi_master #(
      .BUFFER_DEPTH(BUFFER_DEPTH),
      .APB_ADDR_WIDTH(APB_ADDR_WIDTH)
  ) dut (
      .HCLK(HCLK),
      .HRESETn(HRESETn),

      .PADDR(PADDR),
      .PWDATA(PWDATA),
      .PWRITE(PWRITE),
      .PSEL(PSEL),
      .PENABLE(PENABLE),

      .PRDATA(PRDATA),
      .PREADY(PREADY),
      .PSLVERR(PSLVERR),

      .spi_clk(spi_clk),

      .spi_csn0(spi_csn0),
      .spi_csn1(spi_csn1),
      .spi_csn2(spi_csn2),
      .spi_csn3(spi_csn3),

      .spi_sdo0(spi_sdo0),
      .spi_sdo1(spi_sdo1),
      .spi_sdo2(spi_sdo2),
      .spi_sdo3(spi_sdo3),

      .spi_sdi0(spi_sdi0),
      .spi_sdi1(spi_sdi1),
      .spi_sdi2(spi_sdi2),
      .spi_sdi3(spi_sdi3),
      .events_o(events_o),
      .spi_mode(spi_mode)
  );

  //---------------------------------------------------------------------------
  // Clock Generation (100 MHz)
  //---------------------------------------------------------------------------
  initial begin
      HCLK = 0;
      forever #5 HCLK = ~HCLK;
  end

  //---------------------------------------------------------------------------
  // Reset Generation
  //---------------------------------------------------------------------------
  initial begin

      HRESETn = 0;

      PADDR   = '0;
      PWDATA  = '0;
      PWRITE  = 0;
      PSEL    = 0;
      PENABLE = 0;

      spi_sdi0 = 0;
      spi_sdi1 = 0;
      spi_sdi2 = 0;
      spi_sdi3 = 0;

      repeat(5) @(posedge HCLK);

      HRESETn = 1;

      $display("[%0t] Reset Released",$time);

      


        repeat(2) @(posedge HCLK);

    //     $display("\n==============================");
    //     $display("TEST 1 : CLKDIV Register");
    //     $display("==============================");

    //     apb_write(12'h004, 32'h00000008);

    //     apb_read(12'h004, rdata);

    //     if(rdata == 32'h00000008)
    //         $display("PASS : CLKDIV Register");
    //     else
    //         $display("FAIL : Expected = 0x00000008, Got = %h", rdata);

    // //------------------------------------------------
    // // TEST 2 : SPICMD
    // //------------------------------------------------
    // apb_write(12'h008, 32'h00000003);
    // apb_read(12'h008, rdata);

    // if (rdata == 32'h00000003)
    //     $display("PASS : SPICMD Register");
    // else
    //     $display("FAIL : SPICMD Register");

    // //------------------------------------------------
    // // TEST 3 : SPIADR
    // //------------------------------------------------
    // apb_write(12'h00C, 32'h12345678);
    // apb_read(12'h00C, rdata);

    // if (rdata == 32'h12345678)
    //     $display("PASS : SPIADR Register");
    // else
    //     $display("FAIL : SPIADR Register");

    // //------------------------------------------------
    // // TEST 4 : SPILEN
    // //------------------------------------------------
    // apb_write(12'h010, 32'h08180808);
    // apb_read(12'h010, rdata);

    // if (rdata == 32'h08180808)
    //     $display("PASS : SPILEN Register");
    // else
    //     $display("FAIL : SPILEN Register");

    // //------------------------------------------------
    // // TEST 5 : SPIDUM
    // //------------------------------------------------
    // apb_write(12'h014, 32'h00000008);
    // apb_read(12'h014, rdata);

    // if (rdata == 32'h00000008)
    //     $display("PASS : SPIDUM Register");
    // else
    //     $display("FAIL : SPIDUM Register");

    // //------------------------------------------------
    // // TEST 6 : INTCFG
    // //------------------------------------------------
    // apb_write(12'h024, 32'h00000003);
    // apb_read(12'h024, rdata);

    // if (rdata == 32'h00000003)
    //     $display("PASS : INTCFG Register");
    // else
    //     $display("FAIL : INTCFG Register");


    // $display("\n==============================");
    // $display("TEST 7 : SPI WRITE Transaction");
    // $display("==============================");

    // // Clock Divider
    // apb_write(12'h004, 32'd4);

    // // SPI Command (example: Flash Write Enable = 0x06)
    // apb_write(12'h008,32'hA5000000);

    // // SPI Address
    // apb_write(12'h00C, 32'h12340000);

    // // Command = 8 bits
    // // Address = 16 bits
    // // Data = 8 bits
    // apb_write(12'h010, 32'h00080808);

    // // Dummy cycles
    // apb_write(12'h014, 32'h00000000);

    // // One byte of data
    // apb_write(12'h018, 32'hB00000AA);

    // // Start SPI WRITE
    // apb_write(12'h000, 32'h00000102);

    // repeat(5000) @(posedge HCLK);


    $display("\n==============================");
    $display("TEST 8 : SPI Read Transaction");
    $display("==============================");

    // Clock divider
    apb_write(12'h004,32'd4);

    // Read command
    apb_write(12'h008,32'hA5000000);

    // Address
    apb_write(12'h00C,32'h12340000);

    // CMD=8 ADDR=8 DATA=8
    apb_write(12'h010,32'h00080808);

    // No dummy cycles
    apb_write(12'h014,32'h00000000);

    //Status Register
    apb_write(12'h000,32'h00000101);

    // $display("spi_csreg = %b", dut.u_axiregs.spi_csreg);
    // $display("spi_rd    = %b", dut.u_axiregs.spi_rd);

    wait(spi_csn0);

    repeat(5)
    @(posedge HCLK);

    apb_read(12'h020,rdata);
    // $display("spi_data_rx_ready=%b", dut.u_axiregs.spi_data_rx_ready);


    if(rdata[7:0]==8'hB2)
        begin
            $display("");
            $display("SPI READ PASS");
            $display("Expected = B2");
            $display("Observed = %02h",rdata[7:0]);
        end
        else
        begin
            $display("");
            $display("SPI READ FAIL");
            $display("Expected = B2");
            $display("Observed = %02h",rdata[7:0]);
        end

       #100;

    $finish;

  end

    initial begin
        $dumpfile("spi_master.vcd");
        $dumpvars(0, tb_spi_master);
    end


    //Driving sdi1 for reading through spi
    
    always @(negedge spi_clk)
begin
    if(!spi_csn0 && dut.u_spictrl.state==6)
    begin
        spi_sdi1 = slave_data[7-rx_bit];

        $display("[%0t] Driving bit %0d = %b",
                 $time, rx_bit, spi_sdi1);

        rx_bit++;

        if(rx_bit==8)
            rx_bit=0;
    end
end


    


    always @(posedge spi_clk)
        begin
            if(!spi_csn0)
                begin
                    $display("[%0t] MISO = %b", $time, spi_sdi1);
                end
        end

        // always @(negedge spi_clk)
        //     begin
        //         if(!spi_csn0)
        //         begin
        //             $display("[%0t] Controller State = %0d",
        //                     $time,
        //                     dut.u_spictrl.state);
        //         end
        //     end


    //--------------------------------------------------------------------
    // SPI Monitor
    //--------------------------------------------------------------------


    always @(negedge spi_csn0)
    begin
        bit_cnt  = 0;
        byte_cnt = 0;

        byte_reg = 8'h00;

        cmd_rx  = 8'h00;
        addr_rx = 8'h00;
        data_rx = 8'h00;

        $display("\n================================================");
        $display("[%0t] SPI TRANSACTION START",$time);
        $display("================================================");
    end

    always @(posedge spi_clk)
    begin
        if(!spi_csn0)
        begin
            byte_reg = {byte_reg[6:0],spi_sdo0};
            bit_cnt++;

            if(bit_cnt==8)
            begin
                case(byte_cnt)

                    0:
                    begin
                        cmd_rx = byte_reg;
                        $display("[%0t] COMMAND = 0x%02h (%08b)",
                                $time,cmd_rx,cmd_rx);
                    end

                    1:
                    begin
                        addr_rx = byte_reg;
                        $display("[%0t] ADDRESS = 0x%02h (%08b)",
                                $time,addr_rx,addr_rx);
                    end

                    2:
                    begin
                        data_rx = byte_reg;
                        $display("[%0t] DATA    = 0x%02h (%08b)",
                                $time,data_rx,data_rx);
                    end

                    default:
                        $display("[%0t] EXTRA BYTE = 0x%02h",
                                $time,byte_reg);

                endcase

                byte_cnt++;
                bit_cnt = 0;
                byte_reg = 8'h00;
            end
        end
    end



// always @(posedge HCLK)
// begin
//     $display("state=%0d cs0=%b cs=%b rd=%b",
//              dut.u_spictrl.state,
//              spi_csn0,
//              dut.u_spictrl.spi_cs,
//              dut.u_axiregs.spi_rd);
// end

// always @(posedge HCLK)
// begin
//     if (dut.u_spictrl.state == 6 || dut.u_spictrl.state == 7)
//     begin
//         $display("[%0t] RX: data=%08h valid=%b ready=%b done=%b",
//                  $time,
//                  dut.u_spictrl.spi_ctrl_data_rx,
//                  dut.u_spictrl.spi_ctrl_data_rx_valid,
//                  dut.u_spictrl.spi_ctrl_data_rx_ready,
//                  dut.u_spictrl.rx_done);
//     end
// end


// always @(posedge HCLK)
// begin
//     if (dut.u_spictrl.state == 6)
//     begin
//         $display("counter=%0d data_int=%08h",
//                  dut.u_spictrl.u_rxreg.counter,
//                  dut.u_spictrl.u_rxreg.data_int);
//     end
// end

// always @(posedge HCLK)
// begin
//     $display("apb_if.spi_data_rx = %08h",
//              dut.u_axiregs.spi_data_rx);

//     $display("apb_if.PRDATA = %08h",
//              dut.u_axiregs.PRDATA);
// end


// always @(posedge HCLK)
// begin
//     $display("FIFO data=%08h valid=%b ready=%b elements=%0d",
//         dut.spi_data_rx,
//         dut.spi_data_rx_valid,
//         dut.spi_data_rx_ready,
//         dut.elements_rx);
// end


endmodule