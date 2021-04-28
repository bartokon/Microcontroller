// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:21 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_control_unit_0_0/full_testbench_bd_control_unit_0_0_stub.v
// Design      : full_testbench_bd_control_unit_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "control_unit,Vivado 2020.2" *)
module full_testbench_bd_control_unit_0_0(alu_instruction, alu_register_enable, 
  register_enable, register_write, register_read, register_select, program_data, 
  program_data_address, output_data, ram_address, overflow, underflow, A_bigger, B_bigger, 
  AB_same, ram_cu_select, enable, clk, reset)
/* synthesis syn_black_box black_box_pad_pin="alu_instruction[3:0],alu_register_enable[1:0],register_enable[1:0],register_write,register_read,register_select[3:0],program_data[15:0],program_data_address[15:0],output_data[7:0],ram_address[7:0],overflow,underflow,A_bigger,B_bigger,AB_same,ram_cu_select[1:0],enable,clk,reset" */;
  output [3:0]alu_instruction;
  output [1:0]alu_register_enable;
  output [1:0]register_enable;
  output register_write;
  output register_read;
  output [3:0]register_select;
  input [15:0]program_data;
  output [15:0]program_data_address;
  output [7:0]output_data;
  output [7:0]ram_address;
  input overflow;
  input underflow;
  input A_bigger;
  input B_bigger;
  input AB_same;
  output [1:0]ram_cu_select;
  input enable;
  input clk;
  input reset;
endmodule
