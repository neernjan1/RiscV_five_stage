module instruction_memory(
        input [31:0] pc , 
        output [31:0] instruction_code
    );
    
    reg[31:0] mem [0:1023]; //1kb 32 bit mem
    
   initial begin
   $readmemh("../programs/program.mem",mem);
   end
   
    assign instruction_code = mem[pc[31:2]]; //Pc div by 4 ..as we already sending pc+4 ..lsb remains 00..
    
endmodule
