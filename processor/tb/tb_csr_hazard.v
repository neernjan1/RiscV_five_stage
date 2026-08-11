`timescale 1ns/1ps
// =====================================================================
// tb_csr_hazard.v
//
// Self-checking regression testbench for the csrrw RAW-hazard /
// forwarding fix (ID_EX.v / riscv_core.v / csr_file.sv). Instantiates
// riscv_core directly -- no SoC/APB/toolchain dependency -- so it runs
// in seconds via plain iverilog and catches a regression on this path
// without needing gcc/spike.
//
// The program is the exact machine code the real toolchain produces
// for ../csr_hazard_test.s (see that file for the annotated source and
// the equivalent Spike-compared regression). It covers, each with ZERO
// nop instructions between the hazard and its use:
//   Case 1: EX/MEM forward into csrrw's rs1
//   Case 2: back-to-back csrrw to the SAME csr (CSR-internal bypass)
//   Case 3: MEM/WB forward into csrrw's rs1
//   Case 4: load-use hazard directly into csrrw's rs1
//
// Run with:
//   iverilog -g2012 -o /tmp/tb_csr_hazard.vvp -I ../rtl/include \
//     ../rtl/include/defines.vh tb_csr_hazard.v ../rtl/top/riscv_core.v \
//     ../rtl/IF/*.v ../rtl/ID/*.v ../rtl/EX/*.v ../rtl/MA/MEM_WB.v \
//     ../rtl/WB/*.v ../rtl/hazard_unit/*.v ../rtl/plic/csr_file.sv \
//     ../rtl/plic/trap_controller.sv
//   vvp /tmp/tb_csr_hazard.vvp
// =====================================================================
module tb_csr_hazard;

    reg clk = 0;
    reg rst = 1;

    wire [31:0] instr_addr;
    reg  [31:0] instruction;

    wire [31:0] data_addr, data_wdata;
    reg  [31:0] data_rdata;

    wire mem_read, mem_write;
    wire [1:0] mem_size;
    wire load_sign_ext;

    reg  stall_mem = 0;
    reg  external_irq = 0;
    reg  mtip = 0;
    reg  msip = 0;

    integer errors = 0;

    // ---- Program: machine code for csr_hazard_test.s ----
    reg [31:0] imem [0:15];
    initial begin
        imem[0]  = 32'h10000093; // addi x1, x0, 0x100
        imem[1]  = 32'h30509173; // csrrw x2, mtvec, x1
        imem[2]  = 32'h305011f3; // csrrw x3, mtvec, x0
        imem[3]  = 32'h20000213; // addi x4, x0, 0x200
        imem[4]  = 32'h00000013; // addi x0, x0, 0 (spacer)
        imem[5]  = 32'h305212f3; // csrrw x5, mtvec, x4
        imem[6]  = 32'h80010337; // lui x6, 0x80010
        imem[7]  = 32'h30000393; // addi x7, x0, 0x300
        imem[8]  = 32'h00732023; // sw x7, 0(x6)
        imem[9]  = 32'h00032403; // lw x8, 0(x6)
        imem[10] = 32'h305414f3; // csrrw x9, mtvec, x8
        imem[11] = 32'h00000063; // done: beq x0,x0,done
    end

    always @(*) begin
        instruction = imem[(instr_addr - 32'h80000000) >> 2];
    end

    // ---- Minimal DMEM: synchronous write, combinational read ----
    // Only services the one sw/lw pair in this program; not a general
    // memory model -- the real store/load path is unrelated to the CSR
    // fix and is already covered by csr_hazard_test.s's Spike comparison.
    reg [31:0] dmem [0:15];
    wire [3:0] dmem_idx = data_addr[5:2];
    always @(posedge clk)
        if (mem_write) dmem[dmem_idx] <= data_wdata;
    always @(*)
        data_rdata = dmem[dmem_idx];

    riscv_core dut (
        .clk(clk),
        .rst(rst),
        .instr_addr(instr_addr),
        .instruction(instruction),
        .data_addr(data_addr),
        .data_wdata(data_wdata),
        .data_rdata(data_rdata),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_size(mem_size),
        .load_sign_ext(load_sign_ext),
        .stall_mem(stall_mem),
        .external_irq(external_irq),
        .mtip(mtip),
        .msip(msip)
    );

    always #5 clk = ~clk;

    task check(input [255:0] name, input [31:0] actual, input [31:0] expected);
        begin
            if (actual !== expected) begin
                $display("  FAIL  %0s = %h (expected %h)", name, actual, expected);
                errors = errors + 1;
            end else begin
                $display("  ok    %0s = %h", name, actual);
            end
        end
    endtask

    initial begin
        rst = 1;
        #12;
        rst = 0;

        #300;

        $display("");
        $display("==== csrrw hazard regression ====");
        check("x1 (Case1 producer)      ", dut.rf.register[1], 32'h00000100);
        check("x2 (Case1: EX/MEM fwd)   ", dut.rf.register[2], 32'h00000000);
        check("x3 (Case2: CSR-CSR bypass)", dut.rf.register[3], 32'h00000100);
        check("x4 (Case3 producer)      ", dut.rf.register[4], 32'h00000200);
        check("x5 (Case3: MEM/WB fwd)   ", dut.rf.register[5], 32'h00000000);
        check("x8 (load-use result)     ", dut.rf.register[8], 32'h00000300);
        check("x9 (Case4: load-use fwd) ", dut.rf.register[9], 32'h00000200);
        check("mtvec final              ", dut.u_csr.mtvec_q,  32'h00000300);

        $display("");
        if (errors == 0) begin
            $display("TESTBENCH: PASS (%0d checks)", 8);
        end else begin
            $display("TESTBENCH: FAIL (%0d/%0d checks failed)", errors, 8);
        end
        $display("==================================");

        $finish;
    end

endmodule
