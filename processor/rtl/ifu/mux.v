module mux(pc_plus_4,PCTarget,PCSrc,next_pc);
    input [31:0] pc_plus_4;
    input [31:0] PCTarget;
    input PCSrc;
    output [31:0] next_pc;
    
    assign next_pc = (PCSrc) ? PCTarget : pc_plus_4;
    
endmodule