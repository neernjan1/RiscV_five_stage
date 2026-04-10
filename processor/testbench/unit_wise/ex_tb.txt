// NEW signals
reg [31:0] pc;
wire [31:0] pc_branch_out;
wire branch_taken;

// DUT
top dut (
    .clk(clk),
    .rst(rst),

    .wb(wb),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .ALUOp(ALUOp),
    .alu_src(alu_src),
    .branch(branch),

    .func3(func3),
    .func7(func7),

    .rd1(rd1),
    .rd2(rd2),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .imm(imm),
    .pc(pc),   // 🔥 NEW

    .ex_mem_alu_result(ex_mem_alu_result),
    .mem_wb_result(mem_wb_result),
    .ex_mem_rd(ex_mem_rd),
    .mem_wb_rd(mem_wb_rd),
    .ex_mem_reg_write(ex_mem_reg_write),
    .mem_wb_reg_write(mem_wb_reg_write),

    .alu_result_out(alu_result_out),
    .pc_branch_out(pc_branch_out),   // 🔥 NEW
    .branch_taken(branch_taken),     // 🔥 NEW
    .wb_out(wb_out),
    .mem_read_out(mem_read_out),
    .mem_write_out(mem_write_out),
    .rd_out(rd_out)
);