module data_memory(
    input clk,
    input rst,
    input [31:0] addr,
    input [31:0] w_data,
    input [5:0] operation,  //  Pass the 6-bit operation from ALU Control
    input mem_read,
    input mem_write,
    output reg [31:0] r_data
);

    // 16KB Memory (16384 bytes)
    reg [7:0] mem [0:16383]; // after change it to 16kb and add loop for making all zero on rst
    integer i;
    // --- Writing (SB, SH, SW) ---
    always @(posedge clk) begin
        if (rst) begin
            // Initialize memory to zero on reset
          
            for (i = 0; i < 16384; i = i + 1) begin
                mem[i] = 8'b0;
            end
        end else if (mem_write )  begin // Ensure we don't write out of bounds && addr < 16384-3
           // $display("MEM[%0d]  =   %0d",addr,w_data); //only for debug with iverilog, remove later
            case (operation)
                `ALU_S_BYTE: mem[addr] <= w_data[7:0];
                `ALU_S_HALF: begin 
                    mem[addr]   <= w_data[7:0]; 
                    mem[addr+1] <= w_data[15:8]; 
                end
                `ALU_S_WORD: begin
                    mem[addr]   <= w_data[7:0];
                    mem[addr+1] <= w_data[15:8];
                    mem[addr+2] <= w_data[23:16];
                    mem[addr+3] <= w_data[31:24];
                end
            endcase
        end
    end

    // --- Reading (LB, LBU, LH, LHU, LW) ---
    always @(*) begin 
        if (mem_read ) begin // Ensure we don't read out of bounds && addr < 16384-3
            case (operation)
                `ALU_L_BYTE: r_data = {{24{mem[addr][7]}}, mem[addr]}; // Sign extend
                `ALU_L_BU:   r_data = {24'b0, mem[addr]};             // Zero extend
                `ALU_L_HALF: r_data = {{16{mem[addr+1][7]}}, mem[addr+1], mem[addr]};
                `ALU_L_HU:   r_data = {16'b0, mem[addr+1], mem[addr]};
                `ALU_L_WORD: r_data = {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};
                default:     r_data = 32'b0;
            endcase
        end else r_data = 32'b0;
    end
endmodule