`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2026 01:56:25
// Design Name: 
// Module Name: delta_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module delta_counter #(
    parameter int unsigned WIDTH = 4,
    parameter bit STICKY_OVERFLOW = 1'b0
)(
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic             clear_i, // synchronous clear
    input  logic             en_i,    // enable the counter
    input  logic             load_i,  // load a new value
    input  logic             down_i,  // downcount, default is up
    input  logic [WIDTH-1:0] delta_i,
    input  logic [WIDTH-1:0] d_i,
    output logic [WIDTH-1:0] q_o,
    output logic             overflow_o
);
    logic [WIDTH:0] counter_q, counter_d;
    if (STICKY_OVERFLOW) begin : gen_sticky_overflow
        logic overflow_d, overflow_q;

        always_ff @(posedge clk_i or negedge rst_ni)
        begin
            if(!rst_ni) begin
                overflow_q <= 1'b0;
            end else begin
                overflow_q <= overflow_d;
            end
        end

        always_comb begin
            overflow_d = overflow_q;
            if (clear_i || load_i) begin
                overflow_d = 1'b0;
            end else if (!overflow_q && en_i) begin
                if (down_i) begin
                    overflow_d = delta_i > counter_q[WIDTH-1:0];
                end else begin
                    overflow_d = counter_q[WIDTH-1:0] > ({WIDTH{1'b1}} - delta_i);
                end
            end
        end
        assign overflow_o = overflow_q;
    end else begin : gen_transient_overflow
        // counter overflowed if the MSB is set
        assign overflow_o = counter_q[WIDTH];
    end
    assign q_o = counter_q[WIDTH-1:0];

    always_comb begin
        counter_d = counter_q;

        if (clear_i) begin
            counter_d = '0;
        end else if (load_i) begin
            counter_d = {1'b0, d_i};
        end else if (en_i) begin
            if (down_i) begin
                counter_d = counter_q - delta_i;
            end else begin
                counter_d = counter_q + delta_i;
            end
        end
    end

    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
           counter_q <= '0;
        end else begin
           counter_q <= counter_d;
        end
    end
endmodule
