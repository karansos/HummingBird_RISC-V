#################################################################################
# Verification Compiler Low Power Static Signoff Script for
# IC Compiler Reference Methodology 
# Script: ##vc_lp.tcl
# Version: L-2016.03 (April 4, 2016)
# Copyright (C) 2011-2015 Synopsys, Inc. All rights reserved.
#################################################################################


## Enable the default behavior of sh_continue_on_error to be same as DC
set_app_var sh_continue_on_error true
## Variable settings to improve QoR of VC LP and better match the results of check_mv_design (L-2016.03)
set_app_var handle_hanging_crossover true
set_app_var enable_local_policy_match true
set_app_var upf_iso_filter_elements_with_applies_to ENABLE
set_app_var enable_multi_driver_analysis true
set_app_var enable_verdi_debug true

source -echo -verbose ./rm_setup/icc_setup.tcl

read_file -netlist -top $DESIGN_NAME $SOURCE_DIR/$DESIGN_NAME.output.pg.dc.v 

read_upf $RESULTS_DIR/$DESIGN_NAME.output.upf

check_lp -stage upf
check_lp -stage design
check_lp -stage pg

report_lp -file ${REPORTS_DIR}/${DESIGN_NAME}.vclp_report_violations.PGNETLIST.rpt
report_lp -verbose -file ${REPORTS_DIR}/${DESIGN_NAME}.vclp_report_violations.PGNETLIST.verbose.rpt

puts "RM-Info: End script [info script]\n"
exit
