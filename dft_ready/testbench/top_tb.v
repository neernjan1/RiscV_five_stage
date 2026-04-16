```verilog
`timescale 1ns / 1ps

module tb_risc;

//--------------------------------------
// 🔹 Signals
//--------------------------------------
reg clk;
reg rst;

reg test_mode;
reg scan_clk;
reg scan_en;
reg scan_in0;
reg scan_in1;

wire scan_out0;
wire scan_out1;

//--------------------------------------
// 🔹 DUT Instantiation
//--------------------------------------
risc_top uut (
    .clk(clk),
    .rst(rst),
    .test_mode(test_mode),
    .scan_clk(scan_clk),

    .scan_en(scan_en),
    .scan_in0(scan_in0),
    .scan_in1(scan_in1),
    .scan_out0(scan_out0),
    .scan_out1(scan_out1)
);

//--------------------------------------
// 🔹 Clock Generation
//--------------------------------------
initial clk = 0;
always #5 clk = ~clk;          // functional clock

initial scan_clk = 0;
always #10 scan_clk = ~scan_clk; // slower scan clock

//--------------------------------------
// 🔹 Reset
//--------------------------------------
task apply_reset;
begin
    rst = 1;
    #20;
    rst = 0;
end
endtask

//--------------------------------------
// 🔹 Functional Run
//--------------------------------------
task run_functional;
begin
    $display("\n===== FUNCTIONAL MODE =====");
    test_mode = 0;
    scan_en   = 0;

    repeat (40) @(posedge clk);
end
endtask

//--------------------------------------
// 🔹 Enter Test Mode
//--------------------------------------
task enter_test_mode;
begin
    $display("\n===== ENTERING TEST MODE =====");
    test_mode = 1;
    scan_en   = 0;

    repeat (5) @(posedge scan_clk);
end
endtask

//--------------------------------------
// 🔹 Scan Shift (Pseudo, since no chain)
//--------------------------------------
task scan_shift;
    input [31:0] pattern;
    integer i;
begin
    $display("\n===== SCAN SHIFT =====");
    scan_en = 1;

    for (i = 0; i < 32; i = i + 1) begin
        scan_in0 = pattern[i];
        scan_in1 = ~pattern[i];

        @(posedge scan_clk);

        $display("Shift[%0d] IN0=%b OUT0=%b", 
                  i, scan_in0, scan_out0);
    end
end
endtask

//--------------------------------------
// 🔹 Scan Capture
//--------------------------------------
task scan_capture;
begin
    $display("\n===== SCAN CAPTURE =====");
    scan_en = 0;
    @(posedge scan_clk);
end
endtask

//--------------------------------------
// 🔹 Main Stimulus
//--------------------------------------
initial begin
    clk = 0;
    scan_clk = 0;
    rst = 0;
    test_mode = 0;
    scan_en = 0;
    scan_in0 = 0;
    scan_in1 = 0;

    //----------------------------------
    // RESET
    //----------------------------------
    apply_reset();

    //----------------------------------
    // FUNCTIONAL MODE
    //----------------------------------
    run_functional();

    //----------------------------------
    // TEST MODE (DFT)
    //----------------------------------
    enter_test_mode();

    scan_shift(32'hA5A5A5A5);
    scan_capture();

    scan_shift(32'h3C3C3C3C);
    scan_capture();

    //----------------------------------
    // BACK TO FUNCTIONAL
    //----------------------------------
    $display("\n===== BACK TO FUNCTIONAL =====");
    test_mode = 0;
    scan_en   = 0;

    repeat (20) @(posedge clk);

    $display("\n✅ Simulation Finished\n");
    $finish;
end

//--------------------------------------
// 🔹 Waveform Dump
//--------------------------------------
initial begin
    $dumpfile("riscv_core.vcd");
    $dumpvars(0, tb_risc);
end

//--------------------------------------
// 🔹 Debug Monitor (Registers)
//--------------------------------------
initial begin
    $display("-------------------------------------------------------------");
    $display(" Time    |   x0    x1    x2    x5    x6    x7    x10 ");
    $display("-------------------------------------------------------------");

    $monitor("%8t | %4d  %4d  %4d  %4d  %4d  %4d  %4d",
        $time,
        uut.rf.register[0],
        uut.rf.register[1],
        uut.rf.register[2],
        uut.rf.register[5],
        uut.rf.register[6],
        uut.rf.register[7],
        uut.rf.register[10]
    );
end

endmodule
```
