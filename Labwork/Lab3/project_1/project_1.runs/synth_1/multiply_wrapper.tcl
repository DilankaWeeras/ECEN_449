# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.cache/wt [current_project]
set_property parent.project_path /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:arty-z7-10:part0:1.0 [current_project]
set_property ip_repo_paths {
  /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/ip_repo/multiply_1.0
  /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/ip_repo/multiply_1.0
} [current_project]
add_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/multiply.bd
set_property used_in_implementation false [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/ip/multiply_processing_system7_0_0/multiply_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/ip/multiply_rst_processing_system7_0_100M_0/multiply_rst_processing_system7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/ip/multiply_rst_processing_system7_0_100M_0/multiply_rst_processing_system7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/ip/multiply_rst_processing_system7_0_100M_0/multiply_rst_processing_system7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/ip/multiply_auto_pc_0/multiply_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/multiply_ooc.xdc]
set_property is_locked true [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/multiply.bd]

read_verilog -library xil_defaultlib /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab3/project_1/project_1.srcs/sources_1/bd/multiply/hdl/multiply_wrapper.v
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top multiply_wrapper -part xc7z010clg400-1
write_checkpoint -noxdef multiply_wrapper.dcp
catch { report_utilization -file multiply_wrapper_utilization_synth.rpt -pb multiply_wrapper_utilization_synth.pb }
