derive_pg_connection -power_net $MW_POWER_NET -power_pin $MW_POWER_PORT -ground_net $MW_GROUND_NET -ground_pin $MW_GROUND_PORT 

derive_pg_connection -cells [all_macro_cells]  -power_net $MW_POWER_NET -power_pin VDDF

#derive_pg_connection -cells [all_macro_cells]  -power_net $MW_POWER_NET -power_pin VDDPI

