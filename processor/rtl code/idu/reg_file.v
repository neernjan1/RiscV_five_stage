`timescale 1ns / 1ps

module reg_file(
input clk , input rst,
input reg_write ,
input [4:0] rs1 , 
input [4:0] rs2 , 
input [4:0] rd ,
input [31:0] write_data ,
output  [31:0] read_data1 , 
output  [31:0] read_data2 
    );
   reg [31:0] register [31:0] ; 
   integer i;
    
    
    always @ (posedge clk)
    begin
    
    if(rst)begin
    for (i = 0; i < 32; i = i + 1)
        register[i] <= 32'b0;
         end
         
    else if(reg_write && rd != 5'b0)
        register[rd] <= write_data ;
        
    register[0] <= 32'b0;
    
    end
    
    assign read_data1 = (reg_write && rd == rs1 && rd != 0) ? write_data : register[rs1];
    assign read_data2 = (reg_write && rd == rs2 && rd != 0) ? write_data : register[rs2];
    
endmodule
