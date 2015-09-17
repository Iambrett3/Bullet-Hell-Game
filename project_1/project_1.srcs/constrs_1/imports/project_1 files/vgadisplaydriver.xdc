set_property PACKAGE_PIN E3 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
set_property PACKAGE_PIN C12 [get_ports reset]				
        set_property IOSTANDARD LVCMOS33 [get_ports reset] 
 
set_property PACKAGE_PIN A3 [get_ports {RGB[8]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[8]}]
set_property PACKAGE_PIN B4 [get_ports {RGB[9]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[9]}]
set_property PACKAGE_PIN C5 [get_ports {RGB[10]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[10]}]
set_property PACKAGE_PIN A4 [get_ports {RGB[11]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[11]}]
set_property PACKAGE_PIN B7 [get_ports {RGB[4]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[4]}]
set_property PACKAGE_PIN C7 [get_ports {RGB[5]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[5]}]
set_property PACKAGE_PIN D7 [get_ports {RGB[6]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[6]}]
set_property PACKAGE_PIN D8 [get_ports {RGB[7]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[7]}]
set_property PACKAGE_PIN C6 [get_ports {RGB[0]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[0]}]
set_property PACKAGE_PIN A5 [get_ports {RGB[1]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[1]}]
set_property PACKAGE_PIN B6 [get_ports {RGB[2]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[2]}]
set_property PACKAGE_PIN A6 [get_ports {RGB[3]}]                
set_property IOSTANDARD LVCMOS33 [get_ports {RGB[3]}]
set_property PACKAGE_PIN B11 [get_ports hsync]                        
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN B12 [get_ports vsync]                        
set_property IOSTANDARD LVCMOS33 [get_ports vsync]
