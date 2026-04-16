//this unit is responsible for forwarding the data from EX/MEM and MEM/WB stages to the ID/EX stage to resolve data hazards in a pipelined RISC-V processor.
//but it does not handle load-use hazards, which require stalling the pipeline instead of forwarding.
//I need to check rd_ex and rd_mem connections .

module forwarding (
    input [4:0] id_ex_rs1,
    input [4:0] id_ex_rs2,
    input [4:0] ex_mem_rd,
    input [4:0] mem_wb_rd,
    input ex_mem_reg_write,
    input mem_wb_reg_write,
    output reg [1:0] forward_A,
    output reg [1:0] forward_B
);

always @(*) begin

   
  //  forward_A = 2'b00;
 //  forward_B = 2'b00;

   
    if (ex_mem_reg_write && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs1))
        forward_A = 2'b01;   // ex stage(priority)

    else if (mem_wb_reg_write && (mem_wb_rd != 0) && (mem_wb_rd == id_ex_rs1))
        forward_A = 2'b10;   // MEM stage
    else forward_A = 2'b00;   // No forwarding

    if (ex_mem_reg_write && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs2))
        forward_B = 2'b01;

    else if (mem_wb_reg_write && (mem_wb_rd != 0) && (mem_wb_rd == id_ex_rs2))
        forward_B = 2'b10;
    else forward_B = 2'b00;

end

endmodule