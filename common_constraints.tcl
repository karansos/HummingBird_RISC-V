puts "RM-Info: Running script [info script]\n"

# This constraint sets a transition of 120ps on all the sinks of all the clocks.
# The clock transition only set until preCTS, to assume a transition value on the 
# sink pins. 
# After CTS, since clock will be propagated, propagated transition will be used.
 
set_clock_transition 0.120 [all_clocks] 

# Driving cell for all inputs

set inputs [all_inputs]
# remove the clock inputs
set inputs  [filter $inputs -regexp {@full_name !~ ".*clk.*"} ]
# All inputs driven by BUFFD4 (x4) buffer
foreach_in_collection input $inputs {    
   #set_driving_cell [get_ports $input] -library tcbn28hpcplusbwp12t30p140ssg0p81v125c -lib_cell BUFFD4BWP12T30P140 -pin Z -no_design_rule
   set_driving_cell -lib_cell BUFFD4BWP12T30P140 -pin Z -no_design_rule [get_ports $input]
   # Maximum fanout values for input ports of a design.
   set_max_fanout 5 [get_ports $input]
   # Maximum transition times for ports or designs.
   set_max_transition 1 [get_ports $input]
}

set output_load 0.001
set output_fanout_number 1
 
# Outputs
set output_ports [all_outputs]
foreach_in_collection output_port $output_ports {
   set_load -pin_load $output_load [get_ports $output_port]
   set_port_fanout_number $output_fanout_number [get_ports $output_port]
}

# ****************************************************
# Set clock latency
# ****************************************************  

set clk_collection [all_clocks]

foreach_in_collection clk $clk_collection {
   if { $synopsys_program_name == "dc_shell"}  { 
      # network latency = latency from clock source to clk pin
      # of sequential element
      set_clock_latency 0 [get_clocks $clk] 
      # sets source latency = latency from ideal waveform to 
      # clock source
      set_clock_latency -source 0 [get_clocks $clk]
   }   
}

puts "RM-Info: Completed script [info script]\n"
