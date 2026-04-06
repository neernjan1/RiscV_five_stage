module ex_mem (
    input clk,
    input rst,

    // Data signals
    input [31:0] alu_result_in,
    input [31:0] write_data_in,
    input [4:0] rd_in,

    // Control signals
    input mem_read_in,
    input mem_write_in,
    input mem_to_reg_in,
    input reg_write_in,

    // Outputs
    output reg [31:0] alu_result_out,
    output reg [31:0] write_data_out,
    output reg [4:0] rd_out,

    output reg mem_read_out,
    output reg mem_write_out,
    output reg mem_to_reg_out,
    output reg reg_write_out 
    // input  [31:0] pc_plus_4_ex, // 🔥 NEW
    // output reg [31:0] pc_plus_4_mem , // 🔥 NEW
    // // 🔥 ADD
    // input [1:0] result_src_ex,// 🔥 NEW
    // output reg [1:0] result_src_mem// 🔥 NEW
);

always @(posedge clk) begin
    if (rst) begin
        alu_result_out <= 0;
        write_data_out <= 0;
        rd_out <= 0;

        mem_read_out <= 0;
        mem_write_out <= 0;
        mem_to_reg_out <= 0;
        reg_write_out <= 0;
        // pc_plus_4_mem <= 0 ;// 🔥 NEW
        // result_src_mem <= 0 ;// 🔥 NEW
    end
    else begin
        alu_result_out <= alu_result_in;
        write_data_out <= write_data_in;
        rd_out <= rd_in;

        mem_read_out <= mem_read_in;
        mem_write_out <= mem_write_in;
        mem_to_reg_out <= mem_to_reg_in;
        reg_write_out <= reg_write_in;
        // pc_plus_4_mem <= pc_plus_4_ex ;// 🔥 NEW
        // result_src_mem <= result_src_ex ; // 🔥 NEW
    end
end

endmodule


