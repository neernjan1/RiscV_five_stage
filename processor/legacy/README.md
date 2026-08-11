# legacy/

Superseded build/test flow, kept for reference only — **not runnable
as-is** and not part of the active build.

- `run.sh` — predates `run_assembly.sh`. Its `cd tb && make` step calls
  `tb_Makefile`, which points at `RTL_DIR := ../top_module` and
  `TB := $(RTL_DIR)/Testbench.v` — neither exists in this project, so
  that step was already broken before this file moved here. It also
  assumes it's invoked from the repo root, so paths break further if
  run from inside `legacy/`. Any output that looks like it "worked"
  after those failures is Bash falling through to reuse stale
  artifacts left over in `../gcc_files/`/`../verilator/` from a
  previous real run — not a genuine run of this script.
- `tb1.v` / `tb_Makefile` — the testbench/Makefile pair `run.sh` used
  to drive. Superseded by `../tb/tb.v` + `../verilator/Makefile`
  (driven by `../run_assembly.sh`).
- `verification/` — a C-test tree (`add.c`, `branch.c`, `loop.c`,
  `hazard/`, `load_store/`) that nothing in the active build ever
  referenced.

The current, working flow is `../run_assembly.sh <test.s>` +
`python3 ../compare_logs1.py` — see `../README.md`.
