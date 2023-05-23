
#################################
## Change the following variables
#set core_width  423
#set core_height 430

set core_width  1167.360
set core_height 972.800
#################################


set die2core 1
create_floorplan -control_type width_and_height -core_width $core_width -core_height $core_height -left_io2core $die2core -right_io2core $die2core -bottom_io2core $die2core -top_io2core $die2core -keep_macro_place -keep_io_place

###################
## Place all macros
###################

## To write hard macros 
#write_floorplan -placement hard_macro  hard_macro.tcl

#source hard_macro.tcl    # hard macro file is missing
source hard_macro.tcl

set_object_fixed_edit [all_macro_cells] true      

set_keepout_margin -all_macros -outer {1 1 1 1} 

save_mw_cel -as macro_place_icc


## Pins placement
set_pin_physical_constraints -side 1 [get_terminals  -filter "direction==Input"] -layer M4 -width 0.05 -depth 0.1 -pin_spacing 2
set_pin_physical_constraints -side 3 [get_terminals  -filter "direction==Output"] -layer M4 -width 0.05 -depth 0.1 -pin_spacing 2
set_fp_pin_constraints -block_level -exclude_sides "2,4" -use_physical_constraints on
place_fp_pins -block_level


## Placement blockage on top and bottom row
set bb [get_attribute -class die_area [get_die_area] bbox]
set llx [lindex $bb 0 0]
set lly [lindex $bb 0 1]
set urx [lindex $bb 1 0]
set ury [lindex $bb 1 1]

remove_placement_blockage PB_*_row_blocked*
create_placement_blockage -bbox "$llx $lly $urx [expr $lly + $die2core + 1]" -type hard -name PB_first_row_blocked
create_placement_blockage -bbox "$llx [expr $ury - $die2core - 1] $urx $ury" -type hard -name PB_last_row_blocked

######### placement blockage for clock channel at top leval
create_placement_blockage -bbox "[expr $llx + 1] [expr $lly + 500] [expr $urx -1] [expr $ury - 422.800]" -type hard -name top_clock_channel_blockage

####### routing blockage for clock channel
create_routing_blockage -layers {metal1Blockage metal2Blockage metal3Blockage metal4Blockage} -bbox "[expr $llx + 1] [expr $lly + 500] [expr $urx -1] [expr $ury - 422.800]"



## End cap and well tap cells
insert_boundary_cell \
-top_left_inside_corner_cells tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_LEFTBWP12T30P140 \
-top_right_inside_corner_cells tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_RIGHTBWP12T30P140 \
-top_left_outside_corner_cell tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_LEFTBWP12T30P140 \
-top_right_outside_corner_cell tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_RIGHTBWP12T30P140 \
-bottom_left_inside_corner_cells tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_LEFTBWP12T30P140 \
-bottom_right_inside_corner_cells tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_RIGHTBWP12T30P140 \
-bottom_left_outside_corner_cell tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_LEFTBWP12T30P140 \
-bottom_right_outside_corner_cell tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_RIGHTBWP12T30P140 \
-left_boundary_cell tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_LEFTBWP12T30P140 \
-right_boundary_cell tcbn28hpcplusbwp12t30p140ssg0p81v125c_ccs/BOUNDARY_RIGHTBWP12T30P140 \
-rules {respect_hard_macro_keepout respect_hard_blockage}

add_tap_cell_array -ignore_soft_blockage true -master_cell_name TAPCELLBWP12T30P140 -distance  54 -connect_power_name VDD -connect_ground_name VSS -respect_keepout -pattern stagger_every_other_row -tap_cell_identifier WELLTAP

set_keepout_margin -all_macros -outer {3.4 3.4 3.4 3.4} -type soft

## connect_pg_nets
if {[file exists [which $CUSTOM_CONNECT_PG_NETS_SCRIPT]]} {
   echo "RM-Info: Sourcing [which $CUSTOM_CONNECT_PG_NETS_SCRIPT]"
   source -echo $CUSTOM_CONNECT_PG_NETS_SCRIPT
 } else {
    derive_pg_connection -power_net $MW_POWER_NET -power_pin $MW_POWER_PORT -ground_net $MW_GROUND_NET -ground_pin $MW_GROUND_PORT 
    if {!$ICC_TIE_CELL_FLOW} {derive_pg_connection -power_net $MW_POWER_NET -ground_net $MW_GROUND_NET -tie}
}


## Power Mesh & followpins
source rm_setup/power_plan.tcl
## save design
save_mw_cel -as floorplan_icc


