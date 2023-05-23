#exec cp /moon/sun_light-1/users/karuna.doomra/PPI/RTLDROP.3.19082016/exp.ver9/rm_pr/work/activity_file .   
setenv DISPLAY vnc1:13
     
source rm_setup/icc_setup.tcl

set_app_var target_library  "$TARGET_LIBRARY_FILES $TARGET_PR_LIBRARY_FILES"

set_app_var link_library { * tcbn28hpcplusbwp12t30p140hvtffg0p99v125c_ccs.db tcbn28hpcplusbwp12t30p140lvtffg0p99v125c_ccs.db tcbn28hpcplusbwp12t30p140ffg0p99v125c_ccs.db RxPmdPma_lib.db TxPmdPma_lib.db sad2lsph4s1p1024x144m4b1w0c1p1d0r1s10_arp_ffgbc0p99v125c.db   sad2lsph4s1p2048x144m4b4w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sad2lsph4s1p4096x39m8b2w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sad2lsph4s1p8192x39m8b8w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p1024x144m2b2w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p1024x18m4b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_arp_ffgbc0p99v125c.db   sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p1024x56m4b1w0c0p1d0r1s10_arp_ffgbc0p99v125c.db   sadglsph4s1p128x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p128x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p128x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p128x56m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p16x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p2048x39m4b2w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p256x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p256x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p256x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p256x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p32x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p32x144m2b1w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p32x18m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p32x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p512x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p512x144m2b2w0c1p1d0r1s10_arp_ffgbc0p99v125c.db   sadglsph4s1p512x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p512x39m4b1w0c1p1d0r1s10_arp_ffgbc0p99v125c.db   sadglsph4s1p512x50m4b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p512x56m2b2w0c0p1d0r1s10_arp_ffgbc0p99v125c.db   sadglsph4s1p512x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db   sadglsph4s1p64x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s1p64x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db   sadglsph4s2p128x80m1b4w0c0p1d0r1s10_ethrx_ffgbc0p99v125c.db   sadglsph4s2p16x26m2b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db   sadglsph4s2p32x148m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99v125c.db   sadglsph4s2p32x152m1b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db   sadglsph4s2p32x164m1b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db   sadglsph4s2p32x180m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99v125c.db   sadulsph4s2p1024x144m4b4w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db   sadulsph4s2p11264x18m16b4w0c1p1d0r1s10_re_ffgbc0p99v125c.db   sadulsph4s2p16384x18m16b8w0c1p1d0r1s10_re_ffgbc0p99v125c.db   sadulsph4s2p2048x20m8b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db   sadulsph4s2p2048x22m8b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db   sadulsph4s2p4096x76m8b4w0c1p1d0r1s10_sw_ffgbc0p99v125c.db   sadulsph4s2p64x151m4b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db   sadulsph4s2p768x144m4b2w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db   sadulsph4s2p8192x20m16b2w0c1p1d0r1s10_sw_ffgbc0p99v125c.db   sadulsph4s2p8192x26m16b2w0c1p1d0r1s10_sw_ffgbc0p99v125c.db   sasrlsph4s1p64x72m2b1w0c1p1d0r1s10_txrx_fast_ffgbc0p99v125c.db   sasslsph4s1p16384x31m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db   sasslsph4s1p16384x39m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db   sasslsph4s1p16384x72m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db   sasslsph4s1p4096x144m8b2w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db   sasslsph4s1p8192x144m8b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db}

open_mw_lib ${DESIGN_NAME}_LIB
open_mw_cel $DESIGN_NAME
remove_attribute [current_design] local_link_library

set_active_scenarios func_ffg0p99v125c_power

link -force

save_mw_cel

source -echo $CUSTOM_CONNECT_PG_NETS_SCRIPT

if {$PRIMERAIL_DIR == ""} {
  set PRIMERAIL_DIR [file dirname [sh which pr_shell]]
}

if {[which $PRIMERAIL_DIR/pr_shell] == "" } {
  echo "RM-Error: Unable to find pr_shell at \"$PRIMERAIL_DIR\". Exiting...."
  exit
}

#set_rail_options
####################################################################
set_rail_options -default 
set_rail_options -use_pins_as_pads  $PRIMERAIL_USE_PINS_AS_PADS 

if {[file exists [which $PRIMERAIL_PAD_INSTANCE_FILE]]} {
set_rail_options -pad_instance_file $PRIMERAIL_PAD_INSTANCE_FILE 
   } elseif {[file exists [which $PRIMERAIL_PAD_MASTER_FILE]]} {
set_rail_options -pad_master_file $PRIMERAIL_PAD_MASTER_FILE
}

set_rail_options \
    -pr_exec_dir $PRIMERAIL_DIR \
    -output_dir  $PRIMERAIL_WORK_DIR 

if {[file exists [which $PRIMERAIL_SDC_FILE]]} {
   set_rail_options -sdc $PRIMERAIL_SDC_FILE 
}
if {[file exists [which $PRIMERAIL_SPEF_FILE]]} {
   set_rail_options -spef $PRIMERAIL_SPEF_FILE 
}

# Set the analysis mode for analyze_rail
set_rail_options -analysis_mode $PRIMERAIL_ANALYSIS_MODE

if {$PRIMERAIL_ANALYSIS_MODE == "dynamic"} {
   if {[lindex $PRIMERAIL_SWITCHING_ACTIVITY_FILE 0] == "vcd" && [file exists [which [lindex $PRIMERAIL_SWITCHING_ACTIVITY_FILE 1]]]} {
      set_rail_options -switching_activity $PRIMERAIL_SWITCHING_ACTIVITY_FILE 
   } else {
      echo "RM-Info: Error: A VCD file is required for dynamic analysis mode"
   }
} else {
   if {[file exists [which [lindex $PRIMERAIL_SWITCHING_ACTIVITY_FILE 1]]]} {
      set_rail_options -switching_activity $PRIMERAIL_SWITCHING_ACTIVITY_FILE 
   }
}

if {[file exists [which $PRIMERAIL_PACKAGING_FILE]]} {
   set_rail_options -packaging_file $PRIMERAIL_PACKAGING_FILE
}
if {[file exists [which $PRIMERAIL_CONFIG_FILE]]} {
   set_rail_options -config_file $PRIMERAIL_CONFIG_FILE
}

if {$PRIMERAIL_HOST_MACHINE != ""} {
   set_rail_options -host $PRIMERAIL_HOST_MACHINE
}
if {$PRIMERAIL_VD_THRESHOLD != ""} {
   set_rail_options -vd_threshold $PRIMERAIL_VD_THRESHOLD
}

if {$PRIMERAIL_SIGNAL_PARASITICS_FORMAT == "SPEF"} {
   set_rail_options -signal_parasitics_output_format $PRIMERAIL_SIGNAL_PARASITICS_FORMAT
}

if {$PRIMERAIL_POWER_SCALE_VALUE != ""} {
  set_rail_options -power_scale_value $PRIMERAIL_POWER_SCALE_VALUE
  } elseif {$PRIMERAIL_POWER_SCALE_FACTOR != ""} {
  set_rail_options -power_scale_factor $PRIMERAIL_POWER_SCALE_FACTOR
}

if {$PRIMERAIL_ANALYSIS_MODE != "static"} {
  if {$PRIMERAIL_ANALYSIS_START_TIME != ""} {
     set_rail_options -start_time $PRIMERAIL_ANALYSIS_START_TIME
  }

  if {$PRIMERAIL_ANAYSIS_END_TIME != ""} {
     set_rail_options -end_time $PRIMERAIL_ANALYSIS_END_TIME
  }
}

if {$PRIMERAIL_WRITE_RAIL_DATA != ""} {
  set_rail_options -write_rail_data $PRIMERAIL_WRITE_RAIL_DATA
}

if {$PRIMERAIL_VIA_ARRAY_PARTITION_SIZE != ""} {
  set_rail_options -via_array_partition_size $PRIMERAIL_VIA_ARRAY_PARTITION_SIZE 
} 

set rail_reuse ""

if {$PRIMERAIL_REUSE_POWER == "TRUE"} {
  lappend rail_reuse power 
}

if {$PRIMERAIL_REUSE_PG_EXTRACTION == "TRUE"} {
  lappend rail_reuse pg_extraction
}

if {$PRIMERAIL_REUSE_SETUP_VARIABLES == "TRUE"} {
  lappend rail_reuse setup_variables
}

if {$PRIMERAIL_REUSE_SETUP_FILES == "TRUE"} {
  lappend rail_reuse setup_files
}

if {$PRIMERAIL_REUSE_SIGNAL_EXTRACTION == "TRUE"} {
  lappend rail_reuse signal_extraction
}

if {$rail_reuse != ""} {
  set_rail_options -reuse $rail_reuse
}

if {$PRIMERAIL_ASSIGN_POWER == "TRUE" && $PRIMERAIL_REUSE_POWER != "TRUE"} {
  set_rail_options -assign_power_only TRUE
}

set_rail_options -em_rule  {ALF  ../../lib/alf/tsmcn28_9lm6X2ZUTRDL.alf ""}

redirect -tee -file $REPORTS_DIR_IN_DESIGN_RAIL/prime_rail_options.rpt {report_rail_options}

#############################################################
## START In-Design Analysis  			   ##
#############################################################
echo "RM-Info: starting the ICC-PrimeRail analysis flow ... "

if {[file exists [which $PRIMERAIL_ANALYSIS_CUSTOM_SCRIPT  ]]} {
        analyze_rail -primerail_script_file $PRIMERAIL_ANALYSIS_CUSTOM_SCRIPT
} else {
    if {$PRIMERAIL_ANALYSIS_EM == "TRUE" || $PRIMERAIL_ANALYSIS_INTEGRITY == "TRUE" || $PRIMERAIL_ANALYSIS_RAIL == "TRUE" || $PRIMERAIL_SCRIPT_ONLY == "TRUE"} {
       set rail_cmd  "analyze_rail "
       set rail_nets $PRIMERAIL_ANALYSIS_NETS
  if {$PRIMERAIL_ANALYSIS_EM eq "TRUE" }	 {
       lappend rail_cmd -electromigration  }
        if {$PRIMERAIL_ANALYSIS_RAIL eq "TRUE" }   {
             lappend rail_cmd -voltage_drop  }
        if {$PRIMERAIL_ANALYSIS_INTEGRITY eq "TRUE" }   {
             lappend rail_cmd -integrity  }
        if {$PRIMERAIL_SCRIPT_ONLY eq "TRUE" }   {
             lappend rail_cmd -script_only } 
             echo "RM-Info: Executing  ${rail_cmd} \{${rail_nets}\}"
eval ${rail_cmd} {${rail_nets}}

    } else {
       echo "RM-Info: Error! Please configure to use custom script or one of EM|IR drop|Integrity check"
analyze_rail -what ?
    }
  }

recompute_fit_bbox

close_mw_cel
close_mw_lib

exit




