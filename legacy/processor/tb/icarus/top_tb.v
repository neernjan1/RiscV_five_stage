`timescale 1ns / 1ps

module tb_risc;

//--------------------------------------
// 🔹 Signals
//--------------------------------------
reg clk;
reg rst;

//--------------------------------------
// 🔹 DUT Instantiation
//--------------------------------------
risc_top uut (
    .clk(clk),
    .rst(rst)
);

//--------------------------------------
// 🔹 Clock Generation (10ns period)
//--------------------------------------
initial clk = 0;
always #5 clk = ~clk;

//--------------------------------------
// 🔹 Reset Sequence
//--------------------------------------
initial begin
    rst = 1;
    #10 rst = 0;
end

//--------------------------------------
// 🔹 Simulation Control
//--------------------------------------
initial begin
    #300000; // Run simulation for 300ns (adjust as needed)
     $display("-------------------------------------------------------------");
    $display("\n✅Waveform Dump Complete: 'riscv_core.vcd'");
   
    $display("\n✅ Simulation Finished\n");
    $finish;
end

//--------------------------------------
// 🔹 Waveform Dump
//--------------------------------------
initial begin
     $display("📊 Waveform Dump Started: 'riscv_core.vcd'");
    $dumpfile("riscv_core.vcd");
    $dumpvars(0, tb_risc);
    
end

//--------------------------------------
// 🔹 Debug Monitor (Structured Output)
//--------------------------------------
initial begin
    $display("-------------------------------------------------------------");
    $display(" Time    |   x0    x1    x2    x3    x4");
    $display("-------------------------------------------------------------");

    $monitor("%8t | %4h  %4h  %4h  %4h  %4h  ",
        $time,
        uut.rf.register[0],
        uut.rf.register[1],
        uut.rf.register[2],
        uut.rf.register[3],
        uut.rf.register[4],
        
    );
    
end

//--------------------------------------
// 🔹 Optional: Memory Debug (Enable if needed)
//--------------------------------------
/*
initial begin
    #100;
    $display("MEM[0]=%0d MEM[1]=%0d MEM[2]=%0d MEM[3]=%0d",
        uut.dmem.mem[0],
        uut.dmem.mem[1],
        uut.dmem.mem[2],
        uut.dmem.mem[3]
    );
end
*/

endmodule