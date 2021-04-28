//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Wed Apr 28 12:28:06 2021
//Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
//Command     : generate_target control_unit_tb_auto_bd_wrapper.bd
//Design      : control_unit_tb_auto_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module control_unit_tb_auto_bd_wrapper
   (clk,
    cu_enable,
    gen_reg_data_out,
    program_data,
    reset);
  input clk;
  input cu_enable;
  output [7:0]gen_reg_data_out;
  input [15:0]program_data;
  input reset;

  wire clk;
  wire cu_enable;
  wire [7:0]gen_reg_data_out;
  wire [15:0]program_data;
  wire reset;

  control_unit_tb_auto_bd control_unit_tb_auto_bd_i
       (.clk(clk),
        .cu_enable(cu_enable),
        .gen_reg_data_out(gen_reg_data_out),
        .program_data(program_data),
        .reset(reset));
endmodule
