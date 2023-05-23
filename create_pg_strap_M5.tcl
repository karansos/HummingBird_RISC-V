set_preroute_advanced_via_rule  -contact_codes VIA45_LONG_H -rotation_mode off -size_by_array_dimensions {5 1} -x_offset -0.025
set_preroute_drc_strategy  -min_layer M4  -max_layer M5
create_power_straps -advanced_via_rules -direction vertical -start_at 0.97 -stop "$urx" -nets VDD -layer M5 -width 1 -configure step_and_stop -step 11.6 -keep_floating_wire_pieces

create_power_straps -advanced_via_rules -direction vertical -start_at 6.77 -stop "$urx" -nets VSS -layer M5 -width 1 -configure step_and_stop -step 11.6 -keep_floating_wire_pieces


