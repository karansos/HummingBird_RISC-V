set_preroute_drc_strategy  -min_layer M5  -max_layer M8

set_preroute_advanced_via_rule -cut_layer VIA5 -size_by_array_dimensions {4 7} -move_via_to_center
set_preroute_advanced_via_rule -cut_layer VIA6 -size_by_array_dimensions {4 7} -move_via_to_center

create_power_straps -advanced_via_rules -direction horizontal -start_at 1 -stop "$ury" -nets VDD -layer M8 -width 1.8  -configure step_and_stop -step 14.4 -start_low_ends boundary -start_high_ends boundary -extend_low_ends to_boundary_and_generate_pins -extend_high_ends  to_boundary_and_generate_pins

create_power_straps -advanced_via_rules -direction horizontal -start_at 8.2 -stop "$ury" -nets VSS -layer M8 -width 1.8 -configure step_and_stop -step 14.4 -start_low_ends boundary -start_high_ends boundary -extend_low_ends to_boundary_and_generate_pins -extend_high_ends  to_boundary_and_generate_pins


