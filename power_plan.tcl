set bb [get_attribute -class die_area [get_die_area] bbox]
set llx [lindex $bb 0 0]
set lly [lindex $bb 0 1]
set urx [lindex $bb 1 0]
set ury [lindex $bb 1 1]

remove_route_by_type -pg_std_cell_pin_conn
remove_route_by_type -pg_strap
remove_route_by_type -pg_user

source ./rm_setup/create_pg_strap_M5.tcl
source ./rm_setup/create_pg_strap_M8.tcl
#source ./rm_setup/create_pg_strap_M9.tcl

###############################################
derive_pg_connection -all

set_preroute_drc_strategy  -min_layer M1  -max_layer M5
preroute_standard_cells -nets VDD -fill_empty_rows -do_not_route_over_macros
preroute_standard_cells -nets VSS -fill_empty_rows -do_not_route_over_macros
