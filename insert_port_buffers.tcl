#This script :
# inserts buffers on all inputs (excluding clock sources) and all outputs then places the buffers near the port and marks them as fixed.  
# inserst antenna protection diode on all inputs


#specify buffer cell name
set out_buf_name {BUFFD12BWP12T30P140}
set in_buf_name {BUFFD12BWP12T30P140}
set clk_in_buf_name {CKND12BWP12T30P140}
set clk_out_buf_name {CKND12BWP12T30P140}

#collect clock source ports
set cur_scenario [current_scenario]
  set in_clock_ports ""
  set out_clock_ports ""
  foreach scenario [all_active_scenarios] {
     current_scenario $scenario
     lappend in_clock_ports [filter_collection [all_inputs] @is_clock_used_as_clock==true]
     lappend out_clock_ports [filter_collection [all_outputs] @is_clock_used_as_clock==true]
  }
current_scenario $cur_scenario

#insert buffer on all non-clock inputs/outputs
insert_buffer -new_cell_names buf_in_ -no_of_cells 1 [remove_from_collection [all_inputs] $in_clock_ports] $in_buf_name
insert_buffer -new_cell_names buf_out_ -no_of_cells 1 [remove_from_collection [all_outputs] $out_clock_ports] $out_buf_name

#insert buffer on all clock inputs/outputs
insert_buffer -inverter_pair -new_cell_names buf_in_clk_ -no_of_cells 1 $in_clock_ports $clk_in_buf_name
insert_buffer -inverter_pair -new_cell_names buf_out_clk_ -no_of_cells 1 $out_clock_ports $clk_out_buf_name

#Fixed and dont_touch attribute on port isolation buffers
#set_attribute [get_cells buf_in_clk*] is_fixed true
#set_attribute [get_cells buf_out_clk*] is_fixed true
set_attribute [get_cells buf_in*] dont_touch true
set_attribute [get_cells buf_out*] dont_touch true

#insert antenna protection diode on all inputs
insert_port_protection_diodes -ignore_dont_touch -prefix antprot_in_ -diode_cell [get_lib_cells tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/ANTENNABWP12T30P140] -port [all_inputs]

#place port buffers near the connected pin and fix placement
magnet_placement -mark_fixed [all_inputs] -cells [get_cells buf_in*]
magnet_placement -mark_fixed [all_outputs] -cells [get_cells buf_out*]

