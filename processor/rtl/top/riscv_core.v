`timescale 1ns / 1ps

module riscv_core(

    input clk,
    input rst,

    // Instruction interface
    output [31:0] instr_addr,
    input  [31:0] instruction,

    // Data interface
    output [31:0] data_addr,
    output [31:0] data_wdata,
    input  [31:0] data_rdata,

    output mem_read,
    output mem_write,

    output [1:0] mem_size,
    output load_sign_ext,

    //From APB
    input stall_mem ,

    //Interrupt
    input external_irq,
    input mtip,          // CLINT timer interrupt pending
    input msip           // CLINT software interrupt pending
);



// ================= WB WIRES =================
wire [31:0] alu_result_wb, mem_result_wb;
wire [4:0] rd_wb;
wire reg_write_wb, mem_to_reg_wb;

// ================= MEM WIRES =================
wire [31:0] alu_result_mem, write_data_mem;
wire [4:0] rd_mem;
wire reg_write_mem, mem_write_mem, mem_read_mem, mem_to_reg_mem;

// result_src pipeline
wire [1:0] result_src_id, result_src_id_mux;
wire [1:0] result_src_ex, result_src_mem, result_src_wb;

// pc+4 pipeline
wire [31:0] pc_plus_4_ex, pc_plus_4_mem, pc_plus_4_wb;

// ======================= IF STAGE =======================
wire [31:0] pc, next_pc, pc_plus_4, pc_target;
wire [31:0] instruction_code_if;

wire pc_src, pc_write, if_id_write, flush;

wire        trap_taken; // for interrupts

// trap_taken (and, further below, trap_enter/trap_return) must be gated
// by ~stall_mem before they're allowed to flush a pipeline register or
// commit CSR state. PC_Write is already `pc_write & ~stall_mem` -- if a
// trap is taken on a cycle where an unrelated, still-in-flight peripheral
// access (e.g. the ISR's own store to an APB device) is holding
// stall_mem high, that gating silently drops the PC redirect while the
// (ungated) flush/CSR-commit side effects still fire, consuming the
// interrupted or mret instruction with no redirect ever landing -- the
// core then just free-runs off the end of the program. Deferring every
// trap-taking side effect together, atomically, until the stall clears
// is what PC_Write already assumes happens.
wire trap_taken_ok = trap_taken & ~stall_mem;


mux mux_if (
    pc_plus_4,
    pc_target,
    pc_src,
    next_pc,
    trap_taken_ok, // added after plic
    trap_pc     // added after plic
);

pc pc_if (
    clk,
    rst,
    pc_write & ~stall_mem,
    next_pc,
    pc
);

// instruction_memory imem_if (
//     pc,
//     instruction_code_if
// );

adder add_if (
    pc,
    pc_plus_4
);

// ======================= IF/ID =======================
wire [31:0] instruction_code_id, pc_id, pc_plus_4_id;

IF_ID if_id_reg (
    clk,
    rst,
    (flush| trap_taken_ok),
    if_id_write & ~stall_mem,
    instruction,
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
wire csr_we_id,csr_read_id , csr_read_out;
wire [11:0] csr_addr_id;
assign csr_addr_id = instruction_code_id[31:20];

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
    funct3_id,

    reg_write_id,
    alu_src_id,
    alu_op_id,
    branch_id,
    mem_write_id,
    mem_read_id,
    mem_to_reg_id,
    jump_id,
    jalr_sel_id,      
    alu_pc_sel_id ,
    csr_we_id,
    csr_read_id

   
);

// CONTROL MUX
wire reg_write_id_mux, alu_src_id_mux, branch_id_mux,ID_EX_write,alu_pc_sel_ex,alu_pc_sel_id_mux,jalr_sel_id_mux;
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
    csr_read_id,
   

    reg_write_id_mux,
    alu_src_id_mux,
    alu_op_id_mux,
    branch_id_mux,
    mem_write_id_mux,
    mem_read_id_mux,
    mem_to_reg_id_mux,
    jump_id_mux,
    jalr_sel_id_mux, 
    alu_pc_sel_id_mux ,
    csr_read_out
    
);

// ======================= ID/EX =======================
wire [31:0] pc_ex, read_data_1_ex, read_data_2_ex, imm_val_ex;
wire [4:0] rs1_ex, rs2_ex, rd_ex;
wire [2:0] funct3_ex, alu_op_ex;
wire [6:0] funct7_ex;

wire reg_write_ex, alu_src_ex, branch_ex;
wire mem_write_ex, mem_read_ex, mem_to_reg_ex, jump_ex;
wire [31:0] csr_rdata_ex;
wire csr_read_ex ;
wire csr_we_ex ;
wire [11:0] csr_addr_ex ;

ID_EX id_ex1 (
    .clk(clk),
    .rst(rst),
    .stall(control_mux_sel_id | stall_mem), // Stall the pipeline if there's a hazard or if APB is busy
    .flush(flush| trap_taken_ok),

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
    .csr_read_out(csr_read_out),
    .csr_rdata(csr_rdata),
    .csr_we_id(csr_we_id),
    .csr_addr_id(csr_addr_id),

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
    .alu_pc_sel_ex(alu_pc_sel_ex) ,
    .csr_read_ex(csr_read_ex),
    .csr_rdata_ex(csr_rdata_ex),
    .csr_we_ex(csr_we_ex),
    .csr_addr_ex(csr_addr_ex)

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
//added
muxSrc2 store_mux (
    read_data_2_ex,
    alu_result_mem,
    write_data_wb,
    forwardB,
    store_data
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
    .read_data_1_ex(src1), // changed here after jalr problem from read_data_1_ex
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
wire [31:0] store_data;

wire [1:0] mem_size_ex ;
wire load_sign_ext_ex;
wire [1:0] mem_size_mem ;
wire load_sign_ext_mem;

mem_control mcu (
    mem_read_ex ,
    mem_write_ex ,
    funct3_ex ,
    mem_size_ex ,
    load_sign_ext_ex 
);



wire [31:0]pc_mem;
wire csr_read_mem ;
wire [31:0] csr_rdata_mem ;

ex_mem ex_mem1 (
    .clk(clk),
    .rst(rst),
    .stall(stall_mem) ,
    .alu_result_in(alu_result_ex),
   // .write_data_in(src2_forwarded),
   .write_data_in(store_data),
    .rd_in(rd_ex),
    .pc_ex(pc_ex),
    .pc_mem(pc_mem),

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
    
    .mem_size_ex(mem_size_ex) ,
    .load_sign_ext_ex(load_sign_ext_ex),
    .mem_size_mem(mem_size_mem) ,
    .load_sign_ext_mem(load_sign_ext_mem),
    .csr_read_ex(csr_read_ex),
    .csr_rdata_ex(csr_rdata_ex) ,
    .csr_read_mem(csr_read_mem) ,
    .csr_rdata_mem (csr_rdata_mem)

  
    
);

// ======================= MEM STAGE =======================
wire [31:0] mem_result_mem;

// data_memory dmem(
//     .clk(clk),
//     .rst(rst),
//     .addr(alu_result_mem),
//     .w_data(write_data_mem),

//     .mem_read(mem_read_mem),
//     .mem_write(mem_write_mem),

//     .mem_size(mem_size_mem),
//     .load_sign_ext(load_sign_ext_mem),

//     .r_data(mem_result_mem)
// );

wire [31:0] pc_wb;
wire csr_read_wb ;
wire [31:0] csr_rdata_wb ;

// ======================= MEM/WB =======================
mem_wb mem_wb1 (
    .clk(clk),
    .rst(rst),
    .stall(stall_mem),
    .alu_result_mem(alu_result_mem),
    .read_data_mem(data_rdata), // changed here from mem_result_final -> data_rdata
    .reg_write_mem(reg_write_mem),
    .mem_to_reg_mem(mem_to_reg_mem),
    .rd_mem(rd_mem),
    .pc_mem(pc_mem),
    .pc_wb(pc_wb),

    .alu_result_wb(alu_result_wb),
    .read_data_wb(mem_result_wb),
    .reg_write_wb(reg_write_wb),
    .mem_to_reg_wb(mem_to_reg_wb),
    .rd_wb(rd_wb) ,
    .csr_read_mem(csr_read_mem),
   .csr_rdata_mem (csr_rdata_mem),
   .csr_read_wb(csr_read_wb) ,
   .csr_rdata_wb(csr_rdata_wb)


);

// ======================= WB STAGE =======================
mux_wb wb_mux (
    .alu_result(alu_result_wb),
   .r_data(mem_result_wb),
    .memToReg(mem_to_reg_wb),
    .data_out(write_data_wb) ,
    .csr_read(csr_read_wb),
    .csr_rdata(csr_rdata_wb)
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


//---------------- Memory Interfacing Signals ----------------
assign instr_addr = pc;

assign data_addr = alu_result_mem;

assign data_wdata = write_data_mem;

assign mem_read = mem_read_mem;

assign mem_write = mem_write_mem ;

assign mem_size = mem_size_mem ;

assign load_sign_ext = load_sign_ext_mem ;

//---------------- Interrupt / CSR ----------------
// csr_we_ex / csr_addr_ex come from ID/EX (id_ex1) so the write fires in
// the EX stage; csr_wdata taps src1, the already-forwarded EX-stage rs1
// operand (muxSrc1 m1), so the existing EX-stage forwarding network
// (forward A/B) resolves RAW hazards on csrrw's source register without
// needing bubble nops.
wire [31:0] csr_wdata;
assign csr_wdata = src1;

wire        global_ie;
wire        external_ie;
wire        timer_ie;
wire        software_ie;

wire [31:0] mtvec;
wire [31:0] mepc;


wire [31:0] trap_pc;

wire        trap_enter;
wire        trap_return;
// See trap_taken_ok above: csr_file's mepc/mcause/mstatus commits must
// defer the same way the PC redirect does, or the CSR side of a trap can
// commit on a cycle where the redirect itself got dropped by stall_mem.
wire        trap_enter_ok  = trap_enter  & ~stall_mem;
wire        trap_return_ok = trap_return & ~stall_mem;

wire        mret_execute;

wire [31:0] csr_rdata;

// trap_cause is selected by trap_controller (it already owns interrupt
// priority), not hardcoded here -- see u_trap below.
wire [31:0] trap_cause;

// Decode MRET instruction
assign mret_execute = (instruction_code_id == 32'h30200073);

csr_file u_csr(

.clk(clk),
.rst_n(~rst),

.csr_we(csr_we_ex),
.csr_addr(csr_addr_id),
.csr_waddr(csr_addr_ex),
.csr_wdata(csr_wdata),
.csr_rdata(csr_rdata),

.trap_enter(trap_enter_ok),
.trap_return(trap_return_ok),

.interrupted_pc(pc_id),

.trap_cause(trap_cause),

.meip(external_irq),
.mtip(mtip),
.msip(msip),

.global_ie(global_ie),

.external_ie(external_ie),
.timer_ie(timer_ie),
.software_ie(software_ie),

.mtvec(mtvec),

.mepc(mepc)

);

trap_controller u_trap(

.meip(external_irq),
.mtip(mtip),
.msip(msip),

.mstatus_mie(global_ie),

.mie_meie(external_ie),
.mie_mtie(timer_ie),
.mie_msie(software_ie),

.current_pc(pc_id),

.mtvec(mtvec),

.mepc(mepc),

.mret_execute(mret_execute),

.trap_taken(trap_taken),

.trap_pc(trap_pc),

.trap_enter(trap_enter),

.trap_return(trap_return),

.trap_cause(trap_cause)

);

endmodule

