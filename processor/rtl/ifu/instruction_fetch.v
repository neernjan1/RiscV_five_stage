`timescale 1ns / 1ps

module instruction_fetch(
    input clk, rst,
    input PCSrc,
    input PCWrite,
    input [31:0] PCTarget,
    input IF_ID_write, IF_flush,

    output [31:0] Instr_ID,
    output [31:0] pc_ID,
    output [31:0] pc_plus_4_ID
);

    // internal wires
    wire [31:0] next_pc, pc, pc_plus_4;
    wire [31:0] instruction_code;

    wire [31:0] IF_instr;
    wire [31:0] IF_pc;
    wire [31:0] IF_pcplus4;

    // MUX
    mux pc_mux(
        .pc_plus_4(pc_plus_4),
        .PCTarget(PCTarget),
        .PCSrc(PCSrc),
        .next_pc(next_pc)
    );

    // PC
    pc program_counter(
        .clk(clk),
        .rst(rst),
        .pc_write(PCWrite),
        .next_pc(next_pc),
        .pc(pc)
    );

    // Instruction Memory
    instruction_memory imu(
        .pc(pc),
        .instruction_code(instruction_code)
    );

    // PC + 4
    adder pc_adder(
        .pc(pc),
        .pc_plus_4(pc_plus_4)
    );

    // IF stage outputs
    assign IF_instr   = instruction_code;
    assign IF_pc      = pc;
    assign IF_pcplus4 = pc_plus_4;

    // IF/ID Pipeline Register
    IF_ID if_id_reg (
        .clk(clk),
        .rst(rst),

        .IF_flush(IF_flush),
        .IF_ID_write(IF_ID_write),

        .IF_instr(IF_instr),
        .IF_pc(IF_pc),
        .IF_pcplus4(IF_pcplus4),

        .Instr_ID(Instr_ID),
        .pc_ID(pc_ID),
        .pc_plus_4_ID(pc_plus_4_ID)
    );

endmodule

// `timescale 1ns / 1ps

// module instruction_fetch(clk, rst, PCSrc, PCWrite, PCTarget, IF_ID_write, IF_flush, Instr_ID, pc_ID, pc_plus_4_ID);
//     input clk, rst;
//     input PCSrc;
//     input PCWrite;
//     input [31:0] PCTarget;
//     input IF_ID_write, IF_flush;
//     output [31:0] Instr_ID, pc_ID, pc_plus_4_ID;
    
//     //internal wires
//     wire [31:0]next_pc, pc, pc_plus_4;
//     wire [31:0] instruction_code;
    
//     //IF_ID Pipeline registers
//     reg [31:0] IF_ID_instr;
//     reg [31:0] IF_ID_pc;
//     reg [31:0] IF_ID_pcplus4;
    
//     //mux module
//     mux pc_mux(.a(pc_plus_4), .b(PCTarget) , .sel(PCSrc), .out(next_pc));
//     //pc module, basically a flipflop passing on the value depending on the control signal
//     pc program_counter(.clk(clk), .rst(rst),.pc_write(PCWrite), .next_pc(next_pc), .pc(pc));
//     // instruction memory module
//     instruction_memory imu(.pc(pc), .instruction_code(instruction_code));
//     //adder module
//     adder pc_adder(.a(pc), .b(32'h00000004), .out(pc_plus_4));
    
//     //IF_ID stage
//     always @(posedge clk or posedge rst) begin
//         if(rst) begin
//             IF_ID_instr <= 32'b0;
//             IF_ID_pc <= 32'b0;
//             IF_ID_pcplus4 <= 32'b0;
//         end
//         else if(IF_flush == 1'b0) begin //flush the wrong instructions fetched during branch calculation
//             IF_ID_instr <= 32'b0;
//             IF_ID_pc <= 32'b0;
//             IF_ID_pcplus4 <= 32'b0;
//         end        
//         else if(IF_ID_write == 1'b0) begin //holds the same value for every register
//             IF_ID_instr <= IF_ID_instr;
//             IF_ID_pc <= IF_ID_pc;
//             IF_ID_pcplus4 <= IF_ID_pcplus4;
//         end      
//         else begin
//             IF_ID_instr <= instruction_code;
//             IF_ID_pc <= pc;
//             IF_ID_pcplus4 <= pc_plus_4;        
//         end 
//     end
    
//     assign Instr_ID = (rst) ? 32'b0 : IF_ID_instr;
//     assign pc_ID = (rst) ? 32'b0 : IF_ID_pc;
//     assign pc_plus_4_ID = (rst) ? 32'b0 : IF_ID_pcplus4;
    
    
    
    
    
    
// endmodule
