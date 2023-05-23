#!/usr/bin/tclsh
#This file needs to be source into dc_setup.tcl; it will directly set the RTL_SOURCE_FILES variable.
#Forget IPATH for now.
set ADDITIONAL_RTL_FILE ""
set RPATH "/moon/FTPDOWNLOAD/handoff_11012016/RTL/home/dan/projects/sun_light1"
set IPATH "/moon/FTPDOWNLOAD/handoff_15072016/RTL/home/dan/projects/sun_light1/ip"
#Set the FILE variable with .f file path"
set FILE ${DESIGN_NAME}.f 
#Set the x variable with path precedence"
set x {$::env(REPOROOT)}
set y /home/kedar/REPOS/repo_copy_july11 
proc get_VERILOG {arg RPATH} {
set fou [open "$arg"]
while {[gets $fou line1]!=-1} {
set in [string map "$\ip $IPATH" [string map "$x $RPATH" [string map "$y $RPATH" $line1]]]
if [regexp {\-F} [lindex $in 0] ] {
lappend module [get_VERILOG [lindex $in 1] $RPATH]
} else {
lappend module $in
}
}
return $module
}



set module ""
set fi [open "$FILE"]
set fp [open "tmp" w]
while {[gets $fi line]!=-1} {
if [regexp {^\/|^\$} $line ] {
set in [string map "$\ip $IPATH" [string map "$x $RPATH" [string map "$y $RPATH" $line]]]
if [regexp {\-F} [lindex $in 0] ] {
lappend module [get_VERILOG [lindex $in 1] $RPATH]
} else {
lappend module $in
}
}
}
set RTL_SOURCE_FILES [split $module " "]
lappend RTL_SOURCE_FILES $ADDITIONAL_RTL_FILE
#set RTL_SOURCE_FILES [lsort -unique [exec echo $RTL_SOURCE_FILES | sed -e "s/{//g" -e "s/}//g" -e {s/\\//g}]]
set RTL_SOURCE_FILES [exec echo $RTL_SOURCE_FILES | sed -e "s/{//g" -e "s/}//g" -e {s/\\//g}]
puts "There were [llength $RTL_SOURCE_FILES] RTL files in this .f"
puts $fp $RTL_SOURCE_FILES
close $fi
