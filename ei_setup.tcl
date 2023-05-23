

### ei_setup.tcl file              ###




puts "RM-Info: Running script [info script]\n"
set sh_continue_on_error true
### Start of PrimeTime Runtime Variables ###

##########################################################################################
# PrimeTime Variables PrimeTime Reference Methodology script
# Script: pt_setup.tcl
# Version: K-2015.12-SP2 (April 4, 2016)
# Copyright (C) 2008-2016 Synopsys All rights reserved.
##########################################################################################

######################################
# Library and Design Setup
######################################

### Mode : DMSA

set search_path ". $ADDITIONAL_SEARCH_PATH $search_path $sh_launch_dir $sh_launch_dir/$sdir/rm_pt_scripts $sh_launch_dir/$sdir/rm_setup/"  ; # NYN:please include search path for netlist and .sdc if youdon't link them in current dir
# Provide list of Verilog netlist files. It can be compressed --- example "A.v B.v C.v"
set NETLIST_FILES               "${DESIGN_NAME}.v" ; # NYN: for consitensy please keep the netlist name as $DESIGN_NAME.v
# DESIGN_NAME is checked for existence from common_setup.tcl
if {[string length $DESIGN_NAME] > 0} {
} else {
set DESIGN_NAME                   ""  ;#  The name of the top-level design
}


######################################
# Library and Design Setup
######################################

set EI_PT_MODE_POST_LAYOUT          "TRUE" ; #TRUE or FALSE
set EI_PT_FIX_ECO                   "FALSE" ; #TRUE or FALSE

set EI_PT_LIB_ssg0p81v125c " \
	tcbn28hpcplusbwp12t30p140lvtssg0p81v125c_ccs.db \
	tcbn28hpcplusbwp12t30p140hvtssg0p81v125c_ccs.db \
	tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs.db \
	sadglsph4s1p128x56m2b1w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p256x56m2b2w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_ppi.db \
	sad2lsph4s1p1024x144m4b1w0c1p1d0r1s10_arp.db \
	sad2lsph4s1p2048x144m4b4w0c1p1d0r1s10_pipe.db \
	sad2lsph4s1p4096x39m8b2w0c1p1d0r1s10_pipe.db \
	sad2lsph4s1p8192x39m8b8w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p1024x144m2b2w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p1024x18m4b2w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_arp.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_pipe.db \
	sadglsph4s1p1024x56m4b1w0c0p1d0r1s10_arp.db \
	sadglsph4s1p128x144m2b1w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p128x39m4b1w0c0p1d0r1s10_pipe.db \
	sadglsph4s1p128x50m2b1w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p16x144m2b1w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p2048x39m4b2w0c0p1d0r1s10_pipe.db \
	sadglsph4s1p256x144m2b1w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p256x39m4b1w0c0p1d0r1s10_pipe.db \
	sadglsph4s1p256x50m2b1w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_ppi.db \
	sadglsph4s1p32x18m2b1w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p32x39m4b1w0c0p1d0r1s10_pipe.db \
	sadglsph4s1p512x144m2b1w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p512x144m2b2w0c1p1d0r1s10_arp.db \
	sadglsph4s1p512x39m4b1w0c0p1d0r1s10_pipe.db \
	sadglsph4s1p512x39m4b1w0c1p1d0r1s10_arp.db \
	sadglsph4s1p512x50m4b1w0c0p1d0r1s10_ppi.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_arp.db \
	sadglsph4s1p64x144m2b1w0c1p1d0r1s10_pipe.db \
	sadglsph4s1p64x39m4b1w0c0p1d0r1s10_pipe.db \
	sadglsph4s2p128x80m1b4w0c0p1d0r1s10_ethrx.db \
	sadglsph4s2p16x26m2b1w0c0p1d0r1s10_sw.db \
	sadglsph4s2p32x148m1b1w0c1p1d0r1s10_ethrx.db \
	sadglsph4s2p32x152m1b1w0c1p1d0r1s10_sw.db \
	sadglsph4s2p32x164m1b1w0c1p1d0r1s10_sw.db \
	sadglsph4s2p32x180m1b1w0c1p1d0r1s10_ethrx.db \
	sadulsph4s2p1024x144m4b4w0c1p1d0r1s10_ppi.db \
	sadulsph4s2p11264x18m16b4w0c1p1d0r1s10_re.db \
	sadulsph4s2p16384x18m16b8w0c1p1d0r1s10_re.db \
	sadulsph4s2p2048x20m8b1w0c0p1d0r1s10_sw.db \
	sadulsph4s2p2048x22m8b1w0c0p1d0r1s10_sw.db \
	sadulsph4s2p4096x76m8b4w0c1p1d0r1s10_sw.db \
	sadulsph4s2p64x151m4b1w0c1p1d0r1s10_sw.db \
	sadulsph4s2p768x144m4b2w0c1p1d0r1s10_ppi.db \
	sadulsph4s2p8192x20m16b2w0c1p1d0r1s10_sw.db \
	sadulsph4s2p8192x26m16b2w0c1p1d0r1s10_sw.db \
	sasrlsph4s1p64x72m2b1w0c1p1d0r1s10_txrx_fast.db \
	sasslsph4s1p16384x31m16b4w0c1p1d0r1s10_pipe_fast.db \
	sasslsph4s1p16384x39m16b4w0c1p1d0r1s10_pipe_fast.db \
	sasslsph4s1p16384x72m16b4w0c1p1d0r1s10_pipe_fast.db \
	sasslsph4s1p4096x144m8b2w0c1p1d0r1s10_pipe_fast.db \
	sasslsph4s1p8192x144m8b4w0c1p1d0r1s10_pipe_fast.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81v125c_rcworst.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81v125c_rcbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81v125c_cbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81v125c_cworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81v125c_rcbest.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81v125c_rcworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81v125c_cworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81v125c_cbest.db \
				" ; # NYN: define list of all .db files for respective pvt corners. For now, I'm using the same as common_setup.tcl because we don't have .db files for pvts
set EI_PT_LIB_ssg0p81vm40c " \
	tcbn28hpcplusbwp12t30p140hvtssg0p81vm40c_ccs.db \
	tcbn28hpcplusbwp12t30p140lvtssg0p81vm40c_ccs.db \
	tcbn28hpcplusbwp12t30p140ssg0p81vm40c_ccs.db \
	sad2lsph4s1p1024x144m4b1w0c1p1d0r1s10_arp_ssgwc0p81vn40c.db \
	sad2lsph4s1p2048x144m4b4w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sad2lsph4s1p4096x39m8b2w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sad2lsph4s1p8192x39m8b8w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p1024x144m2b2w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p1024x18m4b2w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_arp_ssgwc0p81vn40c.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p1024x56m4b1w0c0p1d0r1s10_arp_ssgwc0p81vn40c.db \
	sadglsph4s1p128x144m2b1w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p128x39m4b1w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p128x50m2b1w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p128x56m2b1w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p16x144m2b1w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p2048x39m4b2w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p256x144m2b1w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p256x39m4b1w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p256x50m2b1w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p256x56m2b2w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p32x18m2b1w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p32x39m4b1w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p512x144m2b1w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p512x144m2b2w0c1p1d0r1s10_arp_ssgwc0p81vn40c.db \
	sadglsph4s1p512x39m4b1w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p512x39m4b1w0c1p1d0r1s10_arp_ssgwc0p81vn40c.db \
	sadglsph4s1p512x50m4b1w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_arp_ssgwc0p81vn40c.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadglsph4s1p64x144m2b1w0c1p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s1p64x39m4b1w0c0p1d0r1s10_pipe_ssgwc0p81vn40c.db \
	sadglsph4s2p128x80m1b4w0c0p1d0r1s10_ethrx_ssgwc0p81vn40c.db \
	sadglsph4s2p16x26m2b1w0c0p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadglsph4s2p32x148m1b1w0c1p1d0r1s10_ethrx_ssgwc0p81vn40c.db \
	sadglsph4s2p32x152m1b1w0c1p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadglsph4s2p32x164m1b1w0c1p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadglsph4s2p32x180m1b1w0c1p1d0r1s10_ethrx_ssgwc0p81vn40c.db \
	sadulsph4s2p1024x144m4b4w0c1p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadulsph4s2p11264x18m16b4w0c1p1d0r1s10_re_ssgwc0p81vn40c.db \
	sadulsph4s2p16384x18m16b8w0c1p1d0r1s10_re_ssgwc0p81vn40c.db \
	sadulsph4s2p2048x20m8b1w0c0p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadulsph4s2p2048x22m8b1w0c0p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadulsph4s2p4096x76m8b4w0c1p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadulsph4s2p64x151m4b1w0c1p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadulsph4s2p768x144m4b2w0c1p1d0r1s10_ppi_ssgwc0p81vn40c.db \
	sadulsph4s2p8192x20m16b2w0c1p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sadulsph4s2p8192x26m16b2w0c1p1d0r1s10_sw_ssgwc0p81vn40c.db \
	sasrlsph4s1p64x72m2b1w0c1p1d0r1s10_txrx_fast_ssgwc0p81vn40c.db \
	sasslsph4s1p16384x31m16b4w0c1p1d0r1s10_pipe_fast_ssgwc0p81vn40c.db \
	sasslsph4s1p16384x39m16b4w0c1p1d0r1s10_pipe_fast_ssgwc0p81vn40c.db \
	sasslsph4s1p16384x72m16b4w0c1p1d0r1s10_pipe_fast_ssgwc0p81vn40c.db \
	sasslsph4s1p4096x144m8b2w0c1p1d0r1s10_pipe_fast_ssgwc0p81vn40c.db \
	sasslsph4s1p8192x144m8b4w0c1p1d0r1s10_pipe_fast_ssgwc0p81vn40c.db \
	dwc_xaui6g_x1_ns_9m6x2z_ssg0p81vn40c_rcbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81vn40c_rcworst.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81vn40c_cbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ssg0p81vn40c_cworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81vn40c_rcbest.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81vn40c_rcworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81vn40c_cworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ssg0p81vn40c_cbest.db \
	 " ;

set EI_PT_LIB_ffg0p99v125c " \
	tcbn28hpcplusbwp12t30p140hvtffg0p99v125c_ccs.db \
	tcbn28hpcplusbwp12t30p140lvtffg0p99v125c_ccs.db \
	tcbn28hpcplusbwp12t30p140ffg0p99v125c_ccs.db \
	sad2lsph4s1p1024x144m4b1w0c1p1d0r1s10_arp_ffgbc0p99v125c.db \
	sad2lsph4s1p2048x144m4b4w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sad2lsph4s1p4096x39m8b2w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sad2lsph4s1p8192x39m8b8w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p1024x144m2b2w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p1024x18m4b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_arp_ffgbc0p99v125c.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p1024x56m4b1w0c0p1d0r1s10_arp_ffgbc0p99v125c.db \
	sadglsph4s1p128x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p128x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p128x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p128x56m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p16x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p2048x39m4b2w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p256x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p256x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p256x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p256x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p32x18m2b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p32x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p512x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p512x144m2b2w0c1p1d0r1s10_arp_ffgbc0p99v125c.db \
	sadglsph4s1p512x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p512x39m4b1w0c1p1d0r1s10_arp_ffgbc0p99v125c.db \
	sadglsph4s1p512x50m4b1w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_arp_ffgbc0p99v125c.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadglsph4s1p64x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s1p64x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99v125c.db \
	sadglsph4s2p128x80m1b4w0c0p1d0r1s10_ethrx_ffgbc0p99v125c.db \
	sadglsph4s2p16x26m2b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadglsph4s2p32x148m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99v125c.db \
	sadglsph4s2p32x152m1b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadglsph4s2p32x164m1b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadglsph4s2p32x180m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99v125c.db \
	sadulsph4s2p1024x144m4b4w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadulsph4s2p11264x18m16b4w0c1p1d0r1s10_re_ffgbc0p99v125c.db \
	sadulsph4s2p16384x18m16b8w0c1p1d0r1s10_re_ffgbc0p99v125c.db \
	sadulsph4s2p2048x20m8b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadulsph4s2p2048x22m8b1w0c0p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadulsph4s2p4096x76m8b4w0c1p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadulsph4s2p64x151m4b1w0c1p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadulsph4s2p768x144m4b2w0c1p1d0r1s10_ppi_ffgbc0p99v125c.db \
	sadulsph4s2p8192x20m16b2w0c1p1d0r1s10_sw_ffgbc0p99v125c.db \
	sadulsph4s2p8192x26m16b2w0c1p1d0r1s10_sw_ffgbc0p99v125c.db \
	sasrlsph4s1p64x72m2b1w0c1p1d0r1s10_txrx_fast_ffgbc0p99v125c.db \
	sasslsph4s1p16384x31m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db \
	sasslsph4s1p16384x39m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db \
	sasslsph4s1p16384x72m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db \
	sasslsph4s1p4096x144m8b2w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db \
	sasslsph4s1p8192x144m8b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99v125c.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99v125c_rcbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99v125c_rcworst.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99v125c_cbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99v125c_cworst.db \
	dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99v125c_rcbest.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99v125c_rcworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99v125c_cworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99v125c_cbest.db \
		   " ;
 
set EI_PT_LIB_ffg0p99vm40c " \
	tcbn28hpcplusbwp12t30p140hvtffg0p99vm40c_ccs.db \
	tcbn28hpcplusbwp12t30p140lvtffg0p99vm40c_ccs.db \
	tcbn28hpcplusbwp12t30p140ffg0p99vm40c_ccs.db \
	sad2lsph4s1p1024x144m4b1w0c1p1d0r1s10_arp_ffgbc0p99vn40c.db \
	sad2lsph4s1p2048x144m4b4w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sad2lsph4s1p4096x39m8b2w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sad2lsph4s1p8192x39m8b8w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p1024x144m2b2w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p1024x18m4b2w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_arp_ffgbc0p99vn40c.db \
	sadglsph4s1p1024x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p1024x56m4b1w0c0p1d0r1s10_arp_ffgbc0p99vn40c.db \
	sadglsph4s1p128x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p128x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p128x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p128x56m2b1w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p16x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p2048x39m4b2w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p256x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p256x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p256x50m2b1w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p256x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p32x144m2b1w0c1p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p32x18m2b1w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p32x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p512x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p512x144m2b2w0c1p1d0r1s10_arp_ffgbc0p99vn40c.db \
	sadglsph4s1p512x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p512x39m4b1w0c1p1d0r1s10_arp_ffgbc0p99vn40c.db \
	sadglsph4s1p512x50m4b1w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_arp_ffgbc0p99vn40c.db \
	sadglsph4s1p512x56m2b2w0c0p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadglsph4s1p64x144m2b1w0c1p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s1p64x39m4b1w0c0p1d0r1s10_pipe_ffgbc0p99vn40c.db \
	sadglsph4s2p128x80m1b4w0c0p1d0r1s10_ethrx_ffgbc0p99vn40c.db \
	sadglsph4s2p16x26m2b1w0c0p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadglsph4s2p32x148m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99vn40c.db \
	sadglsph4s2p32x152m1b1w0c1p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadglsph4s2p32x164m1b1w0c1p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadglsph4s2p32x180m1b1w0c1p1d0r1s10_ethrx_ffgbc0p99vn40c.db \
	sadulsph4s2p1024x144m4b4w0c1p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadulsph4s2p11264x18m16b4w0c1p1d0r1s10_re_ffgbc0p99vn40c.db \
	sadulsph4s2p16384x18m16b8w0c1p1d0r1s10_re_ffgbc0p99vn40c.db \
	sadulsph4s2p2048x20m8b1w0c0p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadulsph4s2p2048x22m8b1w0c0p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadulsph4s2p4096x76m8b4w0c1p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadulsph4s2p64x151m4b1w0c1p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadulsph4s2p768x144m4b2w0c1p1d0r1s10_ppi_ffgbc0p99vn40c.db \
	sadulsph4s2p8192x20m16b2w0c1p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sadulsph4s2p8192x26m16b2w0c1p1d0r1s10_sw_ffgbc0p99vn40c.db \
	sasrlsph4s1p64x72m2b1w0c1p1d0r1s10_txrx_fast_ffgbc0p99vn40c.db \
	sasslsph4s1p16384x31m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99vn40c.db \
	sasslsph4s1p16384x39m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99vn40c.db \
	sasslsph4s1p16384x72m16b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99vn40c.db \
	sasslsph4s1p4096x144m8b2w0c1p1d0r1s10_pipe_fast_ffgbc0p99vn40c.db \
	sasslsph4s1p8192x144m8b4w0c1p1d0r1s10_pipe_fast_ffgbc0p99vn40c.db \
	dwc_xaui6g_x1_ns_9m6x2z_ffg0p99vn40c_rcworst.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99vn40c_rcbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99vn40c_cbest.db \
        dwc_xaui6g_x1_ns_9m6x2z_ffg0p99vn40c_cworst.db \
	dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99vn40c_rcbest.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99vn40c_rcworst.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99vn40c_cbest.db \
        dwc_xaui6g_pads_x1_ns_9m6x2z_ffg0p99vn40c_cworst.db \
        " ;


set EI_PT_OCV_FILE1  "rm_setup/ss_wc_setup_ocv.tcl" ; # NYN : have set derates as per sign-off document. Also, included uncertainity.
set EI_PT_OCV_FILE2  "rm_setup/ss_wc_hold_ocv.tcl"  ; # 
set EI_PT_OCV_FILE3  "rm_setup/ff_wc_hold_ocv.tcl"  ; # 
set EI_PT_OCV_FILE4  "rm_setup/ff_bc_hold_ocv.tcl"  ; # 

set EI_PT_VCD_FILE "" ; # NYN: VCD file for power activity once we start power  analysis/optimization using PTPX


set EI_PT_RUN_SCENARIOS     "\
ssg0p81v125c_cworstT_wc \
ssg0p81v125c_rcworstT_wc  \
ssg0p81vm40c_cworstT_wc  \
ssg0p81vm40c_rcworstT_wc  \
ssg0p81vm40c_cworst_bc  \
ssg0p81vm40c_rcworst_bc  \
ssg0p81v125c_cworst_bc  \
ssg0p81v125c_rcworst_bc  \
ffg0p99v125c_cbest_bc  \
ffg0p99v125c_rcbest_bc  \
ffg0p99v125c_cworst_bc  \
ffg0p99v125c_rcworst_bc  \
ffg0p99vm40c_cbest_bc    \
ffg0p99vm40c_rcbest_bc \
ffg0p99vm40c_cworst_bc  \
ffg0p99vm40c_rcworst_bc \
" ; #NYN: lists all 16 sign-off corners. Use the ones you need to analyze for. Make sure you give enough resources if you select multiple: 

# MAIN:  
# ssg0p81v125c_cworstT_wc 
# ssg0p81v125c_rcworstT_wc 
# ffg0p99vm40c_cbest_bc   
# ffg0p99vm40c_rcbest_bc"

# ALL:  
# ssg0p81v125c_cworstT_wc
# ssg0p81v125c_rcworstT_wc 
# ssg0p81vm40c_cworstT_wc 
# ssg0p81vm40c_rcworstT_wc 

# ssg0p81vm40c_cworst_bc 
# ssg0p81vm40c_rcworst_bc 
# ssg0p81v125c_cworst_bc 
# ssg0p81v125c_rcworst_bc 

# ffg0p99v125c_cbest_bc 
# ffg0p99v125c_rcbest_bc 
# ffg0p99v125c_cworst_bc 
# ffg0p99v125c_rcworst_bc 

# ffg0p99vm40c_cbest_bc   
# ffg0p99vm40c_rcbest_bc"
# ffg0p99vm40c_cworst_bc 
# ffg0p99vm40c_rcworst_bc 


set EI_PT_MODES "func shift sms cap atspeed"  ; # NYN: Please make sure you have .sdc with the name given as aruguement i.e. $DESIGN_NAME.<func or shift or cap or speed >.sdc        func=functional shift=scan shift cap=capture speed=at speed
set EI_PT_DERATE_MODE "FLAT" ; # NYN: AOCV or FLAT. I see one error related to AOCV flow as I'm loading flat derate where flow expects AOCV tables. I need to confirm with Synopsys AE
set EI_PT_DRC_BUF_LIST "BUFFD4BWP12T30P140HVT BUFFD8BWP12T30P140HVT BUFFD12BWP12T30P140HVT BUFFD4BWP12T30P140 BUFFD8BWP12T30P140 BUFFD12BWP12T30P140 BUFFD4BWP12T30P140LVT BUFFD8BWP12T30P140LVT BUFFD12BWP12T30P140LVT" ; # NYN: List of BUF, INV for tras, cap, fan-out fixinh
set EI_PT_HOLD_BUF_LIST "BUFFD2BWP12T30P140HVT BUFFD3BWP12T30P140HVT BUFFD4BWP12T30P140HVT" ; # NYN: List of BUF,INV, DELAY cells for hold fix.
### End of PrimeTime Runtime Variables ###
puts "RM-Info: Completed script [info script]\n"
