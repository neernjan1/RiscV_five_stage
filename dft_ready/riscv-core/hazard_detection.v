module hazard_detection(
input [4:0] rs1_id,
input [4:0] rs2_id,
input [4:0] rd_ex,
input MemRead_ex,

output reg PC_Write,
output reg IF_ID_write,
output reg ID_EX_write, // Control signal to stall the pipeline by preventing the ID/EX register from updating
output reg control_mux_sel
);

always @(*) begin
  // PC_Write = 1'b1;
  // IF_ID_write = 1'b1;
   //control_mux_sel = 0;
    if (MemRead_ex && (rd_ex != 0) &&
       ((rs1_id == rd_ex) || (rs2_id == rd_ex))) begin
        
        // Hazard detected → stall
        PC_Write        = 0;
        IF_ID_write     = 0;
        ID_EX_write     = 0;
        control_mux_sel = 1;

    end else begin
        
        // No hazard → normal execution
        PC_Write        = 1;
        IF_ID_write     = 1;
        ID_EX_write     = 1;
        control_mux_sel = 0;

    end
end

endmodule