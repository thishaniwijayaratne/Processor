transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/ALU.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/control.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/DRAM.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/IRAM.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/mux2to1.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/mux3to1.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/PC_ALU.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/regfile.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/REGISTER.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/SINGLE_CORE_PROCESSOR.v}
vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/Top_Level_Module.v}

vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/Single_Core {D:/THISHANI/ACA/FPGA_Work/Single_Core/Top_Level_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Top_Level_tb

add wave *
view structure
view signals
run 30 sec
