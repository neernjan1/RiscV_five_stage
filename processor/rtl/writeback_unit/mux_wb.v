`timescale 1ns / 1ps

module mux_wb(
input [31:0] alu_result ,
input [31:0] r_data ,
    input [31:0] pc_plus_4_wb,// 🔥 NEW
input [1:0] result_src, // 🔥 NEW

output [31:0] data_out 
    );
   always @(*) begin// 🔥 NEW
    case(result_src)
        2'b00: data_out = alu_result;
        2'b01: data_out = r_data;
        2'b10: data_out = pc_plus_4_wb;  // 🔥 JAL/JALR
        default: data_out = alu_result;
    endcase
end
endmodule
