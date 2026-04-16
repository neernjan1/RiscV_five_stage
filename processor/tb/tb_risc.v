module tb_risc(
    input clk,
    input rst
);

risc_top uut (
    .clk(clk),
    .rst(rst)
);

endmodule