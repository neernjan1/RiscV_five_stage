`timescale 1ns / 1ps

module reg_file(
    input clk, 
    input rst,
    input reg_write,
    input [4:0] rs1, 
    input [4:0] rs2, 
    input [4:0] rd,
    input [31:0] write_data,
    output [31:0] read_data1, 
    output [31:0] read_data2 
);

    reg [31:0] register [31:0]; 
    integer i;

    //--------------------------------------
    // 🔹 Write Logic
    //--------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                register[i] <= 32'b0;
        end 
        else if (reg_write && rd != 0) begin
            register[rd] <= write_data;
        end
    end

    //--------------------------------------
    // 🔹 Read Logic with Bypass (FIX)
    //--------------------------------------
    assign read_data1 = (rs1 == 0) ? 32'b0 :
                        (reg_write && (rs1 == rd) && (rd != 0)) ? write_data :
                        register[rs1];

    assign read_data2 = (rs2 == 0) ? 32'b0 :
                        (reg_write && (rs2 == rd) && (rd != 0)) ? write_data :
                        register[rs2];

endmodule