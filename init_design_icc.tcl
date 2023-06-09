##########################################################################################
# Version: L-2016.03 (April 4, 2016)
# Copyright (C) 2010-2016 Synopsys, Inc. All rights reserved.
##########################################################################################
##########################################################################################
## init_design_icc.tcl : initial scripts that reads the design, applies constraints and
##                       generates a zero interconnect timing report
##########################################################################################

##################################################################################################################
#  Note for a flow with physical guidance:
#  Please do not add commands that will modify netlist or floorplan in this script.
#  You must use a floorplan from Design Compiler, for example, through a DEF file or a floorplan file. 
#  $ICC_FLOORPLAN_INPUT == "CREATE" is not supported and has been omitted. 
##################################################################################################################
set TIME_START [clock seconds]
source -echo ./rm_setup/icc_setup.tcl


########################################################################################
# Design Creation 
########################################################################################

if { $ICC_INIT_DESIGN_INPUT == "MW" } {

########################################################################################
# MW CEL as the format between DCT and ICC
########################################################################################

  if {$ICC_IMPLEMENTATION_PHASE == "default"} {

    ## If $MW_DESIGN_LIBRARY already exists and $COPY_FROM_MW_DESIGN_LIBRARY is specified ...
    if {[file exists $MW_DESIGN_LIBRARY]} {
      if {[file exists $COPY_FROM_MW_DESIGN_LIBRARY]} {
        file delete -force $MW_DESIGN_LIBRARY
        file copy -force $COPY_FROM_MW_DESIGN_LIBRARY $MW_DESIGN_LIBRARY
      } elseif {$COPY_FROM_MW_DESIGN_LIBRARY != "" && ![file exists $COPY_FROM_MW_DESIGN_LIBRARY]} {
        echo "RM-Error: $COPY_FROM_MW_DESIGN_LIBRARY is specified but doesn't exist. Skip copying. Use existing $MW_DESIGN_LIBRARY"
      }

    ## If $MW_DESIGN_LIBRARY does NOT exist and $COPY_FROM_MW_DESIGN_LIBRARY is specified ...
    } else {
      if {[file exists $COPY_FROM_MW_DESIGN_LIBRARY]} {
        file copy -force $COPY_FROM_MW_DESIGN_LIBRARY $MW_DESIGN_LIBRARY
      } elseif {$COPY_FROM_MW_DESIGN_LIBRARY != "" && ![file exists $COPY_FROM_MW_DESIGN_LIBRARY]} {
        echo "RM-Error: $COPY_FROM_MW_DESIGN_LIBRARY is specified but doesn't exist. Skip copying."
  echo "RM-Error: $MW_DESIGN_LIBRARY doesn't exist. Please provide a valid $MW_DESIGN_LIBRARY. Exiting ..."
        exit
      } else {
        echo "RM-Error: $MW_DESIGN_LIBRARY doesn't exist. Please provide a valid $MW_DESIGN_LIBRARY. Exiting ..." 
        exit
      }
    }

  }

 open_mw_cel $ICC_INPUT_CEL -library $MW_DESIGN_LIBRARY 

 if {$ICC_IMPLEMENTATION_PHASE == "top" && $ICC_BLOCK_ABSTRACTIONS_LIST != ""} {
   set_top_implementation_options -block_references $ICC_BLOCK_ABSTRACTIONS_LIST
   save_mw_cel  
 }

} else {

## The Milkyway libraries by default supports user defined and routing layers on layers 1-187 in 
# the tech file. The library can support from 1-4000 in the tech file if the extended layer mode
# is activated. The extended layer mode is permanent and cannot be reverted back to the 255 
# layer mode once activated. To check if the library is in the extended layer mode query for the
# "is_extended_layer_mode" attribute on the Milkyway library.
#
# get_attribute [current_mw_lib] is_extended_layer_mode
#
# The reference libraries should also be created in the extended layer mode to be consistent with
# the design library. For more information on the extended layer mode in schema 8.1 please refer
# to the Milkyway module of Solvnet article #1823238

    if {$MW_EXTENDED_LAYER_MODE} {
      extend_mw_layers
  }

  if { ![file exists [which $MW_DESIGN_LIBRARY/lib]] } {
     if { [file exists $MW_REFERENCE_CONTROL_FILE]} {
       create_mw_lib \
            -tech $TECH_FILE \
            -bus_naming_style {[%d]} \
            -reference_control_file $MW_REFERENCE_CONTROL_FILE \
            $MW_DESIGN_LIBRARY 
     } else {
       create_mw_lib \
            -tech $TECH_FILE \
            -bus_naming_style {[%d]} \
            -mw_reference_library $MW_REFERENCE_LIB_DIRS \
            $MW_DESIGN_LIBRARY 
     }
  }

}



if {$ICC_INIT_DESIGN_INPUT == "DDC" } {

########################################################################################
# DDC as the format between DCT and ICC
########################################################################################

  open_mw_lib $MW_DESIGN_LIBRARY
  suppress_message "UID-3"      ;# avoid local link library messages
  if {$ICC_IMPLEMENTATION_PHASE == "top" && $ICC_BLOCK_ABSTRACTIONS_LIST != ""} {
    set_top_implementation_options -block_references $ICC_BLOCK_ABSTRACTIONS_LIST
  }
  import_designs $ICC_IN_DDC_FILE -format ddc -top $DESIGN_NAME -cel $DESIGN_NAME
  unsuppress_message "UID-3" 

}


if {$ICC_INIT_DESIGN_INPUT == "VERILOG" } {

########################################################################################
# Ascii as the format between DCT and ICC
########################################################################################

 open_mw_lib $MW_DESIGN_LIBRARY


 ## add -dirty_netlist in case there are mismatches between the VERILOG netlist and the FRAM view of the cells
 read_verilog -top $DESIGN_NAME $ICC_IN_VERILOG_NETLIST_FILE

 uniquify_fp_mw_cel 
 current_design $DESIGN_NAME 


}

if {$ICC_INIT_DESIGN_INPUT == "VERILOG" } {
}
if { [check_error -verbose] != 0} { echo "RM-Error, flagging ..." }

if {$DFT} {

  ## Read Scan Chain Information from DEF for hierarchical flow : DFT-aware hierarchical design planning
  if {$ICC_DP_DFT_FLOW && $ICC_IMPLEMENTATION_PHASE == "default"} {
    set DFT_SCAN_DEF_FILE $ICC_IN_FULL_CHIP_SCANDEF_FILE
    set DFT_REPORT_PREFIX full_chip

  ## Read Scan Chain Information from DEF for flat 
  } elseif {!$ICC_DP_DFT_FLOW && $ICC_IMPLEMENTATION_PHASE == "default"} {
    set DFT_SCAN_DEF_FILE $ICC_IN_SCAN_DEF_FILE
    set DFT_REPORT_PREFIX scan_chain_pre_reordering

  ## Read Scan Chain Information from DEF for hierarchical flow : block level implementation
  } elseif {$ICC_IMPLEMENTATION_PHASE != "default"} {
    set DFT_SCAN_DEF_FILE $ICC_IN_SCAN_DEF_FILE
    set DFT_REPORT_PREFIX scan_chain_pre_reordering
  }    

  if {[info exists DFT_SCAN_DEF_FILE]} {
    if {[file exists [which $DFT_SCAN_DEF_FILE]]} {
      if {[get_scan_chain] != 0} {
        remove_scan_def
      }
      read_def $DFT_SCAN_DEF_FILE
    } elseif {$DFT_SCAN_DEF_FILE != ""} {
      echo "RM-Error: SCANDEF file $DFT_SCAN_DEF_FILE is specified but not found. Please investigate it"  
    }
  unset DFT_SCAN_DEF_FILE
  }

  if {[get_scan_chain] != 0} {
    redirect -file $REPORTS_DIR_INIT_DESIGN/$DESIGN_NAME.$DFT_REPORT_PREFIX.check_scan_chain.rpt {check_scan_chain}
    redirect -file $REPORTS_DIR_INIT_DESIGN/$DESIGN_NAME.$DFT_REPORT_PREFIX.report_scan_chain.rpt {report_scan_chain}
  }

}

#  echo "RM-Info : starting the MCMM flow"
  if {$ICC_IMPLEMENTATION_PHASE == "default"} {
        ## If there are "create_voltage_area" commands in the input SDC, pls remove them before SDC is read.
        #  Otherwise, the message "Error: Core Area not defined" will appear.
        #  The "create_voltage_area" commands are to be provided through the $CUSTOM_CREATE_VA_SCRIPT variable.    

#  echo "RM-Info: Sourcing [which $ICC_MCMM_SCENARIOS_FILE]"
#  source -echo $ICC_MCMM_SCENARIOS_FILE
  }

   if {$ICC_CTS_INTERCLOCK_BALANCING && [file exists [which $ICC_CTS_INTERCLOCK_BALANCING_OPTIONS_FILE]]} {
#     set cur_scenario [current_scenario]
#     set cur_active_scenarios [all_active_scenarios]
     #making the CTS scenario also active as it needs to become the current scenario prior to ICDB setup
#     set_active_scenarios -all
#     foreach scenario [get_scenarios -cts_mode true] {
#     current_scenario $scenario
#     echo "RM-Info: Sourcing [which $ICC_CTS_INTERCLOCK_BALANCING_OPTIONS_FILE]"
#     source -echo $ICC_CTS_INTERCLOCK_BALANCING_OPTIONS_FILE
#     }
#     set_active_scenarios $cur_active_scenarios
#     current_scenario $cur_scenario
   }

  if {$ICC_INIT_DESIGN_INPUT == "VERILOG" } {
#   set cur_scenario [current_scenario]
#   foreach scenario [all_active_scenarios] {
#     current_scenario $scenario 
#     set ports_clock_root {} 
#     foreach_in_collection a_clock [get_clocks -quiet] { 
#       set src_ports [filter_collection [get_attribute $a_clock sources] @object_class==port] 
#       set ports_clock_root  [add_to_collection $ports_clock_root $src_ports] 
#     }
#  
#     group_path -name REGOUT -to [all_outputs]
#     group_path -name REGIN -from [remove_from_collection [all_inputs] $ports_clock_root]
#     group_path -name REG2REG -from [all_clocks] -to [all_clocks]
#     group_path -name FEEDTHROUGH -from [remove_from_collection [all_inputs] $ports_clock_root] -to [all_outputs]
#   };
#   current_scenario $cur_scenario
   
   read_sdc -version latest ${ICC_IN_SDC_FILE}
   set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE -tech2itf_map ${MAP_FILE} -min_tluplus $TLUPLUS_MIN_FILE 
  }

#   set cur_scenario [current_scenario]
#   foreach scenario [all_active_scenarios] {
#     current_scenario $scenario 
#     remove_propagated_clock -all
#   };
#   current_scenario $cur_scenario

 ## For MCMM designs, timing derate values are applied in rm_icc_scripts/mcmm.scenarios.example

## The set_critical_range command sets the value of critical_range attribute.
## It specifies absolute values and uses timing units, such as ns and is used in both WNS and TNS 
## optimization.
## If user does not use the set_critical_range command to set the critical_range attribute to a specified 
## value, the default value will be 0. This is the same for place_opt, clock_opt, and route_opt.
## However, in this case, ICC will dynamically derive internal value for the critical_range attribute. 
## This automatic critical range setting starts from 50% of a path group's WNS value at different stages of 
## TNS optimization.
   if {$ICC_CRITICAL_RANGE != "" || $ICC_MAX_TRANSITION != "" || $ICC_MAX_FANOUT != ""} {
#     set cur_scenario [current_scenario]
#     set cur_active_scenarios [all_active_scenarios]
#     foreach scenario [all_active_scenarios] { 
#        current_scenario $scenario 
#        if {$ICC_CRITICAL_RANGE != ""} {set_critical_range $ICC_CRITICAL_RANGE [current_design]}
#        if {$ICC_MAX_TRANSITION != ""} {set_max_transition $ICC_MAX_TRANSITION [current_design]}
#        if {$ICC_MAX_FANOUT     != ""} {set_max_fanout     $ICC_MAX_FANOUT     [current_design]}
#     }
#     current_scenario $cur_scenario
   }

   ## set_clock_gating_check
   #  Note on using set_clock_gating_check for different clock gating styles:
   #  1.If your design has discrete clock gates but does not have any clock gating checks defined on them,
   #    you should uncomment the following commands or 
   #    customize them with non-zero values and set them on either the design level or on the instances preferably.
   #  2.If your design has ICG cells only,
   #    you do not need to uncomment the following commands as the tool will honor library defined checks.
   #
   #  set cur_scenario [current_scenario]
   #  set cur_active_scenarios [all_active_scenarios]
   #  foreach scenario [all_active_scenarios] {
   #     current_scenario $scenario
   #     set_clock_gating_check -setup 0 [current_design]
   #     set_clock_gating_check -hold 0 [current_design]
   #  }
   #  current_scenario $cur_scenario

#  echo "RM-Info: MCMM tlu_plus settings are set during scenario definition"

   if {$ICC_CTS_UPDATE_LATENCY} {
#   set cur_scenario [current_scenario]
#   set cur_active_scenarios [all_active_scenarios]
#   foreach scenario [all_active_scenarios] {
#     if {[file exists [which $ICC_CTS_LATENCY_OPTIONS_FILE.$scenario]]} {
#       current_scenario $scenario
#       echo "RM-Info: Sourcing [which ICC_CTS_LATENCY_OPTIONS_FILE.$scenario]"
#       source -echo $ICC_CTS_LATENCY_OPTIONS_FILE.$scenario
#     }
#   };
#   current_scenario $cur_scenario
   }


#############################################################################################################################
# Floorplan Creation: DEF OR FLOORPLAN FILE OR PIN/PAD PHYSICAL CONSTRAINT FILE + create_floorplan
#############################################################################################################################
## Below steps apply if floorplan input is not a DEF file
##Connect P/G, to create Power and Ground Ports for Non-MV designs 
##Assuming P/G Ports are included in DEF file, need PG ports created for non-DEF flows 
if {$ICC_FLOORPLAN_INPUT != "DEF" } {
      ## If you have additional scripts to create pads, for example, create_cell, load it here       
      #       source $YOUR_SCRIPT 

      ## Connect PG first before loading floorplan file or create_floorplan
        if {[file exists [which $CUSTOM_CONNECT_PG_NETS_SCRIPT]]} {
   echo "RM-Info: Sourcing [which $CUSTOM_CONNECT_PG_NETS_SCRIPT]"
        source -echo $CUSTOM_CONNECT_PG_NETS_SCRIPT
        } else {
  derive_pg_connection -power_net $MW_POWER_NET -power_pin $MW_POWER_PORT -ground_net $MW_GROUND_NET -ground_pin $MW_GROUND_PORT -create_port top 
        }
}

if {[file exists [which $CUSTOM_INIT_DESIGN_PRE_SCRIPT]]} {
echo "RM-Info: Sourcing [which $CUSTOM_INIT_DESIGN_PRE_SCRIPT]"
source $CUSTOM_INIT_DESIGN_PRE_SCRIPT
}

## You can have DEF, floorplan file, or pin pad physical constraint file as floorplan input
if {$ICC_FLOORPLAN_INPUT == "DEF" && [file exists [which $ICC_IN_DEF_FILE]]} {
    if {[file exists [which $ICC_IN_PHYSICAL_ONLY_CELLS_CREATION_FILE]]} {source $ICC_IN_PHYSICAL_ONLY_CELLS_CREATION_FILE}
    if {[file exists [which $ICC_IN_PHYSICAL_ONLY_CELLS_CONNECTION_FILE]]} {source $ICC_IN_PHYSICAL_ONLY_CELLS_CONNECTION_FILE}

    ## Need mapping if there are multiple sites in DEF and they do not match the MW tile names. 
    #  Examples: 
    #    set_app_var mw_site_name_mapping {{CORE unit}} OR   
    #    set_app_var mw_site_name_mapping {{CORE unit} {CORE012 unit012} {CORE015 unit015}}
    #  In the example, CORE is the DEF site name and unit is the MW tile name.
    #  This helps fix PSYN-267 issues: XXX has no associated site row defined in the floorplan.

    read_def -verbose -no_incremental $ICC_IN_DEF_FILE

    if {[file exists [which $ICC_IN_SPG_DEF_FILE]]} {
      set_app_var spg_enable_ascii_flow true
      read_def -verbose $ICC_IN_SPG_DEF_FILE
    } 

    if {[check_error -verbose] != 0} {echo "RM-Error, flagging ..." }
} 

if {$ICC_FLOORPLAN_INPUT == "FP_FILE" } {
  if { [file exists [which $ICC_IN_PHYSICAL_ONLY_CELLS_CREATION_FILE]]} {source $ICC_IN_PHYSICAL_ONLY_CELLS_CREATION_FILE}
  if { [file exists [which $ICC_IN_PHYSICAL_ONLY_CELLS_CONNECTION_FILE]]} {source $ICC_IN_PHYSICAL_ONLY_CELLS_CONNECTION_FILE}

  if { [file exists [which $ICC_IN_FLOORPLAN_FILE]]} {
  read_floorplan $ICC_IN_FLOORPLAN_FILE
  }
}


if {$ICC_FLOORPLAN_INPUT == "USER_FILE"} {
   if {[file exists [which $ICC_IN_FLOORPLAN_USER_FILE]]} { source $ICC_IN_FLOORPLAN_USER_FILE}
} 

if {$ICC_FLOORPLAN_INPUT == "SKIP"} {
}

## If you want to add additional floorplan details such as macro location, corner cells, io filler cells, or pad rings,
## you can add them here :
if {[file exists [which $ICC_PHYSICAL_CONSTRAINTS_FILE]] } {
  source $ICC_PHYSICAL_CONSTRAINTS_FILE
}

if {$TOP_BOUNDARY_CELLS != ""} {lappend insrt_bd_cell_cmd -top_boundary_cells $TOP_BOUNDARY_CELLS}
if {$BOTTOM_BOUNDARY_CELLS != ""} {lappend insrt_bd_cell_cmd -bottom_boundary_cells $BOTTOM_BOUNDARY_CELLS}
if {$LEFT_BOUNDARY_CELLS != ""} {lappend insrt_bd_cell_cmd -left_boundary_cell $LEFT_BOUNDARY_CELLS}
if {$RIGHT_BOUNDARY_CELLS != ""} {lappend insrt_bd_cell_cmd -right_boundary_cell $RIGHT_BOUNDARY_CELLS}
if {$TOP_RIGHT_OUT_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -top_right_outside_corner_cell $TOP_RIGHT_OUT_CORNER_CELLS}
if {$BOTTOM_RIGHT_OUT_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -bottom_right_outside_corner_cell $BOTTOM_RIGHT_OUT_CORNER_CELLS}
if {$TOP_LEFT_OUT_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -top_left_outside_corner_cell $TOP_LEFT_OUT_CORNER_CELLS}
if {$BOTTOM_LEFT_OUT_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -bottom_left_outside_corner_cell $BOTTOM_LEFT_OUT_CORNER_CELLS}
if {$TOP_LEFT_IN_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -top_left_inside_corner_cells $TOP_LEFT_IN_CORNER_CELLS}
if {$TOP_RIGHT_IN_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -top_right_inside_corner_cells $TOP_RIGHT_IN_CORNER_CELLS}
if {$BOTTOM_LEFT_IN_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -bottom_left_inside_corner_cells $BOTTOM_LEFT_IN_CORNER_CELLS}
if {$BOTTOM_RIGHT_IN_CORNER_CELLS != ""} {lappend insrt_bd_cell_cmd -bottom_right_inside_corner_cells $BOTTOM_RIGHT_IN_CORNER_CELLS}
if {$TOP_TAP_CELLS != ""} {lappend insrt_bd_cell_cmd -top_tap_cell $TOP_TAP_CELLS}
if {$BOTTOM_TAP_CELLS != ""} {lappend insrt_bd_cell_cmd -bottom_tap_cell $BOTTOM_TAP_CELLS}
if {$TAP_DISTANCE != ""} {lappend insrt_bd_cell_cmd -tap_distance $TAP_DISTANCE}
if {$MIN_ROW_WIDTH != ""} {lappend insrt_bd_cell_cmd -min_row_width $MIN_ROW_WIDTH}
if {$INSERT_BOUNDARY_CELL_RULES != ""} {lappend insrt_bd_cell_cmd -rules $INSERT_BOUNDARY_CELL_RULES}

## Check if any of the options were defined. 
# If not then the $insrt_bd_cell_cmd variable will not have been defined and insert_boundary_cell won't run.
if {[info exists insrt_bd_cell_cmd]} {
  set insrt_bd_cell_cmd "insert_boundary_cell $insrt_bd_cell_cmd"
  echo $insrt_bd_cell_cmd
  $insrt_bd_cell_cmd
}


source -echo common_optimization_settings_icc.tcl
source -echo common_placement_settings_icc.tcl






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



## If your libraries have implant mask setup for implant_width then uncomment the following:
#foreach mw_ref_lib $MW_REFERENCE_LIB_DIRS {
  ## Extract the FRAM properties for every cell in each MW reference libraryi
  #  extract_fram_property -lib $mw_ref_lib -cell * -implant_width true 
#}

########################################################################################
# Flip chip
########################################################################################
#source flip_chip.tcl

save_mw_cel -as $ICC_FLOORPLAN_CEL

########################################################################################
# Saving the cell + snapshot creation
########################################################################################
if {$ICC_REPORTING_EFFORT != "OFF" } {
 create_qor_snapshot -name $ICC_FLOORPLAN_CEL
 redirect -file $REPORTS_DIR_INIT_DESIGN/$ICC_FLOORPLAN_CEL.qor_snapshot.rpt {report_qor_snapshot -no_display}
}



if {$ICC_REPORTING_EFFORT != "OFF" } {
########################################################################################
# Additional reporting: zero interconnect timing report and design summaries 
########################################################################################
redirect -tee -file $REPORTS_DIR_INIT_DESIGN/$ICC_FLOORPLAN_CEL.sum {report_design_physical -all -verbose}

set_zero_interconnect_delay_mode true
redirect -tee -file $REPORTS_DIR_INIT_DESIGN/$ICC_FLOORPLAN_CEL.zic.qor {report_qor}
set_zero_interconnect_delay_mode false
if {$ICC_SANITY_CHECK} {
  check_physical_design -stage pre_place_opt -no_display -output $REPORTS_DIR_INIT_DESIGN/check_physical_design.pre_place_opt
}

########################################################################################
# Checks : Library + technology checks
########################################################################################
set_check_library_options -all
redirect -file $REPORTS_DIR_INIT_DESIGN/check_library.sum {check_library}
}
set TIME_TAKEN [expr [clock seconds] - $TIME_START]
set time [expr $TIME_TAKEN/60]
set time_seconds [expr $TIME_TAKEN%60]
set time_hours [expr $time/60]
set time_minutes [expr $time%60]
puts "Total time taken is $time_hours hr $time_minutes m $time_seconds s"
#exit

