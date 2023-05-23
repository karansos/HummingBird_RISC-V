puts "RM-Info: Running script [info script]\n"

set timing_report_unconstrained_paths true

# when verbose = 1, the script will print Passing paths as well.
# Use this mode to make sure that all expected paths were indeed
# analysed.
# when verbose = 0, only failing paths will get printed.
set verbose 1
  
set common [getenv common]
source -v -e rm_setup/p_rpt_async_fail_paths.tcl

set afifo_clk_pin_coll \
   [filter \
      [get_pins -of_objects \
         [ filter [all_registers ] \
           "@full_name =~ *rp_afifo_ctrl* || @full_name =~ *mem_reg*" \
         ] \
      ] \
    "@is_clock_pin == true && @full_name !~ *TCLK* && @full_name !~ *RSCLK*" \
   ]

set read_clk_pin_coll [ \
   get_pins [ \
      list \
         [ filter $afifo_clk_pin_coll "@full_name =~ *gray_cnt_read* && @full_name =~ *gray_cnt_reg*"] \
         [ filter $afifo_clk_pin_coll "@full_name =~ *synch_sims_wr_ptr_gray*"] \
         [ filter $afifo_clk_pin_coll "@full_name =~ *temp_reg*" ] \
         [ filter $afifo_clk_pin_coll "@full_name =~ *rd_data*" ] \
   ]      
]   

set write_clk_pin_coll [ \
   get_pins [ \
      list \
         [ filter $afifo_clk_pin_coll "@full_name =~ *gray_cnt_write* && @full_name =~ *gray_cnt_reg*"] \
         [ filter $afifo_clk_pin_coll "@full_name =~ *synch_sims_rd_ptr_gray*"] \
         [ filter $afifo_clk_pin_coll "@full_name =~ *wr_full*" ] \
         [ filter $afifo_clk_pin_coll "@full_name =~ *mem_reg*" ] \
   ]      
]   

set afifo_data_pin_coll [ \
   filter [ \
      get_pins -of_objects [ \
         filter [all_registers ] \
         "@full_name =~ *rp_afifo_ctrl* || @full_name =~ *mem_reg*" \
      ] \
   ] \
   "@is_data_pin == true && @full_name !~ *SI* && full_name !~ *CDN* && full_name !~ *SDN*" \
]

set write_data_pin_coll [ \
   get_pins [ \
      list \
         [ filter $afifo_data_pin_coll "@full_name =~ *gray_cnt_write* && @full_name =~ *gray_cnt_reg*"] \
         [ filter $afifo_data_pin_coll "@full_name =~ *synch_sims_rd_ptr_gray*"] \
         [ filter $afifo_data_pin_coll "@full_name =~ *wr_full*" ] \
   ]      
]   

# there would be no async paths from read-clk domain to the mem_reg of the 
# async FIFO. The mem_reg is written on write-clk domain, and read on
# read clock domain. (When looking at read-clk to write-clk async paths,
# the paths we are interested to measure are ones that
# are written on read-clk domain and read of write-clk domain)
#append_to_collection write_data_pin_coll [ \
#   filter [ \
#      get_pins -of_objects [ \
#         filter [all_registers ] "@full_name =~ *mem*" \
#      ] \
#   ] \
#   "@is_data_pin == true && @full_name !~ *SI* && full_name !~ *CDN* && full_name !~ *SDN*" \
#]

set read_data_pin_coll [ \
   get_pins [ \
      list \
         [ filter $afifo_data_pin_coll "@full_name =~ *gray_cnt_read* && @full_name =~ *gray_cnt_reg*"] \
         [ filter $afifo_data_pin_coll "@full_name =~ *synch_sims_wr_ptr_gray*"] \
         [ filter $afifo_data_pin_coll "@full_name =~ *temp_reg*" ] \
         [ filter $afifo_data_pin_coll "@full_name =~ *rd_data*" ] \
   ]      
]   


set write_data_pin_coll [add_to_collection -unique $write_data_pin_coll $write_data_pin_coll]
set read_data_pin_coll [add_to_collection -unique $read_data_pin_coll $read_data_pin_coll]
set read_clk_pin_coll [add_to_collection -unique $read_clk_pin_coll $read_clk_pin_coll]
set write_clk_pin_coll [add_to_collection -unique $write_clk_pin_coll $write_clk_pin_coll]

echo "Read Clock Pin To Write Data Pin Paths\n\n" > async_paths.rpt

p_rpt_async_fail_paths $read_clk_pin_coll $write_data_pin_coll $verbose

echo "Write Clock Pin To Read Data Pin Paths\n\n" >> async_paths.rpt

p_rpt_async_fail_paths $write_clk_pin_coll $read_data_pin_coll $verbose


puts "RM-Info: Completed script [info script]\n"
