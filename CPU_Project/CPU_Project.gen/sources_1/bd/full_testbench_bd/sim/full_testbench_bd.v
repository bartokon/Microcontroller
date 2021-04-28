//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri Mar  5 19:37:21 2021
//Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
//Command     : generate_target full_testbench_bd.bd
//Design      : full_testbench_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "full_testbench_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=full_testbench_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=9,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "full_testbench_bd.hwdef" *) 
module full_testbench_bd
   (clk,
    cu_enable,
    gen_reg_data_out,
    reset);
  input clk;
  input cu_enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GEN_REG_DATA_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GEN_REG_DATA_OUT, LAYERED_METADATA undef" *) output [7:0]gen_reg_data_out;
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
  wire [7:0]control_unit_0_output_data;
  wire [15:0]control_unit_0_program_data_address;
  wire [7:0]control_unit_0_ram_address;
  wire [1:0]control_unit_0_ram_cu_select;
  wire [1:0]control_unit_0_register_enable;
  wire control_unit_0_register_read;
  wire [3:0]control_unit_0_register_select;
  wire control_unit_0_register_write;
  wire cu_enable_1;
  wire [7:0]cu_ram_0_data_out;
  wire [7:0]general_registers_0_data_out;
  wire [7:0]multiplexer_0_out;
  wire [7:0]multiplexer_1_out;
  wire [15:0]program_memory_0_program_data;
  wire reset_1;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [0:0]xlslice_3_Dout;

  assign clk_1 = clk;
  assign cu_enable_1 = cu_enable;
  assign gen_reg_data_out[7:0] = multiplexer_0_out;
  assign reset_1 = reset;
  full_testbench_bd_alu_0_0 alu_0
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
  full_testbench_bd_alu_op_A_0 alu_op_A
       (.clk(clk_1),
        .data_in(multiplexer_0_out),
        .data_out(alu_op_A_data_out),
        .enable(xlslice_0_Dout),
        .reset(reset_1));
  full_testbench_bd_alu_op_B_0 alu_op_B
       (.clk(clk_1),
        .data_in(multiplexer_0_out),
        .data_out(alu_op_B_data_out),
        .enable(xlslice_1_Dout),
        .reset(reset_1));
  full_testbench_bd_control_unit_0_0 control_unit_0
       (.AB_same(alu_0_AB_same),
        .A_bigger(alu_0_A_bigger),
        .B_bigger(alu_0_B_bigger),
        .alu_instruction(control_unit_0_alu_instruction),
        .alu_register_enable(control_unit_0_alu_register_enable),
        .clk(clk_1),
        .enable(cu_enable_1),
        .output_data(control_unit_0_output_data),
        .overflow(alu_0_overflow),
        .program_data(program_memory_0_program_data),
        .program_data_address(control_unit_0_program_data_address),
        .ram_address(control_unit_0_ram_address),
        .ram_cu_select(control_unit_0_ram_cu_select),
        .register_enable(control_unit_0_register_enable),
        .register_read(control_unit_0_register_read),
        .register_select(control_unit_0_register_select),
        .register_write(control_unit_0_register_write),
        .reset(reset_1),
        .underflow(alu_0_underflow));
  full_testbench_bd_cu_ram_0_0 cu_ram_0
       (.address(control_unit_0_ram_address),
        .clk(clk_1),
        .data_in(multiplexer_1_out),
        .data_out(cu_ram_0_data_out),
        .enable(xlslice_3_Dout),
        .read(control_unit_0_register_read),
        .reset(reset_1),
        .write(control_unit_0_register_write));
  full_testbench_bd_general_registers_0_0 general_registers_0
       (.clk(clk_1),
        .data_in(alu_0_operand_C),
        .data_out(general_registers_0_data_out),
        .enable(xlslice_2_Dout),
        .read(control_unit_0_register_read),
        .reset(reset_1),
        .select_reg(control_unit_0_register_select),
        .write(control_unit_0_register_write));
  full_testbench_bd_multiplexer_0_0 multiplexer_0
       (.in1(general_registers_0_data_out),
        .in2(cu_ram_0_data_out),
        .outpt(multiplexer_0_out),
        .sel(control_unit_0_register_enable));
  full_testbench_bd_multiplexer_0_1 multiplexer_1
       (.in1(control_unit_0_output_data),
        .in2(multiplexer_0_out),
        .outpt(multiplexer_1_out),
        .sel(control_unit_0_ram_cu_select));
  full_testbench_bd_program_memory_0_0 program_memory_6
       (.clk(clk_1),
        .program_data(program_memory_0_program_data),
        .program_data_address(control_unit_0_program_data_address));
  full_testbench_bd_xlslice_0_0 xlslice_0
       (.Din(control_unit_0_alu_register_enable),
        .Dout(xlslice_0_Dout));
  full_testbench_bd_xlslice_1_0 xlslice_1
       (.Din(control_unit_0_alu_register_enable),
        .Dout(xlslice_1_Dout));
  full_testbench_bd_xlslice_0_1 xlslice_2
       (.Din(control_unit_0_register_enable),
        .Dout(xlslice_2_Dout));
  full_testbench_bd_xlslice_1_1 xlslice_3
       (.Din(control_unit_0_register_enable),
        .Dout(xlslice_3_Dout));
endmodule
