`timescale 1ns/1ps
module mem_apb_mux (
    input sel_mem,
    

    input [31:0] r_data_mem,
    input [31:0] r_data_periph,

    

    output reg [31:0] r_data_out
    
);

    always @(*) begin
        
            if (sel_mem)
                r_data_out = r_data_mem;
            else
                r_data_out = r_data_periph;
        
    end

endmodule