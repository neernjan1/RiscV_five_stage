// Copyright 2018, 2021 ETH Zurich and University of Bologna.
//
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
// SPDX-License-Identifier: SHL-0.51
//
// Author: Stefan Mach <smach@iis.ee.ethz.ch>
// Description: Common register defines for RTL designs
//
// Trimmed to just the one macro clint.sv actually uses (`FF), renamed to
// `CLINT_FF so it can't collide with the fuller common_cells/registers.svh
// already vendored under rtl/apb_uart's Bender checkout (same upstream
// library, different pinned version -- both define macros under the same
// plain names, so loading both verbatim produces macro-redefinition
// warnings even though their file-level include guards no longer collide).

`ifndef CLINT_COMMON_CELLS_REGISTERS_SVH_
`define CLINT_COMMON_CELLS_REGISTERS_SVH_

// Flip-Flop with asynchronous active-low reset
// __q: Q output of FF
// __d: D input of FF
// __reset_value: value assigned upon reset
// (__clk: clock input)
// (__arst_n: asynchronous reset, active-low)
`define CLINT_FF(__q, __d, __reset_value, __clk = clk_i, __arst_n = rst_ni) \
  always_ff @(posedge (__clk) or negedge (__arst_n)) begin                  \
    if (!__arst_n) begin                                                    \
      __q <= (__reset_value);                                               \
    end else begin                                                          \
      __q <= (__d);                                                        \
    end                                                                    \
  end

`endif
