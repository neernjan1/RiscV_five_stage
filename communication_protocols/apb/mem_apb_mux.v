module mem_apb_mux (
    input sel_mem,
    input mem_read,

    input [31:0] r_data_mem,
    input [31:0] r_data_periph,

    input busy_apb,

    output reg [31:0] r_data_out,
    output stall_mem
);

    // 🔥 FINAL STALL LOGIC
    assign stall_mem = (~sel_mem) & busy_apb;

    always @(*) begin
        if (mem_read) begin
            if (sel_mem)
                r_data_out = r_data_mem;
            else
                r_data_out = r_data_periph;
        end else begin
            r_data_out = 32'b0;
        end
    end

endmodule