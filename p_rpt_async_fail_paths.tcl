
proc p_rpt_async_fail_paths {args} {

   # Define default values for optional arguments
   # Boolean arguments required leading '-'
   set results(verbose) 0

   set stop_flag 0

   parse_proc_arguments -args $args results
   
   set factor 1.0  

   foreach_in_collection pin $results(launch_clk_pin_coll) {

      #echo "LP: " [get_attribute $pin full_name]   

      set launch_flop_q_pin \
         [get_pins -of_objects [ \
            get_cells -of_objects [get_pins $pin] \
         ] -filter "@full_name =~ */Q*"]   

      set launch_clock_name [get_object_name [get_attribute [get_pins $pin] clocks]]

      set capture_pin_coll [ \
         filter [ \
            all_fanout -flat -endpoints_only -from [get_pins $launch_flop_q_pin] \
         ] "@full_name !~ */SI*" \
      ]   

      # For Macros, some endpoints could be output ports. We don't time to these.
      # so remove them from collection.
      #
      set capture_pin_coll [ remove_from_collection $capture_pin_coll [all_outputs]]

      if { [sizeof_collection $capture_pin_coll] != 0 } {

         foreach_in_collection ep $capture_pin_coll {
            #echo "EP: " [get_attribute $ep full_name] 
            # Lord knows why - but, in some cases, the 
            # "all_fanout -endpoints_only ... " seems to return some
            # combinational cells.. in this case, these cells have no pin
            # with is_clock_pin attribute. put a check to skip over any such cells
            set clk_pin_count \
               [sizeof_collection \
                  [filter \
                     [get_pins -of_objects \
                        [get_cells -of_objects \
                           [get_pins $ep] \
                        ] \
                     ] "@is_clock_pin == true" \
                  ] \
               ]
            #if {$clk_pin_count == 0} {
            #   echo "SP: " [get_attribute $pin full_name] 
            #   echo "EP: " [get_attribute $ep full_name] 
            #   set stop_flag 1
            #   break
            #   
            #}
            # In some cases, the endpoint is a pin on a HM (Hard Macro).
            # In this case, the HM could have many pins that are clock pins
            # So clk_pin_count could be greater than 1. 
            # These would not be async paths starting from async fifo - 
            # so ignore these. Hence, look only for cases where clk_pin_count = 1
            if {$clk_pin_count == 1} {

               #echo "EP1: " [get_attribute $ep full_name] 
               set capture_clk \
                  [get_attribute \
                     [get_pins -of_objects \
                        [get_cells -of_objects \
                           [get_pins $ep] \
                        ] \
                      -filter "@is_clock_pin == true"] \
                   clocks]

               set capture_clk_name [get_object_name $capture_clk]

               # if launch clock is same as capture clock, it is a synchronous path
               # No point in checking the delay on the synchronous paths
               # Hence, look only for paths where launch clock and capture
               # clock are not the same.      
               if {$launch_clock_name != $capture_clk_name } { 

                  set capture_clk_period [get_attribute $capture_clk period]
                  set expected_arrival_time [expr $capture_clk_period * $factor] 
                  set tmg_path [get_timing_paths -delay max -from [get_pins $pin] -to [get_pins $ep]]
   
                  set startpoint [get_attribute $tmg_path startpoint]
                  set endpoint [get_attribute $tmg_path endpoint]
                  set sp_clk [get_attribute $tmg_path startpoint_clock]
                  set ep_clk [get_attribute $tmg_path endpoint_clock]
                  set ep_max_fall_arrival [get_attribute $endpoint max_fall_arrival]
                  set ep_max_rise_arrival [get_attribute $endpoint max_rise_arrival]
       
                  # Pick the worst of rise and fall arrivals
                  if { $ep_max_fall_arrival > $ep_max_rise_arrival} {
                     set ep_arrival $ep_max_fall_arrival
                  } else {
                     set ep_arrival $ep_max_rise_arrival
                  }

                  set sp_clk_latency [get_attribute $tmg_path startpoint_clock_latency]
                  set ep_arrival [expr $ep_arrival - $sp_clk_latency]
       
                  if { $ep_arrival < $expected_arrival_time } {
                     if { $results(verbose) == 1 } {
                        echo "PASS!!"  >> async_paths.rpt
                        echo "SP: " [get_attribute $startpoint full_name] >> async_paths.rpt
                        echo "EP: " [get_attribute $endpoint full_name] >> async_paths.rpt
                        echo "arrival time = " $ep_arrival >> async_paths.rpt  
                        echo "expected arrival time = " $expected_arrival_time "\n" >> async_paths.rpt 
                     }
                  } else {
       
                     echo "FAIL!!" >> async_paths.rpt
                     echo "SP: " [get_attribute $startpoint full_name] >> async_paths.rpt
                     echo "EP: " [get_attribute $endpoint full_name] >> async_paths.rpt
                     echo "arrival time = " $ep_arrival >> async_paths.rpt
                     echo "sp clk latency = " $sp_clk_latency >> async_paths.rpt
                     echo "expected arrival time = " $expected_arrival_time >> async_paths.rpt
                     report_timing -delay max -from [get_pins $pin] -to [get_pins $ep] >> async_paths.rpt
                     echo "\n"  >> async_paths.rpt    

                     #set stop_flag 1
                     #break
                  }
 
               # $launch_clock_name != $capture_clk_name
               }

            # if $clk_pin_count != 0..
            }

         # foreach_in_collection  ep 
         }   
       
      # sizeof_collection $capture_pin_coll 
      }

      if { $stop_flag == 1} { break }
   # foreach_in_collection pin 
   }

# end of proc p_rpt_async_fail_paths
}

define_proc_attributes p_rpt_async_fail_paths \
   -info "Procedure to report async paths that fail the delay check" \
   -define_args { \
      {launch_clk_pin_coll "Launch Clock Pin Collection" launch_clk_pin_coll list required}
      {ep_pin_coll "End Point Pin Collection" ep_pin_coll list required}
      {verbose "verbosity" verbose int required}
   }

