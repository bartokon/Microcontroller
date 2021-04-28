
################################################################
# This is a generated script based on design: full_testbench_bd
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
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source full_testbench_bd_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# alu, alu_input_output_reg, alu_input_output_reg, control_unit, cu_ram, general_registers, multiplexer, multiplexer, program_memory

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z007sclg225-1
   set_property BOARD_PART em.avnet.com:minized:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name full_testbench_bd

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
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

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

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk [ create_bd_port -dir I clk ]
  set cu_enable [ create_bd_port -dir I cu_enable ]
  set gen_reg_data_out [ create_bd_port -dir O -from 7 -to 0 -type data gen_reg_data_out ]
  set reset [ create_bd_port -dir I reset ]

  # Create instance: alu_0, and set properties
  set block_name alu
  set block_cell_name alu_0
  if { [catch {set alu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alu_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: alu_op_A, and set properties
  set block_name alu_input_output_reg
  set block_cell_name alu_op_A
  if { [catch {set alu_op_A [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alu_op_A eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: alu_op_B, and set properties
  set block_name alu_input_output_reg
  set block_cell_name alu_op_B
  if { [catch {set alu_op_B [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alu_op_B eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: control_unit_0, and set properties
  set block_name control_unit
  set block_cell_name control_unit_0
  if { [catch {set control_unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $control_unit_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: cu_ram_0, and set properties
  set block_name cu_ram
  set block_cell_name cu_ram_0
  if { [catch {set cu_ram_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $cu_ram_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: general_registers_0, and set properties
  set block_name general_registers
  set block_cell_name general_registers_0
  if { [catch {set general_registers_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $general_registers_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: multiplexer_0, and set properties
  set block_name multiplexer
  set block_cell_name multiplexer_0
  if { [catch {set multiplexer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $multiplexer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: multiplexer_1, and set properties
  set block_name multiplexer
  set block_cell_name multiplexer_1
  if { [catch {set multiplexer_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $multiplexer_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: program_memory_6, and set properties
  set block_name program_memory
  set block_cell_name program_memory_6
  if { [catch {set program_memory_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $program_memory_6 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_WIDTH {2} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {1} \
   CONFIG.DIN_TO {1} \
   CONFIG.DIN_WIDTH {2} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_WIDTH {2} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {1} \
   CONFIG.DIN_TO {1} \
   CONFIG.DIN_WIDTH {2} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_3

  # Create port connections
  connect_bd_net -net alu_0_AB_same [get_bd_pins alu_0/AB_same] [get_bd_pins control_unit_0/AB_same]
  connect_bd_net -net alu_0_A_bigger [get_bd_pins alu_0/A_bigger] [get_bd_pins control_unit_0/A_bigger]
  connect_bd_net -net alu_0_B_bigger [get_bd_pins alu_0/B_bigger] [get_bd_pins control_unit_0/B_bigger]
  connect_bd_net -net alu_0_operand_C [get_bd_pins alu_0/operand_C] [get_bd_pins general_registers_0/data_in]
  connect_bd_net -net alu_0_overflow [get_bd_pins alu_0/overflow] [get_bd_pins control_unit_0/overflow]
  connect_bd_net -net alu_0_underflow [get_bd_pins alu_0/underflow] [get_bd_pins control_unit_0/underflow]
  connect_bd_net -net alu_op_A_data_out [get_bd_pins alu_0/operand_A] [get_bd_pins alu_op_A/data_out]
  connect_bd_net -net alu_op_B_data_out [get_bd_pins alu_0/operand_B] [get_bd_pins alu_op_B/data_out]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins alu_0/clk] [get_bd_pins alu_op_A/clk] [get_bd_pins alu_op_B/clk] [get_bd_pins control_unit_0/clk] [get_bd_pins cu_ram_0/clk] [get_bd_pins general_registers_0/clk] [get_bd_pins program_memory_6/clk]
  connect_bd_net -net control_unit_0_alu_instruction [get_bd_pins alu_0/instruction] [get_bd_pins control_unit_0/alu_instruction]
  connect_bd_net -net control_unit_0_alu_register_enable [get_bd_pins control_unit_0/alu_register_enable] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net control_unit_0_output_data [get_bd_pins control_unit_0/output_data] [get_bd_pins multiplexer_1/in1]
  connect_bd_net -net control_unit_0_program_data_address [get_bd_pins control_unit_0/program_data_address] [get_bd_pins program_memory_6/program_data_address]
  connect_bd_net -net control_unit_0_ram_address [get_bd_pins control_unit_0/ram_address] [get_bd_pins cu_ram_0/address]
  connect_bd_net -net control_unit_0_ram_cu_select [get_bd_pins control_unit_0/ram_cu_select] [get_bd_pins multiplexer_1/sel]
  connect_bd_net -net control_unit_0_register_enable [get_bd_pins control_unit_0/register_enable] [get_bd_pins multiplexer_0/sel] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net control_unit_0_register_read [get_bd_pins control_unit_0/register_read] [get_bd_pins cu_ram_0/read] [get_bd_pins general_registers_0/read]
  connect_bd_net -net control_unit_0_register_select [get_bd_pins control_unit_0/register_select] [get_bd_pins general_registers_0/select_reg]
  connect_bd_net -net control_unit_0_register_write [get_bd_pins control_unit_0/register_write] [get_bd_pins cu_ram_0/write] [get_bd_pins general_registers_0/write]
  connect_bd_net -net cu_enable_1 [get_bd_ports cu_enable] [get_bd_pins control_unit_0/enable]
  connect_bd_net -net cu_ram_0_data_out [get_bd_pins cu_ram_0/data_out] [get_bd_pins multiplexer_0/in2]
  connect_bd_net -net general_registers_0_data_out [get_bd_pins general_registers_0/data_out] [get_bd_pins multiplexer_0/in1]
  connect_bd_net -net multiplexer_0_out [get_bd_ports gen_reg_data_out] [get_bd_pins alu_op_A/data_in] [get_bd_pins alu_op_B/data_in] [get_bd_pins multiplexer_0/outpt] [get_bd_pins multiplexer_1/in2]
  connect_bd_net -net multiplexer_1_out [get_bd_pins cu_ram_0/data_in] [get_bd_pins multiplexer_1/outpt]
  connect_bd_net -net program_memory_0_program_data [get_bd_pins control_unit_0/program_data] [get_bd_pins program_memory_6/program_data]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins alu_0/reset] [get_bd_pins alu_op_A/reset] [get_bd_pins alu_op_B/reset] [get_bd_pins control_unit_0/reset] [get_bd_pins cu_ram_0/reset] [get_bd_pins general_registers_0/reset]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins alu_op_A/enable] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins alu_op_B/enable] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins general_registers_0/enable] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins cu_ram_0/enable] [get_bd_pins xlslice_3/Dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


