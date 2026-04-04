module ex_mem (
    input clk,
    input rst,

    input [31:0] alu_result_in,
    input mem_write_ex,
    input mem_read_ex,
    input mem_to_reg_ex,
    input reg_write_ex,
    input [4:0] rd_ex,

    output reg [31:0] alu_result_out,
    output reg mem_write_mem,
    output reg mem_read_mem,
    output reg mem_to_reg_mem,
    output reg reg_write_mem,
    output reg [4:0] rd_out ,
     input  [31:0] pc_plus_4_ex, // 🔥 NEW
    output reg [31:0] pc_plus_4_mem , // 🔥 NEW
    // 🔥 ADD
    input [1:0] result_src_ex,// 🔥 NEW
    output reg [1:0] result_src_mem// 🔥 NEW
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        alu_result_out <= 32'b0;
        mem_write_mem  <= 1'b0;
        mem_read_mem   <= 1'b0;
        mem_to_reg_mem <= 1'b0;
        reg_write_mem  <= 1'b0;
        rd_out         <= 5'b0;
         pc_plus_4_mem <= 0 ;// 🔥 NEW
        result_src_mem <= 0 ;// 🔥 NEW
    end else begin
        alu_result_out <= alu_result_in;
        mem_write_mem  <= mem_write_ex;
        mem_read_mem   <= mem_read_ex;
        mem_to_reg_mem <= mem_to_reg_ex;
        reg_write_mem  <= reg_write_ex;
        rd_out         <= rd_ex;
         pc_plus_4_mem <= pc_plus_4_ex ;// 🔥 NEW
        result_src_mem <= result_src_ex ; // 🔥 NEW
    end
end

endmodule
