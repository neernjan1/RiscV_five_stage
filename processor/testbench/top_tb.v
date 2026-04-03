`timescale 1ns / 1ps

module tb_risc;

reg clk;
reg rst;

// DUT
risc_top uut (
    .clk(clk),
    .rst(rst)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #3000 $finish;
end

//--------------------------------------------------
// 🔥 FULL DEBUG MONITOR
//--------------------------------------------------
 
 
initial begin
    

  $monitor("t=%0t | x1=%0d x2=%0d  x3=%0d x4=%0d x5=%0d",
    $time,
    uut.rf.register[1],
    uut.rf.register[2],
    uut.rf.register[3],
    uut.rf.register[4],
    uut.rf.register[5]
);
end   
//initial begin
//    $monitor(
//    "T=%0t | PC=%h | INST=%h | rs1=%0d rs2=%0d rd=%0d | ID: d1=%h d2=%h | EX: d1=%h d2=%h | src1=%h src2=%h | ALU=%h | WB: rd=%0d data=%h we=%b",
    
//    $time,
    
//    // IF stage
//    uut.pc,
//    uut.instruction_code_if,

//    // ID decode
//    uut.rs1_id,
//    uut.rs2_id,
//    uut.rd_id,

//    // ID stage data
//    uut.read_data_1_id,
//    uut.read_data_2_id,

//    // EX stage data (from ID_EX)
//    uut.read_data_1_ex,
//    uut.read_data_2_ex,

//    // ALU inputs
//    uut.src1,
//    uut.src2,

//    // ALU output
//    uut.alu_result_ex,

//    // Writeback
//    uut.rd_wb,
//    uut.write_data_wb,
//    uut.reg_write_wb
//    );
//end

//--------------------------------------------------
// 🔥 REGISTER WRITE TRACE (VERY IMPORTANT)
//--------------------------------------------------

//always @(posedge clk) begin
//    if (uut.reg_write_wb) begin
//        $display(">>> WRITEBACK: x%0d = %h at T=%0t",
//            uut.rd_wb,
//            uut.write_data_wb,
//            $time
//        );
//    end
//end

endmodule