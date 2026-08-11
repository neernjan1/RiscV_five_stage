package reg_pkg;

typedef struct packed {
    logic valid;
    logic write;
    logic [31:0] addr;
    logic [31:0] wdata;
} reg_req_t;

typedef struct packed {
    logic ready;
    logic [31:0] rdata;
    logic error;
} reg_rsp_t;

endpackage