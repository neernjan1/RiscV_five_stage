#!/bin/bash



case ${1,,} in

    verilator)
        cd verilator
        make verilate
        cd ../
        ;;

    gcc_make)
        cd tb
        make
        cd ../

        echo "Running Spike..."
        spike -l  --log-commits --isa=rv32i  --instructions=500 gcc_files/tst_spike.elf | spike-dasm > spike_commit.log
        ;;

    clean)
        cd verilator
        make clean
        cd ../

        cd tb
        make clean
        cd ../

        rm -f spike_commit.log
        rm -f rtl.log
        ;;

    *)
        cd tb
        make
        cd ../

        echo "Running Spike..."
        spike -l --log-commits --isa=rv32i --instructions=2500 gcc_files/tst_spike.elf > spike_commit.log 2>&1
        cd verilator
        make verilate
        cd ../
        echo "comparing logs..."
        python3 compare_logs.py 
        ;;

esac