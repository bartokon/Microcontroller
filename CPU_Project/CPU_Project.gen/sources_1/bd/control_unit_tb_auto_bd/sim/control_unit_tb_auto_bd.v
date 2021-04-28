//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Wed Apr 28 12:28:06 2021
//Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
//Command     : generate_target control_unit_tb_auto_bd.bd
//Design      : control_unit_tb_auto_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "control_unit_tb_auto_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=control_unit_tb_auto_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=5,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "control_unit_tb_auto_bd.hwdef" *) 
module control_unit_tb_auto_bd
   (clk,
    cu_enable,
    gen_reg_data_out,
    program_data,
    reset);
  input clk;
  input cu_enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GEN_REG_DATA_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GEN_REG_DATA_OUT, LAYERED_METADATA undef" *) output [7:0]gen_reg_data_out;
  input [15:0]program_data;
  input reset;

  wire alu_0_AB_same;
  wire alu_0_A_bigger;
  wire alu_0_B_bigger;
  wire [7:0]alu_0_operand_C;
  wire alu_0_overflow;
  wire alu_0_underflow;
  wire [7:0]alu_op_A_data_out;
  wire [7:0]alu_op_B_data_out;
  wire clk_1;
  wire [3:0]control_unit_0_alu_instruction;
  wire [1:0]control_unit_0_alu_register_enable;
  wire [1:0]control_unit_0_register_enable;
  wire control_unit_0_register_read;
  wire [3:0]control_unit_0_register_select;
  wire control_unit_0_register_write;
  wire cu_enable_1;
  wire [7:0]general_registers_0_data_out;
  wire [15:0]program_data_1;
  wire reset_1;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;

  assign clk_1 = clk;
  assign cu_enable_1 = cu_enable;
  assign gen_reg_data_out[7:0] = general_registers_0_data_out;
  assign program_data_1 = program_data[15:0];
  assign reset_1 = reset;
  control_unit_tb_auto_bd_alu_0_0 alu_0
       (.AB_same(alu_0_AB_same),
        .A_bigger(alu_0_A_bigger),
        .B_bigger(alu_0_B_bigger),
        .clk(clk_1),
        .instruction(control_unit_0_alu_instruction),
        .operand_A(alu_op_A_data_out),
        .operand_B(alu_op_B_data_out),
        .operand_C(alu_0_operand_C),
        .overflow(alu_0_overflow),
        .reset(reset_1),
        .underflow(alu_0_underflow));
  control_unit_tb_auto_bd_alu_input_output_reg_0_0 alu_op_A
       (.clk(clk_1),
        .data_in(general_registers_0_data_out),
        .data_out(alu_op_A_data_out),
        .enable(xlslice_0_Dout),
        .reset(reset_1));
  control_unit_tb_auto_bd_alu_input_output_reg_0_1 alu_op_B
       (.clk(clk_1),
        .data_in(general_registers_0_data_out),
        .data_out(alu_op_B_data_out),
        .enable(xlslice_1_Dout),
        .reset(reset_1));
  control_unit_tb_auto_bd_control_unit_0_0 control_unit_0
       (.AB_same(alu_0_AB_same),
        .A_bigger(alu_0_A_bigger),
        .B_bigger(alu_0_B_bigger),
        .alu_instruction(control_unit_0_alu_instruction),
        .alu_register_enable(control_unit_0_alu_register_enable),
        .clk(clk_1),
        .enable(cu_enable_1),
        .overflow(alu_0_overflow),
        .program_data(program_data_1),
        .register_enable(control_unit_0_register_enable),
        .register_read(control_unit_0_register_read),
        .register_select(control_unit_0_register_select),
        .register_write(control_unit_0_register_write),
        .reset(reset_1),
        .underflow(alu_0_underflow));
  control_unit_tb_auto_bd_general_registers_0_0 general_registers_0
       (.clk(clk_1),
        .data_in(alu_0_operand_C),
        .data_out(general_registers_0_data_out),
        .enable(control_unit_0_register_enable[0]),
        .read(control_unit_0_register_read),
        .reset(reset_1),
        .select_reg(control_unit_0_register_select),
        .write(control_unit_0_register_write));
  control_unit_tb_auto_bd_xlslice_0_0 xlslice_0
       (.Din(control_unit_0_alu_register_enable),
        .Dout(xlslice_0_Dout));
  control_unit_tb_auto_bd_xlslice_1_0 xlslice_1
       (.Din(control_unit_0_alu_register_enable),
        .Dout(xlslice_1_Dout));
endmodule
