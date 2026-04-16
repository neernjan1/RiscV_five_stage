module WB_tb();
    reg clk;
    reg rst;
    reg [31:0] alu_result = 0;     
    reg [31:0] r_data = 0;   
    reg [4:0]   rd_wb = 0;
    reg       mem_to_reg = 0;   
    wire [31:0] data_out; 
    wire [4:0]  rd;
    WB_stage wb(clk, rst, alu_result, r_data, rd_wb, mem_to_reg, data_out,rd);
    always #5 clk = ~clk ;
    initial begin
       clk = 0;
       rst = 1;
       #10 rst = 0; 
       #10 r_data = 32'h11111111;rd_wb= 5'b10101;
                 alu_result = 32'h10101010;
       #10 mem_to_reg = 1;
       #10 $finish;
    end               
endmodule    


//as it has only mux we don't need to write top etc. we can directly write the testbench for it and check the output of mux. if mem_to_reg is 1 then data_out should be r_data else it should be alu_result.