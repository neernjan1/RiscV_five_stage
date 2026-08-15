# DFT Readiness

What's actually been verified/fixed on the RTL side before a DFT engineer
picks this up, and what's still explicitly out of scope for that handoff
(scan insertion itself is a DFT-tool job, not something hand-inserted
into this RTL -- see the "Not done here" section).

Referenced from inline comments across the core (`pc.v`, `apb_master.v`,
`soc_top.v`'s `rtc_div`, `csr_file.sv`) as "see DFT_READINESS.md" --
this is that file.

## Clock

Single clock domain. `clk` is the only signal ever used in a `posedge`
sensitivity list to drive core logic. Verified by grepping every
`always @(posedge ...)` / `always_ff @(posedge ...)` across the whole
design (core + vendored) and confirming every hit is `clk` (or a
vendored IP's own `clk_i`/`HCLK`/`PCLK` alias for the same net, bridged
1:1 from `clk` at the SoC boundary -- see `soc_top.v`).

The vendored CLINT/GPIO checkouts carry generic multi-clock-domain CDC
primitives (`prim_reg_cdc`-style modules referencing `src_clk_i`/
`dst_clk_i` etc.) in their dependency tree, but none of them are actually
instantiated anywhere in this design -- confirmed by searching for any
instantiation site. Dead template code, not a second clock domain.

One legitimate clock gate exists: GPIO's `gpio_input_stage.sv`
instantiates a vendored `tc_clk_gating` cell (power-saving only, not
required for function -- see its `IS_FUNCTIONAL(0)` parameter) with a
`test_en_i` bypass input, **currently tied to `1'b0`**. Once a real
`scan_en` exists at the top level, wire it here so scan shift can bypass
the gate.

No ad-hoc gated clocks anywhere else -- searched for any signal
combinationally derived from `clk` (`clk & something`, `assign x = ...
clk ...`) and found nothing outside that one vendored ICG cell.

## Reset

Synchronous, active-high (`if (rst) ... else ...` inside `always
@(posedge clk)`) throughout every hand-written core register:
`pc.v`, `IF_ID.v`, `ID_EX.v`, `EX_MEM.v`, `MEM_WB.v`, `reg_file.v`,
`csr_file.sv`, `apb_master.v`'s state register and its `addr_reg`/
`wdata_reg`/`write_reg`/`read_reg` group, `data_memory.v`, and
`soc_top.v`'s `rtc_div`. Verified register-by-register (not just
spot-checked) that every clocked `always` block in the core's own RTL
resets every register it drives.

Vendored peripheral IP (SPI, ASCON, CLINT, GPIO, UART, PLIC's internal
`prim_*`/`rv_plic_*` blocks, I2C) intentionally keeps its own
asynchronous, active-low convention (`PRESETn`/`HRESETn`/`rst_ni`),
bridged from the core's synchronous `rst` via a plain `~rst` at each
IP's instantiation in `soc_top.v`. That's a deliberate polarity crossing
at each IP boundary, not an oversight -- rewriting third-party IP's own
internal reset scheme is out of scope here. A DFT engineer scanning
those blocks needs to treat each one as its own async-reset domain at
the boundary.

**This mattered in practice**: converting registers to synchronous reset
originally broke everything, because the testbench's reset pulse
(`tb.v`) was only 2ns while the clock's first `posedge` isn't until 5ns
-- the pulse never actually overlapped a clock edge. Async-reset
registers never noticed (they fire independent of the clock); a
synchronous-reset register only ever samples `rst` at a `posedge`, so it
silently never reset at all, and `pc` booted from `0x00000000` instead
of `0x80000000`. Fixed by extending the pulse to 20ns (spans two full
clock periods). Any DFT engineer adding their own testbench/scan-shift
harness needs a reset pulse that actually spans a clock edge for the
same reason.

## Latches

Zero, verified by running a full-design lint (`-Wno-LATCH` removed) over
every file the build actually compiles, core and vendored. One was
found and fixed this session (`apb_master.v`'s `rdata` capture and
`busy` logic, both missing an explicit `else`/`default` on some paths)
-- see git history for the fix. `-Wno-LATCH` is no longer in the
Makefile since nothing needs it anymore; if it starts firing again in
the future, don't just re-suppress it.

## Combinational loops

None (`UNOPTFLAT`), verified the same way.

## Tri-state / `inout`

None in synthesizable RTL. I2C's open-drain SCL/SDA are modeled as
separate `_i`/`_o`/`_oen` signals (matching this SoC's existing
`gpio_tx_en`-style convention for GPIO), not a real bidirectional pin
inside the RTL -- whatever instantiates `soc_top` (testbench or a real
pad ring) is responsible for resolving that down to the actual
wired-AND bus level.

## Memory arrays

`instruction_memory.v`'s `imem_array` (1024 x 32-bit) and
`data_memory.v`'s `mem` (16KB) are plain behavioral `reg` arrays,
`$readmemh`-loaded for simulation. For real silicon these need to become
actual SRAM macros from a memory compiler, tested via MBIST -- **not**
scan. Don't try to fold them into the flip-flop scan chain; 1024 words
alone would blow up chain length for no benefit MBIST doesn't already
cover better.

## Global macro namespace

Fixed a latent bug this session: SPI (`spi_master_apb_if.sv`) and I2C
(`apb_i2c.sv`) both defined a `` `REG_STATUS `` macro with *different*
values (`4'b0000` vs `3'b011`). Verilog `` `define ``s are global, not
file-scoped, so whichever file compiled last silently won for any later
use. It happened to work only because of this specific Makefile's file
order (SPI before I2C); an alphabetical directory glob would have put
`i2c` before `spi` and silently broken SPI's register decode. Fixed by
namespacing I2C's register macros (`I2C_REG_*`), matching its own
already-prefixed `I2C_CMD_*` convention. Worth remembering if more
peripherals get vendored in: check for macro collisions across the
whole build, not just within one IP's own files.

## Build/lint suppressions (verilator/Makefile)

Every remaining `-Wno-` flag is scoped to genuine vendored-IP
characteristics, verified to not be masking anything in the core's own
RTL:
- `MODDUP` -- CLINT/apb_uart's vendored checkouts declare a couple of
  modules twice across their own dependency tree.
- `PINMISSING` -- unused pins on vendored submodule instances (CLINT's
  `clint_reg_top.sv`, apb_uart's internal AXI plumbing).
- `fatal` -- CLINT's vendored `prim_subreg_arb.sv` references a typedef
  before its declaration; a strict IEEE 1800-2023 ordering rule that
  Verilator's own default (non-`-Wall`) elaboration, and every real EDA
  tool, accepts fine.

`WIDTHEXPAND`/`WIDTHTRUNC` used to be suppressed too; removed this
session after confirming neither ever actually fires, anywhere, even
under a full `-Wall` build.

Two other files aren't part of the real build at all -- `tb_apb_i2c.sv`
and `tb_apb_top.sv` are standalone unit testbenches for their respective
IP blocks in isolation, sitting in `rtl/i2c/` and `rtl/apb/`
respectively but not picked up by the Makefile's file list (or, for
`tb_apb_i2c.sv`, deliberately left out of `rtl/i2c/`'s copy in this repo
-- see the i2c integration notes). `rtl/plic/tb_top.sv` **is** picked up
by the `../rtl/plic/*.sv` glob and does compile, but is never
instantiated from `--top tb`, so it's dead code in the actual build --
harmless, just worth knowing it's there if chain length or compile time
ever becomes a concern.

## Not done here (DFT engineer's side, not RTL prep)

- No `scan_en` port, no scan muxes on any flip-flop, no scan chain --
  none of the actual scan hardware exists. This is normally inserted by
  a DFT tool (Synopsys DFT Compiler / Cadence Modus / Siemens Tessent)
  post-synthesis, not hand-written into RTL.
- No JTAG/TAP controller to drive scan from outside.
- No ATPG patterns generated or fault coverage signed off -- a
  post-synthesis backend step against the gate-level netlist.
- `processor_v2`'s `soc_top.v` has a `test_mode` input port, but it's
  tied to `1'b0` in `tb.v` and not muxed into anything -- a placeholder
  name, not a functioning scan enable. `RiscV_five_stage-1` doesn't even
  have that port. Neither should be read as "DFT is partially wired up."
