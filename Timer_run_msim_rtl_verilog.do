transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/20.1/Examples/Timer_down_count {F:/intelFPGA_lite/20.1/Examples/Timer_down_count/Timer_v.v}

vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/20.1/Examples/Timer_down_count {F:/intelFPGA_lite/20.1/Examples/Timer_down_count/Timer_v_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  Timer_v_tb

add wave *
view structure
view signals
run -all
