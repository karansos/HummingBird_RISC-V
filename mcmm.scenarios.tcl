puts "RM-Info: Running script [info script]\n"

##########################################################################################
# Version: G-2012.06 (July 2, 2012)
# Copyright (C) 2007-2012 Synopsys, Inc. All rights reserved.
##########################################################################################

set OPCOND_1                  "ssg0p81v125c"      	;# name of operating condition
set OPCOND_1_LIB              "tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs";# name of library containing definition of the operating condition
set TLUPLUS_EMULATION_1_FILE  ""          	;# Max EMULATION TLUplus file
set TLUPLUS_1_FILE            "$TLUPLUS_MAX_FILE"
set STARRC_NXTGRD_1_FILE      ""	       	;# Max NXTGRD file			

set OPCOND_1_1                "ssg0p81vm40c"      	;# name of operating condition
set OPCOND_1_1_LIB            "tcbn28hpcplusbwp12t30p140ssg0p81vm40c_ccs";# name of library containing definition of the operating condition
set TLUPLUS_EMULATION_1_1_FILE	""          	;# Max EMULATION TLUplus file
set TLUPLUS_1_1_FILE          "$TLUPLUS_MAX_FILE"
set STARRC_NXTGRD_1_1_FILE    ""	       	;# Max NXTGRD file			

set OPCOND_2                  "ffg0p99vm40c"	;# name of operating condition
set OPCOND_2_LIB              "tcbn28hpcplusbwp12t30p140ffg0p99vm40c_ccs"     ;# name of library containing definition of the operating condition
set TLUPLUS_EMULATION_2_FILE  ""          	;# Min EMULATION TLUplus file
set TLUPLUS_2_FILE            "$TLUPLUS_MIN_FILE"
set STARRC_NXTGRD_2_FILE      ""	       	;# Min NXTGRD file

set OPCOND_3                  "ffg0p99v125c"	;# name of operating condition
set OPCOND_3_LIB              "tcbn28hpcplusbwp12t30p140ffg0p99v125c_ccs"     ;# name of library containing definition of the operating condition
set TLUPLUS_EMULATION_3_FILE  ""          	;# Min EMULATION TLUplus file
set TLUPLUS_3_FILE            "$TLUPLUS_MAX_FILE"
set STARRC_NXTGRD_3_FILE      ""	       	;# Min NXTGRD file







set SCENARIO_1                "func_ssg0p81v125c_wc"		;# name of scenario
set ICC_IN_SDC_1_FILE         "./$DESIGN_NAME.func.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_1_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_1_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_1_1                "func_ssg0p81vm40c_wc"		;# name of scenario
set ICC_IN_SDC_1_1_FILE         "./$DESIGN_NAME.func.sdc"       ;# implementation SDC file for the scenario  
set PT_SDC_1_1_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_1_1_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_2                "func_ffg0p99vm40c_bc"	;# name of scenario
set ICC_IN_SDC_2_FILE         "./$DESIGN_NAME.func.sdc"	;# implementation SDC file for the scenario
set PT_SDC_2_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_2_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.







set SCENARIO_3                "shift_ssg0p81v125c_wc"		;# name of scenario
set ICC_IN_SDC_3_FILE         "./$DESIGN_NAME.shift.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_3_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_3_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_3_1                "shift_ssg0p81vm40c_wc"			;# name of scenario
set ICC_IN_SDC_3_1_FILE         "./$DESIGN_NAME.shift.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_3_1_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_3_1_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_4                "shift_ffg0p99vm40c_bc"		;# name of scenario
set ICC_IN_SDC_4_FILE         "./$DESIGN_NAME.shift.sdc"	;# implementation SDC file for the scenario
set PT_SDC_4_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_4_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.





set SCENARIO_5                "sms_ssg0p81v125c_wc"		;# name of scenario
set ICC_IN_SDC_5_FILE         "./$DESIGN_NAME.sms.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_5_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_5_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_5_1                "sms_ssg0p81vm40c_wc"		;# name of scenario
set ICC_IN_SDC_5_1_FILE         "./$DESIGN_NAME.sms.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_5_1_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_5_1_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_6                "sms_ffg0p99vm40c_bc"			;# name of scenario
set ICC_IN_SDC_6_FILE         "./$DESIGN_NAME.sms.sdc"	;# implementation SDC file for the scenario
set PT_SDC_6_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_6_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.






set SCENARIO_7                "cap_ssg0p81v125c_wc"			;# name of scenario
set ICC_IN_SDC_7_FILE         "./$DESIGN_NAME.cap.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_7_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_7_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_7_1                "cap_ssg0p81vm40c_wc"			;# name of scenario
set ICC_IN_SDC_7_1_FILE         "./$DESIGN_NAME.cap.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_7_1_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_7_1_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_8                "cap_ffg0p99vm40c_bc"			;# name of scenario
set ICC_IN_SDC_8_FILE         "./$DESIGN_NAME.cap.sdc"	;# implementation SDC file for the scenario
set PT_SDC_8_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_8_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.






set SCENARIO_9                "atspeed_ssg0p81v125c_wc"			;# name of scenario
set ICC_IN_SDC_9_FILE         "./$DESIGN_NAME.atspeed.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_9_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_9_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_9_1                "atspeed_ssg0p81vm40c_wc"			;# name of scenario
set ICC_IN_SDC_9_1_FILE         "./$DESIGN_NAME.atspeed.sdc"       	;# implementation SDC file for the scenario  
set PT_SDC_9_1_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_9_1_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.


set SCENARIO_10                "atspeed_ffg0p99vm40c_bc"			;# name of scenario
set ICC_IN_SDC_10_FILE         "./$DESIGN_NAME.atspeed.sdc"	;# implementation SDC file for the scenario
set PT_SDC_10_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_10_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.






set SCENARIO_11                "func_ffg0p99v125c_power"			;# name of scenario
set ICC_IN_SDC_11_FILE         "./$DESIGN_NAME.func.sdc"	;# implementation SDC file for the scenario
set PT_SDC_11_FILE             ""		       	;# optional, signoff SDC to be used with with PT, if different from implementation SDC
set SCENARIO_11_IS_LEAKAGE_SCENARIO	"FALSE"		;# TRUE|FALSE, specify TRUE to enable this scenario for leakage optimization.
							;# For leakage optimization to work (performed by -power option of the core commands except clock_opt -only_cts), 
							;# you should enable at least one scenario as leakage scenario.
							;# However, for focal_opt, you should only enable a single scenario as leakage scenario.

#########################################################################################
## *** DESIGNERS: MAKE NO EDITS BELOW HERE UNLESS CHANGING SCENERIO NAMES/NUMBERS ABOVE
#########################################################################################

#########################################################################################
## *** PNR FOLKS : MAKE SURE SCENARIOS (LATE & EARLY DERATE_CLOCK) ARE SET UP PROPERLY 
##               WORST CASE SHOULD BE SET TO EARLY, BEST CASE SET TO LATE       
##
##               IF MORE THAN 4 SCENARIOS ARE USED, YOU MUST CREATE EQUIVILENT 
##                   if {$SCENARIO_* STATEMENTS FOR EACH SCENARIO
#########################################################################################


##########################################################################################
##############    USAGE OF ABOVE VARIABLES FOR 4 SCENARIOS     ########################
############## IF YOU HAVE MORE SCENARIOS, ADD THEM HERE BELOW  #######################
##########################################################################################

if {$SCENARIO_1 != "" && $ICC_IN_SDC_1_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_1"
    create_scenario $SCENARIO_1

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_1_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_LIB -max $OPCOND_1

    if {$TLUPLUS_EMULATION_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_1_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_1_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 


    set_scenario_options -leakage_power $SCENARIO_1_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true -cts_mode true -cts_corner max

    report_scenario_options
}





if {$SCENARIO_1_1 != "" && $ICC_IN_SDC_1_1_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_1_1"
    create_scenario $SCENARIO_1_1

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_1_1_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_1_LIB -max $OPCOND_1_1

    if {$TLUPLUS_EMULATION_1_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_1_FILE
    }

    if {[file exists [which $PT_SDC_1_1_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_1_1_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_1_1_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}





if {$SCENARIO_2 != "" && $ICC_IN_SDC_2_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_2"
    create_scenario $SCENARIO_2

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_2_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively.
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_2_LIB -max $OPCOND_2

    if {$TLUPLUS_EMULATION_2_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_2_FILE
    }

    if {[file exists [which $PT_SDC_2_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_2_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_2_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_2_FILE
    }

    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 

    set_timing_derate -net_delay -early 1
    set_timing_derate -net_delay -late  1.085

    set_scenario_options -leakage_power $SCENARIO_2_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}






if {$SCENARIO_3 != "" && $ICC_IN_SDC_3_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_3"
    create_scenario $SCENARIO_3

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_3_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_LIB -max $OPCOND_1

    if {$TLUPLUS_EMULATION_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_3_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_3_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_3_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true -cts_mode true -cts_corner max

    report_scenario_options
}




if {$SCENARIO_3_1 != "" && $ICC_IN_SDC_3_1_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_3_1"
    create_scenario $SCENARIO_3_1

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_3_1_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_1_LIB -max $OPCOND_1_1

    if {$TLUPLUS_EMULATION_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_3_1_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_3_1_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_1_FILE
    }


    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 


    set_scenario_options -leakage_power $SCENARIO_3_1_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}




if {$SCENARIO_4 != "" && $ICC_IN_SDC_4_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_4"
    create_scenario $SCENARIO_4

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_4_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively.
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_2_LIB -max $OPCOND_2

    if {$TLUPLUS_EMULATION_2_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_2_FILE
    }

    if {[file exists [which $PT_SDC_4_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_4_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_2_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_2_FILE
    }


    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 

    set_timing_derate -net_delay -early 1
    set_timing_derate -net_delay -late  1.085

    set_scenario_options -leakage_power $SCENARIO_4_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}




if {$SCENARIO_5 != "" && $ICC_IN_SDC_5_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_5"
    create_scenario $SCENARIO_5

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_5_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_LIB -max $OPCOND_1

    if {$TLUPLUS_EMULATION_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_5_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_5_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_5_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true -cts_mode true -cts_corner max

    report_scenario_options
}



if {$SCENARIO_5_1 != "" && $ICC_IN_SDC_5_1_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_5_1"
    create_scenario $SCENARIO_5_1

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_5_1_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_1_LIB -max $OPCOND_1_1

    if {$TLUPLUS_EMULATION_1_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_5_1_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_5_1_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_5_1_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}




if {$SCENARIO_6 != "" && $ICC_IN_SDC_6_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_6"
    create_scenario $SCENARIO_6

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_6_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively.
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_2_LIB -max $OPCOND_2

    if {$TLUPLUS_EMULATION_2_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_2_FILE
    }

    if {[file exists [which $PT_SDC_6_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_6_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_2_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_2_FILE
    }

    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 

    set_timing_derate -net_delay -early 1
    set_timing_derate -net_delay -late  1.085

    set_scenario_options -leakage_power $SCENARIO_6_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}



if {$SCENARIO_7 != "" && $ICC_IN_SDC_7_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_7"
    create_scenario $SCENARIO_7

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_7_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_LIB -max $OPCOND_1

    if {$TLUPLUS_EMULATION_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_7_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_7_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_7_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true -cts_mode true -cts_corner max

    report_scenario_options
}



if {$SCENARIO_7_1 != "" && $ICC_IN_SDC_7_1_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_7_1"
    create_scenario $SCENARIO_7_1

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_7_1_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_1_LIB -max $OPCOND_1_1

    if {$TLUPLUS_EMULATION_1_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_1_FILE
    }

    if {[file exists [which $PT_SDC_7_1_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_7_1_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_7_1_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}



if {$SCENARIO_8 != "" && $ICC_IN_SDC_8_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_8"
    create_scenario $SCENARIO_8

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_8_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively.
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_2_LIB -max $OPCOND_2

    if {$TLUPLUS_EMULATION_2_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_2_FILE
    }

    if {[file exists [which $PT_SDC_8_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_8_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_2_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_2_FILE
    }

    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 

    set_timing_derate -net_delay -early 1
    set_timing_derate -net_delay -late  1.085

    set_scenario_options -leakage_power $SCENARIO_8_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}





if {$SCENARIO_9 != "" && $ICC_IN_SDC_9_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_9"
    create_scenario $SCENARIO_9

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_9_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_LIB -max $OPCOND_1

    if {$TLUPLUS_EMULATION_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_FILE
    }

    if {[file exists [which $PT_SDC_9_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_9_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_FILE
    }

    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_9_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true -cts_mode true -cts_corner max


    report_scenario_options
}



if {$SCENARIO_9_1 != "" && $ICC_IN_SDC_9_1_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_9_1"
    create_scenario $SCENARIO_9_1

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_9_1_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively. 
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_1_1_LIB -max $OPCOND_1_1

    if {$TLUPLUS_EMULATION_1_1_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_1_1_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_1_1_FILE
    }

    if {[file exists [which $PT_SDC_9_1_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_9_1_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_1_1_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_1_1_FILE
    }


    set_timing_derate -cell_delay -clock -late 1.032 
    set_timing_derate -cell_delay -data -late  1.071 
    set_timing_derate -cell_delay -early 0.968

    set_timing_derate -net_delay  -early 0.94
    set_timing_derate -net_delay  -late 1.06 

    set_scenario_options -leakage_power $SCENARIO_9_1_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}



if {$SCENARIO_10 != "" && $ICC_IN_SDC_10_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_10"
    create_scenario $SCENARIO_10

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_10_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively.
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_2_LIB -max $OPCOND_2

    if {$TLUPLUS_EMULATION_2_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_2_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_2_FILE
    }

    if {[file exists [which $PT_SDC_10_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_10_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_2_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_2_FILE
    }

    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 

    set_timing_derate -net_delay -early 1
    set_timing_derate -net_delay -late  1.085

    set_scenario_options -leakage_power $SCENARIO_10_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup true -hold true

    report_scenario_options
}





if {$SCENARIO_11 != "" && $ICC_IN_SDC_11_FILE != ""} {
    echo "SCRIPT-Info : Setting up scenario $SCENARIO_11"
    create_scenario $SCENARIO_11

    set auto_link_disable true
    read_sdc $ICC_IN_SDC_11_FILE
    set auto_link_disable false

    # On chip variation is used as analysis type for the example.
    #  As -min_library and -min are not specified, the tool uses the max operating condition for -min.
    #  That means tool is modeling on chip variation using the max operating condition and the early and late derating factors for
    #  min and max path delay analysis, respectively.
    set_operating_conditions \
          -analysis_type on_chip_variation -max_library $OPCOND_3_LIB -max $OPCOND_3

    if {$TLUPLUS_EMULATION_3_FILE == ""} {
       set_tlu_plus_files -max_tluplus $TLUPLUS_3_FILE -tech2itf_map $MAP_FILE
    } else {
       set_tlu_plus_files -max_tluplus $TLUPLUS_3_FILE -tech2itf_map $MAP_FILE \
             -max_emulation_tluplus $TLUPLUS_EMULATION_3_FILE
    }

    if {[file exists [which $PT_SDC_11_FILE]]} {
    set_primetime_options -sdc_file $PT_SDC_11_FILE
    }
    if {[file exists [which $STARRC_NXTGRD_3_FILE]]} {
    set_starrcxt_options -max_nxtgrd_file $STARRC_NXTGRD_3_FILE
    }

    set_timing_derate -cell_delay -clock -early 0.928
    set_timing_derate -cell_delay -data -early 0.879
    set_timing_derate -cell_delay -late 1.072 

    set_timing_derate -net_delay -early 1
    set_timing_derate -net_delay -late  1.085

    set_scenario_options -leakage_power $SCENARIO_11_IS_LEAKAGE_SCENARIO
    set_scenario_options -setup false -hold false

    report_scenario_options
}



puts "RM-Info: Completed script [info script]\n"
