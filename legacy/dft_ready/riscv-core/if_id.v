module IF_ID (
    input clk,
    input rst,
    input scan_clk,
    input test_mode,
    // control signals
    input IF_flush,
    input IF_ID_write,

    // data from IF stage
    input [31:0] IF_instr,
    input [31:0] IF_pc,
    input [31:0] IF_pcplus4,

    // outputs to ID stage
    output reg [31:0] Instr_ID,
    output reg [31:0] pc_ID,
    output reg [31:0] pc_plus_4_ID
);
  wire clk_dft;
  wire rst_dft;
  assign clk_dft = test_mode ? scan_clk : clk;
assign rst_dft = test_mode ? 1'b0 : rst;
always @(posedge clk_dft ) begin 
    if (rst_dft) begin 
      
        Instr_ID      <= 32'b0;
        pc_ID         <= 32'b0;
        pc_plus_4_ID  <= 32'b0;
    end
      if (IF_flush && !test_mode) begin //flush at 1 ,earlier set to 0 
      
        Instr_ID      <= 32'b0;
        pc_ID         <= 32'b0;
        pc_plus_4_ID  <= 32'b0;
        
    end

    else if (IF_ID_write || test_mode) begin //IF_ID_write == 0 will lead to stall 
        // Normal operation 
        Instr_ID      <= IF_instr;
        pc_ID         <= IF_pc;
        pc_plus_4_ID  <= IF_pcplus4;
    end
    // as its register .. it will hold itself ..that is stalling
end 

endmodule