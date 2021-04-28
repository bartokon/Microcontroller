// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:21 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_multiplexer_0_0/full_testbench_bd_multiplexer_0_0_stub.v
// Design      : full_testbench_bd_multiplexer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "multiplexer,Vivado 2020.2" *)
module full_testbench_bd_multiplexer_0_0(sel, in1, in2, outpt)
/* synthesis syn_black_box black_box_pad_pin="sel[1:0],in1[7:0],in2[7:0],outpt[7:0]" */;
  input [1:0]sel;
  input [7:0]in1;
  input [7:0]in2;
  output [7:0]outpt;
endmodule
