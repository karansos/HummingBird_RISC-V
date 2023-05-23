

### pt_setup.tcl file              ###




puts "RM-Info: Running script [info script]\n"
### Start of PrimeTime Runtime Variables ###

##########################################################################################
# PrimeTime Variables PrimeTime Reference Methodology script
# Script: pt_setup.tcl
# Version: K-2015.12-SP2 (April 4, 2016)
# Copyright (C) 2008-2016 Synopsys All rights reserved.
##########################################################################################

set sdir "."
######################################
# Report and Results Directories
######################################


set REPORTS_DIR "reports"
set RESULTS_DIR "results"


######################################
# Library and Design Setup
######################################

### Mode : DMSA
source -echo $sh_launch_dir/$sdir/rm_setup/ei_setup.tcl
source -echo $sh_launch_dir/$sdir/rm_setup/mcmm_setup.tcl



######################################
# End
######################################

### End of PrimeTime Runtime Variables ###
puts "RM-Info: Completed script [info script]\n"
