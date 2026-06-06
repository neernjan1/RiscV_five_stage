remove_design -all
# This script was generated automatically by bender.
set ROOT "/home/neeraj/Desktop/processor/processor/rtl/apb_ip/apb"
set search_path_initial $search_path

set search_path $search_path_initial

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-e35f0451a8c995cb/src/rtl/tc_sram.sv" \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-e35f0451a8c995cb/src/rtl/tc_sram_impl.sv" \
    ]
]} {return 1}

set search_path $search_path_initial

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-e35f0451a8c995cb/src/rtl/tc_clk.sv" \
    ]
]} {return 1}

set search_path $search_path_initial

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-e35f0451a8c995cb/src/deprecated/pulp_clock_gating_async.sv" \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-e35f0451a8c995cb/src/deprecated/cluster_clk_cells.sv" \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-e35f0451a8c995cb/src/deprecated/pulp_clk_cells.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/binary_to_gray.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cb_filter_pkg.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cc_onehot.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_reset_ctrlr_pkg.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cf_math_pkg.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/clk_int_div.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/credit_counter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/delta_counter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/ecc_pkg.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/edge_propagator_tx.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/exp_backoff.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/fifo_v3.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/gray_to_binary.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/heaviside.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/isochronous_4phase_handshake.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/isochronous_spill_register.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/lfsr.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/lfsr_16bit.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/lfsr_8bit.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/lossy_valid_to_stream.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/mv_filter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/onehot_to_bin.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/plru_tree.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/passthrough_stream_fifo.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/popcount.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/ring_buffer.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/rr_arb_tree.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/rstgen_bypass.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/serial_deglitch.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/shift_reg.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/shift_reg_gated.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/spill_register_flushable.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_demux.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_filter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_fork.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_intf.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_join_dynamic.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_mux.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_throttle.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/sub_per_hash.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/sync.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/sync_wedge.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/unread.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/read.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/addr_decode_dync.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/boxcar.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_2phase.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_4phase.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/clk_int_div_static.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/trip_counter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/addr_decode.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/addr_decode_napot.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/multiaddr_decode.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cb_filter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_fifo_2phase.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/clk_mux_glitch_free.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/counter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/ecc_decode.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/ecc_encode.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/edge_detect.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/lzc.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/max_counter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/rstgen.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/spill_register.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_delay.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_fifo.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_fork_dynamic.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_join.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_reset_ctrlr.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_fifo_gray.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/fall_through_register.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/id_queue.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_to_mem.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_arbiter_flushable.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_fifo_optimal_wrap.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_register.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_xbar.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_fifo_gray_clearable.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/cdc_2phase_clearable.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/mem_to_banks_detailed.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_arbiter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/stream_omega_net.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/mem_to_banks.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/test/cdc_2phase_synth.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/test/id_queue_synth.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/test/stream_arbiter_synth.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/test/ecc_synth.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/test/synth_bench.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/clock_divider_counter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/clk_div.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/find_first_one.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/generic_LFSR_8bit.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/generic_fifo.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/prioarbiter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/pulp_sync.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/pulp_sync_wedge.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/rrarbiter.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/clock_divider.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/fifo_v2.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/deprecated/fifo_v1.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/edge_propagator_ack.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/edge_propagator.sv" \
        "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/src/edge_propagator_rx.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"
lappend search_path "$ROOT/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/src/apb_pkg.sv" \
        "$ROOT/src/apb_intf.sv" \
        "$ROOT/src/apb_err_slv.sv" \
        "$ROOT/src/apb_regs.sv" \
        "$ROOT/src/apb_cdc.sv" \
        "$ROOT/src/apb_demux.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
lappend search_path "$ROOT/.bender/git/checkouts/common_cells-7aa318331ef38143/include"
lappend search_path "$ROOT/include"

if {0 == [analyze -format sv \
-define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/test/synth_bench.sv" \
    ]
]} {return 1}

set search_path $search_path_initial
elaborate synth_bench
