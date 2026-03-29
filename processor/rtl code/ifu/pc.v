module pc(clk, rst, pc_write, next_pc, pc);
    input clk, rst;
    input pc_write;
    input [31:0] next_pc;
    output reg [31:0] pc;
    
    always @ (posedge clk)
    begin
        if(rst)
            pc <= 32'b0;
        else if(pc_write)
            pc <=next_pc;
        else 
           pc <= pc; // incase of stall .n
    end
endmodule