
### mcmm_setup.tcl file              ###




puts "RM-Info: Running script [info script]\n"
### Start of PrimeTime Runtime Variables ###

##########################################################################################
# PrimeTime Variables PrimeTime Reference Methodology script
# Script: pt_setup.tcl
# Version: K-2015.12-SP2 (April 4, 2016)
# Copyright (C) 2008-2016 Synopsys All rights reserved.
##########################################################################################





######################################
# DMSA File Section
######################################

set sh_source_uses_search_path true

# Provide a list of DMSA Corners : best_case, nom, worst_case
#
# The syntax is:
#		1.  set dmsa_corners "corner1 corner2 ..."
set dmsa_corners      "$EI_PT_RUN_SCENARIOS"

# Provide an array of DMSA Corners Based Libraries : best_case, nom, worst_case
#
# The syntax is dmsa_corner_library_files(corner)
#		1. dmsa_corner_library_files(corner1)
#		2. dmsa_corner_library_files(corner2)

foreach cn $dmsa_corners { 
if {[regexp 0p81v125c $cn] } {
	set dmsa_corner_library_files($cn) "$EI_PT_LIB_ssg0p81v125c" 
} elseif {[regexp 0p81vm40c $cn]} {
	set dmsa_corner_library_files($cn) "$EI_PT_LIB_ssg0p81vm40c"
} elseif {[regexp 0p99vm40c $cn]} {
	set dmsa_corner_library_files($cn) "$EI_PT_LIB_ffg0p99vm40c" 
} else {
	if {[regexp 0p99v125c $cn]} {
	set dmsa_corner_library_files($cn) "$EI_PT_LIB_ffg0p99v125c" 
	}
}
}

foreach cn $dmsa_corners { 
if {[regexp worstT $cn] } {
	set dmsa_corner_aocvm_file($cn) "$EI_PT_OCV_FILE1" 
} elseif {[regexp ^ss(.*)_bc $cn] } {
	set dmsa_corner_aocvm_file($cn) "$EI_PT_OCV_FILE2" 
} elseif {[regexp ^ff(.*)_(.*)worst_bc $cn] } {
	set dmsa_corner_aocvm_file($cn) "$EI_PT_OCV_FILE3" 
} else {
	if {[regexp ^ff(.*)_(.*)best_bc $cn] } {
	set dmsa_corner_aocvm_file($cn) "$EI_PT_OCV_FILE4" 
	}
}
}

############## setup corners at RC_T 
#set dmsa_corner_library_files(ssg0p81v125c_cworstT_wc) "$EI_PT_LIB_ssg0p81v125c"
#set dmsa_corner_library_files(ssg0p81v125c_rcworstT_wc) "$EI_PT_LIB_ssg0p81v125c"
#set dmsa_corner_library_files(ssg0p81vm40c_cworstT_wc) "$EI_PT_LIB_ssg0p81vm40c"
#set dmsa_corner_library_files(ssg0p81vm40c_rcworstT_wc) "$EI_PT_LIB_ssg0p81vm40c"

############## hold corners at worst RC
#set dmsa_corner_library_files(ssg0p81v125c_cworst_bc) "$EI_PT_LIB_ssg0p81v125c"
#set dmsa_corner_library_files(ssg0p81v125c_rcworst_bc) "$EI_PT_LIB_ssg0p81v125c"
#set dmsa_corner_library_files(ssg0p81vm40c_cworst_bc) "$EI_PT_LIB_ssg0p81vm40c"
#set dmsa_corner_library_files(ssg0p81vm40c_rcworst_bc) "$EI_PT_LIB_ssg0p81vm40c"
#set dmsa_corner_library_files(ffg0p99v125c_cworst_bc) "$EI_PT_LIB_ffg0p99v125c"
#set dmsa_corner_library_files(ffg0p99v125c_rcworst_bc) "$EI_PT_LIB_ffg0p99v125c"
#set dmsa_corner_library_files(ffg0p99vm40c_cworst_bc) "$EI_PT_LIB_ffg0p99vm40c"
#set dmsa_corner_library_files(ffg0p99vm40c_rcworst_bc) "$EI_PT_LIB_ffg0p99vm40c"

############# hold corners at main or best RC
#set dmsa_corner_library_files(ffg0p99v125c_cbest_bc) "$EI_PT_LIB_ffg0p99v125c"
#set dmsa_corner_library_files(ffg0p99v125c_rcbest_bc) "$EI_PT_LIB_ffg0p99v125c"
#set dmsa_corner_library_files(ffg0p99vm40c_cbest_bc) "$EI_PT_LIB_ffg0p99vm40c"
#set dmsa_corner_library_files(ffg0p99vm40c_rcbest_bc) "$EI_PT_LIB_ffg0p99vm40c"




#set dmsa_corner_aocvm_file(corner1)            ""
#set dmsa_corner_aocvm_file(corner2)            ""


############## setup corners at RC_T 
#set dmsa_corner_aocvm_file(ssg0p81v125c_cworstT_wc) "$EI_PT_OCV_FILE1"
#set dmsa_corner_aocvm_file(ssg0p81v125c_rcworstT_wc) "$EI_PT_OCV_FILE1"
#set dmsa_corner_aocvm_file(ssg0p81vm40c_cworstT_wc) "$EI_PT_OCV_FILE1"
#set dmsa_corner_aocvm_file(ssg0p81vm40c_rcworstT_wc) "$EI_PT_OCV_FILE1"

############## hold corners at worst RC
#set dmsa_corner_aocvm_file(ssg0p81v125c_cworst_bc) "$EI_PT_OCV_FILE2"
#set dmsa_corner_aocvm_file(ssg0p81v125c_rcworst_bc) "$EI_PT_OCV_FILE2"
#set dmsa_corner_aocvm_file(ssg0p81vm40c_cworst_bc) "$EI_PT_OCV_FILE2"
#set dmsa_corner_aocvm_file(ssg0p81vm40c_rcworst_bc) "$EI_PT_OCV_FILE2"
#set dmsa_corner_aocvm_file(ffg0p99v125c_cworst_bc) "$EI_PT_OCV_FILE3"
#set dmsa_corner_aocvm_file(ffg0p99v125c_rcworst_bc) "$EI_PT_OCV_FILE3"
#set dmsa_corner_aocvm_file(ffg0p99vm40c_cworst_bc) "$EI_PT_OCV_FILE3"
#set dmsa_corner_aocvm_file(ffg0p99vm40c_rcworst_bc) "$EI_PT_OCV_FILE3"

############# hold corners at main or best RC
#set dmsa_corner_aocvm_file(ffg0p99v125c_cbest_bc) "$EI_PT_OCV_FILE4"
#set dmsa_corner_aocvm_file(ffg0p99v125c_rcbest_bc) "$EI_PT_OCV_FILE4"
#set dmsa_corner_aocvm_file(ffg0p99vm40c_cbest_bc) "$EI_PT_OCV_FILE4"
#set dmsa_corner_aocvm_file(ffg0p99vm40c_rcbest_bc) "$EI_PT_OCV_FILE4"



### DMSA AOCVM : Enabled ###

# Provide an array of DMSA Corner Based AOCVM File : best_case, nom, worst_case
#
# The syntax is: dmsa_corner_aocvm_file(corner) "top.aocvm" or dmsa_corner_aocvm_file(corner) "top1.aocvm top2.aocvm"
#		1. dmsa_corner_aocvm_file(corner1)
#		2. dmsa_corner_aocvm_file(corner2)



# Provide a list of DMSA modes   : functional, test
#
# The syntax is:
#               1.  set dmsa_modes "mode1 mode2 ..."

set dmsa_modes      "$EI_PT_MODES"

# Provide an array of constraint files
# The syntax will be dmsa_mode_constraint_files(mode)
#		1. dmsa_mode_constraint_files(mode1)
#		2. dmsa_mode_constraint_files(mode2)
#
foreach md $dmsa_modes {
set dmsa_mode_constraint_files($md) "${DESIGN_NAME}.${md}.tcl"
}


#################################################################################
# Provide location of PT2TMAX_SCRIPT_FILE (normally in the TetraMAX release area)
#################################################################################

set PT2TMAX_SCRIPT_FILE   ""


#
# Corner-Based Back Annotation Section
#
# The syntax is:
#		1. PARASITIC_FILES(corner1)
#		2. PARASITIC_PATHS(corner1)
#

# The recommended order is to put the block spefs first then the top so that block spefs are read 1st then top
# For example 
# PARASITIC_FILES(slow) "blk1.gpd blk2.gpd ... top.gpd"
# PARASITIC_PATHS(slow) "u_blk1 u_blk2 ... top"
# If you are loading the node coordinates by setting read_parasitics_load_locations true, it is more efficient
# to read the top first so that block coordinates can be transformed as they are read in
# Each PARASITIC_PATH entry corresponds to the related PARASITIC_FILE for the specific block"   
# For toplevel PARASITIC file please use the toplevel design name in PARASITIC_PATHS variable."   
#set PARASITIC_FILES(ss)	 "cworst_T.TLUP_125.rp_pp_egress_top.output.spef" 
#set PARASITIC_PATHS(corner1)	 "./rc/" 
foreach cn $dmsa_corners { 
if {[regexp 125c_cworstT_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.cworstT_125c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp 125c_rcworstT_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.rcworstT_125c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp m40c_cworstT_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.cworstT_m40c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp m40c_rcworstT_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.rcworstT_m40c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp 125c_cworst_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.cworst_125c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp 125c_rcworst_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.rcworst_125c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp m40c_cworst_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.cworst_m40c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp m40c_rcworst_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.rcworst_m40c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp 125c_cbest_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.cbest_125c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp 125c_rcbest_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.rcbest_125c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
}  elseif {[regexp m40c_cbest_ $cn] } {
	set PARASITIC_FILES($cn) "${DESIGN_NAME}.cbest_m40c.spef.gz"
        set PARASITIC_PATHS($cn) "$DESIGN_NAME"
	set_app_var eco_instance_name_prefix eco_cell_221116_
	set_app_var eco_net_name_prefix eco_net_221116_
} else {
        if {[regexp m40c_rcbest_ $cn] } {
		set PARASITIC_FILES($cn) "${DESIGN_NAME}.rcbest_m40c.spef.gz"
        	set PARASITIC_PATHS($cn) "$DESIGN_NAME"
		set_app_var eco_instance_name_prefix eco_cell_221116_
		set_app_var eco_net_name_prefix eco_net_221116_
		}
	}
}

# switching activity (VCD/SAIF) file 
set ACTIVITY_FILE ""

# strip_path setting for the activity file
set STRIP_PATH ""

## name map file
set NAME_MAP_FILE ""


#
# Provide Mode/Corner Specific Derates
#
# The syntax is
#		1. set dmsa_derate_clock_early_value(mode_corner) "_1.09"
#		2. set dmsa_derate_clock_late_value(mode_corner) "_1.09"
#		3. set dmsa_derate_data_early_value(mode_corner) "_1.09"
#		4. set dmsa_derate_data_late_value(mode_corner) "_1.09"
#set dmsa_derate_clock_early_value(mode_corner) "_1.09"
#set dmsa_derate_clock_late_value(mode_corner) "_1.09"
#set dmsa_derate_data_early_value(mode_corner) "_1.09"
#set dmsa_derate_data_late_value(mode_corner) "_1.09"

######################################
# Setting Number of Hosts and Licenses
######################################
# Set the number of hosts and licenses for compute resource efficient ECO
# Make sure you have sufficient RAM and free disk space in multi_scenario_working_directory
# otherwise it may result in unexpected slowdowns and crashes without proper stack traces
set num_of_scenarios [expr [llength $dmsa_corners] * [llength $dmsa_modes]]
if {$num_of_scenarios < 4} {
	set dmsa_num_of_hosts $num_of_scenarios
} elseif {$num_of_scenarios >= 4 && $num_of_scenarios <= 8} {
	set dmsa_num_of_hosts 4
} else {
	if {[expr ceil([expr $num_of_scenarios/4.0])] > 8} {
		set dmsa_num_of_hosts 16 
	} else {
		set dmsa_num_of_hosts 16
	}
}
set dmsa_num_of_licenses $dmsa_num_of_hosts





######################################
# Fix ECO DRC Setup
######################################
# specify a list of allowable buffers to use for fixing DRC
# Example: set eco_drc_buf_list "BUF4 BUF8 BUF12"
set eco_drc_buf_list "$EI_PT_DRC_BUF_LIST"

######################################
# Fix ECO Timing Setup
######################################
# Specify a list of allowable buffers to use for fixing hold
# Example: set eco_hold_buf_list "DELBUF1 DELBUF2 DELBUF4"
set eco_hold_buf_list "$EI_PT_HOLD_BUF_LIST"

######################################
# Fix ECO Leakage Setup
######################################
# Specify a list of name patterns for leakage eco in order of most preferred to least preferred
# Example: set leakage_pattern_priority_list "HVT NVT LVT"
set leakage_pattern_priority_list ""




######################################
# End
######################################

### End of PrimeTime Runtime Variables ###
puts "RM-Info: Completed script [info script]\n"
