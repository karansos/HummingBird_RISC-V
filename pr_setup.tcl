
### pr_setup.tcl file              ###
 
# sourcing the common variables
source -echo rm_setup/icc_setup.tcl

###############################
## General PrimeRail variables
###############################

set MAX_CORE_NUMBER "4"			;# 4|8

set FLOW "static"                ;# static|dynamic_vcd|dynamic_vfra

set SWITCHING_ACTIVITY_TYPE "user_defined"	        ;##  default|vcd|saif|user_defined

set DEFAULT_TOGGLE_RATE	""			;# toggle rate

set BACK_ANNOTATION_MODE "spef"               	;# spef|sbpf

set PARASITIC_FILE "$PRIMERAIL_SPEF_FILE"			;# signal parasitic file

set TAP_FILE		""			;# Optional, tap file,

set RC_TEMPERATURE	""			;# Optional

set SDC_FILE		"$PRIMERAIL_SDC_FILE"	;# sdc file 

set VCD_FILE		""			;# optional for static and dynamic_vfra, required input for dynamic_vcd, vcd file 
 
set VCD_STRIP_PATH	""			;# mandatory if VCD_FILE is present, vcd file strip path

set SAIF_FILE		""			;# optional for static and dynamic_vfra, saif file 

set SAIF_STRIP_PATH	""			;# mandatory if SAIF_FILE is present, saif file strip path 

set USER_ACTIVITY_FILE		"./activity_file"	;# optional for static and dynamic_vfra, user defined switching activity file 

set RAIL_POWER_FILE	""			;# Optional, rail power file 

set POWER_SCALING	"off"			;#  off|scale_factor|target_power 

set POWER_SCALE_VALUE	""			;# scale_factor|target_power, required when POWER_SCALING is either scale_facror or target_power

set EM_RULE_TYPE		"ITF"			;# MW|TF|ITF|TLUP

set EM_RULE_ALF_FILE		"$EM_DIR/tsmcn28_9lm6X2ZUTRDL.alf"	;# Optional EM rule file

set EM_RULE_TLUP_FILE	""			;# Optional EM rule file

set EM_RULE_MAP_FILE	""			;# Optional EM rule map file

set EM_SCALE_FACTOR	""			;# Optional 

set EM_TEMPERATURE 	""			;# Optional

set MW_DESIGN_LIBRARY		"${DESIGN_NAME}_LIB"			;# milkyway design library name

set PG_NETS			{VDD VSS}			;# list all the power and ground nets to be analyzed 


puts "RM-Info: Running script [info script]\n"
### Start of PrimeRail Runtime Variables ###

##########################################################################################
#########################     USAGE OF ABOVE VARIABLES      ##############################
#########################   DO NOT CHANGE BELOW THIS LINE   ##############################
##########################################################################################

set REPORTS_DIR                 "reports"               ;# Directory to write reports.
set RESULTS_DIR                 "results"               ;# Directory to write output data files

## Logical libraries
#set_app_var search_path		". ./scripts  $ADDITIONAL_SEARCH_PATH $search_path"
#set_app_var link_library	"* $TARGET_LIBRARY_FILES $ADDITIONAL_LINK_LIB_FILES"

set search_path { ../../lib/synopsys/}

set link_path { * tcbn28hpcplusbwp12t30p140ffg0p88v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140ffg0p99v0p88v125c_ccs.db  tcbn28hpcplusbwp12t30p140ffg0p99v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140ffg0p99v125c_ccs.db   tcbn28hpcplusbwp12t30p140ffg0p99v1p05v125c_ccs.db  tcbn28hpcplusbwp12t30p140ffg1p05v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140hvtffg0p88v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140hvtffg0p99v0p88v125c_ccs.db  tcbn28hpcplusbwp12t30p140hvtffg0p99v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140hvtffg0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140hvtffg0p99v1p05v125c_ccs.db  tcbn28hpcplusbwp12t30p140hvtffg1p05v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140lvtffg0p88v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140lvtffg0p99v0p88v125c_ccs.db  tcbn28hpcplusbwp12t30p140lvtffg0p99v0p99v125c_ccs.db  tcbn28hpcplusbwp12t30p140lvtffg0p99v125c_ccs.db   tcbn28hpcplusbwp12t30p140lvtffg0p99v1p05v125c_ccs.db  tcbn28hpcplusbwp12t30p140lvtffg1p05v0p99v125c_ccs.db  tef28hpcp128x32hd18_phrm_120a_ffg0p99v1p98v125c.db  tef28hpcp16x32hd18_phrm_130a_ffg0p99v1p98v125c.db   tef28hpcp256x32hd18_phrm_120a_ffg0p99v1p98v125c.db   tef28hpcp32x32hd18_phrm_120a_ffg0p99v1p98v125c.db  tef28hpcp64x32hd18_phrm_120a_ffg0p99v1p98v125c.db  tef28hpcpesd_p_120a_ffg0p99v1p98v125c.db   tphn28hpcpgv18ffg0p99v1p98v125c.db dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99v125c_cbest.db  dwc_xaui6g_x1_ns_9m6x2z_ffg0p99v125c_cbest.db  sad2lsph4s1p1024x144m4b1w0c1p1d0r1s10_arp_ffgbc0p99v125c.db  sad2lsph4s1p2048x144m4b4w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sad2lsph4s1p4096x39m8b2w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sad2lsph4s1p8192x39m8b8w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p1024x144m2b2w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p1024x18m4b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_arp_ffgbc0p99v125c.db  sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p1024x56m4b1w0c0p1d0r1s10_arp_ffgbc0p99v125c.db  sadglsph4s1p128x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p128x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p128x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p128x56m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p16x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p2048x39m4b2w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p256x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p256x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p256x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p256x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p32x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p32x144m2b1w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p32x18m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p32x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p512x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p512x144m2b2w0c1p1d0r1s10_arp_ffgbc0p99v125c.db  sadglsph4s1p512x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p512x39m4b1w0c1p1d0r1s10_arp_ffgbc0p99v125c.db  sadglsph4s1p512x50m4b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p512x56m2b2w0c0p1d0r1s10_arp_ffgbc0p99v125c.db  sadglsph4s1p512x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db  sadglsph4s1p64x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s1p64x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db  sadglsph4s2p128x80m1b4w0c0p1d0r1s10_ethrx_ffgbc0p99v125c.db  sadglsph4s2p16x26m2b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db  sadglsph4s2p32x148m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99v125c.db  sadglsph4s2p32x152m1b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db  sadglsph4s2p32x164m1b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db  sadglsph4s2p32x180m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99v125c.db  sadulsph4s2p1024x144m4b4w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db  sadulsph4s2p11264x18m16b4w0c1p1d0r1s10_re_ffgbc0p99v125c.db  sadulsph4s2p16384x18m16b8w0c1p1d0r1s10_re_ffgbc0p99v125c.db  sadulsph4s2p2048x20m8b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db  sadulsph4s2p2048x22m8b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db  sadulsph4s2p4096x76m8b4w0c1p1d0r1s10_sw_ffgbc0p99v125c.db  sadulsph4s2p64x151m4b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db  sadulsph4s2p768x144m4b2w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db  sadulsph4s2p8192x20m16b2w0c1p1d0r1s10_sw_ffgbc0p99v125c.db  sadulsph4s2p8192x26m16b2w0c1p1d0r1s10_sw_ffgbc0p99v125c.db  sasrlsph4s1p64x72m2b1w0c1p1d0r1s10_txrx_fast_ffgbc0p99v125c.db  sasslsph4s1p16384x31m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db  sasslsph4s1p16384x39m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db  sasslsph4s1p16384x72m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db   sasslsph4s1p4096x144m8b2w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db  sasslsph4s1p8192x144m8b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db}

if { ! [file exists $RESULTS_DIR] } {
  file mkdir $RESULTS_DIR
}
if { ! [file exists $REPORTS_DIR] } {
  file mkdir $REPORTS_DIR
}

## Min Max Library Relationships
if {$MIN_LIBRARY_FILES != "" } {
  foreach {max_library min_library} $MIN_LIBRARY_FILES {
    echo "$max_library $min_library"
    set_min_library $max_library -min_version $min_library
  }
}




