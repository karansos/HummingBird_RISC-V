##########################################################################################
# Version: L-2016.03 (April 4, 2016)
# Copyright (C) 2010-2016 Synopsys, Inc. All rights reserved.
##########################################################################################
set TIME_START [clock seconds]
source -echo ./rm_setup/icc_setup.tcl 

###########################################################
## clock_opt_cts_icc: Clock Tree Synthesis and Optimization 
###########################################################

open_mw_lib $MW_DESIGN_LIBRARY
redirect /dev/null "remove_mw_cel -version_kept 0 ${ICC_CLOCK_OPT_CTS_CEL}" 
copy_mw_cel -from $ICC_PLACE_OPT_CEL -to $ICC_CLOCK_OPT_CTS_CEL
open_mw_cel $ICC_CLOCK_OPT_CTS_CEL



## Optimization Common Session Options - set in all sessions
source -echo common_optimization_settings_icc.tcl
source -echo common_placement_settings_icc.tcl

## Source CTS Options 
source -echo common_cts_settings_icc.tcl

## Source Advanced node settings
source -echo common_advanced_node_settings_zrt_icc.tcl

set_app_var cts_instance_name_prefix CTS

 ## By default, all scenarios are made active here, prior to CTS. This will ensure that all clock related 
 ## attributes ( propagation, set_fix_hold, latency, uncertainty) will be available in each scenario.
 ## If you reduce the active scenarios here, or if you add new scenarios later in the flow
 ## then you will have to manually provide all this info for 
 ## each inactive scenario, after running clock_opt -only_cts
 ## 
 #set prects_cur_scenario [current_scenario]
 #set prects_active_scenarios [all_active_scenarios]

 #set_active_scenarios [all_scenarios]
 #set_active_scenarios [all_active_scenarios]
 #puts "RM-Info: CTS scenarios are [get_scenarios -cts_mode true]"

##############################
## RP : Relative Placement  ##                
##############################
## Ensuring that the RP cells are not changed during clock_opt
#set_rp_group_options [all_rp_groups] -cts_option fixed_placement
#set_rp_group_options [all_rp_groups] -cts_option "size_only"

# set_delay_calculation_options -routed_clock arnoldi

# set cur_scenario [current_scenario]
# current_scenario [lindex [get_scenarios -cts_mode true] 0]
if {$ICC_SANITY_CHECK} {
        check_physical_design -stage pre_clock_opt -no_display -output $REPORTS_DIR_CLOCK_OPT_CTS/check_physical_design.pre_clock_opt 
}
# current_scenario $cur_scenario 

if {$ICC_ENABLE_CHECKPOINT} {
echo "RM-Info : Please ensure there's enough disk space before enabling the set_checkpoint_strategy feature."
set_checkpoint_strategy -enable -overwrite
# The -overwrite option is used by default. Remove it if needed.
}

# A SAIF file is optional for self-gating
if {$ICC_CTS_SELF_GATING && [file exists [which $ICC_IN_SAIF_FILE]]} {
#  foreach scenario [all_active_scenarios] {
#    current_scenario $scenario
    read_saif -input $ICC_IN_SAIF_FILE -instance_name $ICC_SAIF_INSTANCE_NAME
#  }
}

if {$POWER_OPTIMIZATION && $ICC_CTS_LOW_POWER_PLACEMENT} {set_optimize_pre_cts_power_options -low_power_placement true}
if {$POWER_OPTIMIZATION && $ICC_CTS_CLOCK_GATE_MERGE} {set_optimize_pre_cts_power_options -merge_clock_gates true}
# Gate splitting to avoid timing violations on enable pins of ICGs
if {$POWER_OPTIMIZATION && $ICC_CTS_CLOCK_GATE_SPLIT} {set_optimize_pre_cts_power_options -split_clock_gates true}

if {[file exists [which $CUSTOM_CLOCK_OPT_CTS_PRE_SCRIPT]]} {
echo "RM-Info: Sourcing [which $CUSTOM_CLOCK_OPT_CTS_PRE_SCRIPT]"
source $CUSTOM_CLOCK_OPT_CTS_PRE_SCRIPT
}


## for balancing the output ports of feedthrough clocks ##
source -e -v rm_setup/custom_pre_script_icc_clock


set clock_opt_cts_cmd "clock_opt -only_cts -no_clock_route"
if {!$DFT && [get_scan_chain] == 0} {lappend clock_opt_cts_cmd -continue_on_missing_scandef}
if {$POWER_OPTIMIZATION} {
if {$ICC_CTS_LOW_POWER_PLACEMENT || $ICC_CTS_CLOCK_GATE_MERGE || $ICC_CTS_CLOCK_GATE_SPLIT} {lappend clock_opt_cts_cmd -power}
}
if {$ICC_CTS_INTERCLOCK_BALANCING && [file exists [which $ICC_CTS_INTERCLOCK_BALANCING_OPTIONS_FILE]]} {lappend clock_opt_cts_cmd -inter_clock_balance}
if {$ICC_CTS_UPDATE_LATENCY} {lappend clock_opt_cts_cmd -update_clock_latency}
if {$ICC_CTS_SELF_GATING} {lappend clock_opt_cts_cmd -insert_self_gating}
echo $clock_opt_cts_cmd
eval $clock_opt_cts_cmd

if {[file exists [which $CUSTOM_CLOCK_OPT_CTS_POST_SCRIPT]]} {
echo "RM-Info: Sourcing [which $CUSTOM_CLOCK_OPT_CTS_POST_SCRIPT]"
source $CUSTOM_CLOCK_OPT_CTS_POST_SCRIPT
}

if {$ICC_ENABLE_CHECKPOINT} {set_checkpoint_strategy -disable}

if { [check_error -verbose] != 0} { echo "RM-Error, flagging ..." }
############################################################################################################
# ADDING ADDITIONAL FEATURES TO THE CLOCK_OPT COMMAND
############################################################################################################

## When you want to do interclock delay balancing, you need to execute the following commands :
#  set_inter_clock_delay_options -balance_group "Clk1 Clk2"
#  clock_opt -inter_clock_balance


## When you want to update the IO latency before you start the post CTS optimization, add :
# set_latency_adjustment_options -from_clock  ....  -to_clock .... -latency ....
# clock_opt -update_clock_latency -no_clock_route


## checking whether the clock nets got the NDR
# report_net_routing_rules [get_nets -hier *]



########################################
#           CONNECT P/G                #
########################################
## Connect Power & Ground for non-MV and MV-mode

 if {[file exists [which $CUSTOM_CONNECT_PG_NETS_SCRIPT]]} {
   echo "RM-Info: Sourcing [which $CUSTOM_CONNECT_PG_NETS_SCRIPT]"
   source -echo $CUSTOM_CONNECT_PG_NETS_SCRIPT
 } else {
    derive_pg_connection -power_net $MW_POWER_NET -power_pin $MW_POWER_PORT -ground_net $MW_GROUND_NET -ground_pin $MW_GROUND_PORT 
    if {!$ICC_TIE_CELL_FLOW} {derive_pg_connection -power_net $MW_POWER_NET -ground_net $MW_GROUND_NET -tie}
   }
if { [check_error -verbose] != 0} { echo "RM-Error, flagging ..." }

source -echo common_post_cts_timing_settings.tcl
#   set cur_active_scenarios [all_active_scenarios]
#   set_active_scenarios -all
#   foreach scenario [all_active_scenarios] {
     #ideal network
#    current_scenario $scenario
     remove_ideal_network [all_fanout -flat -clock_tree]
#   }
#   set_active_scenarios $cur_active_scenarios

   ## If not all scenarios are active at the start of the script, you must propagate clocks manually.
   #  The command propagates all clocks on all active scenarios.
   #  propagate_all_clocks

#   foreach scenario [all_active_scenarios] {
#     current_scenario $scenario
     #set fix hold 
     set_fix_hold [all_clocks]

     #uncertainties 
#     if {$ICC_APPLY_RM_UNCERTAINTY_POSTCTS && [file exists [which $ICC_UNCERTAINTY_POSTCTS_FILE.$scenario]] } {
#           echo "RM-Info: Sourcing the post-cts uncertainty file : [which $ICC_UNCERTAINTY_POSTCTS_FILE.$scenario]"
#           source -echo $ICC_UNCERTAINTY_POSTCTS_FILE.$scenario
     }
   }

#save_mw_cel -as $ICC_CLOCK_OPT_CTS_CEL

#  current_scenario $prects_cur_scenario

if {$ICC_REPORTING_EFFORT != "OFF" } {
#     if {[llength [get_scenarios -cts_mode true]]} {
     redirect -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.clock_timing {report_clock_timing -nosplit -type skew} ;# local skew report
     redirect -tee -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.max.clock_tree {report_clock_tree -nosplit -summary}     ;# global skew report
     }
     if {[llength [get_scenarios -active true -hold true]]} {
     redirect -tee -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.min.clock_tree {report_clock_tree -nosplit -summary}     ;# min global skew report
     }
}

# set_active_scenarios $prects_active_scenarios
# unset prects_active_scenarios
if {$ICC_REPORTING_EFFORT == "MED" } {
 redirect -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.max.tim {report_timing -nosplit -capacitance -transition_time -input_pins -nets -delay max} 
 redirect -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.min.tim {report_timing -nosplit  -capacitance -transition_time -input_pins -nets -delay min} 
}
if {$ICC_REPORTING_EFFORT == "MED" } {
   redirect -tee -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.qor {report_qor}
   redirect -tee -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.qor -append {report_qor -summary}
   redirect -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.con {report_constraints}
}


if {$ICC_REPORTING_EFFORT != "OFF" } {
   redirect -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.placement_utilization.rpt {report_placement_utilization -verbose}
   create_qor_snapshot -clock_tree -name $ICC_CLOCK_OPT_CTS_CEL
   redirect -file $REPORTS_DIR_CLOCK_OPT_CTS/$ICC_CLOCK_OPT_CTS_CEL.qor_snapshot.rpt {report_qor_snapshot -no_display}
}

## Categorized Timing Report (CTR)
#  Use CTR in the interactive mode to view the results of create_qor_snapshot. 
#  Recommended to be used with GUI opened.
#  query_qor_snapshot -display (or GUI: Timing -> Query QoR Snapshot)
#  query_qor_snapshot condenses the timing report into a cross-referencing table for quick analysis. 
#  It can be used to highlight violating paths and metric in the layout window and timing reports. 
#  CTR also provides special options to focus on top-level and hierarchical timing issues. 
#  When dealing with dirty designs, increasing the number violations per path to 20-30 when generating a snapshot can help 
#  find more issues after each run (create_qor_snapshot -max_paths 20).
#  Specify -type min for hold time violations. 
set TIME_TAKEN [expr [clock seconds] - $TIME_START]
set time [expr $TIME_TAKEN/60]
set time_seconds [expr $TIME_TAKEN%60]
set time_hours [expr $time/60]
set time_minutes [expr $time%60]
puts "Total time taken is $time_hours hr $time_minutes m $time_seconds s"
exit

