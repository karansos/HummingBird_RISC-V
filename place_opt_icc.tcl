##########################################################################################
# Version: L-2016.03 (April 4, 2016)
# Copyright (C) 2010-2016 Synopsys, Inc. All rights reserved.
##########################################################################################

##################################################################################################################
#  Note for a flow with physical guidance:
#  Please do not add commands that will modify netlist or floorplan before "place_opt -spg".
#  Please do not use "-effort low" or "set PLACE_OPT_EFFORT low" with "place_opt -spg".
##################################################################################################################

set TIME_START [clock seconds]
source -echo ./rm_setup/icc_setup.tcl 



##########################################################################################
## place_opt_icc: Placement and Placement Optimizations
##########################################################################################

open_mw_lib $MW_DESIGN_LIBRARY
redirect /dev/null "remove_mw_cel -version_kept 0 ${ICC_PLACE_OPT_CEL}" 
copy_mw_cel -from floorplan_icc -to $ICC_PLACE_OPT_CEL
open_mw_cel $ICC_PLACE_OPT_CEL

## Optimization Common Session options - set in all sessions
source -echo common_optimization_settings_icc.tcl 
source -echo common_placement_settings_icc.tcl

## Source CTS Options CTS can be run during place_opt 
source -echo common_cts_settings_icc.tcl

## Source Advanced node settings
source -echo common_advanced_node_settings_zrt_icc.tcl

## Set Ideal Network so place_opt doesn't buffer clock nets
## Remove before clock_opt cts
## Uncertainty handling pre-cts
#   set cur_scenario [current_scenario]
#   set cur_active_scenarios [all_active_scenarios]
#   set_active_scenarios -all
#   foreach scenario [all_active_scenarios] {
#     current_scenario $scenario
#     set_ideal_network [all_fanout -flat -clock_tree ]

#     if {$ICC_APPLY_RM_UNCERTAINTY_PRECTS && [file exists [which $ICC_UNCERTAINTY_PRECTS_FILE.$scenario]] } {
#         echo "RM-Info: Sourcing the pre-cts uncertainty file : [which $ICC_UNCERTAINTY_PRECTS_FILE.$scenario]"
#         source -echo $ICC_UNCERTAINTY_PRECTS_FILE.$scenario 
#     }
#   }
#   set_active_scenarios $cur_active_scenarios
#   current_scenario $cur_scenario

set_app_var compile_instance_name_prefix icc_place  

  if {$ICC_MCMM_PLACE_OPT_SCENARIOS != ""} {
    set_active_scenarios $ICC_MCMM_PLACE_OPT_SCENARIOS
  } else {
#    set_active_scenarios [lminus [all_scenarios] [get_scenarios -setup false -hold false -cts_mode true]]
    ## Note: CTS only scenarios (get_scenarios -setup false -hold false -cts_mode true) are made inactive by RM during optimizations
  }



#######################
## MAGNET PLACEMENT  ## 
#######################
## Define e.g. a ram as a magnet and the command will pull the cells connected to this instance
## closer to the magnet, depending on the -logical_level amount you provide. 
## When adding the -exclude_buffers option, you instruct the tool to pull buffers as well, but do not consider them in the
## logical levels calculation

#magnet_placement -exclude_buffers -logical_level 2 [get_cells "INST_RAM1 INST_RAM2"]

##############################
## RP : Relative Placement  ## 
##############################
## Create RP constraints as shown below
#create_rp_group Lachd_Result_reg -design ORCA -columns 1 -rows 8 -utilization 1.000000
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_0_ -column 0 -row 0
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_1_ -column 0 -row 1
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_2_ -column 0 -row 2
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_3_ -column 0 -row 3
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_4_ -column 0 -row 4
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_5_ -column 0 -row 5
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_6_ -column 0 -row 6
#add_to_rp_group ORCA::Lachd_Result_reg -leaf I_ORCA_TOP/I_RISC_CORE/I_ALU/Lachd_Result_reg_7_ -column 0 -row 7

## Other commands that can be used for RP group creation are : extract_rp_group and order_rp_groups
#extract_rp_group -group_name Lachd_Result_reg -objects [get_cells -hier Lachd_Result_reg*] -col 1 -apply
#extract_rp_group -group_name Oprnd_A_reg -objects [get_cells -hier Oprnd_A_reg*] -col 1 -apply
#extract_rp_group -group_name Oprnd_B_reg -objects [get_cells -hier Oprnd_B_reg*] -col 1 -apply
#order_rp_group -group_name Oprnd_reg {ORCA::Oprnd_A_reg ORCA::Oprnd_B_reg} -apply

## Set spacing labels - to set internal spacing constraint on a reference cell, refer to the following example : 
  set_lib_cell_spacing_label -names {my_label} -right_lib_cells [get_object_name [get_lib_cells tcb*/*]] -left_lib_cells [get_object_name [get_lib_cells tcb*/*]]

## Set spacing rules - to set internal spacing constraint between reference cells assigned with spacing labels,
#  refer to the following example :
  set_spacing_label_rule -labels {my_label my_label} {1 1}    
#  set_spacing_label_rule -labels {your_label1 SNPS_BOUNDARY} {illegal_spacing_min illegal_spacing_max}    
################################################################################
## Save the environment snapshot for the Consistency Checker utility.
#
#  This utility checks for inconsistent settings between Design Compiler and
#  IC Compiler which can contribute to correlation mismatches.
#  Download this utility from SolvNet. See the following SolvNet article for
#  complete details: https://solvnet.synopsys.com/retrieve/026366.html
#  Uncomment the following lines to snapshot the environment.
#  write_environment -consistency -output $REPORTS_DIR/${ICC_PLACE_OPT_CEL}.env 
################################################################################

# A SAIF file is optional for low power placement
if {$POWER_OPTIMIZATION} {
  if {[file exists [which $ICC_IN_SAIF_FILE]]} {
#  set cur_scenario [current_scenario]
#  foreach scenario [all_active_scenarios] {
#    current_scenario $scenario
#    read_saif -input $ICC_IN_SAIF_FILE -instance_name $ICC_SAIF_INSTANCE_NAME
#  }
#  current_scenario $cur_scenario
  }
}

if {$POWER_OPTIMIZATION} {
## A scenario needs to be set with dynamic_power, leakage_power, and setup timing set to true for total optimization.
# The scenarios with these settings  should also have read in the SAIF for switching activity.
set_total_power_strategy -effort $ICC_TOTAL_POWER_STRATEGY_EFFORT
report_total_power_strategy
}

# This variable controls whether timing, power and area tradeoff optimization is enabled in place_opt command. 
# The variable works only for medium effort or high (beginning 2013.03-SP5) effort place_opt with -power option.
if {$POWER_OPTIMIZATION && ($PLACE_OPT_EFFORT == "medium" || $PLACE_OPT_EFFORT == "high")} {
set_app_var icc_preroute_tradeoff_timing_for_power_area $PLACE_OPT_TRADEOFF_TIMING_FOR_POWER_AREA
}

if {$POWER_OPTIMIZATION && $ICC_PLACE_LOW_POWER_PLACEMENT} {
set_optimize_pre_cts_power_options -low_power_placement true
}

# Controls the effort level of TNS optimization
set_optimization_strategy -tns_effort $ICC_TNS_EFFORT_PREROUTE

## This command controls the layer optimization and track RC based optimization during place_opt.
# If $PLACE_OPT_CONSIDER_ROUTING is TRUE make sure the most critical scenario is the current scenario to generate the RC models   
set_place_opt_strategy -layer_optimization $PLACE_OPT_LAYER_OPTIMIZATION -layer_optimization_effort $PLACE_OPT_LAYER_OPTIMIZATION_EFFORT -consider_routing $PLACE_OPT_CONSIDER_ROUTING

report_place_opt_strategy

if {[file exists [which $CUSTOM_PLACE_OPT_PRE_SCRIPT]]} {
echo "RM-Info: Sourcing [which $CUSTOM_PLACE_OPT_PRE_SCRIPT]"
source $CUSTOM_PLACE_OPT_PRE_SCRIPT
}

############## port isolation and antenna diodes ##################
source -e -v rm_setup/insert_port_buffers.tcl
###################################################################

if {$ICC_ENABLE_CHECKPOINT} {
echo "RM-Info : Please ensure there's enough disk space before enabling the set_checkpoint_strategy feature."
set_checkpoint_strategy -enable -overwrite
# The -overwrite option is used by default. Remove it if needed.
}

set place_opt_cmd "place_opt -area_recovery -effort $PLACE_OPT_EFFORT" 

# Physical guidance
if {[file exists [which $ICC_IN_SPG_DEF_FILE]]} {
  set_app_var spg_enable_ascii_flow true
}
#lappend place_opt_cmd -spg


if {$PLACE_OPT_CONGESTION_DRIVEN} {lappend place_opt_cmd -congestion}
if {$DFT && [get_scan_chain] != 0} {lappend place_opt_cmd -optimize_dft}
if {!$DFT && [get_scan_chain] == 0} {lappend place_opt_cmd -continue_on_missing_scandef}
if {$POWER_OPTIMIZATION} {lappend place_opt_cmd -power}

echo $place_opt_cmd

## Workaround for place_opt crash
set_separate_process_options -placement false

eval $place_opt_cmd

if {$POWER_OPTIMIZATION && $ICC_PLACE_LOW_POWER_PLACEMENT} {
set_optimize_pre_cts_power_options -low_power_placement false
}

if {[file exists [which $CUSTOM_PLACE_OPT_POST_SCRIPT]]} {
echo "RM-Info: Sourcing [which $CUSTOM_PLACE_OPT_POST_SCRIPT]"
source $CUSTOM_PLACE_OPT_POST_SCRIPT
}

if {$ICC_ENABLE_CHECKPOINT} {set_checkpoint_strategy -disable}

if { [check_error -verbose] != 0} { echo "RM-Error, flagging ..." }

if {$PLACE_OPT_PREROUTE_FOCALOPT_LAYER_OPTIMIZATION} {
## For advanced technologies, where upper metal layer resistance values are much smaller then lower layer ones,
#  you can perform layer optimization to improve existing buffer trees.
#  Use set_preroute_focal_opt_strategy to customize the settings.
report_preroute_focal_opt_strategy
preroute_focal_opt -layer_optimization
}

## preroute_focal_opt -size_only_mode
#  Use the command to perform preroute focal optimizations with cell sizing only

## psynopt -refine_critical_paths max_path_count
#  Use the command to perform register optimization. 
#  Register optimization moves registers and combinational logic along timing paths to minimize timing violations.


##############################
## RP : Relative Placement  ## 
##############################
## Checking any RP violations.
## It is recommended to open up the GUI and bring up the RP hierarchical browser and 
## RP visual mode to see if RP groups were created correctly
#check_rp_groups -all 



if {$ICC_ECO_FLOW == "FREEZE_SILICON"} {

 echo "RM-Info: Starting the Freeze Silicon eco flow, inserting the spare cells"

 ## spare cell file typically contains commands like :
 ## insert_spare_cells -num_cells {ANDa 10 ANDb 20 ANDc 23} -cell_name spares 

 if {[file exists [which $ICC_SPARE_CELL_FILE]]} {
   echo "RM-Info: Sourcing [which $ICC_SPARE_CELL_FILE]"
   source -echo $ICC_SPARE_CELL_FILE
 }

}


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

save_mw_cel -as $ICC_PLACE_OPT_CEL  

if {$ICC_TIE_CELL_FLOW} { 
  echo "RM-Info : List of TIE-CELL instances in your design :"
  all_tieoff_cells
} else { report_tie_nets
  }

  if {$ICC_REPORTING_EFFORT != "OFF" } {
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.max.tim {report_timing -nosplit -capacitance -transition_time -input_pins -nets -delay max}
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.min.tim {report_timing -nosplit -capacitance -transition_time -input_pins -nets -delay min}
  }
  if {$ICC_REPORTING_EFFORT == "MED" && $POWER_OPTIMIZATION } {
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.power {report_power -nosplit}
  }



## Create Snapshot and Save
  if {$ICC_REPORTING_EFFORT != "OFF" } {
    create_qor_snapshot -name $ICC_PLACE_OPT_CEL
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.qor_snapshot.rpt {report_qor_snapshot -no_display}
  }

  if {$ICC_REPORTING_EFFORT == "MED" } {
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.placement_utilization.rpt {report_placement_utilization -verbose}
    redirect -tee -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.qor {report_qor}
    redirect -tee -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.qor -append {report_qor -summary}
    # redirect -tee -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.qor -append {report_timing_histogram -range_maximum 0  [all_active_scenarios]}
    # redirect -tee -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.qor -append {report_timing_histogram -range_minimum 0 [all_active_scenarios]}
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.con {report_constraints}
    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.10000.hfextclk.rpt {report_timing -group hfextclk -nosplit -capacitance -transition_time -input_pins -nets -delay max -max_paths 10000}

    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.10000.lfextclk.rpt {report_timing -group lfextclk -nosplit [all_active_scenarios] -capacitance -transition_time -input_pins -nets -delay max -max_paths 10000}

#    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.10000.in2reg.rpt {report_timing -group REGIN -nosplit [all_active_scenarios] -capacitance -transition_time -input_pins -nets -delay max -max_paths 10000}

    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.10000.cong.rpt {report_congestion}

    redirect -file $REPORTS_DIR_PLACE_OPT/$ICC_PLACE_OPT_CEL.std.util.rpt {report_placement_utilization}
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
recompute_fit_bbox 
set TIME_TAKEN [expr [clock seconds] - $TIME_START]
set time [expr $TIME_TAKEN/60]
set time_seconds [expr $TIME_TAKEN%60]
set time_hours [expr $time/60]
set time_minutes [expr $time%60]
puts "Total time taken is $time_hours hr $time_minutes m $time_seconds s"
exit

