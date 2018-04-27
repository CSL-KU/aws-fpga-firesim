
################################################################
# This is a generated script based on design: cl
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source cl_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu9p-flgb2104-2-i
   set_property BOARD_PART xilinx.com:f1_cl:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name cl

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set M_AXI4_OCL [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI4_OCL ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {24} \
CONFIG.DATA_WIDTH {32} \
CONFIG.NUM_READ_OUTSTANDING {2} \
CONFIG.NUM_WRITE_OUTSTANDING {2} \
CONFIG.PROTOCOL {AXI4LITE} \
 ] $M_AXI4_OCL
  set M_AXI4_PCIS [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI4_PCIS ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {64} \
CONFIG.DATA_WIDTH {512} \
CONFIG.NUM_READ_OUTSTANDING {2} \
CONFIG.NUM_WRITE_OUTSTANDING {2} \
CONFIG.PROTOCOL {AXI4} \
 ] $M_AXI4_PCIS
  set S_AXI4_DDR_C [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI4_DDR_C ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {34} \
CONFIG.ARUSER_WIDTH {0} \
CONFIG.AWUSER_WIDTH {0} \
CONFIG.BUSER_WIDTH {0} \
CONFIG.DATA_WIDTH {64} \
CONFIG.HAS_BRESP {1} \
CONFIG.HAS_BURST {1} \
CONFIG.HAS_CACHE {1} \
CONFIG.HAS_LOCK {0} \
CONFIG.HAS_PROT {0} \
CONFIG.HAS_QOS {0} \
CONFIG.HAS_REGION {0} \
CONFIG.HAS_RRESP {1} \
CONFIG.HAS_WSTRB {1} \
CONFIG.ID_WIDTH {5} \
CONFIG.MAX_BURST_LENGTH {16} \
CONFIG.NUM_READ_OUTSTANDING {16} \
CONFIG.NUM_READ_THREADS {1} \
CONFIG.NUM_WRITE_OUTSTANDING {16} \
CONFIG.NUM_WRITE_THREADS {1} \
CONFIG.PROTOCOL {AXI4} \
CONFIG.READ_WRITE_MODE {READ_WRITE} \
CONFIG.RUSER_BITS_PER_BYTE {0} \
CONFIG.RUSER_WIDTH {0} \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.WUSER_BITS_PER_BYTE {0} \
CONFIG.WUSER_WIDTH {0} \
 ] $S_AXI4_DDR_C
  set S_SH [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aws_f1_sh1_rtl:1.0 S_SH ]
  set S_SH_1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aws_f1_sh1_rtl:1.0 S_SH_1 ]

  # Create ports
  set firesim_clk1 [ create_bd_port -dir O -type clk firesim_clk1 ]
  set firesim_clk2 [ create_bd_port -dir O -type clk firesim_clk2 ]
  set firesim_clk3 [ create_bd_port -dir O -type clk firesim_clk3 ]
  set firesim_clk4 [ create_bd_port -dir O -type clk firesim_clk4 ]
  set firesim_clk5 [ create_bd_port -dir O -type clk firesim_clk5 ]
  set firesim_clk6 [ create_bd_port -dir O -type clk firesim_clk6 ]
  set firesim_selected_clock [ create_bd_port -dir I -type clk firesim_selected_clock ]
  set_property -dict [ list \
CONFIG.ASSOCIATED_RESET {firesim_sync_nreset} \
 ] $firesim_selected_clock
  set firesim_sync_nreset [ create_bd_port -dir I -type rst firesim_sync_nreset ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $firesim_sync_nreset

  # Create instance: axi_clock_converter_ocl, and set properties
  set axi_clock_converter_ocl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_ocl ]

  # Create instance: axi_clock_converter_pcis, and set properties
  set axi_clock_converter_pcis [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_pcis ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {100.051} \
CONFIG.CLKOUT1_PHASE_ERROR {130.256} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {190} \
CONFIG.CLKOUT2_JITTER {101.370} \
CONFIG.CLKOUT2_PHASE_ERROR {130.256} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {175} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_JITTER {102.992} \
CONFIG.CLKOUT3_PHASE_ERROR {130.256} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {160} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.CLKOUT4_JITTER {111.617} \
CONFIG.CLKOUT4_PHASE_ERROR {130.256} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {90} \
CONFIG.CLKOUT4_USED {true} \
CONFIG.CLKOUT5_JITTER {115.271} \
CONFIG.CLKOUT5_PHASE_ERROR {130.256} \
CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {75} \
CONFIG.CLKOUT5_USED {true} \
CONFIG.CLKOUT6_JITTER {119.098} \
CONFIG.CLKOUT6_PHASE_ERROR {130.256} \
CONFIG.CLKOUT6_REQUESTED_OUT_FREQ {60} \
CONFIG.CLKOUT6_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {37.625} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.250} \
CONFIG.MMCM_CLKOUT1_DIVIDE {9} \
CONFIG.MMCM_CLKOUT2_DIVIDE {10} \
CONFIG.MMCM_CLKOUT3_DIVIDE {17} \
CONFIG.MMCM_CLKOUT4_DIVIDE {21} \
CONFIG.MMCM_CLKOUT5_DIVIDE {26} \
CONFIG.MMCM_DIVCLK_DIVIDE {3} \
CONFIG.NUM_OUT_CLKS {6} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0

  # Create instance: f1_inst, and set properties
  set f1_inst [ create_bd_cell -type ip -vlnv xilinx.com:ip:aws:1.0 f1_inst ]
  set_property -dict [ list \
CONFIG.DDR_C_PRESENT {1} \
CONFIG.OCL_PRESENT {1} \
CONFIG.PCIS_PRESENT {1} \
 ] $f1_inst

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXI4_DDR_C_1 [get_bd_intf_ports S_AXI4_DDR_C] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_ocl_M_AXI [get_bd_intf_ports M_AXI4_OCL] [get_bd_intf_pins axi_clock_converter_ocl/M_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_pcis_M_AXI [get_bd_intf_ports M_AXI4_PCIS] [get_bd_intf_pins axi_clock_converter_pcis/M_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins f1_inst/S_AXI_DDRC]
  connect_bd_intf_net -intf_net f1_inst_M_AXI_OCL [get_bd_intf_pins axi_clock_converter_ocl/S_AXI] [get_bd_intf_pins f1_inst/M_AXI_OCL]
  connect_bd_intf_net -intf_net f1_inst_M_AXI_PCIS [get_bd_intf_pins axi_clock_converter_pcis/S_AXI] [get_bd_intf_pins f1_inst/M_AXI_PCIS]
  connect_bd_intf_net -intf_net f1_inst_S_SH [get_bd_intf_ports S_SH] [get_bd_intf_pins f1_inst/S_SH]

  # Create port connections
  connect_bd_net -net Net [get_bd_ports firesim_sync_nreset] [get_bd_pins axi_clock_converter_ocl/m_axi_aresetn] [get_bd_pins axi_clock_converter_pcis/m_axi_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN]
  connect_bd_net -net Net1 [get_bd_ports firesim_selected_clock] [get_bd_pins axi_clock_converter_ocl/m_axi_aclk] [get_bd_pins axi_clock_converter_pcis/m_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_ports firesim_clk1] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports firesim_clk2] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_ports firesim_clk3] [get_bd_pins clk_wiz_0/clk_out3]
  connect_bd_net -net clk_wiz_0_clk_out4 [get_bd_ports firesim_clk4] [get_bd_pins clk_wiz_0/clk_out4]
  connect_bd_net -net clk_wiz_0_clk_out5 [get_bd_ports firesim_clk5] [get_bd_pins clk_wiz_0/clk_out5]
  connect_bd_net -net clk_wiz_0_clk_out6 [get_bd_ports firesim_clk6] [get_bd_pins clk_wiz_0/clk_out6]
  connect_bd_net -net f1_inst_clk_main_a0_out [get_bd_pins axi_clock_converter_ocl/s_axi_aclk] [get_bd_pins axi_clock_converter_pcis/s_axi_aclk] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins f1_inst/clk_main_a0_out]
  connect_bd_net -net f1_inst_rst_main_n_out [get_bd_pins axi_clock_converter_ocl/s_axi_aresetn] [get_bd_pins axi_clock_converter_pcis/s_axi_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins clk_wiz_0/resetn] [get_bd_pins f1_inst/rst_main_n_out]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces f1_inst/M_AXI_OCL] [get_bd_addr_segs M_AXI4_OCL/Reg] SEG_M_AXI4_OCL_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces f1_inst/M_AXI_PCIS] [get_bd_addr_segs M_AXI4_PCIS/Reg] SEG_M_AXI4_PCIS_Reg
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces S_AXI4_DDR_C] [get_bd_addr_segs f1_inst/S_AXI_DDRC/Mem_DDRC] SEG_f1_inst_Mem_DDRC


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


