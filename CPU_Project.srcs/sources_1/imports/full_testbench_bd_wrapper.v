//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri Mar  5 19:37:21 2021
//Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
//Command     : generate_target full_testbench_bd_wrapper.bd
//Design      : full_testbench_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module full_testbench_bd_wrapper
   (clk,
    cu_enable,
    gen_reg_data_out,
    reset);
  input clk;
  input cu_enable;
  output [7:0]gen_reg_data_out;
  input reset;

  wire clk;
  wire cu_enable;
  wire [7:0]gen_reg_data_out;
  wire reset;

  full_testbench_bd full_testbench_bd_i
       (.clk(clk),
        .cu_enable(cu_enable),
        .gen_reg_data_out(gen_reg_data_out),
        .reset(reset));
endmodule
