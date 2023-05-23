set_preroute_drc_strategy  -min_layer M8  -max_layer M9 

create_power_straps -direction vertical -start_at 1.07 -stop "$urx" -nets VDD -layer M9 -width 1.8 -configure step_and_stop -step 4.8 -start_low_ends boundary -start_high_ends boundary -extend_low_ends to_boundary_and_generate_pins -extend_high_ends  to_boundary_and_generate_pins -ignore_parallel_targets

create_power_straps -direction vertical -start_at 3.47 -stop "$urx" -nets VSS -layer M9 -width 1.8 -configure step_and_stop -step 4.8 -start_low_ends boundary -start_high_ends boundary -extend_low_ends to_boundary_and_generate_pins -extend_high_ends  to_boundary_and_generate_pins  -ignore_parallel_targets

