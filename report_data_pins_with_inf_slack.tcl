# Usage: To be invoked in PrimeTime (should be possible to invoke in other
# tools as well)
#
# Purpose: Report data pins that have max_slack = INFINITY. These are pins
# that are not constrained for max_delay.
#
# The Script uses "proc_show_collection" procedure, included in common_procs.tcl 

puts "Info: Running script [info script]\n"

source -echo -verbose rm_setup/proc_show_collection.tcl

# CDN - reset for a flop with Enable signal
# SDN - reset for a flop which does not have Enable signal
# all_registers also covers memories and ETMs:w
#
proc_show_collection -force \
   [filter \
      [ filter \
         [get_pins -of_objects [all_registers]] \
         "is_data_pin == true"] \
      "@max_slack == INFINITY && \
       @full_name !~ *SDN && \
       @full_name !~ *CDN && \
       @full_name !~ *CLK*" \
   ] > data_pins_with_inf_slack_reg.rpt

puts "Info: Completed script [info script]\n"
