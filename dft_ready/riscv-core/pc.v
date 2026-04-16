module pc(clk, rst,test_mode,scan_clk, pc_write, next_pc, pc);
    input clk, rst;
    input pc_write;
    input test_mode;
    input scan_clk;
    input [31:0] next_pc;
    
    output reg [31:0] pc;
    wire clk_dft;
    wire rst_dft;
    assign clk_dft = test_mode ? scan_clk : clk;
assign rst_dft = test_mode ? 1'b0 : rst;
    always @ (posedge clk_dft)
    begin
        if(rst_dft ) // reset pc to 0 on reset or when ecall is executed
            pc <= 32'b0;
        else if(pc_write || test_mode)
            pc <=next_pc;
           
        else 
           pc <= pc; // incase of stall .n
    end
endmodule