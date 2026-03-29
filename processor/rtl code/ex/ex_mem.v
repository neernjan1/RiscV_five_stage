module ex_mem (
    input clk,
    input rst,

   
    input [31:0] alu_result_in,
    input [1:0] mem_in,
    input wb_in,
    input branch_in,
    input [4:0] rd_in,

   
    output reg [31:0] alu_result_out,
    output reg [1:0] mem_out,
    output reg wb_out,
    output reg branch_out,
    output reg [4:0] rd_out
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        alu_result_out <= 32'b0;
        mem_out        <= 2'b0;
        wb_out         <= 1'b0;
        branch_out     <= 1'b0;
        rd_out         <= 5'b0;
    end 
    else begin
        alu_result_out <= alu_result_in;
        mem_out        <= mem_in;
        wb_out         <= wb_in;
        branch_out     <= branch_in;
        rd_out         <= rd_in;
    end
end

endmodule