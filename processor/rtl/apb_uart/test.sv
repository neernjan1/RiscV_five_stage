module test;

    parameter type apb_req_t = struct packed {
    logic [31:0] paddr;
    logic        pwrite;
    logic [31:0] pwdata;
    logic [3:0]  pstrb;
    logic        psel;
    logic        penable;
    };

    apb_req_t ax;

    initial begin
        ax.paddr = 32'd23;
        #5 $finish;
    end
    
    initial begin
        $monitor("paddr = %0d", ax.paddr);
    end

endmodule