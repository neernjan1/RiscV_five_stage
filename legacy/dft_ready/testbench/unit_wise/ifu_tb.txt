module ifu_tb();
    reg clk, rst;
    reg PCSrc;
    reg [31:0] PCTarget;
    reg PCWrite, IF_ID_write, IF_flush;
    wire [31:0] Instr_ID, pc_ID, pc_plus_4_ID;

    
    instruction_fetch dut(.clk(clk), .rst(rst), .PCSrc(PCSrc), .PCWrite(PCWrite), .PCTarget(PCTarget), .IF_ID_write(IF_ID_write), .IF_flush(IF_flush), .Instr_ID(Instr_ID), .pc_ID(pc_ID), .pc_plus_4_ID(pc_plus_4_ID));
    always #50 clk =~clk;
     initial begin
    rst = 1'b1;
    clk=0;
    #200 rst = 1'b0;

    PCSrc = 0;
    PCTarget = 0;
    PCWrite = 1;
    IF_ID_write = 1;
    IF_flush = 0;

    #400;

    // Stall
    PCWrite = 0;
    IF_ID_write = 0;
    #200;

    // Resume
    PCWrite = 1;
    IF_ID_write = 1;
    #200;

    // Branch
    PCSrc = 1;
    PCTarget = 32'h4;
    IF_flush = 1;   // FIXED
    #200;

    // Normal
    PCSrc = 0;
    IF_flush = 0;

    #1000 $finish;
end
        
     // Monitor
    initial begin
        $dumpfile("ifu_tb.vcd");
        $dumpvars(0,ifu_tb);
        
        $monitor("Time=%0t | PC=%h | Instr=%h | PC+4=%h | IF_ID_Write=%b | PC_write =%b| Flush=%b",
                  $time, pc_ID, Instr_ID, pc_plus_4_ID, IF_ID_write,PCWrite, IF_flush);
        
    
    end
    
endmodule
// `timescale 1ns / 1ps

// module ifu_tb();

//     reg clk, rst;
//     reg PCSrc;
//     reg [31:0] PCTarget;
//     reg PCWrite, IF_ID_write, IF_flush;

//     wire [31:0] Instr_ID, pc_ID, pc_plus_4_ID;

//     // DUT
//     instruction_fetch dut(
//         .clk(clk),
//         .rst(rst),
//         .PCSrc(PCSrc),
//         .PCWrite(PCWrite),
//         .PCTarget(PCTarget),
//         .IF_ID_write(IF_ID_write),
//         .IF_flush(IF_flush),
//         .Instr_ID(Instr_ID),
//         .pc_ID(pc_ID),
//         .pc_plus_4_ID(pc_plus_4_ID)
//     );

//     // Clock generation
//     initial clk = 0;
//     always #50 clk = ~clk;

//     // Monitor
//     initial begin
//         $dumpfile("ifu_tb.vcd");
//         $dumpvars(0,ifu_tb);
        
//         $monitor("Time=%0t | PC=%h | Instr=%h | PC+4=%h | IF_ID_Write=%b | PC_write =%b| Flush=%b",
//                   $time, pc_ID, Instr_ID, pc_plus_4_ID, IF_ID_write,PCWrite, IF_flush);
        
    
//     end

//     // Stimulus
//     initial begin
//         // Initialize everything
//         rst = 1;
//         PCSrc = 0;
//         PCTarget = 32'h4;
//         PCWrite = 1;
//         IF_ID_write = 1;
//         IF_flush = 0;   

//         #100;
//         rst = 0; //verified

//        // #300 PCSrc=1; //verified 
//         #400 PCSrc=0; //verified manually

//         //stall 
//         #100 IF_ID_write =0;PCWrite=0;
//         #100 IF_ID_write =1;PCWrite=1;
        

//         // ✅ Normal execution
//        // #200;
//         // //check branching 
//         // PCSrc = 1; #200

//         // PCSrc = 0; #200

//         // // ✅ Stall test
//         // IF_ID_write = 0;
//         // #200;

//         // // ✅ Resume
//         // IF_ID_write = 1;
//         // #200;

//         // // ✅ PC stall
//         // PCWrite = 0;
//         // #200;

//         // PCWrite = 1;

//         // // ✅ Flush test
//         #200 IF_flush = 1;
//         // #200;
//         #200 IF_flush = 0;PCSrc=1;

//         // IF_flush = 0;
//         // #200; 
        
        

//        #1000 $finish;
//     end

// endmodule

