// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:13 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_alu_op_B_0/full_testbench_bd_alu_op_B_0_stub.v
// Design      : full_testbench_bd_alu_op_B_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "alu_input_output_reg,Vivado 2020.2" *)
module full_testbench_bd_alu_op_B_0(data_in, data_out, enable, clk, reset)
/* synthesis syn_black_box black_box_pad_pin="data_in[7:0],data_out[7:0],enable,clk,reset" */;
  input [7:0]data_in;
  output [7:0]data_out;
  input enable;
  input clk;
  input reset;
endmodule
