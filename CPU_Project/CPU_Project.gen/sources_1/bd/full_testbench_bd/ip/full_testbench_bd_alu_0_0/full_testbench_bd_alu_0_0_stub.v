// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:21 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_alu_0_0/full_testbench_bd_alu_0_0_stub.v
// Design      : full_testbench_bd_alu_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "alu,Vivado 2020.2" *)
module full_testbench_bd_alu_0_0(operand_A, operand_B, operand_C, overflow, 
  underflow, A_bigger, B_bigger, AB_same, instruction, clk, reset)
/* synthesis syn_black_box black_box_pad_pin="operand_A[7:0],operand_B[7:0],operand_C[7:0],overflow,underflow,A_bigger,B_bigger,AB_same,instruction[3:0],clk,reset" */;
  input [7:0]operand_A;
  input [7:0]operand_B;
  output [7:0]operand_C;
  output overflow;
  output underflow;
  output A_bigger;
  output B_bigger;
  output AB_same;
  input [3:0]instruction;
  input clk;
  input reset;
endmodule
