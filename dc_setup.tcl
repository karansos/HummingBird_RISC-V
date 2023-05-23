source -echo -verbose ./rm_setup/common_setup.tcl
source -echo -verbose ./rm_setup/dc_setup_filenames.tcl
# source -echo -verbose ./parser.tcl
puts "RM-Info: Running script [info script]\n"

set OPTIMIZATION_FLOW ""

#################################################################################
# Design Compiler Reference Methodology Setup for Top-Down Flow
# Script: dc_setup.tcl
# Version: L-2016.03 (April 4, 2016)
# Copyright (C) 2007-2016 Synopsys, Inc. All rights reserved.
#################################################################################



#################################################################################
# Setup Variables
#
# Modify settings in this section to customize your Design Compiler Reference 
# Methodology run.
# Portions of dc_setup.tcl may be used by other tools so program name checks
# are performed where necessary.
#################################################################################

  # The following setting removes new variable info messages from the end of the log file
  set_app_var sh_new_variable_message false

if {$synopsys_program_name == "dc_shell" || $synopsys_program_name == "de_shell"}  {

  #################################################################################
  # Design Compiler and  DC Explorer Setup Variables
  #################################################################################

  # Use the set_host_options command to enable multicore optimization to improve runtime.
  # This feature has special usage and license requirements.  Refer to the 
  # "Support for Multicore Technology" section in the Design Compiler User Guide
  # for multicore usage guidelines.
  # Note: This is a DC Ultra feature and is not supported in DC Expert.

  set_host_options -max_cores 8

  # Change alib_library_analysis_path to point to a central cache of analyzed libraries
  # to save runtime and disk space.  The following setting only reflects the
  # default value and should be changed to a central location for best results.

  set_app_var alib_library_analysis_path .

  # Add any additional Design Compiler variables needed here

  #################################################################################
  # DC Explorer Specific Setup Variables
  #################################################################################

  if {[shell_is_in_exploration_mode]} {
    # Uncomment the following setting to use top-level signal ports instead of a  
    # isolation power controller.

    # set_app_var upf_auto_iso_enable_source top_level_port
 
    # Uncomment the following setting to allow DC Explorer to perform optimization with
    # physical design data. 
 
    # set_app_var de_enable_physical_flow true 

    # Add any additional DC Explorer variables needed here

  }
}

set RTL_SOURCE_FILES  "/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_clint.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_gfcm.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_hclkgen.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_hclkgen_rstsync.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_main.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_mems.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_perips.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_plic.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_pll.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_pllclkdiv.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/subsys/e203_subsys_top.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/soc/e203_soc_top.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/i2c_master_bit_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/i2c_master_byte_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/i2c_master_defines.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/i2c_master_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_aon.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_aon_lclkgen_regs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_aon_porrst.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_aon_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_aon_wrapper.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_AsyncResetReg.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_AsyncResetRegVec.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_AsyncResetRegVec_1.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_AsyncResetRegVec_36.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_AsyncResetRegVec_67.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_AsyncResetRegVec_129.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_clint.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_clint_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_DeglitchShiftRegister.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_expl_apb_slv.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_expl_axi_slv.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_flash_qspi.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_flash_qspi_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_gpio.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_gpio_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_hclkgen_regs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_jtaggpioport.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_LevelGateway.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_otp_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_plic_man.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_plic_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pmu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pmu_core.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwm8.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwm8_core.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwm8_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwm16.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwm16_core.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwm16_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_pwmgpioport.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_1cs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_1cs_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_4cs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_4cs_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_arbiter.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_fifo.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_media.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_media_1.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_media_2.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_physical.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_physical_1.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_qspi_physical_2.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_queue.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_queue_1.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_repeater_6.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_ResetCatchAndSync.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_ResetCatchAndSync_2.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_rtc.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_spi_flashmap.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_spigpioport.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_spigpioport_1.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_spigpioport_2.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_tlfragmenter_qspi_1.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_tl_repeater_5.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_tlwidthwidget_qspi.v\
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_uart.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_uartgpioport.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_uartrx.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_uart_top.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_uarttx.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/perips/sirv_wdog.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/mems/sirv_mrom.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/mems/sirv_mrom_top.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_1cyc_sram_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_gnrl_bufs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_gnrl_dffs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_gnrl_icbs.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_gnrl_ram.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_gnrl_xchecker.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_sim_ram.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/general/sirv_sram_icb_ctrl.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/fab/sirv_icb1to2_bus.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/fab/sirv_icb1to8_bus.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/fab/sirv_icb1to16_bus.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/debug/sirv_debug_csr.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/debug/sirv_debug_module.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/debug/sirv_debug_ram.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/debug/sirv_debug_rom.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/debug/sirv_jtag_dtm.v \
			
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/config.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_biu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_clk_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_clkgate.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_core.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_cpu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_defines.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_dtcm_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_dtcm_ram.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_extend_csr.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu_bjp.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu_csrctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu_dpath.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu_lsuagu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu_muldiv.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_alu_rglr.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_branchslv.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_commit.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_csr.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_decode.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_disp.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_excp.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_longpwbck.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_oitf.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_regfile.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_exu_wbck.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_ifu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_ifu_ifetch.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_ifu_ift2icb.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_ifu_litebpu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_ifu_minidec.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_irq_sync.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_itcm_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_itcm_ram.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_lsu.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_lsu_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_reset_ctrl.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_srams.v \
			/home/nirlep.vadsara/hummingbird/rtl/e203/core/e203_cpu_top.v"	;# Enter the list of source RTL files if reading from RTL

# The following variables are used by scripts in the rm_dc_scripts folder to direct 
# the location of the output files.

set REPORTS_DIR "reports"
set RESULTS_DIR "results"

file mkdir ${REPORTS_DIR}
file mkdir ${RESULTS_DIR}

#################################################################################
# Search Path Setup
#
# Set up the search path to find the libraries and design files.
#################################################################################

  set_app_var search_path ". ${ADDITIONAL_SEARCH_PATH} $search_path"

#################################################################################
# Library Setup
#
# This section is designed to work with the settings from common_setup.tcl
# without any additional modification.
#################################################################################

  # Milkyway variable settings

  # Make sure to define the Milkyway library variable
  # mw_design_library, it is needed by write_milkyway command

  set mw_reference_library ${MW_REFERENCE_LIB_DIRS}
  set mw_design_library ${DCRM_MW_LIBRARY_NAME}

  set mw_site_name_mapping { {CORE unit} {Core unit} {core unit} }

# The remainder of the setup below should only be performed in Design Compiler or DC Explorer
if {$synopsys_program_name == "dc_shell" || $synopsys_program_name == "de_shell"}  {

  set_app_var target_library ${TARGET_LIBRARY_FILES}
  set_app_var synthetic_library dw_foundation.sldb
  set_app_var link_library "* $target_library $ADDITIONAL_LINK_LIB_FILES $synthetic_library"

  # Set min libraries if they exist
  foreach {max_library min_library} $MIN_LIBRARY_FILES {
    set_min_library $max_library -min_version $min_library
  }

  # Set the variable to use Verilog libraries for Test Design Rule Checking
  # (See dc.tcl for details)

  # set_app_var test_simulation_library <list of Verilog library files>

  if {[shell_is_in_topographical_mode]} {

    # To activate the extended layer mode to support 4095 layers uncomment the extend_mw_layers command 
    # before creating the Milkyway library. The extended layer mode is permanent and cannot be reverted 
    # back to the 255 layer mode once activated.

    # extend_mw_layers

    # Only create new Milkyway design library if it doesn't already exist
    if {![file isdirectory $mw_design_library ]} {
      create_mw_lib   -technology $TECH_FILE \
                      -mw_reference_library $mw_reference_library \
                      $mw_design_library
    } else {
      # If Milkyway design library already exists, ensure that it is consistent with specified Milkyway reference libraries
      set_mw_lib_reference $mw_design_library -mw_reference_library $mw_reference_library
    }

    open_mw_lib     $mw_design_library

    check_library > ${REPORTS_DIR}/${DCRM_CHECK_LIBRARY_REPORT}

    set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE \
                       -min_tluplus $TLUPLUS_MIN_FILE \
                       -tech2itf_map $MAP_FILE

    check_tlu_plus_files
  }

  #################################################################################
  # Library Modifications
  #
  # Apply library modifications after the libraries are loaded.
  #################################################################################

  if {[file exists [which ${LIBRARY_DONT_USE_FILE}]]} {
    puts "RM-Info: Sourcing script file [which ${LIBRARY_DONT_USE_FILE}]\n"
    source -echo -verbose ${LIBRARY_DONT_USE_FILE}
  }
}

puts "RM-Info: Completed script [info script]\n"

