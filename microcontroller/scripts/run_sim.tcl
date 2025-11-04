#!/usr/bin/tclsh
#===============================================================================
# Vivado Simulation Script for Microcontroller
#
# This script automates the complete simulation workflow:
# 1. Creates a new Vivado project
# 2. Adds all RTL source files
# 3. Adds testbench files
# 4. Compiles the design
# 5. Runs behavioral simulation
# 6. Displays waveforms
#
# Usage:
#   vivado -mode batch -source run_sim.tcl
#   or
#   vivado -mode gui -source run_sim.tcl
#===============================================================================

# Set script directory
set script_dir [file dirname [info script]]
set project_dir [file normalize "$script_dir/.."]
set rtl_dir "$project_dir/rtl"
set sim_dir "$project_dir/sim"

puts "=========================================="
puts "Microcontroller Simulation Setup"
puts "=========================================="
puts "Project Directory: $project_dir"
puts "RTL Directory: $rtl_dir"
puts "Simulation Directory: $sim_dir"
puts "=========================================="

#===============================================================================
# Create Project
#===============================================================================
set project_name "microcontroller_sim"
set part "xc7z007sclg400-1"  # MiniZed board part

# Close any existing project
catch {close_project}

# Create new project in simulation directory
create_project $project_name "$project_dir/vivado_sim" -part $part -force

puts "\n[INFO] Created project: $project_name"

#===============================================================================
# Add RTL Source Files
#===============================================================================
puts "\n[INFO] Adding RTL source files..."

# Add parameter file first (needed by all other files)
add_files "$rtl_dir/params.v"

# Add core modules
add_files "$rtl_dir/core/alu.v"
add_files "$rtl_dir/core/control_unit.v"
add_files "$rtl_dir/core/general_registers.v"
add_files "$rtl_dir/core/alu_input_output_reg.v"

# Add memory modules
add_files "$rtl_dir/memory/program_memory.v"
add_files "$rtl_dir/memory/cu_ram.v"

# Add utility modules
add_files "$rtl_dir/utils/multiplexer.v"

# Add top-level module
add_files "$rtl_dir/microcontroller_top.v"

puts "[INFO] RTL files added successfully"

#===============================================================================
# Add Simulation Files
#===============================================================================
puts "\n[INFO] Adding simulation files..."

# Add testbench files (if they exist)
if {[file exists "$sim_dir/tb_microcontroller.v"]} {
    add_files -fileset sim_1 "$sim_dir/tb_microcontroller.v"
    puts "[INFO] Added tb_microcontroller.v"
}

if {[file exists "$sim_dir/tb_alu.v"]} {
    add_files -fileset sim_1 "$sim_dir/tb_alu.v"
    puts "[INFO] Added tb_alu.v"
}

if {[file exists "$sim_dir/tb_control_unit.v"]} {
    add_files -fileset sim_1 "$sim_dir/tb_control_unit.v"
    puts "[INFO] Added tb_control_unit.v"
}

#===============================================================================
# Set Simulation Properties
#===============================================================================
puts "\n[INFO] Configuring simulation settings..."

# Set top module for simulation
if {[file exists "$sim_dir/tb_microcontroller.v"]} {
    set_property top tb_microcontroller [get_filesets sim_1]
} else {
    puts "[WARNING] No testbench found. You'll need to set the top module manually."
}

# Set simulation runtime
set_property -name {xsim.simulate.runtime} -value {1000ns} -objects [get_filesets sim_1]

# Set simulation to use Verilog 2001
set_property verilog_define {} [get_filesets sim_1]

puts "[INFO] Simulation settings configured"

#===============================================================================
# Update Compile Order
#===============================================================================
puts "\n[INFO] Updating compile order..."
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

#===============================================================================
# Run Simulation (Optional - uncomment to auto-run)
#===============================================================================
puts "\n[INFO] Setup complete!"
puts "=========================================="
puts "To run simulation, execute:"
puts "  launch_simulation"
puts "  run all"
puts "=========================================="

# Uncomment the following lines to automatically run simulation
# puts "\n[INFO] Launching simulation..."
# launch_simulation
# run all
# puts "[INFO] Simulation complete!"

puts "\n[INFO] Project setup complete. You can now:"
puts "  1. Open the project in Vivado GUI: vivado vivado_sim/$project_name.xpr"
puts "  2. Run simulation from Vivado: Flow > Run Simulation > Run Behavioral Simulation"
puts "  3. Or use TCL commands: launch_simulation; run all"
