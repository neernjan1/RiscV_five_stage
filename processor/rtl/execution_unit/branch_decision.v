`timescale 1ns / 1ps

module branch_decision(
input branch_condn ,
input jump ,
input branch ,
output pc_src ,
output flush 
    );
    
   assign pc_src = (branch_condn & branch)| jump ;
   assign flush = pc_src ;
endmodule
