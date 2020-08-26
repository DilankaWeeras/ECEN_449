set_property SRC_FILE_INFO {cfile:/home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_1/project_1.srcs/sources_1/bd/led_sw/ip/led_sw_clk_wiz_1_0/led_sw_clk_wiz_1_0.xdc rfile:../../../project_1.srcs/sources_1/bd/led_sw/ip/led_sw_clk_wiz_1_0/led_sw_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:led_sw_i/clk_wiz_1/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
