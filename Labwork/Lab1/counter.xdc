
##ENABLE SWITCH
set_property PACKAGE_PIN G15 [get_ports {Sw}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw}]

##BUTTONS
##Reset
set_property PACKAGE_PIN K18 [get_ports {BTNs[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTNs[2]}]
##up
set_property PACKAGE_PIN P16 [get_ports {BTNs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTNs[1]}]
##down
set_property PACKAGE_PIN K19 [get_ports {BTNs[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTNs[0]}]

##LEDs
set_property PACKAGE_PIN M14 [get_ports {LEDs[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[0]}]

set_property PACKAGE_PIN M15 [get_ports {LEDs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[1]}]

set_property PACKAGE_PIN G14 [get_ports {LEDs[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[2]}]

set_property PACKAGE_PIN D18 [get_ports {LEDs[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[3]}]

##Clock
set_property PACKAGE_PIN K17 [get_ports {Clock}]
set_property IOSTANDARD LVCMOS33 [get_ports {Clock}]




