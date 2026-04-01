module data_memory(
    input clk,
    input rst,
    input [31:0] addr,
    input [31:0] w_data,
    input mem_read,
    input mem_write,
    output [31:0] r_data
);

    reg [31:0] data_mem [0:31];
    integer i;

    // WRITE + RESET
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 4096; i = i + 1)
                data_mem[i] <= 32'b0;
        end else if (mem_write) begin
            data_mem[addr[13:2]] <= w_data;
        end
    end

    // READ (combinational)
    assign r_data = mem_read ? data_mem[addr[13:2]] : 32'b0;

endmodule