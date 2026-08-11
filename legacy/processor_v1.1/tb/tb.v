`timescale 1ns/1ps

module tb;

    reg clk, rst;
    int prev_x10;
    reg prev_txd;

    // ================= DUT =================
    risc_top cpu(.clk(clk), .rst(rst));

    // ================= CLOCK =================
    always #5 clk = ~clk;

    // ================= RESET =================
    initial begin
        clk = 0;
        rst = 1;

        #20;
        rst = 0;

        #3000000;

        $finish;
    end
    always @(posedge clk) begin

    if (cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_push) begin

        $display("TX BYTE = %c (%h)",
            cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i,
            cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i);

    end
end
    initial begin
        $dumpfile("riscv.vcd");
        $dumpvars(0, tb);
    end
//uart debugging 
    // ================= REGISTER MONITOR =================
//     always @(posedge clk) begin
//         if (prev_x10 !== cpu.rf.register[10]) begin
//             $display("[X10] = %0d", cpu.rf.register[10]);
//             prev_x10 <= cpu.rf.register[10];
//         end
//     end

//     // ================= APB MONITOR =================
//     always @(posedge clk) begin

//         if (cpu.apb_interface.PSEL &&
//             cpu.apb_interface.PENABLE &&
//             cpu.apb_interface.PWRITE) begin

//             $display("\n[APB WRITE]");
//             $display("PC    = %h", cpu.pc);
//             $display("ADDR  = %h", cpu.apb_interface.PADDR);
//             $display("DATA  = %h", cpu.apb_interface.PWDATA);
//         end
//     end

//     // ================= UART FIFO PUSH =================
//     always @(posedge clk) begin

//         if (cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_push) begin

//             $display("\n[UART FIFO PUSH]");
//             $display("CHAR = %c",
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i);

//             $display("HEX  = %h",
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i);

//             $display("DIV  = %0d",
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_baudgen.divisor);
//         end
//     end

//     // ================= UART TX EDGE MONITOR =================
//     always @(posedge clk) begin

//         if (prev_txd !=
//             cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.txd_o) begin

//             $display("[TXD CHANGE] time=%0t txd=%b state=%0d",
//                 $time,
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.txd_o,
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.state_q);

//             prev_txd <=
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.txd_o;
//         end
//     end

//     // ================= UART FSM MONITOR =================
//     always @(posedge clk) begin

//         if (cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.state_q != 0) begin

//             $display("[UART FSM]");
//             $display("state    = %0d",
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.state_q);

//             $display("thr_full = %b",
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.thr_full_q);

//             $display("txd      = %b",
//                 cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.txd_o);
//         end
//     end

//     // ================= MEMORY DEBUG =================
//     initial begin

//         #1;

//         $display("STORE: addr=%h data=%h",
//             cpu.alu_result_mem,
//             cpu.write_data_mem);

//         $display("LOAD: addr=%h mem_rdata=%h final=%h",
//             cpu.alu_result_mem,
//             cpu.mem_result_mem,
//             cpu.mem_result_final);
//     end

//     // ================= WAVES =================

// always @(posedge clk) begin

//     if (cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_push) begin

//         $display("CHAR SENT = %c",
//             cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i);

//     end
// end


endmodule