`timescale 1ns/1ps

// Two run-time plusargs, both optional (both default to a quiet, generic
// run so nothing breaks for an invocation that doesn't pass them):
//   +TESTNAME=<name>  Printed in the start/end banners and used by
//                      check_test.py to look up tests/directed/<name>.expect
//                      for automatic PASS/FAIL. run.sh/run_assembly.sh pass
//                      this automatically (derived from the test file's
//                      basename) -- nothing to do by hand.
//   +VERBOSE           Turns on the per-peripheral debug traces that used
//                      to always print (SPI transaction monitor here,
//                      STORE/LOAD in data_memory.v, AUIPC decode in
//                      imm_gen.v) -- off by default so a normal run's
//                      output stays readable, on when you actually need
//                      to see bus-level activity.

module tb;

//=========================================================
// Testbench Signals
//=========================================================
reg clk;
reg rst;
integer i;

reg [8*64-1:0] test_name;
reg verbose_trace;

initial begin
    if (!$value$plusargs("TESTNAME=%s", test_name))
        test_name = "unknown";
    verbose_trace = $test$plusargs("VERBOSE");
end
reg spi_sdi0;
reg spi_sdi1;
reg spi_sdi2;
reg spi_sdi3;

wire spi_clk;

wire spi_csn0;
wire spi_csn1;
wire spi_csn2;
wire spi_csn3;

wire spi_sdo0;
wire spi_sdo1;
wire spi_sdo2;
wire spi_sdo3;

// GPIO: fixed pattern on the input pins so a directed test can read a
// known value back through them; outputs/direction just observed.
reg  [31:0] gpio_in = 32'hA5A5_1234;
wire [31:0] gpio_out;
wire [31:0] gpio_tx_en;

// UART: simple external loopback (tx wired straight back to rx) so a
// directed test can transmit a byte and read it back through the real
// TX/RX framing logic end to end.
wire uart_tx;
wire uart_rx = uart_tx;
//=========================================================
// DUT
//=========================================================
soc_top soc(

    .clk(clk),
    .rst(rst),

    .spi_sdi0(spi_sdi0),
    .spi_sdi1(spi_sdi1),
    .spi_sdi2(spi_sdi2),
    .spi_sdi3(spi_sdi3),

    .spi_clk(spi_clk),

    .spi_csn0(spi_csn0),
    .spi_csn1(spi_csn1),
    .spi_csn2(spi_csn2),
    .spi_csn3(spi_csn3),

    .spi_sdo0(spi_sdo0),
    .spi_sdo1(spi_sdo1),
    .spi_sdo2(spi_sdo2),
    .spi_sdo3(spi_sdo3),

    .gpio_in(gpio_in),
    .gpio_out(gpio_out),
    .gpio_tx_en(gpio_tx_en),

    .uart_tx(uart_tx),
    .uart_rx(uart_rx)

);

//=========================================================
// Clock Generation
//=========================================================

always #5 clk = ~clk;

//=========================================================
// Reset Generation
//=========================================================

initial begin
    clk = 0;
    rst = 1;

    #2;
    rst = 0;

    $display("");
    $display("==============================================================");
    $display(" Running Test: %0s", test_name);
    $display("==============================================================");

    #200000;

    $display("\n========== REGISTER FILE ==========");

    for (i = 0; i < 32; i = i + 1) begin
        $display("x%0d = %08h", i, soc.cpu.rf.register[i]);
    end
    $display("===================================\n");

    // Print Coverage Report
    print_coverage();

    $display("");
    $display("==============================================================");
    $display(" Test Complete: %0s", test_name);
    $display("==============================================================");
    $display("");

    // Close log files
    $fclose(rtl_log);

    $finish;
end;

initial begin
    spi_sdi0 = 0;
    spi_sdi1 = 0;
    spi_sdi2 = 0;
    spi_sdi3 = 0;
end

//=========================================================
// Waveform Dump
//=========================================================

initial begin
    $dumpfile("riscv.vcd");
    $dumpvars(0,tb);
end;

//=========================================================
// RTL Logger
//=========================================================

// RTL log file

integer rtl_log;
reg [31:0] last_pc;

initial begin
    rtl_log = $fopen("../rtl.log","w");
    last_pc = 32'hFFFFFFFF;
end

always @(posedge clk)
begin

    if(soc.cpu.reg_write_wb &&
       soc.cpu.rd_wb != 0 &&
       soc.cpu.pc_wb != last_pc)
    begin
        $fdisplay(
            rtl_log,
            "PC=%h x%0d=%h",
            soc.cpu.pc_wb,
            soc.cpu.rd_wb,
            soc.cpu.write_data_wb
        );

        last_pc <= soc.cpu.pc_wb;
    end

    //---------------------------------------------------------
// RTL Memory Logger
//---------------------------------------------------------

if(soc.cpu.mem_write_mem)
begin

    case(soc.cpu.mem_size_mem)

        //----------------------------------------
        // Store Byte
        //----------------------------------------
        `BYTE:
        begin
            $fdisplay(
                rtl_log,
                "PC=%h mem[%h]=%08h",
                soc.cpu.pc_mem,
                soc.cpu.alu_result_mem,
                {24'b0, soc.cpu.write_data_mem[7:0]}
            );
        end

        //----------------------------------------
        // Store Halfword
        //----------------------------------------
        `HALF:
        begin
            $fdisplay(
                rtl_log,
                "PC=%h mem[%h]=%08h",
                soc.cpu.pc_mem,
                soc.cpu.alu_result_mem,
                {16'b0, soc.cpu.write_data_mem[15:0]}
            );
        end

        //----------------------------------------
        // Store Word
        //----------------------------------------
        `WORD:
        begin
            $fdisplay(
                rtl_log,
                "PC=%h mem[%h]=%08h",
                soc.cpu.pc_mem,
                soc.cpu.alu_result_mem,
                soc.cpu.write_data_mem
            );
        end

        default:
        begin
            $display("Unknown mem_size = %b", soc.cpu.mem_size_mem);
        end

    endcase



end

end

//--------------------------------------------------------
// Temporary debug
//----------------------------------------------------------
// always @(posedge clk)
// $display(
//     "PC=%h mem_write=%b mem_size=%b addr=%h data=%h",
//     soc.cpu.pc_mem,
//     soc.cpu.mem_write_mem,
//     soc.cpu.mem_size_mem,
//     soc.cpu.alu_result_mem,
//     soc.cpu.write_data_mem
// );

//=========================================================
// Functional Coverage
//=========================================================

//-----------------------------
// Instruction Coverage
//-----------------------------

// Arithmetic

integer add_cov;
integer sub_cov;
integer addi_cov;

// Logical

integer and_cov;
integer or_cov;
integer xor_cov;

// Shift

integer sll_cov;
integer srl_cov;
integer sra_cov;

// Comparison

integer slt_cov;
integer sltu_cov;

// Immediate

integer slti_cov;
integer sltiu_cov;
integer andi_cov;
integer ori_cov;
integer xori_cov;
integer slli_cov;
integer srli_cov;
integer srai_cov;

// Upper Immediate

integer lui_cov;
integer auipc_cov;

// Load

integer lb_cov;
integer lh_cov;
integer lw_cov;
integer lbu_cov;
integer lhu_cov;

// Store

integer sb_cov;
integer sh_cov;
integer sw_cov;

// Branch

integer beq_taken_cov;
integer beq_not_taken_cov;

integer bne_taken_cov;
integer bne_not_taken_cov;

integer blt_taken_cov;
integer blt_not_taken_cov;

integer bge_taken_cov;
integer bge_not_taken_cov;

integer bltu_taken_cov;
integer bltu_not_taken_cov;

integer bgeu_taken_cov;
integer bgeu_not_taken_cov;

// Jump

integer jal_cov;
integer jalr_cov;


//=========================================================
// Pipeline Coverage
//=========================================================

// Forwarding
integer rf_forwardA_cov;
integer ex_forwardA_cov;
integer mem_forwardA_cov;

integer rf_forwardB_cov;
integer ex_forwardB_cov;
integer mem_forwardB_cov;

// Hazard

integer load_use_cov;
integer raw_dependency_cov;
integer double_dependency_cov;
integer dual_forward_cov;
// Stall

integer stall_cov;

// Flush

integer flush_cov;

//=========================================================
// Register Coverage
//=========================================================

integer reg_write_cov[31:1];

//=========================================================
// Memory Coverage
//=========================================================

integer byte_store_cov;
integer half_store_cov;
integer word_store_cov;

integer byte_load_cov;
integer half_load_cov;
integer word_load_cov;

//------------------------------------------------
// Forwarding Scenario Coverage Counters
//------------------------------------------------

// Arithmetic
integer add_forward_cov;
integer sub_forward_cov;
integer addi_forward_cov;

// Logical
integer and_forward_cov;
integer or_forward_cov;
integer xor_forward_cov;
integer andi_forward_cov;
integer ori_forward_cov;
integer xori_forward_cov;

// Shift
integer sll_forward_cov;
integer srl_forward_cov;
integer sra_forward_cov;
integer slli_forward_cov;
integer srli_forward_cov;
integer srai_forward_cov;

// Comparison
integer slt_forward_cov;
integer sltu_forward_cov;
integer slti_forward_cov;
integer sltiu_forward_cov;

// Upper Immediate
integer lui_forward_cov;
integer auipc_forward_cov;

// Memory
integer load_forward_cov;
integer store_forward_cov;

// Control
integer branch_forward_cov;
integer jal_forward_cov;
integer jalr_forward_cov;

//Memory coverage 
integer first_addr_cov;
integer last_addr_cov;

//=========================================================
// Coverage Collection Logic
//=========================================================

always @(posedge clk)
begin

    //------------------------------------
    // Instruction Coverage
    //------------------------------------
   //------------------------------------
// Instruction Coverage
//------------------------------------

case(soc.cpu.alu1.operation)

    // Arithmetic
    `ALU_ADD   : add_cov   <= add_cov + 1;
    `ALU_SUB   : sub_cov   <= sub_cov + 1;
    `ALU_ADDI  : addi_cov  <= addi_cov + 1;

    // Logical
    `ALU_AND   : and_cov   <= and_cov + 1;
    `ALU_OR    : or_cov    <= or_cov + 1;
    `ALU_XOR   : xor_cov   <= xor_cov + 1;
    `ALU_ANDI  : andi_cov  <= andi_cov + 1;
    `ALU_ANDI_ALT : andi_cov <= andi_cov + 1;
    `ALU_ORI   : ori_cov   <= ori_cov + 1;
    `ALU_XORI  : xori_cov  <= xori_cov + 1;

    // Shift
    `ALU_SLL   : sll_cov   <= sll_cov + 1;
    `ALU_SRL   : srl_cov   <= srl_cov + 1;
    `ALU_SRA   : sra_cov   <= sra_cov + 1;
    `ALU_SLLI  : slli_cov  <= slli_cov + 1;
    `ALU_SRLI  : srli_cov  <= srli_cov + 1;
    `ALU_SRAI  : srai_cov  <= srai_cov + 1;

    // Comparison
    `ALU_SLT   : slt_cov   <= slt_cov + 1;
    `ALU_SLTU  : sltu_cov  <= sltu_cov + 1;
    `ALU_SLTI  : slti_cov  <= slti_cov + 1;
    `ALU_SLTIU : sltiu_cov <= sltiu_cov + 1;

    // Upper Immediate
    `ALU_LUI   : lui_cov   <= lui_cov + 1;
    `ALU_AUIPC : auipc_cov <= auipc_cov + 1;

    // Loads
    `ALU_L_BYTE : lb_cov   <= lb_cov + 1;
    `ALU_L_HALF : lh_cov   <= lh_cov + 1;
    `ALU_L_WORD : lw_cov   <= lw_cov + 1;
    `ALU_L_BU   : lbu_cov  <= lbu_cov + 1;
    `ALU_L_HU   : lhu_cov  <= lhu_cov + 1;

    // Stores
    `ALU_S_BYTE : sb_cov   <= sb_cov + 1;
    `ALU_S_HALF : sh_cov   <= sh_cov + 1;
    `ALU_S_WORD : sw_cov   <= sw_cov + 1;

    // Branches
    `ALU_BEQ : begin
        if(soc.cpu.alu1.branch_condn)
            beq_taken_cov <= beq_taken_cov + 1;
        else
            beq_not_taken_cov <= beq_not_taken_cov + 1;
    end

    `ALU_BNE : begin
        if(soc.cpu.alu1.branch_condn)
            bne_taken_cov <= bne_taken_cov + 1;
        else
            bne_not_taken_cov <= bne_not_taken_cov + 1;
    end

    `ALU_BLT : begin
        if(soc.cpu.alu1.branch_condn)
            blt_taken_cov <= blt_taken_cov + 1;
        else
            blt_not_taken_cov <= blt_not_taken_cov + 1;
    end

    `ALU_BGE : begin
        if(soc.cpu.alu1.branch_condn)
            bge_taken_cov <= bge_taken_cov + 1;
        else
            bge_not_taken_cov <= bge_not_taken_cov + 1;
    end

    `ALU_BLTU : begin
        if(soc.cpu.alu1.branch_condn)
            bltu_taken_cov <= bltu_taken_cov + 1;
        else
            bltu_not_taken_cov <= bltu_not_taken_cov + 1;
    end

    `ALU_BGEU : begin
        if(soc.cpu.alu1.branch_condn)
            bgeu_taken_cov <= bgeu_taken_cov + 1;
        else
            bgeu_not_taken_cov <= bgeu_not_taken_cov + 1;
    end

    // Jumps
    `ALU_JAL  : jal_cov  <= jal_cov + 1;
    `ALU_JALR : jalr_cov <= jalr_cov + 1;

    default: ;

endcase

    
//------------------------------------
// Hazard Coverage
//------------------------------------

//------------------------------------------------
// Load-Use Hazard
// lw x1,...
// add x2,x1,x3
//------------------------------------------------
    if (soc.cpu.mem_read_ex &&
    (soc.cpu.rd_ex != 0) &&
    ((soc.cpu.rs1_id == soc.cpu.rd_ex) ||
     (soc.cpu.rs2_id == soc.cpu.rd_ex)))
    begin
        load_use_cov++;
    end;


    //------------------------------------------------
    // RAW Dependency in Register File
    //------------------------------------------------
    if (soc.cpu.rf.reg_write &&
    (soc.cpu.rf.rd != 0) &&
    (soc.cpu.rf.rs1 == soc.cpu.rf.rd))
    begin
        raw_dependency_cov++;
    end;


    //------------------------------------------------
    // Forwarding Coverage
    //------------------------------------------------

    ///------------------------------------------------
    // Forwarding Coverage
    //------------------------------------------------

    // No Forwarding (Register File)
    if(soc.cpu.forwardA == 2'b00)
        rf_forwardA_cov++;

    if(soc.cpu.forwardB == 2'b00)
        rf_forwardB_cov++;

    // EX/MEM Forwarding
    if(soc.cpu.forwardA == 2'b01)
        ex_forwardA_cov++;

    if(soc.cpu.forwardB == 2'b01)
        ex_forwardB_cov++;

    // MEM/WB Forwarding
    if(soc.cpu.forwardA == 2'b10)
        mem_forwardA_cov++;

    if(soc.cpu.forwardB == 2'b10)
        mem_forwardB_cov++;

    //------------------------------------------------
    // Pipeline Flush
    //------------------------------------------------
    if(soc.cpu.flush)
        flush_cov++;


    //------------------------------------------------
    // Pipeline Stall
    //------------------------------------------------
    if(!soc.cpu.pc_write)
        stall_cov++;


//------------------------------------------------
// Double Dependency
//
// Both MEM and WB contain the same destination
// register needed by the current instruction.
// Forwarding priority should select MEM.
//------------------------------------------------
    if(soc.cpu.reg_write_mem &&
    soc.cpu.reg_write_wb &&
    (soc.cpu.rd_mem != 0) &&
    (
        ((soc.cpu.rd_mem == soc.cpu.rs1_ex) &&
        (soc.cpu.rd_wb  == soc.cpu.rs1_ex))
        ||
        ((soc.cpu.rd_mem == soc.cpu.rs2_ex) &&
        (soc.cpu.rd_wb  == soc.cpu.rs2_ex))
    ))
    begin
        double_dependency_cov++;
    end;


//------------------------------------------------
// Dual Operand Forwarding
//
// Both operands require forwarding
//------------------------------------------------
    if((soc.cpu.forwardA != 2'b00) &&
    (soc.cpu.forwardB != 2'b00))
    begin
        dual_forward_cov++;
    end;

    //------------------------------------------------
    // Forwarding Scenario Coverage
    //
    // Checks whether the current instruction is
    // executed using a forwarded operand.
    //------------------------------------------------

    if ((soc.cpu.forwardA != 2'b00) || (soc.cpu.forwardB != 2'b00))
    begin

        //----------------------------------------
        // Arithmetic Instructions
        //----------------------------------------
        case(soc.cpu.operation)

            `ALU_ADD   : add_forward_cov++;
            `ALU_SUB   : sub_forward_cov++;
            `ALU_ADDI  : addi_forward_cov++;

            //------------------------------------
            // Logical Instructions
            //------------------------------------
            `ALU_AND   : and_forward_cov++;
            `ALU_OR    : or_forward_cov++;
            `ALU_XOR   : xor_forward_cov++;

            `ALU_ANDI  : andi_forward_cov++;
            `ALU_ORI   : ori_forward_cov++;
            `ALU_XORI  : xori_forward_cov++;

            //------------------------------------
            // Shift Instructions
            //------------------------------------
            `ALU_SLL   : sll_forward_cov++;
            `ALU_SRL   : srl_forward_cov++;
            `ALU_SRA   : sra_forward_cov++;

            `ALU_SLLI  : slli_forward_cov++;
            `ALU_SRLI  : srli_forward_cov++;
            `ALU_SRAI  : srai_forward_cov++;

            //------------------------------------
            // Comparison Instructions
            //------------------------------------
            `ALU_SLT   : slt_forward_cov++;
            `ALU_SLTU  : sltu_forward_cov++;
            `ALU_SLTI  : slti_forward_cov++;
            `ALU_SLTIU : sltiu_forward_cov++;

            //------------------------------------
            // Upper Immediate Instructions
            //------------------------------------
            `ALU_LUI   : lui_forward_cov++;
            `ALU_AUIPC : auipc_forward_cov++;

            default: ;

        endcase

    end


    //------------------------------------------------
    // Load Address Forwarding
    //------------------------------------------------
    if ((soc.cpu.forwardA != 2'b00 || soc.cpu.forwardB != 2'b00) &&
        (soc.cpu.operation == `ALU_L_WORD ||
        soc.cpu.operation == `ALU_L_HALF ||
        soc.cpu.operation == `ALU_L_BYTE ||
        soc.cpu.operation  == `ALU_L_HU   ||
        soc.cpu.operation == `ALU_L_BU))
    begin
        load_forward_cov++;
    end


    //------------------------------------------------
    // Store Address/Data Forwarding
    //------------------------------------------------
    if ((soc.cpu.forwardA != 2'b00 || soc.cpu.forwardB != 2'b00) &&
        (soc.cpu.operation == `ALU_S_WORD ||
        soc.cpu.operation == `ALU_S_HALF ||
        soc.cpu.operation == `ALU_S_BYTE))
    begin
        store_forward_cov++;
    end


    //------------------------------------------------
    // Branch Operand Forwarding
    //------------------------------------------------
    if ((soc.cpu.forwardA != 2'b00 || soc.cpu.forwardB != 2'b00) &&
        (soc.cpu.operation == `ALU_BEQ  ||
        soc.cpu.operation == `ALU_BNE  ||
        soc.cpu.operation == `ALU_BLT  ||
        soc.cpu.operation == `ALU_BGE  ||
        soc.cpu.operation == `ALU_BLTU ||
        soc.cpu.operation == `ALU_BGEU))
    begin
        branch_forward_cov++;
    end


    //------------------------------------------------
    // JALR Base Register Forwarding
    //------------------------------------------------
    if ((soc.cpu.forwardA != 2'b00 || soc.cpu.forwardB != 2'b00) &&
        soc.cpu.operation == `ALU_JALR)
    begin
        jalr_forward_cov++;
    end


    //------------------------------------------------
    // JAL Link Register Forwarding
    //------------------------------------------------
    if ((soc.cpu.forwardA != 2'b00 || soc.cpu.forwardB != 2'b00) &&
        soc.cpu.operation == `ALU_JAL)
    begin
        jal_forward_cov++;
    end

    //------------------------------------------------------
    //Memory Coverage 
    //------------------------------------------------------
    if(soc.cpu.mem_write_mem || soc.cpu.mem_read_mem)
        begin

            if(soc.cpu.alu_result_mem==32'h80010000)
                first_addr_cov++;

            if(soc.cpu.alu_result_mem==32'h80013FFF)
                last_addr_cov++;
        end 




end

//=========================================================
// Coverage Report
//=========================================================

task print_coverage;

begin

   $display("");
$display("==============================================================");
$display("                 RV32I FUNCTIONAL COVERAGE REPORT");
$display("==============================================================");

$display("");
$display("---------------- Instruction Coverage ----------------");
$display("Instruction      Count    Covered");
$display("-----------------------------------------------");

$display("ADD         %8d      %s", add_cov,   (add_cov>0)   ? "YES":"NO");
$display("SUB         %8d      %s", sub_cov,   (sub_cov>0)   ? "YES":"NO");
$display("ADDI        %8d      %s", addi_cov,  (addi_cov>0)  ? "YES":"NO");

$display("AND         %8d      %s", and_cov,   (and_cov>0)   ? "YES":"NO");
$display("OR          %8d      %s", or_cov,    (or_cov>0)    ? "YES":"NO");
$display("XOR         %8d      %s", xor_cov,   (xor_cov>0)   ? "YES":"NO");

$display("ANDI        %8d      %s", andi_cov,  (andi_cov>0)  ? "YES":"NO");
$display("ORI         %8d      %s", ori_cov,   (ori_cov>0)   ? "YES":"NO");
$display("XORI        %8d      %s", xori_cov,  (xori_cov>0)  ? "YES":"NO");

$display("SLL         %8d      %s", sll_cov,   (sll_cov>0)   ? "YES":"NO");
$display("SRL         %8d      %s", srl_cov,   (srl_cov>0)   ? "YES":"NO");
$display("SRA         %8d      %s", sra_cov,   (sra_cov>0)   ? "YES":"NO");

$display("SLLI        %8d      %s", slli_cov,  (slli_cov>0)  ? "YES":"NO");
$display("SRLI        %8d      %s", srli_cov,  (srli_cov>0)  ? "YES":"NO");
$display("SRAI        %8d      %s", srai_cov,  (srai_cov>0)  ? "YES":"NO");

$display("SLT         %8d      %s", slt_cov,   (slt_cov>0)   ? "YES":"NO");
$display("SLTU        %8d      %s", sltu_cov,  (sltu_cov>0)  ? "YES":"NO");
$display("SLTI        %8d      %s", slti_cov,  (slti_cov>0)  ? "YES":"NO");
$display("SLTIU       %8d      %s", sltiu_cov, (sltiu_cov>0) ? "YES":"NO");

$display("LUI         %8d      %s", lui_cov,   (lui_cov>0)   ? "YES":"NO");
$display("AUIPC       %8d      %s", auipc_cov, (auipc_cov>0) ? "YES":"NO");

$display("LB          %8d      %s", lb_cov,    (lb_cov>0)    ? "YES":"NO");
$display("LH          %8d      %s", lh_cov,    (lh_cov>0)    ? "YES":"NO");
$display("LW          %8d      %s", lw_cov,    (lw_cov>0)    ? "YES":"NO");
$display("LBU         %8d      %s", lbu_cov,   (lbu_cov>0)   ? "YES":"NO");
$display("LHU         %8d      %s", lhu_cov,   (lhu_cov>0)   ? "YES":"NO");

$display("SB          %8d      %s", sb_cov,    (sb_cov>0)    ? "YES":"NO");
$display("SH          %8d      %s", sh_cov,    (sh_cov>0)    ? "YES":"NO");
$display("SW          %8d      %s", sw_cov,    (sw_cov>0)    ? "YES":"NO");

$display("JAL         %8d      %s", jal_cov,   (jal_cov>0)   ? "YES":"NO");
$display("JALR        %8d      %s", jalr_cov,  (jalr_cov>0)  ? "YES":"NO");

$display("");
$display("---------------- Branch Coverage ----------------");
$display("Branch     Taken   NotTaken  Covered");
$display("-------------------------------------------------");

$display("BEQ    %8d %8d      %s",
beq_taken_cov,
beq_not_taken_cov,
(beq_taken_cov>0 && beq_not_taken_cov>0)?"YES":"NO");

$display("BNE    %8d %8d      %s",
bne_taken_cov,
bne_not_taken_cov,
(bne_taken_cov>0 && bne_not_taken_cov>0)?"YES":"NO");

$display("BLT    %8d %8d      %s",
blt_taken_cov,
blt_not_taken_cov,
(blt_taken_cov>0 && blt_not_taken_cov>0)?"YES":"NO");

$display("BGE    %8d %8d      %s",
bge_taken_cov,
bge_not_taken_cov,
(bge_taken_cov>0 && bge_not_taken_cov>0)?"YES":"NO");

$display("BLTU   %8d %8d      %s",
bltu_taken_cov,
bltu_not_taken_cov,
(bltu_taken_cov>0 && bltu_not_taken_cov>0)?"YES":"NO");

$display("BGEU   %8d %8d      %s",
bgeu_taken_cov,
bgeu_not_taken_cov,
(bgeu_taken_cov>0 && bgeu_not_taken_cov>0)?"YES":"NO");

$display("");
$display("---------------- Hazard Coverage ----------------");
$display("Hazard                    Count   Covered");
$display("-------------------------------------------------");

$display("Load-Use Hazard      %8d      %s", load_use_cov,
(load_use_cov>0)?"YES":"NO");

$display("RAW Dependency       %8d      %s", raw_dependency_cov,
(raw_dependency_cov>0)?"YES":"NO");

$display("Pipeline Stall       %8d      %s", stall_cov,
(stall_cov>0)?"YES":"NO");

$display("Pipeline Flush       %8d      %s", flush_cov,
(flush_cov>0)?"YES":"NO");

$display("Double Dependency    %8d      %s", double_dependency_cov,
(double_dependency_cov>0)?"YES":"NO");

$display("Dual Forwarding      %8d      %s", dual_forward_cov,
(dual_forward_cov>0)?"YES":"NO");

$display("");
$display("------------ Forwarding Scenario Coverage ------------");
$display("Scenario                 Count  Covered");
$display("------------------------------------------------------");

$display("ADD Forwarding      %8d      %s", add_forward_cov,
(add_forward_cov>0)?"YES":"NO");

$display("SUB Forwarding      %8d      %s", sub_forward_cov,
(sub_forward_cov>0)?"YES":"NO");

$display("ADDI Forwarding     %8d      %s", addi_forward_cov,
(addi_forward_cov>0)?"YES":"NO");

$display("LUI Forwarding      %8d      %s", lui_forward_cov,
(lui_forward_cov>0)?"YES":"NO");

$display("AUIPC Forwarding    %8d      %s", auipc_forward_cov,
(auipc_forward_cov>0)?"YES":"NO");

$display("Load Forwarding     %8d      %s", load_forward_cov,
(load_forward_cov>0)?"YES":"NO");

$display("Store Forwarding    %8d      %s", store_forward_cov,
(store_forward_cov>0)?"YES":"NO");

$display("Branch Forwarding   %8d      %s", branch_forward_cov,
(branch_forward_cov>0)?"YES":"NO");

$display("JAL Forwarding      %8d      %s", jal_forward_cov,
(jal_forward_cov>0)?"YES":"NO");

$display("JALR Forwarding     %8d      %s", jalr_forward_cov,
(jalr_forward_cov>0)?"YES":"NO");


 

    
    
    //-----------------------------
    // Memory
    //-----------------------------
    $display("");
$display("------------ Memory Corner Coverage ------------");
$display("Scenario                 Count     Covered");
$display("------------------------------------------------------");


    $display("First Address Cov     %8d       %s", first_addr_cov,
    (first_addr_cov>0)?"YES":"NO");

    $display("Last Address Cov      %8d       %s", last_addr_cov,
    (last_addr_cov>0)?"YES":"NO");

end

endtask

//==================================================
//SPI PRINTING
//===================================================
reg [7:0] tx_byte;
integer bit_cnt;
integer byte_cnt;

always @(negedge soc.spi.spi_csn0) begin
    tx_byte  = 8'h00;
    bit_cnt  = 0;
    byte_cnt = 0;
    if (verbose_trace) $display("\nSPI Transaction Started");
end

always @(posedge soc.spi.spi_clk) begin
    if (!soc.spi.spi_csn0) begin
        tx_byte = {tx_byte[6:0], soc.spi.spi_sdo0};   // MSB first
        bit_cnt = bit_cnt + 1;

        if (bit_cnt == 8) begin
            if (verbose_trace)
                $display("Byte %0d = 0x%02h (%08b)",
                         byte_cnt, tx_byte, tx_byte);
            byte_cnt = byte_cnt + 1;
            bit_cnt  = 0;
            tx_byte  = 8'h00;
        end
    end
end

always @(posedge soc.spi.spi_csn0)
    if (verbose_trace) $display("SPI Transaction Finished\n");

///=====================================================
// SPI FLASH MODEL (RX DATA)
//=====================================================

reg [7:0] slave_data;
integer rx_bit;

initial begin
    slave_data = 8'hB9;
    rx_bit = 0;
end

always @(negedge soc.spi_csn0)
begin
    rx_bit = 0;
end

always @(negedge soc.spi_clk)
begin
    if (!soc.spi_csn0 &&
        soc.spi.u_spictrl.state == 6)
    begin
        spi_sdi1 = slave_data[7-rx_bit];

        if (verbose_trace)
            $display("[%0t] Driving bit %0d = %b",
                     $time,
                     rx_bit,
                     spi_sdi1);

        rx_bit = rx_bit + 1;

        if(rx_bit==8)
            rx_bit=0;
    end
    else
        spi_sdi1 = 0;
end

// Optional monitor
always @(posedge soc.spi.spi_clk)
begin
    if (!soc.spi.spi_csn0 && verbose_trace)
    begin
        $display("[%0t] slave_data=%h  rx_bit=%0d  drive=%b",
         $time,
         slave_data,
         rx_bit,
         slave_data[7-rx_bit]);
    end
end


always @(posedge clk) begin
    if (soc.spi.u_spictrl.spi_ctrl_data_rx_valid && verbose_trace)
        $display("[%0t] CTRL RX = %08h",
                 $time,
                 soc.spi.u_spictrl.spi_ctrl_data_rx);
end

always @(posedge clk) begin
    if (soc.spi.u_rxfifo.valid_o && verbose_trace)
        $display("[%0t] FIFO RX = %08h",
                 $time,
                 soc.spi.u_rxfifo.data_o);
end

always @(posedge clk) begin
    if (soc.spi.u_axiregs.spi_data_rx_ready && verbose_trace)
        $display("[%0t] CPU read RXFIFO = %08h",
                 $time,
                 soc.spi.u_axiregs.spi_data_rx);
end

endmodule