`timescale 1ns/1ps
module instruction_memory(
        input [31:0] pc ,
        output [31:0] instruction_code,

        // Read-only data port: lets the load/store path read .rodata
        // and the .data LMA copy out of imem[] (see gcc_files/link.ld
        // and crt0.S's data-copy loop). Address-decoded in soc_top.v
        // via addr_decoder's sel_imem so it only responds within
        // 0x80000000-0x80000FFF.
        input [31:0] data_addr,
        output [31:0] data_rdata
    );

    reg [31:0] imem [0:1023]; //1kb 32 bit mem
    wire [31:0] pc_offset;
    wire [31:0] data_offset;

    initial begin
        $readmemh("imem.mem", imem); // comment added
    end

    assign pc_offset = pc - 32'h80000000;
    assign instruction_code = imem[pc_offset[11:2]]; //Pc div by 4 ..as we already sending pc+4 ..lsb remains 00..

    assign data_offset = data_addr - 32'h80000000;
    assign data_rdata = imem[data_offset[11:2]];

endmodule
