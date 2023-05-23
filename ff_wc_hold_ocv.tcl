    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 
#    set_timing_derate -cell_delay -data -late  1.0 

    set_timing_derate -net_delay -early 0.915
    set_timing_derate -net_delay -late  1.0
set_clock_uncertainty -setup 0.075 [all_clocks]
set_clock_uncertainty -hold 0.04 [all_clocks]
#set_max_transition 0.25 [current_design]
set_max_transition 0.150 -clock_path [get_clocks [all_clocks]]
