transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Personal/Documents/TDD/Lab1/Problema3 {C:/Users/Personal/Documents/TDD/Lab1/Problema3/full_substractor_n_bits.sv}
vlog -sv -work work +incdir+C:/Users/Personal/Documents/TDD/Lab1/Problema3 {C:/Users/Personal/Documents/TDD/Lab1/Problema3/sevenseg.sv}
vlog -sv -work work +incdir+C:/Users/Personal/Documents/TDD/Lab1/Problema3 {C:/Users/Personal/Documents/TDD/Lab1/Problema3/countdown.sv}

