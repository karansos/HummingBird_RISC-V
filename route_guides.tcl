foreach_in_collection macro [all_macro_cells] {
set bb [get_attribute $macro bbox]
create_route_guide -coordinate $bb -preferred_direction_only_layers {M2 M3 M4} -no_signal_layers {M4}
#create_route_guide -coordinate $bb -preferred_direction_only_layers {M2 M3 M4}
}
