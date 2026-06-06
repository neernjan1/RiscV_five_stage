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
        ;;
    
    clean)
        cd verilator
        make clean
        cd ../
        cd tb
        make clean
        cd ../
        ;;

	*)
        cd tb
        make
        cd ../

        cd verilator
        make verilate
        cd ../
		;;
		
esac
