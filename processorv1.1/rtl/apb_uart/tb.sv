module tb;

    reg CLK, RSTN, PSEL, PENABLE, PWRITE;
    reg CTSN, DSRN, DCDN, RIN;
    reg SIN;
    reg  [2:0]  PADDR;
    reg  [31:0] PWDATA;
    logic [31:0] PRDATA;
    logic PREADY, PSLVERR, INT, OUT1N, OUT2N, RTSN, DTRN;
    logic SOUT;

    // DUT
    apb_uart uart (
        .CLK(CLK),
        .RSTN(RSTN),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR),
        .INT(INT),
        .OUT1N(OUT1N),
        .OUT2N(OUT2N),
        .RTSN(RTSN),
        .DTRN(DTRN),
        .CTSN(CTSN),
        .DSRN(DSRN),
        .DCDN(DCDN),
        .RIN(RIN),
        .SIN(SIN),
        .SOUT(SOUT)
    );

    // Clock
    always #5 CLK = ~CLK;

    task write_apb(input [2:0] addr, input [31:0] data);
    begin
        @(posedge CLK);
        PSEL    <= 1;
        PENABLE <= 0;
        PWRITE  <= 1;
        PADDR   <= addr;
        PWDATA  <= data;

        @(posedge CLK);
        PENABLE <= 1;

        wait(PREADY);

        @(posedge CLK);
        PSEL    <= 0;
        PENABLE <= 0;
    end
    endtask


    task read_apb(input [2:0] addr, output [31:0] data);
    begin
        @(posedge CLK);
        PSEL    <= 1;
        PENABLE <= 0;
        PWRITE  <= 0;
        PADDR   <= addr;

        @(posedge CLK);
        PENABLE <= 1;

        wait (PREADY == 1);

        data = PRDATA;

        @(posedge CLK);
        PSEL    <= 0;
        PENABLE <= 0;
    end
    endtask

    reg [31:0] lsr;

    initial begin
        CLK = 0;
        RSTN = 0;

        PSEL = 0;
        PENABLE = 0;
        PWRITE = 0;
        PADDR = 0;
        PWDATA = 0;

        CTSN = 0;
        DSRN = 0;
        DCDN = 0;
        RIN  = 0;

        #20;
        RSTN = 1;
        @(posedge CLK);

        write_apb(3'b011, 8'h80);
        write_apb(3'b000, 8'h02);
        write_apb(3'b001, 8'h00);
        write_apb(3'b011, 8'h03);
        write_apb(3'b010, 8'h01);

        write_apb(3'b000, "H");
        write_apb(3'b000, "E");
        write_apb(3'b000, "L");
        write_apb(3'b000, "L");
        write_apb(3'b000, "O");

        do begin
            @(posedge CLK);
            read_apb(3'b101, lsr);        
        end while (lsr[6] == 0);

        #200;
            
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end

endmodule