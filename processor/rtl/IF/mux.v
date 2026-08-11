`timescale 1ns/1ps
module mux(pc_plus_4,PCTarget,PCSrc,next_pc,trap_taken,trap_pc);
    input [31:0] pc_plus_4;
    input [31:0] PCTarget;
    input PCSrc;
    input trap_taken ;
    input [31:0] trap_pc ; // added after plic
    output [31:0] next_pc; // added after plic
    
    assign next_pc = (trap_taken) ? trap_pc : ((PCSrc) ? PCTarget : pc_plus_4);   // added after plic
    
endmodule