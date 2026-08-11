
`ifndef CLINT_REGISTER_INTERFACE_ASSIGN_SVH_
`define CLINT_REGISTER_INTERFACE_ASSIGN_SVH_

`define REG_BUS_ASSIGN_TO_REQ(lhs, rhs) \
  assign lhs = '{                       \
    addr: rhs.addr,                     \
    write: rhs.write,                   \
    wdata: rhs.wdata,                   \
    wstrb: rhs.wstrb,                   \
    valid: rhs.valid                    \
  };

`define REG_BUS_ASSIGN_FROM_REQ(lhs, rhs) \
  assign lhs.addr = rhs.addr;             \
  assign lhs.write = rhs.write;           \
  assign lhs.wdata = rhs.wdata;           \
  assign lhs.wstrb = rhs.wstrb;           \
  assign lhs.valid = rhs.valid;           \

`define REG_BUS_ASSIGN_TO_RSP(lhs, rhs) \
  assign lhs = '{                       \
    rdata: rhs.rdata,                   \
    error: rhs.error,                   \
    ready: rhs.ready                    \
  };

`define REG_BUS_ASSIGN_FROM_RSP(lhs, rhs) \
  assign lhs.rdata = rhs.rdata;           \
  assign lhs.error = rhs.error;           \
  assign lhs.ready = rhs.ready;

`endif