// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:57:09 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_cu_ram_0_0/full_testbench_bd_cu_ram_0_0_sim_netlist.v
// Design      : full_testbench_bd_cu_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "full_testbench_bd_cu_ram_0_0,cu_ram,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "cu_ram,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module full_testbench_bd_cu_ram_0_0
   (address,
    data_out,
    data_in,
    write,
    read,
    enable,
    clk,
    reset);
  input [7:0]address;
  output [7:0]data_out;
  input [7:0]data_in;
  input write;
  input read;
  input enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;

  wire [7:0]address;
  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire \data_out[7]_INST_0_i_1_n_0 ;
  wire \data_out[7]_INST_0_i_2_n_0 ;
  wire enable;
  wire read;
  wire write;

  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \data_out[7]_INST_0_i_1 
       (.C(clk),
        .CE(1'b1),
        .D(\data_out[7]_INST_0_i_2_n_0 ),
        .Q(\data_out[7]_INST_0_i_1_n_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6F40)) 
    \data_out[7]_INST_0_i_2 
       (.I0(write),
        .I1(read),
        .I2(enable),
        .I3(\data_out[7]_INST_0_i_1_n_0 ),
        .O(\data_out[7]_INST_0_i_2_n_0 ));
  full_testbench_bd_cu_ram_0_0_cu_ram inst
       (.address(address),
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .data_out_0_sp_1(\data_out[7]_INST_0_i_1_n_0 ),
        .enable(enable),
        .read(read),
        .write(write));
endmodule

(* ORIG_REF_NAME = "cu_ram" *) 
module full_testbench_bd_cu_ram_0_0_cu_ram
   (data_out,
    enable,
    read,
    write,
    address,
    data_out_0_sp_1,
    clk,
    data_in);
  output [7:0]data_out;
  input enable;
  input read;
  input write;
  input [7:0]address;
  input data_out_0_sp_1;
  input clk;
  input [7:0]data_in;

  wire [7:0]address;
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
  wire \data_out_tristate_oe[7]_i_1_n_0 ;
  wire \data_out_tristate_oe[7]_i_2_n_0 ;
  wire \data_out_tristate_oe[7]_i_3_n_0 ;
  wire \data_out_tristate_oe_reg_n_0_[0] ;
  wire \data_out_tristate_oe_reg_n_0_[1] ;
  wire \data_out_tristate_oe_reg_n_0_[2] ;
  wire \data_out_tristate_oe_reg_n_0_[3] ;
  wire \data_out_tristate_oe_reg_n_0_[4] ;
  wire \data_out_tristate_oe_reg_n_0_[5] ;
  wire \data_out_tristate_oe_reg_n_0_[6] ;
  wire \data_out_tristate_oe_reg_n_0_[7] ;
  wire enable;
  wire \internal_memory[5][7]_i_1_n_0 ;
  wire \internal_memory[5][7]_i_2_n_0 ;
  wire \internal_memory[6][7]_i_1_n_0 ;
  wire \internal_memory[6][7]_i_2_n_0 ;
  wire \internal_memory[7][7]_i_1_n_0 ;
  wire \internal_memory[7][7]_i_2_n_0 ;
  wire [7:0]\internal_memory_reg[5] ;
  wire [7:0]\internal_memory_reg[6] ;
  wire [7:0]\internal_memory_reg[7] ;
  wire read;
  wire write;

  assign data_out_0_sn_1 = data_out_0_sp_1;
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[0]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[0] ),
        .I1(data_out_0_sn_1),
        .O(data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[1]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[1] ),
        .I1(data_out_0_sn_1),
        .O(data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[2]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[2] ),
        .I1(data_out_0_sn_1),
        .O(data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[3]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[3] ),
        .I1(data_out_0_sn_1),
        .O(data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[4]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[4] ),
        .I1(data_out_0_sn_1),
        .O(data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[5]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[5] ),
        .I1(data_out_0_sn_1),
        .O(data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[6]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[6] ),
        .I1(data_out_0_sn_1),
        .O(data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_out[7]_INST_0 
       (.I0(\data_out_tristate_oe_reg_n_0_[7] ),
        .I1(data_out_0_sn_1),
        .O(data_out[7]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \data_out_tristate_oe[0]_i_1 
       (.I0(\internal_memory_reg[7] [0]),
        .I1(\internal_memory_reg[6] [0]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(\internal_memory_reg[5] [0]),
        .O(\data_out_tristate_oe[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \data_out_tristate_oe[1]_i_1 
       (.I0(\internal_memory_reg[7] [1]),
        .I1(\internal_memory_reg[6] [1]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(\internal_memory_reg[5] [1]),
        .O(\data_out_tristate_oe[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \data_out_tristate_oe[2]_i_1 
       (.I0(\internal_memory_reg[7] [2]),
        .I1(\internal_memory_reg[6] [2]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(\internal_memory_reg[5] [2]),
        .O(\data_out_tristate_oe[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \data_out_tristate_oe[3]_i_1 
       (.I0(\internal_memory_reg[7] [3]),
        .I1(\internal_memory_reg[6] [3]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(\internal_memory_reg[5] [3]),
        .O(\data_out_tristate_oe[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \data_out_tristate_oe[4]_i_1 
       (.I0(\internal_memory_reg[7] [4]),
        .I1(\internal_memory_reg[6] [4]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(\internal_memory_reg[5] [4]),
        .O(\data_out_tristate_oe[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \data_out_tristate_oe[5]_i_1 
       (.I0(\internal_memory_reg[7] [5]),
        .I1(\internal_memory_reg[6] [5]),
        .I2(address[1]),
        .I3(\internal_memory_reg[5] [5]),
        .I4(address[0]),
        .O(\data_out_tristate_oe[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \data_out_tristate_oe[6]_i_1 
       (.I0(\internal_memory_reg[7] [6]),
        .I1(\internal_memory_reg[6] [6]),
        .I2(address[1]),
        .I3(\internal_memory_reg[5] [6]),
        .I4(address[0]),
        .O(\data_out_tristate_oe[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h008A)) 
    \data_out_tristate_oe[7]_i_1 
       (.I0(enable),
        .I1(read),
        .I2(write),
        .I3(address[2]),
        .O(\data_out_tristate_oe[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \data_out_tristate_oe[7]_i_2 
       (.I0(write),
        .I1(read),
        .I2(enable),
        .O(\data_out_tristate_oe[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \data_out_tristate_oe[7]_i_3 
       (.I0(\internal_memory_reg[7] [7]),
        .I1(\internal_memory_reg[6] [7]),
        .I2(address[1]),
        .I3(\internal_memory_reg[5] [7]),
        .I4(address[0]),
        .O(\data_out_tristate_oe[7]_i_3_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[0] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[0]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[0] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[1] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[1]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[1] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[2] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[2]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[2] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[3] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[3]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[3] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[4] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[4]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[4] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[5] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[5]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[5] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[6] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[6]_i_1_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[6] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \data_out_tristate_oe_reg[7] 
       (.C(clk),
        .CE(\data_out_tristate_oe[7]_i_2_n_0 ),
        .D(\data_out_tristate_oe[7]_i_3_n_0 ),
        .Q(\data_out_tristate_oe_reg_n_0_[7] ),
        .R(\data_out_tristate_oe[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \internal_memory[5][7]_i_1 
       (.I0(read),
        .I1(address[7]),
        .I2(\internal_memory[5][7]_i_2_n_0 ),
        .I3(address[6]),
        .I4(write),
        .I5(enable),
        .O(\internal_memory[5][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \internal_memory[5][7]_i_2 
       (.I0(address[4]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(address[5]),
        .O(\internal_memory[5][7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \internal_memory[6][7]_i_1 
       (.I0(read),
        .I1(address[7]),
        .I2(\internal_memory[6][7]_i_2_n_0 ),
        .I3(address[6]),
        .I4(write),
        .I5(enable),
        .O(\internal_memory[6][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \internal_memory[6][7]_i_2 
       (.I0(address[4]),
        .I1(address[1]),
        .I2(address[3]),
        .I3(address[0]),
        .I4(address[2]),
        .I5(address[5]),
        .O(\internal_memory[6][7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \internal_memory[7][7]_i_1 
       (.I0(read),
        .I1(address[7]),
        .I2(\internal_memory[7][7]_i_2_n_0 ),
        .I3(address[6]),
        .I4(write),
        .I5(enable),
        .O(\internal_memory[7][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \internal_memory[7][7]_i_2 
       (.I0(address[4]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(address[5]),
        .O(\internal_memory[7][7]_i_2_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][0] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[0]),
        .Q(\internal_memory_reg[5] [0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][1] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[1]),
        .Q(\internal_memory_reg[5] [1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][2] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[2]),
        .Q(\internal_memory_reg[5] [2]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][3] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[3]),
        .Q(\internal_memory_reg[5] [3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][4] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[4]),
        .Q(\internal_memory_reg[5] [4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][5] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[5]),
        .Q(\internal_memory_reg[5] [5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][6] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[6]),
        .Q(\internal_memory_reg[5] [6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[5][7] 
       (.C(clk),
        .CE(\internal_memory[5][7]_i_1_n_0 ),
        .D(data_in[7]),
        .Q(\internal_memory_reg[5] [7]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][0] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[0]),
        .Q(\internal_memory_reg[6] [0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][1] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[1]),
        .Q(\internal_memory_reg[6] [1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][2] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[2]),
        .Q(\internal_memory_reg[6] [2]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][3] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[3]),
        .Q(\internal_memory_reg[6] [3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][4] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[4]),
        .Q(\internal_memory_reg[6] [4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][5] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[5]),
        .Q(\internal_memory_reg[6] [5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][6] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[6]),
        .Q(\internal_memory_reg[6] [6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[6][7] 
       (.C(clk),
        .CE(\internal_memory[6][7]_i_1_n_0 ),
        .D(data_in[7]),
        .Q(\internal_memory_reg[6] [7]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][0] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[0]),
        .Q(\internal_memory_reg[7] [0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][1] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[1]),
        .Q(\internal_memory_reg[7] [1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][2] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[2]),
        .Q(\internal_memory_reg[7] [2]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][3] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[3]),
        .Q(\internal_memory_reg[7] [3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][4] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[4]),
        .Q(\internal_memory_reg[7] [4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][5] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[5]),
        .Q(\internal_memory_reg[7] [5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][6] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[6]),
        .Q(\internal_memory_reg[7] [6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \internal_memory_reg[7][7] 
       (.C(clk),
        .CE(\internal_memory[7][7]_i_1_n_0 ),
        .D(data_in[7]),
        .Q(\internal_memory_reg[7] [7]),
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
