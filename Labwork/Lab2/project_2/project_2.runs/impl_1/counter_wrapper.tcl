proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  debug::add_scope template.lib 1
  create_project -in_memory -part xc7z010clg400-1
  set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.cache/wt [current_project]
  set_property parent.project_path /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.xpr [current_project]
  set_property ip_repo_paths /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.cache/ip [current_project]
  set_property ip_output_repo /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.cache/ip [current_project]
  add_files -quiet /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.runs/synth_1/counter_wrapper.dcp
  add_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/counter.bmm
  set_property SCOPED_TO_REF counter [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/counter.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/counter.bmm]
  add_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_5/cfde4cbb/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF counter [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_5/cfde4cbb/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_5/cfde4cbb/data/mb_bootloop_le.elf]
  read_xdc -ref counter_microblaze_0_0 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_microblaze_0_0/counter_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_microblaze_0_0/counter_microblaze_0_0.xdc]
  read_xdc -ref counter_dlmb_v10_0 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_dlmb_v10_0/counter_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_dlmb_v10_0/counter_dlmb_v10_0.xdc]
  read_xdc -ref counter_ilmb_v10_0 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_ilmb_v10_0/counter_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_ilmb_v10_0/counter_ilmb_v10_0.xdc]
  read_xdc -ref counter_mdm_1_0 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_mdm_1_0/counter_mdm_1_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_mdm_1_0/counter_mdm_1_0.xdc]
  read_xdc -prop_thru_buffers -ref counter_clk_wiz_1_0 -cells inst /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_clk_wiz_1_0/counter_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_clk_wiz_1_0/counter_clk_wiz_1_0_board.xdc]
  read_xdc -ref counter_clk_wiz_1_0 -cells inst /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_clk_wiz_1_0/counter_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_clk_wiz_1_0/counter_clk_wiz_1_0.xdc]
  read_xdc -prop_thru_buffers -ref counter_rst_clk_wiz_1_100M_0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_rst_clk_wiz_1_100M_0/counter_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_rst_clk_wiz_1_100M_0/counter_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref counter_rst_clk_wiz_1_100M_0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_rst_clk_wiz_1_100M_0/counter_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_rst_clk_wiz_1_100M_0/counter_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref counter_axi_gpio_0_0 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_0/counter_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_0/counter_axi_gpio_0_0_board.xdc]
  read_xdc -ref counter_axi_gpio_0_0 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_0/counter_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_0/counter_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref counter_axi_gpio_0_1 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_1/counter_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_1/counter_axi_gpio_0_1_board.xdc]
  read_xdc -ref counter_axi_gpio_0_1 -cells U0 /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_1/counter_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/sources_1/bd/counter/ip/counter_axi_gpio_0_1/counter_axi_gpio_0_1.xdc]
  read_xdc /home/ugrads/d/dweerasinghe/ECEN449/Labwork/Lab2/project_2/project_2.srcs/constrs_1/new/up_down_counter.xdc
  link_design -top counter_wrapper -part xc7z010clg400-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force counter_wrapper_opt.dcp
  catch {report_drc -file counter_wrapper_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file counter_wrapper.hwdef}
  place_design 
  write_checkpoint -force counter_wrapper_placed.dcp
  catch { report_io -file counter_wrapper_io_placed.rpt }
  catch { report_utilization -file counter_wrapper_utilization_placed.rpt -pb counter_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file counter_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force counter_wrapper_routed.dcp
  catch { report_drc -file counter_wrapper_drc_routed.rpt -pb counter_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file counter_wrapper_timing_summary_routed.rpt -rpx counter_wrapper_timing_summary_routed.rpx }
  catch { report_power -file counter_wrapper_power_routed.rpt -pb counter_wrapper_power_summary_routed.pb }
  catch { report_route_status -file counter_wrapper_route_status.rpt -pb counter_wrapper_route_status.pb }
  catch { report_clock_utilization -file counter_wrapper_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force counter_wrapper.mmi }
  catch { write_bmm -force counter_wrapper_bd.bmm }
  write_bitstream -force counter_wrapper.bit 
  catch { write_sysdef -hwdef counter_wrapper.hwdef -bitfile counter_wrapper.bit -meminfo counter_wrapper.mmi -ltxfile debug_nets.ltx -file counter_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

