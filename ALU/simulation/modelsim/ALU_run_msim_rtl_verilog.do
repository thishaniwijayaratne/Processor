transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/THISHANI/ACA/FPGA_Work/PROCESSOR/ALU {D:/THISHANI/ACA/FPGA_Work/PROCESSOR/ALU/ALU.v}

