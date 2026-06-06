
`timescale 1ns/1ps
module tb;
    int prev_x10;
    reg clk, rst;

    risc_top cpu(.clk(clk), .rst(rst));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #12 rst = 0;

        // wait(cpu.instruction_code_id == 32'h0000006f);
        // @(posedge clk);
        // @(posedge clk);
        // @(posedge clk);
        // @(posedge clk);
        // @(posedge clk);

        #5000;

        $finish;
    end

 always @(posedge clk) begin
    if (prev_x10 != cpu.rf.register[10]) begin
        $display("x10 = %0d", cpu.rf.register[10]);
        prev_x10 = cpu.rf.register[10];
    end
end

    initial begin
        $dumpfile("riscv.vcd");
        $dumpvars(0);
    end

endmodule