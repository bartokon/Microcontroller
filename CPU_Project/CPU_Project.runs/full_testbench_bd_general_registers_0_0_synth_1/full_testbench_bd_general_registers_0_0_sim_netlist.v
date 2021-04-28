// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:20 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ full_testbench_bd_general_registers_0_0_sim_netlist.v
// Design      : full_testbench_bd_general_registers_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "full_testbench_bd_general_registers_0_0,general_registers,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "general_registers,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (data_in,
    data_out,
    read,
    write,
    select_reg,
    enable,
    clk,
    reset);
  input [7:0]data_in;
  output [7:0]data_out;
  input read;
  input write;
  input [3:0]select_reg;
  input enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;

  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire \data_out[7]_INST_0_i_1_n_0 ;
  wire \data_out[7]_INST_0_i_2_n_0 ;
  wire enable;
  wire inst_n_8;
  wire read;
  wire reset;
  wire [3:0]select_reg;
  wire write;

  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \data_out[7]_INST_0_i_1 
       (.C(clk),
        .CE(inst_n_8),
        .D(\data_out[7]_INST_0_i_2_n_0 ),
        .Q(\data_out[7]_INST_0_i_1_n_0 ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[7]_INST_0_i_2 
       (.I0(read),
        .I1(write),
        .O(\data_out[7]_INST_0_i_2_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_general_registers inst
       (.E(inst_n_8),
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .data_out_0_sp_1(\data_out[7]_INST_0_i_1_n_0 ),
        .enable(enable),
        .read(read),
        .reset(reset),
        .select_reg(select_reg),
        .write(write));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_general_registers
   (data_out,
    E,
    data_out_0_sp_1,
    clk,
    data_in,
    reset,
    enable,
    select_reg,
    read,
    write);
  output [7:0]data_out;
  output [0:0]E;
  input data_out_0_sp_1;
  input clk;
  input [7:0]data_in;
  input reset;
  input enable;
  input [3:0]select_reg;
  input read;
  input write;

  wire [0:0]E;
  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire data_out_0_sn_1;
  wire \data_out_tristate_oe[0]_i_1_n_0 ;
  wire \data_out_tristate_oe[1]_i_1_n_0 ;
  wire \data_out_tristate_oe[2]_i_1_n_0 ;
  wire \data_out_tristate_oe[3]_i_1_n_0 ;
  wire \data_out_tristate_oe[4]_i_1_n_0 ;
  wire \data_out_tristate_oe[5]_i_1_n_0 ;
  wire \data_out_tristate_oe[6]_i_1_n_0 ;
  wire \data_out_tristate_oe[7]_i_2_n_0 ;
  wire \data_out_tristate_oe_reg_n_0_[0] ;
  wire \data_out_tristate_oe_reg_n_0_[1] ;
  wire \data_out_tristate_oe_reg_n_0_[2] ;
  wire \data_out_tristate_oe_reg_n_0_[3] ;
  wire \data_out_tristate_oe_reg_n_0_[4] ;
  wire \data_out_tristate_oe_reg_n_0_[5] ;
  wire \data_out_tristate_oe_reg_n_0_[6] ;
  wire \data_out_tristate_oe_reg_n_0_[7] ;
  wire data_reg;
  wire \data_reg[0][7]_i_2_n_0 ;
  wire \data_reg[0][7]_i_3_n_0 ;
  wire \data_reg[1][7]_i_1_n_0 ;
  wire \data_reg[1][7]_i_2_n_0 ;
  wire \data_reg[2][7]_i_1_n_0 ;
  wire [7:0]\data_reg_reg[0] ;
  wire [7:0]\data_reg_reg[1] ;
  wire [7:0]\data_reg_reg[2] ;
  wire [7:0]\data_reg_reg[3] ;
  wire enable;
  wire p_0_in;
  wire read;
  wire reset;
  wire [3:0]select_reg;
  wire write;

  assign data_out_0_sn_1 = data_out_0_sp_1;
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[0]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[0] ),
        .I1(data_out_0_sn_1),
        .O(data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[1]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[1] ),
        .I1(data_out_0_sn_1),
        .O(data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[2]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[2] ),
        .I1(data_out_0_sn_1),
        .O(data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[3]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[3] ),
        .I1(data_out_0_sn_1),
        .O(data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[4]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[4] ),
        .I1(data_out_0_sn_1),
        .O(data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[5]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[5] ),
        .I1(data_out_0_sn_1),
        .O(data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[6]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[6] ),
        .I1(data_out_0_sn_1),
        .O(data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[7]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[7] ),
        .I1(data_out_0_sn_1),
        .O(data_out[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[0]_i_1 
       (.I0(\data_reg_reg[3] [0]),
        .I1(\data_reg_reg[2] [0]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [0]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [0]),
        .O(\data_out_tristate_oe[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[1]_i_1 
       (.I0(\data_reg_reg[3] [1]),
        .I1(\data_reg_reg[2] [1]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [1]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [1]),
        .O(\data_out_tristate_oe[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[2]_i_1 
       (.I0(\data_reg_reg[3] [2]),
        .I1(\data_reg_reg[2] [2]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [2]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [2]),
        .O(\data_out_tristate_oe[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[3]_i_1 
       (.I0(\data_reg_reg[3] [3]),
        .I1(\data_reg_reg[2] [3]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [3]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [3]),
        .O(\data_out_tristate_oe[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[4]_i_1 
       (.I0(\data_reg_reg[3] [4]),
        .I1(\data_reg_reg[2] [4]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [4]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [4]),
        .O(\data_out_tristate_oe[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[5]_i_1 
       (.I0(\data_reg_reg[3] [5]),
        .I1(\data_reg_reg[2] [5]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [5]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [5]),
        .O(\data_out_tristate_oe[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[6]_i_1 
       (.I0(\data_reg_reg[3] [6]),
        .I1(\data_reg_reg[2] [6]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [6]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [6]),
        .O(\data_out_tristate_oe[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB000)) 
    \data_out_tristate_oe[7]_i_1 
       (.I0(read),
        .I1(write),
        .I2(reset),
        .I3(enable),
        .O(E));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out_tristate_oe[7]_i_2 
       (.I0(\data_reg_reg[3] [7]),
        .I1(\data_reg_reg[2] [7]),
        .I2(select_reg[1]),
        .I3(\data_reg_reg[1] [7]),
        .I4(select_reg[0]),
        .I5(\data_reg_reg[0] [7]),
        .O(\data_out_tristate_oe[7]_i_2_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[0]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[1]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[2]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[3]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[4]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[5]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[6]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\data_out_tristate_oe[7]_i_2_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[7] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \data_reg[0][7]_i_1 
       (.I0(reset),
        .O(p_0_in));
  LUT4 #(
    .INIT(16'h0008)) 
    \data_reg[0][7]_i_2 
       (.I0(enable),
        .I1(\data_reg[0][7]_i_3_n_0 ),
        .I2(select_reg[1]),
        .I3(read),
        .O(\data_reg[0][7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \data_reg[0][7]_i_3 
       (.I0(write),
        .I1(select_reg[2]),
        .I2(select_reg[3]),
        .I3(select_reg[0]),
        .O(\data_reg[0][7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \data_reg[1][7]_i_1 
       (.I0(enable),
        .I1(\data_reg[1][7]_i_2_n_0 ),
        .I2(select_reg[1]),
        .I3(read),
        .O(\data_reg[1][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_reg[1][7]_i_2 
       (.I0(write),
        .I1(select_reg[2]),
        .I2(select_reg[3]),
        .I3(select_reg[0]),
        .O(\data_reg[1][7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \data_reg[2][7]_i_1 
       (.I0(enable),
        .I1(\data_reg[0][7]_i_3_n_0 ),
        .I2(select_reg[1]),
        .I3(read),
        .O(\data_reg[2][7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \data_reg[3][7]_i_1 
       (.I0(enable),
        .I1(\data_reg[1][7]_i_2_n_0 ),
        .I2(select_reg[1]),
        .I3(read),
        .O(data_reg));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][0] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[0]),
        .Q(\data_reg_reg[0] [0]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][1] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[1]),
        .Q(\data_reg_reg[0] [1]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][2] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[2]),
        .Q(\data_reg_reg[0] [2]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][3] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[3]),
        .Q(\data_reg_reg[0] [3]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][4] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[4]),
        .Q(\data_reg_reg[0] [4]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][5] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[5]),
        .Q(\data_reg_reg[0] [5]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][6] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[6]),
        .Q(\data_reg_reg[0] [6]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[0][7] 
       (.C(clk),
        .CE(\data_reg[0][7]_i_2_n_0 ),
        .D(data_in[7]),
        .Q(\data_reg_reg[0] [7]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][0] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[0]),
        .Q(\data_reg_reg[1] [0]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][1] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[1]),
        .Q(\data_reg_reg[1] [1]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][2] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[2]),
        .Q(\data_reg_reg[1] [2]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][3] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[3]),
        .Q(\data_reg_reg[1] [3]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][4] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[4]),
        .Q(\data_reg_reg[1] [4]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][5] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[5]),
        .Q(\data_reg_reg[1] [5]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][6] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[6]),
        .Q(\data_reg_reg[1] [6]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[1][7] 
       (.C(clk),
        .CE(\data_reg[1][7]_i_1_n_0 ),
        .D(data_in[7]),
        .Q(\data_reg_reg[1] [7]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][0] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[0]),
        .Q(\data_reg_reg[2] [0]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][1] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[1]),
        .Q(\data_reg_reg[2] [1]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][2] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[2]),
        .Q(\data_reg_reg[2] [2]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][3] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[3]),
        .Q(\data_reg_reg[2] [3]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][4] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[4]),
        .Q(\data_reg_reg[2] [4]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][5] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[5]),
        .Q(\data_reg_reg[2] [5]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][6] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[6]),
        .Q(\data_reg_reg[2] [6]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[2][7] 
       (.C(clk),
        .CE(\data_reg[2][7]_i_1_n_0 ),
        .D(data_in[7]),
        .Q(\data_reg_reg[2] [7]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][0] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[0]),
        .Q(\data_reg_reg[3] [0]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][1] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[1]),
        .Q(\data_reg_reg[3] [1]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][2] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[2]),
        .Q(\data_reg_reg[3] [2]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][3] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[3]),
        .Q(\data_reg_reg[3] [3]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][4] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[4]),
        .Q(\data_reg_reg[3] [4]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][5] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[5]),
        .Q(\data_reg_reg[3] [5]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][6] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[6]),
        .Q(\data_reg_reg[3] [6]),
        .R(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_reg_reg[3][7] 
       (.C(clk),
        .CE(data_reg),
        .D(data_in[7]),
        .Q(\data_reg_reg[3] [7]),
        .R(p_0_in));
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
