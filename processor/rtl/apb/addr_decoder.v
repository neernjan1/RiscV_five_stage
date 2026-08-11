`timescale 1ns/1ps
module addr_decoder(
    input  [31:0] addr,

    output reg sel_mem,
    output reg sel_imem,
    output reg sel_ascon,
    output reg sel_uart,
    output reg sel_gpio,
    output reg sel_spi,
    output reg sel_i2c,
    output reg sel_plic,
    output reg sel_timer,
    output reg sel_clint
);

always @(*) begin
    // default
    {sel_mem, sel_imem, sel_ascon, sel_uart, sel_gpio,
     sel_spi, sel_i2c, sel_plic, sel_timer, sel_clint} = 0;

    case (addr[31:12])   // 4KB regions

        // Data Memory (0x80010000 - 0x80013FFF) : 16 KB
        20'h80010,
        20'h80011,
        20'h80012,
        20'h80013:
            sel_mem = 1;

        // Instruction Memory (0x80000000 - 0x80000FFF) : 4 KB
        // read-only access for .rodata / the .data LMA copy that
        // crt0.S relocates into DMEM at boot.
        20'h80000:
            sel_imem = 1;

        // Peripherals
        20'h40000: sel_ascon = 1;
        20'h40001: sel_uart  = 1;
        20'h40002: sel_gpio  = 1;
        20'h40003: sel_spi   = 1;
        20'h40004: sel_i2c   = 1;
        20'h40005: sel_plic  = 1;
        20'h40006: sel_timer = 1;
        20'h40007: sel_clint = 1;

        default: 
        // sel_mem = 1
        ;

    endcase
end

endmodule