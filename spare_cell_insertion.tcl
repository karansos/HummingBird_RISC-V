puts "RM-Info: Running script [info script]\n"

set wh [lindex [get_attribute [get_die_area] bbox] 1]

set EI_GEN_SPARE_CELL_COUNT  "[expr int([lindex $wh 0] * [lindex $wh 1]/90000)]"

#set EI_GEN_SPARE_LIST "SDFCNQD1BWP12T30P140 AN4D1BWP12T30P140 NR4D1BWP12T30P140  ND4D2BWP12T30P140 XOR4D1BWP12T30P140 MUX2D1BWP12T30P140 BUFFD6BWP12T30P140 BUFFD12BWP12T30P140 INVD12BWP12T30P140 INVD6BWP12T30P140HVT "
set EI_GEN_SPARE_LIST "SDFCNQD1BWP12T30P140 AN4D1BWP12T30P140 NR4D1BWP12T30P140  ND4D2BWP12T30P140 XOR4D1BWP12T30P140 MUX2D1BWP12T30P140 CKBD6BWP12T30P140  CKBD12BWP12T30P140  CKND12BWP12T30P140 CKND6BWP12T30P140   DEL025D1BWP12T30P140HVT"


puts "EI_INFO: Running spare cell flow"
if { $EI_GEN_SPARE_CELL_COUNT > 0 } {
  foreach currentLIB [regsub -all "\.db"  $TARGET_LIBRARY_FILES  ""] {
    foreach key $EI_GEN_SPARE_LIST {
      set lib_cell [ get_lib_cell -quiet $currentLIB/$key ]
      if { $lib_cell != "" }  {
        remove_attribute [ get_lib_cell -quiet $currentLIB/$key ] dont_use
      }
    }
  }
  puts "EI_INFO: insert_spare_cells $EI_GEN_SPARE_LIST -cell_name spares -num_instances $EI_GEN_SPARE_CELL_COUNT"
  insert_spare_cells -lib_cell $EI_GEN_SPARE_LIST -cell_name ei_spares -num_instances $EI_GEN_SPARE_CELL_COUNT -tie -skip_legal
#  legalize_placement -incremental -timing
}


#puts "Fixing Placement of all spare cells."
#set_attribute [all_spare_cells] is_fixed true

if { $EI_GEN_SPARE_CELL_COUNT > 0 } {
  source $TCL_DIR/library_dont_use.tcl
  legalize_placement -incremental -timing
}

puts "RM-Info: Completed script [info script]\n"
