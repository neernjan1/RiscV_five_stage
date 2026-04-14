module addr_decoder(
    input  [31:0] addr,

    output reg sel_mem,
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
    {sel_mem, sel_ascon, sel_uart, sel_gpio,
     sel_spi, sel_i2c, sel_plic, sel_timer, sel_clint} = 0;

    case (addr[31:12])   // 4KB regions

        // Memory (0x0000_0000 - 0x2000_3FFF)
        20'h00000,
        20'h00001,
        20'h00002,
        20'h00003,
        20'h00004,
        20'h00005,
        20'h00006,
        20'h00007: sel_mem = 1;

        // Peripherals
        20'h40000: sel_ascon = 1;
        20'h40001: sel_uart  = 1;
        20'h40002: sel_gpio  = 1;
        20'h40003: sel_spi   = 1;
        20'h40004: sel_i2c   = 1;
        20'h40005: sel_plic  = 1;
        20'h40006: sel_timer = 1;
        20'h40007: sel_clint = 1;

        default: sel_mem = 1;

    endcase
end

endmodule