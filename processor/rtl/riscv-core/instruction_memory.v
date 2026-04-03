module instruction_memory(
        input [31:0] pc , 
        output [31:0] instruction_code
    );
    
    reg[31:0] mem [0:1023]; //1kb 32 bit mem
    
   initial begin
        $readmemh("../rtl/riscv-core/program.mem", mem);   // Load instructions from file into memory
        //$readmemh("../rtl/riscv-core/program.mem", mem ,0,
  // $readmemh("../rtl/riscv-core/program.mem", mem ,0, 40);   // Load instructions from file into memory (addresses 0 to 10)
   end
   
    assign instruction_code = mem[pc[31:2]]; //Pc div by 4 ..as we already sending pc+4 ..lsb remains 00..
    
endmodule
