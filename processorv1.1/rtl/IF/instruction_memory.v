`timescale 1ns/1ps
module instruction_memory(
        input [31:0] pc , 
        output [31:0] instruction_code
    );
    
    reg [31:0] imem [0:1023]; //1kb 32 bit mem
        
    initial begin
        $readmemh("imem.mem", imem); // comment added
    end
    
    assign instruction_code = imem[pc[11:2]]; //Pc div by 4 ..as we already sending pc+4 ..lsb remains 00..
    
endmodule
