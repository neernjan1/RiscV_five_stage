`timescale 1ns/1ps



module data_memory(

    input clk,
    input rst,

    input [31:0] addr,
    input [31:0] w_data,

    input mem_read,
    input mem_write,

    // Access Size
    input [1:0] mem_size,

    // 1 = Sign Extend
    // 0 = Zero Extend
    input load_sign_ext,

    output reg [31:0] r_data

);

    wire [31:0] local_addr;

    assign local_addr = addr - 32'h80010000;; // h80001000 changed  from h80010000
    //--------------------------------------------------
    // 16 KB Memory
    //--------------------------------------------------

    reg [7:0] mem [0:16383];

    integer i;

    //--------------------------------------------------
    // Memory Write
    //--------------------------------------------------

    always @(posedge clk)
    begin

        if(rst)
        begin

            for(i=0;i<16384;i=i+1)
                mem[i] <= 8'b0;

        end

        else if(mem_write)
        begin

            case(mem_size)

                //--------------------------------------------------
                // Store Byte
                //--------------------------------------------------

                `BYTE:
                begin
                    mem[local_addr] <= w_data[7:0];
                end

                //--------------------------------------------------
                // Store Half Word
                //--------------------------------------------------

                `HALF:
                begin
                    mem[local_addr]   <= w_data[7:0];
                    mem[local_addr+1] <= w_data[15:8];
                end

                //--------------------------------------------------
                // Store Word
                //--------------------------------------------------

                `WORD:
                begin
                    mem[local_addr]   <= w_data[7:0];
                    mem[local_addr+1] <= w_data[15:8];
                    mem[local_addr+2] <= w_data[23:16];
                    mem[local_addr+3] <= w_data[31:24];
                end

                default: ;

            endcase

        end

    end

    //--------------------------------------------------
    // Memory Read
    //--------------------------------------------------

    always @(*)
    begin

        r_data = 32'b0;

        if(mem_read)
        begin

            case(mem_size)

                //--------------------------------------------------
                // Load Byte
                //--------------------------------------------------

                `BYTE:
                begin

                    if(load_sign_ext)
                        r_data = {{24{mem[local_addr][7]}},mem[local_addr]};

                    else
                        r_data = {24'b0,mem[local_addr]};

                end

                //--------------------------------------------------
                // Load Half Word
                //--------------------------------------------------

                `HALF:
                begin

                    if(load_sign_ext)
                        r_data = {{16{mem[local_addr+1][7]}},
                                  mem[local_addr+1],
                                  mem[local_addr]};

                    else
                        r_data = {16'b0,
                                  mem[local_addr+1],
                                  mem[local_addr]};

                end

                //--------------------------------------------------
                // Load Word
                //--------------------------------------------------

                `WORD:
                begin

                    r_data = {mem[local_addr+3],
                              mem[local_addr+2],
                              mem[local_addr+1],
                              mem[local_addr]};

                end

                default:
                    r_data = 32'b0;

            endcase

        end

    end

    //Debug
                always @(posedge clk)
            begin
                 if(mem_write)
                begin
                    $display("STORE");
                    $display("ADDR=%h",addr);
                    $display("DATA=%h",w_data);
                end
            end

            always @(*)
            begin
                if(mem_read)
                begin
                    $display(
                    "LOAD addr=%h mem_size=%d sign=%d",
                    addr,
                    mem_size,
                    load_sign_ext);
                end
            end

endmodule