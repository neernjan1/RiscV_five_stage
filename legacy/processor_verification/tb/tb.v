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
       
        #30000;
         $fclose(rtl_log);
        $finish;
    end

// initial begin
//     $monitor(
//     "arr0=%h%h%h%h  arr1=%h%h%h%h  arr2=%h%h%h%h  arr3=%h%h%h%h",

//     cpu.dmem.mem[4099], cpu.dmem.mem[4098],
//     cpu.dmem.mem[4097], cpu.dmem.mem[4096],

//     cpu.dmem.mem[4103], cpu.dmem.mem[4102],
//     cpu.dmem.mem[4101], cpu.dmem.mem[4100],

//     cpu.dmem.mem[4107], cpu.dmem.mem[4106],
//     cpu.dmem.mem[4105], cpu.dmem.mem[4104],

//     cpu.dmem.mem[4111], cpu.dmem.mem[4110],
//     cpu.dmem.mem[4109], cpu.dmem.mem[4108]
//     );
// end
//     always @(posedge clk) beginS

//     if (cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_push) begin

//         $display("TX BYTE = %c (%h)",
//             cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i,
//             cpu.uart.i_apb_uart_wrap.i_obi_uart.i_uart_tx.fifo_data_i);

//     end
// end
    initial begin
        $dumpfile("riscv.vcd");
        $dumpvars(0, tb);
    end

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

// always @(posedge clk)
// begin
//     if(cpu.mem_write_mem)
//     begin
//         $display("STORE: addr=%h data=%h",
//                  cpu.alu_result_mem,
//                  cpu.write_data_mem);
//     end
// end




integer rtl_log;
reg [31:0] last_pc;

initial begin
    rtl_log = $fopen("../rtl.log","w");
    last_pc = 32'hFFFFFFFF;
end

always @(posedge clk)
begin

    if(cpu.reg_write_wb &&
       cpu.rd_wb != 0 &&
       cpu.pc_wb != last_pc)
    begin
        $fdisplay(
            rtl_log,
            "PC=%h x%0d=%h",
            cpu.pc_wb,
            cpu.rd_wb,
            cpu.write_data_wb
        );

        last_pc <= cpu.pc_wb;
    end

    if(cpu.mem_write_mem)
    begin
        $fdisplay(
            rtl_log,
            "PC=%h mem[%h]=%h",
            cpu.pc_mem,
            cpu.alu_result_mem,
            cpu.write_data_mem
        );
    end

end



endmodule