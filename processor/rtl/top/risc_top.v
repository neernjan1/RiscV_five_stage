`timescale 1ns / 1ps

module risc_top(
    input clk,
    input rst
);

// ================= WB WIRES =================
wire [31:0] alu_result_wb, mem_result_wb;
wire [4:0] rd_wb;
wire reg_write_wb, mem_to_reg_wb;

// ================= MEM WIRES =================
wire [31:0] alu_result_mem, write_data_mem;
wire [4:0] rd_mem;
wire reg_write_mem, mem_write_mem, mem_read_mem, mem_to_reg_mem;

// 🔥 result_src pipeline
wire [1:0] result_src_id, result_src_id_mux;
wire [1:0] result_src_ex, result_src_mem, result_src_wb;

// 🔥 pc+4 pipeline
wire [31:0] pc_plus_4_ex, pc_plus_4_mem, pc_plus_4_wb;

// ======================= IF STAGE =======================
wire [31:0] pc, next_pc, pc_plus_4, pc_target;
wire [31:0] instruction_code_if;

wire pc_src, pc_write, if_id_write, flush;

//wires required for APB interface
wire stall_mem;
wire [31:0] mem_result_final;
// APB interface signals INPUT  FROM PERIPHERALS
wire [31:0] mem_rdata ,uart_PRDATA, gpio_PRDATA, spi_PRDATA, ascon_PRDATA, i2c_PRDATA, plic_PRDATA, timer_PRDATA, clint_PRDATA;
wire uart_PREADY, gpio_PREADY, spi_PREADY, ascon_PREADY, i2c_PREADY, plic_PREADY, timer_PREADY, clint_PREADY;


mux mux_if (
    pc_plus_4,
    pc_target,
    pc_src,
    next_pc
);

pc pc_if (
    clk,
    rst,
    pc_write & ~stall_mem,
    next_pc,
    pc
);

instruction_memory imem_if (
    pc,
    instruction_code_if
);

adder add_if (
    pc,
    pc_plus_4
);

// ======================= IF/ID =======================
wire [31:0] instruction_code_id, pc_id, pc_plus_4_id;

IF_ID if_id_reg (
    clk,
    rst,
    flush,
    if_id_write & ~stall_mem,
    instruction_code_if,
    pc,
    pc_plus_4,
    instruction_code_id,
    pc_id,
    pc_plus_4_id
);

// ======================= ID STAGE =======================
wire [6:0] opcode_id, funct7_id;
wire [2:0] funct3_id;
wire [4:0] rs1_id, rs2_id, rd_id;

assign opcode_id = instruction_code_id[6:0];
assign rd_id     = instruction_code_id[11:7];
assign funct3_id = instruction_code_id[14:12];
assign rs1_id    = instruction_code_id[19:15];
assign rs2_id    = instruction_code_id[24:20];
assign funct7_id = instruction_code_id[31:25];

wire reg_write_id, alu_src_id, branch_id;
wire mem_write_id, mem_read_id, mem_to_reg_id, jump_id;
wire [2:0] alu_op_id;

wire [31:0] read_data_1_id, read_data_2_id;
wire [31:0] write_data_wb;

reg_file rf (
    clk,
    rst,
    reg_write_wb,
    rs1_id,
    rs2_id,
    rd_wb,
    write_data_wb,
    read_data_1_id,
    read_data_2_id
);

wire [31:0] imm_val_id;

imm_gen imm1 (
    instruction_code_id,
    imm_val_id
);

// CONTROL
wire jalr_sel_id, alu_pc_sel_id;

control ctrl (
    opcode_id,
    reg_write_id,
    alu_src_id,
    alu_op_id,
    branch_id,
    mem_write_id,
    mem_read_id,
    mem_to_reg_id,
    jump_id,
    jalr_sel_id,      
    alu_pc_sel_id    
   
);

// CONTROL MUX
wire reg_write_id_mux, alu_src_id_mux, branch_id_mux;
wire mem_write_id_mux, mem_read_id_mux, mem_to_reg_id_mux, jump_id_mux;
wire [2:0] alu_op_id_mux;
wire control_mux_sel_id;

control_mux cmux (
    control_mux_sel_id,
    reg_write_id,
    alu_src_id,
    alu_op_id,
    branch_id,
    mem_write_id,
    mem_read_id,
    mem_to_reg_id,
    jump_id,
    jalr_sel_id,    
    alu_pc_sel_id, 
   

    reg_write_id_mux,
    alu_src_id_mux,
    alu_op_id_mux,
    branch_id_mux,
    mem_write_id_mux,
    mem_read_id_mux,
    mem_to_reg_id_mux,
    jump_id_mux,
    jalr_sel_id_mux, 
    alu_pc_sel_id_mux 
    
);

// ======================= ID/EX =======================
wire [31:0] pc_ex, read_data_1_ex, read_data_2_ex, imm_val_ex;
wire [4:0] rs1_ex, rs2_ex, rd_ex;
wire [2:0] funct3_ex, alu_op_ex;
wire [6:0] funct7_ex;

wire reg_write_ex, alu_src_ex, branch_ex;
wire mem_write_ex, mem_read_ex, mem_to_reg_ex, jump_ex;

ID_EX id_ex1 (
    .clk(clk),
    .rst(rst),
    .stall(control_mux_sel_id | stall_mem), // Stall the pipeline if there's a hazard or if APB is busy 
    .flush(flush),

    .pc_id(pc_id),
  

    .rs1_id(rs1_id),
    .rs2_id(rs2_id),
    .rd_id(rd_id),

    .read_data1_id(read_data_1_id),
    .read_data2_id(read_data_2_id),
    .imm_val_id(imm_val_id),

    .funct3_id(funct3_id),
    .funct7_id(funct7_id),

    .regWrite_id(reg_write_id_mux),
    .aluSrc_id(alu_src_id_mux),
    .aluOp_id(alu_op_id_mux),
    .branch_id(branch_id_mux),
    .memWrite_id(mem_write_id_mux),
    .memRead_id(mem_read_id_mux),
    .memToReg_id(mem_to_reg_id_mux),
    .jump_id(jump_id_mux),
    .jalr_sel_id(jalr_sel_id_mux),
    .alu_pc_sel_id(alu_pc_sel_id_mux),
    .pc_ex(pc_ex),
    

    .rs1_ex(rs1_ex),
    .rs2_ex(rs2_ex),
    .rd_ex(rd_ex),

    .read_data1_ex(read_data_1_ex),
    .read_data2_ex(read_data_2_ex),
    .imm_val_ex(imm_val_ex),

    .funct3_ex(funct3_ex),
    .funct7_ex(funct7_ex),

    .regWrite_ex(reg_write_ex),
    .aluSrc_ex(alu_src_ex),
    .aluOp_ex(alu_op_ex),
    .branch_ex(branch_ex),
    .memWrite_ex(mem_write_ex),
    .memRead_ex(mem_read_ex),
    .memToReg_ex(mem_to_reg_ex),
    .jump_ex(jump_ex),
        .jalr_sel_ex(jalr_sel_ex), 
    .alu_pc_sel_ex(alu_pc_sel_ex) 


    
);

// ======================= EX STAGE =======================
wire [1:0] forwardA, forwardB;

forwarding fwd (
    rs1_ex,
    rs2_ex,
    rd_mem,
    rd_wb,
    reg_write_mem,
    reg_write_wb,
    forwardA,
    forwardB
);

wire [31:0] src1, src2_forwarded, src2;

muxSrc1 m1 (
    read_data_1_ex,
    alu_result_mem,
    write_data_wb,
    forwardA,
    src1
);

muxSrc2 m2 (
    read_data_2_ex,
    alu_result_mem,
    write_data_wb,
    forwardB,
    src2_forwarded
);

muxSrcImm m3 (
    alu_src_ex,
    src2_forwarded,
    imm_val_ex,
    src2
);
wire [31:0]src1_forwarded;
muxSrcPc m4 (
    .src1_in(src1),
    .pc(pc_ex),
    .alu_pc_sel(alu_pc_sel_ex),
    .src1(src1_forwarded)
); //check inputs

wire jalr_sel_ex;
wire [31:0] pc_int_offset;

mux_jalr m5 (
    .read_data_1_ex(read_data_1_ex),
    .pc(pc_ex),
    .jalr_sel(jalr_sel_ex),
    .pc_offset_in(pc_int_offset)
); 

wire [5:0] operation;

alu_control alu_ctrl (
    alu_op_ex,
    funct3_ex,
    funct7_ex,
    operation,
    mem_write_ex
);

wire [31:0] alu_result_ex;
wire branch_condn_ex;

alu alu1 (
    src1_forwarded, //as new mux added so taking src1_forwarded instead src1 ,giving jalr x1 correct
    src2,
    operation,
    alu_result_ex,
    branch_condn_ex
);

pc_offset pco (
    .pc_offset_in(pc_int_offset), // input from mux_jalr
     .imm(imm_val_ex),
    .pc_offset_out(pc_target)
);

branch_decision bd (
    branch_condn_ex,
    jump_ex,
    branch_ex,
    pc_src,
    flush
);
wire [5:0] operation_mem ;
// ======================= EX/MEM =======================
ex_mem ex_mem1 (
    .clk(clk),
    .rst(rst),

    .alu_result_in(alu_result_ex),
    .write_data_in(src2_forwarded),
    .rd_in(rd_ex),

    .mem_read_in(mem_read_ex),
    .mem_write_in(mem_write_ex),
    .mem_to_reg_in(mem_to_reg_ex),
    .reg_write_in(reg_write_ex),

    
   

    .alu_result_out(alu_result_mem),
    .write_data_out(write_data_mem),
    .rd_out(rd_mem),

    .mem_read_out(mem_read_mem),
    .mem_write_out(mem_write_mem),
    .mem_to_reg_out(mem_to_reg_mem),
    .reg_write_out(reg_write_mem),
    
    //operation passing for load store 
    .operation_ex(operation),
    .operation_mem(operation_mem)

  
    
);

// ======================= MEM STAGE =======================
wire [31:0] mem_result_mem;

data_memory dmem (
    .clk(clk),
    .rst(rst),
    .addr(alu_result_mem),
    .w_data(write_data_mem),
    .operation(operation_mem),
    .mem_read(mem_read_mem),
    .mem_write(mem_write_mem),
    .r_data(mem_result_mem)
);

// ======================= MEM/WB =======================
mem_wb mem_wb1 (
    .clk(clk),
    .rst(rst),
    .alu_result_mem(alu_result_mem),
    .read_data_mem(mem_result_final), // This will be the output from APB or data memory based on address decoding
    .reg_write_mem(reg_write_mem),
    .mem_to_reg_mem(mem_to_reg_mem),
    .rd_mem(rd_mem),

    .alu_result_wb(alu_result_wb),
    .read_data_wb(mem_result_wb),
    .reg_write_wb(reg_write_wb),
    .mem_to_reg_wb(mem_to_reg_wb),
    .rd_wb(rd_wb)

);

// ======================= WB STAGE =======================
mux_wb wb_mux (
    .alu_result(alu_result_wb),
   .r_data(mem_result_wb),
    .memToReg(mem_to_reg_wb),
    .data_out(write_data_wb)
);

// ======================= HAZARD =======================
hazard_detection hz (
    rs1_id,
    rs2_id,
    rd_ex,
    mem_read_ex,
    pc_write,
    if_id_write,
ID_EX_write, // This signal is used inside the ID/EX register to stall it   
    control_mux_sel_id
);


// ======================= APB =======================

//instantiation of APB interface module
apb_top apb_interface (
    .clk(clk),
    .rst(rst),  
    .addr(alu_result_mem), // Address from MEM stage //add more conditions
    .wdata(write_data_mem), // Write data from MEM stage //for mem or apb
    .mem_read(mem_read_mem), // Memory read signal from MEM stage
    .mem_write(mem_write_mem), // Memory write signal from MEM stage    
    .rdata(mem_result_final) ,// Read data to MEM stage //or apb read data
    // Connect other APB signals as needed

    .stall_mem(stall_mem), // Connect to hazard detection if needed
    .mem_rdata(mem_result_mem), // Connect to data memory read data

    // Peripheral side connections // Connection to actual peripherals
    .uart_PRDATA(32'd543), // Connect to UART peripheral
    .uart_PREADY(1'b1), // Connect to UART peripheral
    .gpio_PRDATA(32'b0), // Connect to GPIO peripheral
    .gpio_PREADY(1'b1), // Connect to GPIO peripheral
    .spi_PRDATA(32'b0), // Connect to SPI peripheral
    .spi_PREADY(1'b1), // Connect to SPI peripheral 
    .ascon_PRDATA(32'b0), // Connect to ASCON peripheral
    .ascon_PREADY(1'b1), // Connect to ASCON peripheral
    .i2c_PRDATA(32'b0), // Connect to I2C peripheral
    .i2c_PREADY(1'b1), // Connect to I2C peripheral
    .plic_PRDATA(32'b0), // Connect to PLIC peripheral
    .plic_PREADY(1'b1), // Connect to PLIC peripheral
    .timer_PRDATA(32'b0), // Connect to Timer peripheral
    .timer_PREADY(1'b1), // Connect to Timer peripheral
    .clint_PRDATA(32'b0), // Connect to CLINT peripheral
    .clint_PREADY(1'b1) // Connect to CLINT peripheral
);

endmodule