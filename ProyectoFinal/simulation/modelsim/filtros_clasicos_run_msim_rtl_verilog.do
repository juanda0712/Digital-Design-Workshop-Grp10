transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/instruction_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/memory_unit.v}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/mux2.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/flopr.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/decoder_unit.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/datapath.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/condlogic_unit.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/condcheck_unit.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/adder.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/controller_unit.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/register_unit.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/ALU.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/imm_unit.sv}
vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/filtros_clasicos.sv}

vlog -sv -work work +incdir+C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal {C:/Users/grero/OneDrive/Escritorio/taller/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/ProyectoFinal/filtros_clasicos_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  filtros_clasicos_tb

add wave *
view structure
view signals
run -all