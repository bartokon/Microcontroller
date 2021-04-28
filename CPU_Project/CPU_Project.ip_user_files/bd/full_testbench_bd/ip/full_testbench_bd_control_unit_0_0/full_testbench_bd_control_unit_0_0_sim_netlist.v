// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:21 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_control_unit_0_0/full_testbench_bd_control_unit_0_0_sim_netlist.v
// Design      : full_testbench_bd_control_unit_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "full_testbench_bd_control_unit_0_0,control_unit,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "control_unit,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module full_testbench_bd_control_unit_0_0
   (alu_instruction,
    alu_register_enable,
    register_enable,
    register_write,
    register_read,
    register_select,
    program_data,
    program_data_address,
    output_data,
    ram_address,
    overflow,
    underflow,
    A_bigger,
    B_bigger,
    AB_same,
    ram_cu_select,
    enable,
    clk,
    reset);
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;

  wire \<const0> ;
  wire AB_same;
  wire A_bigger;
  wire B_bigger;
  wire [2:0]\^alu_instruction ;
  wire [1:0]alu_register_enable;
  wire clk;
  wire enable;
  wire inst_n_18;
  wire [7:0]output_data;
  wire \output_data[7]_INST_0_i_1_n_0 ;
  wire \output_data[7]_INST_0_i_2_n_0 ;
  wire overflow;
  wire [15:0]program_data;
  wire [15:0]program_data_address;
  wire [7:0]ram_address;
  wire [1:0]ram_cu_select;
  wire [1:0]register_enable;
  wire register_read;
  wire [3:0]register_select;
  wire register_write;
  wire reset;
  wire underflow;

  assign alu_instruction[3] = \<const0> ;
  assign alu_instruction[2:0] = \^alu_instruction [2:0];
  GND GND
       (.G(\<const0> ));
  full_testbench_bd_control_unit_0_0_control_unit inst
       (.AB_same(AB_same),
        .A_bigger(A_bigger),
        .B_bigger(B_bigger),
        .E(inst_n_18),
        .alu_instruction(\^alu_instruction ),
        .alu_register_enable(alu_register_enable),
        .clk(clk),
        .enable(enable),
        .output_data(output_data),
        .output_data_0_sp_1(\output_data[7]_INST_0_i_1_n_0 ),
        .overflow(overflow),
        .program_data(program_data),
        .program_data_address(program_data_address),
        .ram_address(ram_address),
        .ram_cu_select(ram_cu_select),
        .register_enable(register_enable),
        .register_read(register_read),
        .register_select(register_select),
        .register_write(register_write),
        .reset(reset),
        .underflow(underflow));
  FDRE #(
    .INIT(1'b1)) 
    \output_data[7]_INST_0_i_1 
       (.C(clk),
        .CE(inst_n_18),
        .D(\output_data[7]_INST_0_i_2_n_0 ),
        .Q(\output_data[7]_INST_0_i_1_n_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \output_data[7]_INST_0_i_2 
       (.I0(program_data[1]),
        .I1(program_data[0]),
        .I2(program_data[3]),
        .I3(program_data[2]),
        .I4(program_data[15]),
        .I5(program_data[14]),
        .O(\output_data[7]_INST_0_i_2_n_0 ));
endmodule

(* ORIG_REF_NAME = "control_unit" *) 
module full_testbench_bd_control_unit_0_0_control_unit
   (program_data_address,
    register_write,
    register_read,
    E,
    output_data,
    alu_instruction,
    alu_register_enable,
    register_enable,
    register_select,
    ram_address,
    ram_cu_select,
    clk,
    enable,
    reset,
    program_data,
    overflow,
    underflow,
    A_bigger,
    B_bigger,
    AB_same,
    output_data_0_sp_1);
  output [15:0]program_data_address;
  output register_write;
  output register_read;
  output [0:0]E;
  output [7:0]output_data;
  output [2:0]alu_instruction;
  output [1:0]alu_register_enable;
  output [1:0]register_enable;
  output [3:0]register_select;
  output [7:0]ram_address;
  output [1:0]ram_cu_select;
  input clk;
  input enable;
  input reset;
  input [15:0]program_data;
  input overflow;
  input underflow;
  input A_bigger;
  input B_bigger;
  input AB_same;
  input output_data_0_sp_1;

  wire AB_same;
  wire A_bigger;
  wire B_bigger;
  wire [0:0]E;
  wire [2:0]alu_instruction;
  wire \alu_instruction[0]_i_1_n_0 ;
  wire \alu_instruction[0]_i_2_n_0 ;
  wire \alu_instruction[1]_i_1_n_0 ;
  wire \alu_instruction[1]_i_2_n_0 ;
  wire \alu_instruction[2]_i_10_n_0 ;
  wire \alu_instruction[2]_i_11_n_0 ;
  wire \alu_instruction[2]_i_12_n_0 ;
  wire \alu_instruction[2]_i_13_n_0 ;
  wire \alu_instruction[2]_i_14_n_0 ;
  wire \alu_instruction[2]_i_1_n_0 ;
  wire \alu_instruction[2]_i_2_n_0 ;
  wire \alu_instruction[2]_i_3_n_0 ;
  wire \alu_instruction[2]_i_4_n_0 ;
  wire \alu_instruction[2]_i_5_n_0 ;
  wire \alu_instruction[2]_i_6_n_0 ;
  wire \alu_instruction[2]_i_7_n_0 ;
  wire \alu_instruction[2]_i_8_n_0 ;
  wire \alu_instruction[2]_i_9_n_0 ;
  wire [1:0]alu_register_enable;
  wire \alu_register_enable[1]_i_1_n_0 ;
  wire \alu_register_enable[1]_i_2_n_0 ;
  wire \alu_register_enable[1]_i_4_n_0 ;
  wire [1:0]alu_register_enable_0;
  wire clk;
  wire enable;
  wire [7:0]output_data;
  wire output_data_0_sn_1;
  wire \output_data_tristate_oe[7]_i_2_n_0 ;
  wire \output_data_tristate_oe[7]_i_3_n_0 ;
  wire \output_data_tristate_oe[7]_i_4_n_0 ;
  wire \output_data_tristate_oe[7]_i_5_n_0 ;
  wire \output_data_tristate_oe[7]_i_6_n_0 ;
  wire \output_data_tristate_oe[7]_i_7_n_0 ;
  wire \output_data_tristate_oe_reg_n_0_[0] ;
  wire \output_data_tristate_oe_reg_n_0_[1] ;
  wire \output_data_tristate_oe_reg_n_0_[2] ;
  wire \output_data_tristate_oe_reg_n_0_[3] ;
  wire \output_data_tristate_oe_reg_n_0_[4] ;
  wire \output_data_tristate_oe_reg_n_0_[5] ;
  wire \output_data_tristate_oe_reg_n_0_[6] ;
  wire \output_data_tristate_oe_reg_n_0_[7] ;
  wire overflow;
  wire [15:0]program_counter;
  wire program_counter0_carry__0_n_0;
  wire program_counter0_carry__0_n_1;
  wire program_counter0_carry__0_n_2;
  wire program_counter0_carry__0_n_3;
  wire program_counter0_carry__0_n_4;
  wire program_counter0_carry__0_n_5;
  wire program_counter0_carry__0_n_6;
  wire program_counter0_carry__0_n_7;
  wire program_counter0_carry__1_n_0;
  wire program_counter0_carry__1_n_1;
  wire program_counter0_carry__1_n_2;
  wire program_counter0_carry__1_n_3;
  wire program_counter0_carry__1_n_4;
  wire program_counter0_carry__1_n_5;
  wire program_counter0_carry__1_n_6;
  wire program_counter0_carry__1_n_7;
  wire program_counter0_carry__2_n_2;
  wire program_counter0_carry__2_n_3;
  wire program_counter0_carry__2_n_5;
  wire program_counter0_carry__2_n_6;
  wire program_counter0_carry__2_n_7;
  wire program_counter0_carry_n_0;
  wire program_counter0_carry_n_1;
  wire program_counter0_carry_n_2;
  wire program_counter0_carry_n_3;
  wire program_counter0_carry_n_4;
  wire program_counter0_carry_n_5;
  wire program_counter0_carry_n_6;
  wire program_counter0_carry_n_7;
  wire \program_counter[15]_i_2_n_0 ;
  wire \program_counter[15]_i_3_n_0 ;
  wire \program_counter[15]_i_4_n_0 ;
  wire \program_counter[15]_i_5_n_0 ;
  wire \program_counter[15]_i_6_n_0 ;
  wire \program_counter[7]_i_2_n_0 ;
  wire \program_counter[7]_i_3_n_0 ;
  wire \program_counter[7]_i_4_n_0 ;
  wire \program_counter[7]_i_5_n_0 ;
  wire \program_counter[7]_i_6_n_0 ;
  wire [15:0]program_data;
  wire [15:0]program_data_address;
  wire [7:0]ram_address;
  wire \ram_address[7]_i_1_n_0 ;
  wire [1:0]ram_cu_select;
  wire \ram_cu_select[0]_i_1_n_0 ;
  wire \ram_cu_select[1]_i_1_n_0 ;
  wire \ram_cu_select[1]_i_2_n_0 ;
  wire [1:0]register_enable;
  wire [1:0]register_enable_1;
  wire register_read;
  wire register_read_i_1_n_0;
  wire [3:0]register_select;
  wire \register_select[3]_i_1_n_0 ;
  wire \register_select[3]_i_2_n_0 ;
  wire \register_select[3]_i_3_n_0 ;
  wire \register_select[3]_i_4_n_0 ;
  wire \register_select[3]_i_5_n_0 ;
  wire register_write;
  wire register_write_2;
  wire register_write_i_1_n_0;
  wire register_write_i_3_n_0;
  wire register_write_i_4_n_0;
  wire reset;
  wire underflow;
  wire [3:2]NLW_program_counter0_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_program_counter0_carry__2_O_UNCONNECTED;

  assign output_data_0_sn_1 = output_data_0_sp_1;
  LUT6 #(
    .INIT(64'h0000000002FE0202)) 
    \alu_instruction[0]_i_1 
       (.I0(alu_instruction[0]),
        .I1(\alu_instruction[2]_i_2_n_0 ),
        .I2(\alu_instruction[2]_i_3_n_0 ),
        .I3(\alu_instruction[2]_i_4_n_0 ),
        .I4(\alu_instruction[0]_i_2_n_0 ),
        .I5(\alu_register_enable[1]_i_1_n_0 ),
        .O(\alu_instruction[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \alu_instruction[0]_i_2 
       (.I0(\register_select[3]_i_4_n_0 ),
        .I1(program_data[12]),
        .I2(program_data[15]),
        .I3(program_data[11]),
        .I4(program_data[10]),
        .I5(program_data[9]),
        .O(\alu_instruction[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002FE0202)) 
    \alu_instruction[1]_i_1 
       (.I0(alu_instruction[1]),
        .I1(\alu_instruction[2]_i_2_n_0 ),
        .I2(\alu_instruction[2]_i_3_n_0 ),
        .I3(\alu_instruction[2]_i_4_n_0 ),
        .I4(\alu_instruction[1]_i_2_n_0 ),
        .I5(\alu_register_enable[1]_i_1_n_0 ),
        .O(\alu_instruction[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \alu_instruction[1]_i_2 
       (.I0(\register_select[3]_i_4_n_0 ),
        .I1(program_data[13]),
        .I2(program_data[15]),
        .I3(program_data[11]),
        .I4(program_data[10]),
        .I5(program_data[9]),
        .O(\alu_instruction[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002FE0202)) 
    \alu_instruction[2]_i_1 
       (.I0(alu_instruction[2]),
        .I1(\alu_instruction[2]_i_2_n_0 ),
        .I2(\alu_instruction[2]_i_3_n_0 ),
        .I3(\alu_instruction[2]_i_4_n_0 ),
        .I4(\alu_instruction[2]_i_5_n_0 ),
        .I5(\alu_register_enable[1]_i_1_n_0 ),
        .O(\alu_instruction[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \alu_instruction[2]_i_10 
       (.I0(reset),
        .I1(enable),
        .I2(program_data[14]),
        .O(\alu_instruction[2]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFBF08)) 
    \alu_instruction[2]_i_11 
       (.I0(program_data[1]),
        .I1(program_data[12]),
        .I2(program_data[13]),
        .I3(program_data[2]),
        .I4(program_data[3]),
        .O(\alu_instruction[2]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \alu_instruction[2]_i_12 
       (.I0(program_data[2]),
        .I1(program_data[3]),
        .I2(program_data[12]),
        .O(\alu_instruction[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h002A2A2A)) 
    \alu_instruction[2]_i_13 
       (.I0(program_data[0]),
        .I1(B_bigger),
        .I2(program_data[2]),
        .I3(program_data[1]),
        .I4(AB_same),
        .O(\alu_instruction[2]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h02020F02)) 
    \alu_instruction[2]_i_14 
       (.I0(program_data[2]),
        .I1(A_bigger),
        .I2(program_data[0]),
        .I3(program_data[1]),
        .I4(underflow),
        .O(\alu_instruction[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h44444440CCCCCCCC)) 
    \alu_instruction[2]_i_2 
       (.I0(program_data[14]),
        .I1(\alu_register_enable[1]_i_2_n_0 ),
        .I2(\alu_instruction[2]_i_6_n_0 ),
        .I3(\alu_instruction[2]_i_7_n_0 ),
        .I4(\alu_instruction[2]_i_8_n_0 ),
        .I5(program_data[15]),
        .O(\alu_instruction[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880888088808080)) 
    \alu_instruction[2]_i_3 
       (.I0(\alu_instruction[2]_i_9_n_0 ),
        .I1(\alu_instruction[2]_i_10_n_0 ),
        .I2(\alu_instruction[2]_i_11_n_0 ),
        .I3(\alu_instruction[2]_i_12_n_0 ),
        .I4(\alu_instruction[2]_i_13_n_0 ),
        .I5(\alu_instruction[2]_i_14_n_0 ),
        .O(\alu_instruction[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFEFE)) 
    \alu_instruction[2]_i_4 
       (.I0(\alu_instruction[2]_i_8_n_0 ),
        .I1(program_data[3]),
        .I2(program_data[2]),
        .I3(program_data[14]),
        .I4(program_data[13]),
        .O(\alu_instruction[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \alu_instruction[2]_i_5 
       (.I0(\register_select[3]_i_4_n_0 ),
        .I1(program_data[14]),
        .I2(program_data[15]),
        .I3(program_data[11]),
        .I4(program_data[10]),
        .I5(program_data[9]),
        .O(\alu_instruction[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \alu_instruction[2]_i_6 
       (.I0(program_data[12]),
        .I1(program_data[13]),
        .O(\alu_instruction[2]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \alu_instruction[2]_i_7 
       (.I0(program_data[9]),
        .I1(program_data[10]),
        .I2(program_data[11]),
        .O(\alu_instruction[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \alu_instruction[2]_i_8 
       (.I0(program_data[6]),
        .I1(program_data[8]),
        .I2(program_data[7]),
        .I3(program_data[4]),
        .I4(program_data[5]),
        .O(\alu_instruction[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFBFFFF)) 
    \alu_instruction[2]_i_9 
       (.I0(program_data[1]),
        .I1(overflow),
        .I2(program_data[3]),
        .I3(program_data[2]),
        .I4(program_data[13]),
        .O(\alu_instruction[2]_i_9_n_0 ));
  FDRE \alu_instruction_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\alu_instruction[0]_i_1_n_0 ),
        .Q(alu_instruction[0]),
        .R(1'b0));
  FDRE \alu_instruction_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\alu_instruction[1]_i_1_n_0 ),
        .Q(alu_instruction[1]),
        .R(1'b0));
  FDRE \alu_instruction_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\alu_instruction[2]_i_1_n_0 ),
        .Q(alu_instruction[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0000F444)) 
    \alu_register_enable[0]_i_1 
       (.I0(\alu_register_enable[1]_i_4_n_0 ),
        .I1(program_data[12]),
        .I2(register_enable_1[1]),
        .I3(program_data[0]),
        .I4(program_data[13]),
        .O(alu_register_enable_0[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \alu_register_enable[1]_i_1 
       (.I0(enable),
        .I1(reset),
        .O(\alu_register_enable[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \alu_register_enable[1]_i_2 
       (.I0(enable),
        .I1(reset),
        .O(\alu_register_enable[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h1111F000)) 
    \alu_register_enable[1]_i_3 
       (.I0(\alu_register_enable[1]_i_4_n_0 ),
        .I1(program_data[12]),
        .I2(register_enable_1[1]),
        .I3(program_data[1]),
        .I4(program_data[13]),
        .O(alu_register_enable_0[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \alu_register_enable[1]_i_4 
       (.I0(program_data[15]),
        .I1(\alu_instruction[2]_i_8_n_0 ),
        .I2(program_data[11]),
        .I3(program_data[10]),
        .I4(program_data[9]),
        .I5(program_data[14]),
        .O(\alu_register_enable[1]_i_4_n_0 ));
  FDRE \alu_register_enable_reg[0] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(alu_register_enable_0[0]),
        .Q(alu_register_enable[0]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \alu_register_enable_reg[1] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(alu_register_enable_0[1]),
        .Q(alu_register_enable[1]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[0]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[0] ),
        .I1(output_data_0_sn_1),
        .O(output_data[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[1]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[1] ),
        .I1(output_data_0_sn_1),
        .O(output_data[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[2]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[2] ),
        .I1(output_data_0_sn_1),
        .O(output_data[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[3]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[3] ),
        .I1(output_data_0_sn_1),
        .O(output_data[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[4]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[4] ),
        .I1(output_data_0_sn_1),
        .O(output_data[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[5]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[5] ),
        .I1(output_data_0_sn_1),
        .O(output_data[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[6]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[6] ),
        .I1(output_data_0_sn_1),
        .O(output_data[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output_data[7]_INST_0 
       (.I0(\output_data_tristate_oe_reg_n_0_[7] ),
        .I1(output_data_0_sn_1),
        .O(output_data[7]));
  LUT6 #(
    .INIT(64'hEE00EE00F0000000)) 
    \output_data_tristate_oe[7]_i_1 
       (.I0(\output_data_tristate_oe[7]_i_2_n_0 ),
        .I1(\output_data_tristate_oe[7]_i_3_n_0 ),
        .I2(register_write_i_3_n_0),
        .I3(\alu_register_enable[1]_i_2_n_0 ),
        .I4(\output_data_tristate_oe[7]_i_4_n_0 ),
        .I5(\output_data_tristate_oe[7]_i_5_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'h7777777777777770)) 
    \output_data_tristate_oe[7]_i_2 
       (.I0(program_data[14]),
        .I1(program_data[15]),
        .I2(program_data[1]),
        .I3(\alu_instruction[2]_i_7_n_0 ),
        .I4(\alu_instruction[2]_i_8_n_0 ),
        .I5(\output_data_tristate_oe[7]_i_6_n_0 ),
        .O(\output_data_tristate_oe[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF040F0404)) 
    \output_data_tristate_oe[7]_i_3 
       (.I0(underflow),
        .I1(program_data[1]),
        .I2(program_data[0]),
        .I3(A_bigger),
        .I4(program_data[2]),
        .I5(\alu_instruction[2]_i_13_n_0 ),
        .O(\output_data_tristate_oe[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hEEFEFFFF)) 
    \output_data_tristate_oe[7]_i_4 
       (.I0(program_data[3]),
        .I1(program_data[2]),
        .I2(program_data[12]),
        .I3(program_data[13]),
        .I4(program_data[14]),
        .O(\output_data_tristate_oe[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h40550000)) 
    \output_data_tristate_oe[7]_i_5 
       (.I0(program_data[3]),
        .I1(program_data[12]),
        .I2(program_data[13]),
        .I3(program_data[15]),
        .I4(\output_data_tristate_oe[7]_i_7_n_0 ),
        .O(\output_data_tristate_oe[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFEAA)) 
    \output_data_tristate_oe[7]_i_6 
       (.I0(program_data[2]),
        .I1(program_data[15]),
        .I2(program_data[14]),
        .I3(program_data[13]),
        .O(\output_data_tristate_oe[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7D7F)) 
    \output_data_tristate_oe[7]_i_7 
       (.I0(program_data[15]),
        .I1(program_data[2]),
        .I2(program_data[1]),
        .I3(overflow),
        .O(\output_data_tristate_oe[7]_i_7_n_0 ));
  FDRE \output_data_tristate_oe_reg[0] 
       (.C(clk),
        .CE(E),
        .D(program_data[4]),
        .Q(\output_data_tristate_oe_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[1] 
       (.C(clk),
        .CE(E),
        .D(program_data[5]),
        .Q(\output_data_tristate_oe_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[2] 
       (.C(clk),
        .CE(E),
        .D(program_data[6]),
        .Q(\output_data_tristate_oe_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[3] 
       (.C(clk),
        .CE(E),
        .D(program_data[7]),
        .Q(\output_data_tristate_oe_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[4] 
       (.C(clk),
        .CE(E),
        .D(program_data[8]),
        .Q(\output_data_tristate_oe_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[5] 
       (.C(clk),
        .CE(E),
        .D(program_data[9]),
        .Q(\output_data_tristate_oe_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[6] 
       (.C(clk),
        .CE(E),
        .D(program_data[10]),
        .Q(\output_data_tristate_oe_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \output_data_tristate_oe_reg[7] 
       (.C(clk),
        .CE(E),
        .D(program_data[11]),
        .Q(\output_data_tristate_oe_reg_n_0_[7] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 program_counter0_carry
       (.CI(1'b0),
        .CO({program_counter0_carry_n_0,program_counter0_carry_n_1,program_counter0_carry_n_2,program_counter0_carry_n_3}),
        .CYINIT(program_data_address[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({program_counter0_carry_n_4,program_counter0_carry_n_5,program_counter0_carry_n_6,program_counter0_carry_n_7}),
        .S(program_data_address[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 program_counter0_carry__0
       (.CI(program_counter0_carry_n_0),
        .CO({program_counter0_carry__0_n_0,program_counter0_carry__0_n_1,program_counter0_carry__0_n_2,program_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({program_counter0_carry__0_n_4,program_counter0_carry__0_n_5,program_counter0_carry__0_n_6,program_counter0_carry__0_n_7}),
        .S(program_data_address[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 program_counter0_carry__1
       (.CI(program_counter0_carry__0_n_0),
        .CO({program_counter0_carry__1_n_0,program_counter0_carry__1_n_1,program_counter0_carry__1_n_2,program_counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({program_counter0_carry__1_n_4,program_counter0_carry__1_n_5,program_counter0_carry__1_n_6,program_counter0_carry__1_n_7}),
        .S(program_data_address[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 program_counter0_carry__2
       (.CI(program_counter0_carry__1_n_0),
        .CO({NLW_program_counter0_carry__2_CO_UNCONNECTED[3:2],program_counter0_carry__2_n_2,program_counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_program_counter0_carry__2_O_UNCONNECTED[3],program_counter0_carry__2_n_5,program_counter0_carry__2_n_6,program_counter0_carry__2_n_7}),
        .S({1'b0,program_data_address[15:13]}));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF444)) 
    \program_counter[0]_i_1 
       (.I0(program_data_address[0]),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[4]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[10]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__1_n_6),
        .O(program_counter[10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[11]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__1_n_5),
        .O(program_counter[11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[12]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__1_n_4),
        .O(program_counter[12]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[13]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__2_n_7),
        .O(program_counter[13]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[14]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__2_n_6),
        .O(program_counter[14]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[15]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__2_n_5),
        .O(program_counter[15]));
  LUT6 #(
    .INIT(64'hFFFFCFFFFAFACAFA)) 
    \program_counter[15]_i_2 
       (.I0(\program_counter[15]_i_3_n_0 ),
        .I1(\program_counter[15]_i_4_n_0 ),
        .I2(\program_counter[15]_i_5_n_0 ),
        .I3(\alu_instruction[2]_i_6_n_0 ),
        .I4(\register_select[3]_i_5_n_0 ),
        .I5(\program_counter[15]_i_6_n_0 ),
        .O(\program_counter[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h101C)) 
    \program_counter[15]_i_3 
       (.I0(A_bigger),
        .I1(program_data[0]),
        .I2(program_data[2]),
        .I3(overflow),
        .O(\program_counter[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \program_counter[15]_i_4 
       (.I0(AB_same),
        .I1(program_data[0]),
        .I2(underflow),
        .O(\program_counter[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    \program_counter[15]_i_5 
       (.I0(program_data[3]),
        .I1(program_data[1]),
        .I2(program_data[12]),
        .I3(program_data[13]),
        .I4(program_data[15]),
        .I5(program_data[14]),
        .O(\program_counter[15]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \program_counter[15]_i_6 
       (.I0(B_bigger),
        .I1(program_data[2]),
        .I2(program_data[0]),
        .O(\program_counter[15]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[1]_i_1 
       (.I0(program_counter0_carry_n_7),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[5]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[2]_i_1 
       (.I0(program_counter0_carry_n_6),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[6]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[3]_i_1 
       (.I0(program_counter0_carry_n_5),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[7]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[4]_i_1 
       (.I0(program_counter0_carry_n_4),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[8]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[5]_i_1 
       (.I0(program_counter0_carry__0_n_7),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[9]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[6]_i_1 
       (.I0(program_counter0_carry__0_n_6),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[10]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[6]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \program_counter[7]_i_1 
       (.I0(program_counter0_carry__0_n_5),
        .I1(\program_counter[15]_i_2_n_0 ),
        .I2(program_data[11]),
        .I3(\program_counter[7]_i_2_n_0 ),
        .O(program_counter[7]));
  LUT6 #(
    .INIT(64'h0F0F0FFF0E0E0EFE)) 
    \program_counter[7]_i_2 
       (.I0(\program_counter[7]_i_3_n_0 ),
        .I1(\program_counter[7]_i_4_n_0 ),
        .I2(\program_counter[15]_i_5_n_0 ),
        .I3(\program_counter[7]_i_5_n_0 ),
        .I4(\program_counter[15]_i_4_n_0 ),
        .I5(\program_counter[7]_i_6_n_0 ),
        .O(\program_counter[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h4F44)) 
    \program_counter[7]_i_3 
       (.I0(program_data[0]),
        .I1(A_bigger),
        .I2(program_data[2]),
        .I3(overflow),
        .O(\program_counter[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \program_counter[7]_i_4 
       (.I0(program_data[0]),
        .I1(program_data[2]),
        .I2(B_bigger),
        .O(\program_counter[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    \program_counter[7]_i_5 
       (.I0(program_data[3]),
        .I1(program_data[2]),
        .I2(program_data[15]),
        .I3(program_data[14]),
        .I4(program_data[13]),
        .I5(program_data[12]),
        .O(\program_counter[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \program_counter[7]_i_6 
       (.I0(program_data[0]),
        .I1(program_data[2]),
        .O(\program_counter[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[8]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__0_n_4),
        .O(program_counter[8]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \program_counter[9]_i_1 
       (.I0(\program_counter[15]_i_2_n_0 ),
        .I1(program_counter0_carry__1_n_7),
        .O(program_counter[9]));
  FDRE \program_counter_reg[0] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[0]),
        .Q(program_data_address[0]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[10] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[10]),
        .Q(program_data_address[10]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[11] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[11]),
        .Q(program_data_address[11]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[12] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[12]),
        .Q(program_data_address[12]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[13] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[13]),
        .Q(program_data_address[13]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[14] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[14]),
        .Q(program_data_address[14]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[15] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[15]),
        .Q(program_data_address[15]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[1] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[1]),
        .Q(program_data_address[1]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[2] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[2]),
        .Q(program_data_address[2]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[3] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[3]),
        .Q(program_data_address[3]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[4] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[4]),
        .Q(program_data_address[4]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[5] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[5]),
        .Q(program_data_address[5]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[6] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[6]),
        .Q(program_data_address[6]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[7] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[7]),
        .Q(program_data_address[7]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[8] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[8]),
        .Q(program_data_address[8]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \program_counter_reg[9] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(program_counter[9]),
        .Q(program_data_address[9]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \ram_address[7]_i_1 
       (.I0(program_data[15]),
        .I1(program_data[14]),
        .I2(program_data[2]),
        .I3(program_data[3]),
        .I4(program_data[12]),
        .I5(\alu_register_enable[1]_i_2_n_0 ),
        .O(\ram_address[7]_i_1_n_0 ));
  FDRE \ram_address_reg[0] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[4]),
        .Q(ram_address[0]),
        .R(1'b0));
  FDRE \ram_address_reg[1] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[5]),
        .Q(ram_address[1]),
        .R(1'b0));
  FDRE \ram_address_reg[2] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[6]),
        .Q(ram_address[2]),
        .R(1'b0));
  FDRE \ram_address_reg[3] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[7]),
        .Q(ram_address[3]),
        .R(1'b0));
  FDRE \ram_address_reg[4] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[8]),
        .Q(ram_address[4]),
        .R(1'b0));
  FDRE \ram_address_reg[5] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[9]),
        .Q(ram_address[5]),
        .R(1'b0));
  FDRE \ram_address_reg[6] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[10]),
        .Q(ram_address[6]),
        .R(1'b0));
  FDRE \ram_address_reg[7] 
       (.C(clk),
        .CE(\ram_address[7]_i_1_n_0 ),
        .D(program_data[11]),
        .Q(ram_address[7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8F80)) 
    \ram_cu_select[0]_i_1 
       (.I0(program_data[13]),
        .I1(program_data[0]),
        .I2(\ram_cu_select[1]_i_2_n_0 ),
        .I3(ram_cu_select[0]),
        .O(\ram_cu_select[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F80)) 
    \ram_cu_select[1]_i_1 
       (.I0(program_data[13]),
        .I1(program_data[1]),
        .I2(\ram_cu_select[1]_i_2_n_0 ),
        .I3(ram_cu_select[1]),
        .O(\ram_cu_select[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000300000103000)) 
    \ram_cu_select[1]_i_2 
       (.I0(program_data[1]),
        .I1(\register_select[3]_i_5_n_0 ),
        .I2(\alu_register_enable[1]_i_2_n_0 ),
        .I3(program_data[13]),
        .I4(program_data[12]),
        .I5(program_data[0]),
        .O(\ram_cu_select[1]_i_2_n_0 ));
  FDRE \ram_cu_select_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\ram_cu_select[0]_i_1_n_0 ),
        .Q(ram_cu_select[0]),
        .R(1'b0));
  FDRE \ram_cu_select_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\ram_cu_select[1]_i_1_n_0 ),
        .Q(ram_cu_select[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \register_enable[0]_i_1 
       (.I0(program_data[12]),
        .I1(program_data[13]),
        .I2(\alu_register_enable[1]_i_4_n_0 ),
        .O(register_enable_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h01000000)) 
    \register_enable[1]_i_1 
       (.I0(program_data[12]),
        .I1(program_data[3]),
        .I2(program_data[2]),
        .I3(program_data[14]),
        .I4(program_data[15]),
        .O(register_enable_1[1]));
  FDRE \register_enable_reg[0] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(register_enable_1[0]),
        .Q(register_enable[0]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  FDRE \register_enable_reg[1] 
       (.C(clk),
        .CE(\alu_register_enable[1]_i_2_n_0 ),
        .D(register_enable_1[1]),
        .Q(register_enable[1]),
        .R(\alu_register_enable[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h555555F755555504)) 
    register_read_i_1
       (.I0(register_write_2),
        .I1(\alu_register_enable[1]_i_2_n_0 ),
        .I2(register_write_i_3_n_0),
        .I3(\ram_address[7]_i_1_n_0 ),
        .I4(register_write_i_4_n_0),
        .I5(register_read),
        .O(register_read_i_1_n_0));
  FDRE register_read_reg
       (.C(clk),
        .CE(1'b1),
        .D(register_read_i_1_n_0),
        .Q(register_read),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0808080888080808)) 
    \register_select[3]_i_1 
       (.I0(program_data[14]),
        .I1(\alu_register_enable[1]_i_2_n_0 ),
        .I2(register_write_i_3_n_0),
        .I3(\register_select[3]_i_3_n_0 ),
        .I4(\register_select[3]_i_4_n_0 ),
        .I5(\register_select[3]_i_5_n_0 ),
        .O(\register_select[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h004F0F0F00000000)) 
    \register_select[3]_i_2 
       (.I0(\register_select[3]_i_5_n_0 ),
        .I1(\register_select[3]_i_4_n_0 ),
        .I2(\alu_register_enable[1]_i_4_n_0 ),
        .I3(program_data[13]),
        .I4(program_data[12]),
        .I5(\alu_register_enable[1]_i_2_n_0 ),
        .O(\register_select[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \register_select[3]_i_3 
       (.I0(program_data[12]),
        .I1(program_data[13]),
        .O(\register_select[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \register_select[3]_i_4 
       (.I0(program_data[0]),
        .I1(program_data[1]),
        .O(\register_select[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \register_select[3]_i_5 
       (.I0(program_data[14]),
        .I1(program_data[15]),
        .I2(program_data[2]),
        .I3(program_data[3]),
        .O(\register_select[3]_i_5_n_0 ));
  FDRE \register_select_reg[0] 
       (.C(clk),
        .CE(\register_select[3]_i_2_n_0 ),
        .D(program_data[0]),
        .Q(register_select[0]),
        .R(\register_select[3]_i_1_n_0 ));
  FDRE \register_select_reg[1] 
       (.C(clk),
        .CE(\register_select[3]_i_2_n_0 ),
        .D(program_data[1]),
        .Q(register_select[1]),
        .R(\register_select[3]_i_1_n_0 ));
  FDRE \register_select_reg[2] 
       (.C(clk),
        .CE(\register_select[3]_i_2_n_0 ),
        .D(program_data[2]),
        .Q(register_select[2]),
        .R(\register_select[3]_i_1_n_0 ));
  FDRE \register_select_reg[3] 
       (.C(clk),
        .CE(\register_select[3]_i_2_n_0 ),
        .D(program_data[3]),
        .Q(register_select[3]),
        .R(\register_select[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    register_write_i_1
       (.I0(register_write_2),
        .I1(\alu_register_enable[1]_i_2_n_0 ),
        .I2(register_write_i_3_n_0),
        .I3(\ram_address[7]_i_1_n_0 ),
        .I4(register_write_i_4_n_0),
        .I5(register_write),
        .O(register_write_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    register_write_i_2
       (.I0(program_data[12]),
        .I1(program_data[13]),
        .I2(program_data[14]),
        .O(register_write_2));
  LUT6 #(
    .INIT(64'hFFFFFEFFFEFFFEFF)) 
    register_write_i_3
       (.I0(program_data[14]),
        .I1(\alu_instruction[2]_i_7_n_0 ),
        .I2(\alu_instruction[2]_i_8_n_0 ),
        .I3(program_data[15]),
        .I4(program_data[13]),
        .I5(program_data[12]),
        .O(register_write_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    register_write_i_4
       (.I0(enable),
        .I1(reset),
        .I2(program_data[1]),
        .I3(program_data[0]),
        .I4(program_data[13]),
        .I5(\register_select[3]_i_5_n_0 ),
        .O(register_write_i_4_n_0));
  FDRE register_write_reg
       (.C(clk),
        .CE(1'b1),
        .D(register_write_i_1_n_0),
        .Q(register_write),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
