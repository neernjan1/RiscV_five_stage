# Packages (must come first)
plic/top_pkg.sv
plic/tlul_pkg.sv
plic/reg_pkg.sv
plic/rv_plic_reg_pkg.sv

# Primitive modules
plic/prim_subreg.sv
plic/prim_subreg_ext.sv

# Register interface
plic/plic_regmap.sv
plic/rv_plic_reg_top.sv

# PLIC blocks
plic/rv_plic_gateway.sv
plic/rv_plic_target.sv
plic/plic_top.sv
plic/rv_plic.sv

# CSR / trap path
csr/csr_file.sv
trap/trap_controller.sv

# Testbench
tb_top.sv