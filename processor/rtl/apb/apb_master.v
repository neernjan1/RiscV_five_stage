`timescale 1ns/1ps
module apb_master (
    input clk,
    input rst,

    // CPU side
    input [31:0] addr,
    input [31:0] wdata,
    input mem_read,
    input mem_write,

    // APB side
    output reg PSEL,
    output reg PENABLE,
    output reg PWRITE,
    output reg [31:0] PADDR,
    output reg [31:0] PWDATA,

    input [31:0] PRDATA,
    input PREADY,

    // Back to CPU
    output reg [31:0] rdata,
    output reg ready,

    // Debug
    output [1:0] debug_state,
    output reg busy
);

    parameter IDLE   = 2'b00;
    parameter SETUP  = 2'b01;
    parameter ACCESS = 2'b10;

    reg [1:0] state, next_state;

    assign debug_state = state;

    //  CORRECT BUSY LOGIC
    wire done;
    assign done = (state == ACCESS) && PREADY; 
    // assign busy =
    //    (state != IDLE) ; // changed from busy = (state != IDLE) && ~done; to busy = (state != IDLE); because it is ending stall one cycle before data read is valid 

    reg [31:0] addr_reg, wdata_reg;
    reg write_reg, read_reg;

    // State register -- synchronous reset, matching every other register
    // in the core's clock domain (pc.v, pipeline regs, reg_file.v,
    // csr_file.sv).
    always @(posedge clk) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state
    always @(*) begin
        case (state)
            IDLE:   next_state = (mem_read || mem_write) ? SETUP : IDLE;
            SETUP:  next_state = ACCESS;
            ACCESS: next_state = (PREADY) ? IDLE : ACCESS;
            default: next_state = IDLE;
        endcase
    end

    // Latch inputs
    always @(posedge clk) begin
        if (state == IDLE) begin
            if (mem_write) begin
                addr_reg  <= addr;
                wdata_reg <= wdata;
                write_reg <= 1;
                read_reg  <= 0;
               
            end
            else if (mem_read) begin
                addr_reg  <= addr;
                write_reg <= 0;
                read_reg  <= 1;
               
            end
        end
    end

    // Output logic
    always @(*) begin
        PSEL = 0; PENABLE = 0; PWRITE = 0;
        PADDR = 0; PWDATA = 0;
        ready = 0;

        case (state)
            IDLE: begin
                ready = 1;
            end

            SETUP: begin
                PSEL = 1;
                PWRITE = write_reg;
                PADDR = addr_reg;
                PWDATA = wdata_reg;
            end

            ACCESS: begin
                PSEL = 1;
                PENABLE = 1;
                PWRITE = write_reg;
                PADDR = addr_reg;
                PWDATA = wdata_reg;

                if (PREADY) begin
                    ready = 1;
                   
                end
            end
            default: ready = 1;
        endcase
    end

    // Read capture -- only ever sampled by a consumer on the same cycle
    // this condition holds (gated by `ready`/apb_busy upstream), so the
    // else branch's value is a don't-care; giving it one explicitly
    // (rather than omitting it) keeps this combinational instead of an
    // inferred latch.
    always @(*) begin
        if (state == ACCESS && PREADY && read_reg)
            rdata = PRDATA;
        else
            rdata = 32'b0;
    end

    // Handling busy logic -- fully combinational function of state
    // (already a registered value) plus the same live inputs next_state
    // uses, so every case can be spelled out explicitly instead of
    // relying on an implicit latch-hold for the states/conditions this
    // used to leave unassigned (SETUP, and ACCESS while still waiting
    // on PREADY).
    always @(*) begin
        if (rst)
            busy = 0;
        else begin
            case (state)
                IDLE:   busy = (mem_read || mem_write);
                SETUP:  busy = 1'b1;
                ACCESS: busy = ~PREADY;
                default: busy = 1'b0;
            endcase
        end
    end

endmodule