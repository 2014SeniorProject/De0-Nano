## Generated SDC file "I2C_MyNano.out.sdc"

## Copyright (C) 1991-2014 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.2 Build 173 01/15/2014 SJ Web Edition"

## DATE    "Sat Mar 29 16:09:07 2014"

##
## DEVICE  "EP4CE22F17C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {IMUCalculations:IMUCalc|IMUInterface:IMU|DataValid} -period 10000.000 -waveform { 0.000 5000.000 } [get_nets {IMUCalc|IMU|DataValid}]
create_clock -name {RPM:rpmCalc|blips_d1} -period 20.000 -waveform { 0.000 10.000 } [get_registers {RPM:rpmCalc|blips_d2}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]} -source [get_pins {PLLs|PLL_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[1]} -source [get_pins {PLLs|PLL_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -phase -54.000 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]} -source [get_pins {PLLs|PLL_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 1000 -phase -0.054 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {PLLs|PLL_inst3|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {PLLs|PLL_inst3|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 128 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst3|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {ClockManagement:PLLs|PLL2:PLL_inst2|altpll:altpll_component|PLL2_altpll:auto_generated|wire_pll1_clk[0]} -source [get_pins {PLLs|PLL_inst2|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 26 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst2|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {ClockManagement:PLLs|PLL2:PLL_inst2|altpll:altpll_component|PLL2_altpll:auto_generated|wire_pll1_clk[1]} -source [get_pins {PLLs|PLL_inst2|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 2500 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst2|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {ClockManagement:PLLs|PLL2:PLL_inst2|altpll:altpll_component|PLL2_altpll:auto_generated|wire_pll1_clk[2]} -source [get_pins {PLLs|PLL_inst2|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 128 -master_clock {CLOCK_50} [get_pins {PLLs|PLL_inst2|altpll_component|auto_generated|pll1|clk[2]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}] -rise_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}] -fall_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}] -rise_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}] -fall_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}] -rise_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}] -fall_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}] -rise_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}] -fall_to [get_clocks {ClockManagement:PLLs|PLL:PLL_inst|altpll:altpll_component|PLL_altpll:auto_generated|wire_pll1_clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.060  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -from [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_nios2_oci_break:the_CPU_nios2_qsys_0_nios2_oci_break|break_readreg*}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_tck:the_CPU_nios2_qsys_0_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_nios2_oci_debug:the_CPU_nios2_qsys_0_nios2_oci_debug|*resetlatch}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_tck:the_CPU_nios2_qsys_0_jtag_debug_module_tck|*sr[33]}]
set_false_path -from [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_nios2_oci_debug:the_CPU_nios2_qsys_0_nios2_oci_debug|monitor_ready}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_tck:the_CPU_nios2_qsys_0_jtag_debug_module_tck|*sr[0]}]
set_false_path -from [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_nios2_oci_debug:the_CPU_nios2_qsys_0_nios2_oci_debug|monitor_error}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_tck:the_CPU_nios2_qsys_0_jtag_debug_module_tck|*sr[34]}]
set_false_path -from [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_nios2_ocimem:the_CPU_nios2_qsys_0_nios2_ocimem|*MonDReg*}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_tck:the_CPU_nios2_qsys_0_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_tck:the_CPU_nios2_qsys_0_jtag_debug_module_tck|*sr*}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_sysclk:the_CPU_nios2_qsys_0_jtag_debug_module_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_jtag_debug_module_wrapper:the_CPU_nios2_qsys_0_jtag_debug_module_wrapper|CPU_nios2_qsys_0_jtag_debug_module_sysclk:the_CPU_nios2_qsys_0_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*CPU_nios2_qsys_0:*|CPU_nios2_qsys_0_nios2_oci:the_CPU_nios2_qsys_0_nios2_oci|CPU_nios2_qsys_0_nios2_oci_debug:the_CPU_nios2_qsys_0_nios2_oci_debug|monitor_go}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50}]  -to  [get_clocks {IMUCalculations:IMUCalc|IMUInterface:IMU|DataValid}] 2
set_multicycle_path -setup -end -from [get_keepers {SafetyControls:Safety|debounced_button:LeftBlinker|ButtonOut}] -to [get_keepers {SafetyControls:Safety|blinker:blinkerControls|leftBlinkerOut}] 2
set_multicycle_path -setup -end -from [get_keepers {SafetyControls:Safety|debounced_button:RightBlinker|ButtonOut}] -to [get_keepers {SafetyControls:Safety|blinker:blinkerControls|rightBlinkerOut}] 2
set_multicycle_path -hold -end -from [get_keepers {SafetyControls:Safety|debounced_button:LeftBlinker|ButtonOut}] -to [get_keepers {SafetyControls:Safety|blinker:blinkerControls|leftBlinkerOut}] 2
set_multicycle_path -hold -end -from [get_keepers {SafetyControls:Safety|debounced_button:RightBlinker|ButtonOut}] -to [get_keepers {SafetyControls:Safety|blinker:blinkerControls|rightBlinkerOut}] 2


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

