// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:20 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ full_testbench_bd_alu_0_0_sim_netlist.v
// Design      : full_testbench_bd_alu_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_alu
   (B_bigger,
    A_bigger,
    operand_C,
    AB_same,
    overflow,
    underflow,
    instruction,
    operand_A,
    operand_B,
    clk);
  output B_bigger;
  output A_bigger;
  output [7:0]operand_C;
  output AB_same;
  output overflow;
  output underflow;
  input [3:0]instruction;
  input [7:0]operand_A;
  input [7:0]operand_B;
  input clk;

  wire AB_same;
  wire AB_same_i_1_n_0;
  wire A_bigger;
  wire A_bigger0_carry_i_1_n_0;
  wire A_bigger0_carry_i_2_n_0;
  wire A_bigger0_carry_i_3_n_0;
  wire A_bigger0_carry_i_4_n_0;
  wire A_bigger0_carry_i_5_n_0;
  wire A_bigger0_carry_i_6_n_0;
  wire A_bigger0_carry_i_7_n_0;
  wire A_bigger0_carry_i_8_n_0;
  wire A_bigger0_carry_n_0;
  wire A_bigger0_carry_n_1;
  wire A_bigger0_carry_n_2;
  wire A_bigger0_carry_n_3;
  wire A_bigger1_carry_i_1_n_0;
  wire A_bigger1_carry_i_2_n_0;
  wire A_bigger1_carry_i_3_n_0;
  wire A_bigger1_carry_i_4_n_0;
  wire A_bigger1_carry_i_5_n_0;
  wire A_bigger1_carry_i_6_n_0;
  wire A_bigger1_carry_i_7_n_0;
  wire A_bigger1_carry_i_8_n_0;
  wire A_bigger1_carry_n_0;
  wire A_bigger1_carry_n_1;
  wire A_bigger1_carry_n_2;
  wire A_bigger1_carry_n_3;
  wire A_bigger_i_1_n_0;
  wire A_bigger_i_2_n_0;
  wire A_bigger_i_3_n_0;
  wire A_bigger_i_4_n_0;
  wire B_bigger;
  wire B_bigger_i_1_n_0;
  wire \_inferred__0/i__carry__0_n_0 ;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire clk;
  wire [8:0]data1;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire [3:0]instruction;
  wire [7:0]operand_A;
  wire [7:0]operand_B;
  wire [7:0]operand_C;
  wire \operand_C[0]_i_1_n_0 ;
  wire \operand_C[0]_i_2_n_0 ;
  wire \operand_C[1]_i_1_n_0 ;
  wire \operand_C[1]_i_2_n_0 ;
  wire \operand_C[2]_i_1_n_0 ;
  wire \operand_C[2]_i_2_n_0 ;
  wire \operand_C[3]_i_1_n_0 ;
  wire \operand_C[3]_i_2_n_0 ;
  wire \operand_C[4]_i_1_n_0 ;
  wire \operand_C[4]_i_2_n_0 ;
  wire \operand_C[5]_i_1_n_0 ;
  wire \operand_C[5]_i_2_n_0 ;
  wire \operand_C[6]_i_1_n_0 ;
  wire \operand_C[6]_i_2_n_0 ;
  wire \operand_C[7]_i_2_n_0 ;
  wire overflow;
  wire overflow_i_1_n_0;
  wire overflow_i_2_n_0;
  wire [0:0]p_0_in;
  wire underflow;
  wire underflow_i_1_n_0;
  wire [3:0]NLW_A_bigger0_carry_O_UNCONNECTED;
  wire [3:0]NLW_A_bigger1_carry_O_UNCONNECTED;
  wire [3:0]\NLW__inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__0/i__carry__1_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h000E)) 
    AB_same_i_1
       (.I0(AB_same),
        .I1(A_bigger_i_2_n_0),
        .I2(A_bigger1_carry_n_0),
        .I3(A_bigger0_carry_n_0),
        .O(AB_same_i_1_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    AB_same_reg
       (.C(clk),
        .CE(1'b1),
        .D(AB_same_i_1_n_0),
        .Q(AB_same),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 A_bigger0_carry
       (.CI(1'b0),
        .CO({A_bigger0_carry_n_0,A_bigger0_carry_n_1,A_bigger0_carry_n_2,A_bigger0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({A_bigger0_carry_i_1_n_0,A_bigger0_carry_i_2_n_0,A_bigger0_carry_i_3_n_0,A_bigger0_carry_i_4_n_0}),
        .O(NLW_A_bigger0_carry_O_UNCONNECTED[3:0]),
        .S({A_bigger0_carry_i_5_n_0,A_bigger0_carry_i_6_n_0,A_bigger0_carry_i_7_n_0,A_bigger0_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger0_carry_i_1
       (.I0(operand_A[6]),
        .I1(operand_B[6]),
        .I2(operand_A[7]),
        .I3(operand_B[7]),
        .O(A_bigger0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger0_carry_i_2
       (.I0(operand_A[4]),
        .I1(operand_B[4]),
        .I2(operand_B[5]),
        .I3(operand_A[5]),
        .O(A_bigger0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger0_carry_i_3
       (.I0(operand_A[2]),
        .I1(operand_B[2]),
        .I2(operand_B[3]),
        .I3(operand_A[3]),
        .O(A_bigger0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger0_carry_i_4
       (.I0(operand_A[0]),
        .I1(operand_B[0]),
        .I2(operand_B[1]),
        .I3(operand_A[1]),
        .O(A_bigger0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger0_carry_i_5
       (.I0(operand_A[6]),
        .I1(operand_B[6]),
        .I2(operand_B[7]),
        .I3(operand_A[7]),
        .O(A_bigger0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger0_carry_i_6
       (.I0(operand_A[4]),
        .I1(operand_B[4]),
        .I2(operand_A[5]),
        .I3(operand_B[5]),
        .O(A_bigger0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger0_carry_i_7
       (.I0(operand_A[2]),
        .I1(operand_B[2]),
        .I2(operand_A[3]),
        .I3(operand_B[3]),
        .O(A_bigger0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger0_carry_i_8
       (.I0(operand_A[0]),
        .I1(operand_B[0]),
        .I2(operand_A[1]),
        .I3(operand_B[1]),
        .O(A_bigger0_carry_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 A_bigger1_carry
       (.CI(1'b0),
        .CO({A_bigger1_carry_n_0,A_bigger1_carry_n_1,A_bigger1_carry_n_2,A_bigger1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({A_bigger1_carry_i_1_n_0,A_bigger1_carry_i_2_n_0,A_bigger1_carry_i_3_n_0,A_bigger1_carry_i_4_n_0}),
        .O(NLW_A_bigger1_carry_O_UNCONNECTED[3:0]),
        .S({A_bigger1_carry_i_5_n_0,A_bigger1_carry_i_6_n_0,A_bigger1_carry_i_7_n_0,A_bigger1_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger1_carry_i_1
       (.I0(operand_B[6]),
        .I1(operand_A[6]),
        .I2(operand_B[7]),
        .I3(operand_A[7]),
        .O(A_bigger1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger1_carry_i_2
       (.I0(operand_B[4]),
        .I1(operand_A[4]),
        .I2(operand_A[5]),
        .I3(operand_B[5]),
        .O(A_bigger1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger1_carry_i_3
       (.I0(operand_B[2]),
        .I1(operand_A[2]),
        .I2(operand_A[3]),
        .I3(operand_B[3]),
        .O(A_bigger1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    A_bigger1_carry_i_4
       (.I0(operand_B[0]),
        .I1(operand_A[0]),
        .I2(operand_A[1]),
        .I3(operand_B[1]),
        .O(A_bigger1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger1_carry_i_5
       (.I0(operand_B[6]),
        .I1(operand_A[6]),
        .I2(operand_A[7]),
        .I3(operand_B[7]),
        .O(A_bigger1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger1_carry_i_6
       (.I0(operand_B[4]),
        .I1(operand_A[4]),
        .I2(operand_B[5]),
        .I3(operand_A[5]),
        .O(A_bigger1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger1_carry_i_7
       (.I0(operand_B[2]),
        .I1(operand_A[2]),
        .I2(operand_B[3]),
        .I3(operand_A[3]),
        .O(A_bigger1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    A_bigger1_carry_i_8
       (.I0(operand_B[0]),
        .I1(operand_A[0]),
        .I2(operand_B[1]),
        .I3(operand_A[1]),
        .O(A_bigger1_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hCDCC)) 
    A_bigger_i_1
       (.I0(A_bigger1_carry_n_0),
        .I1(A_bigger0_carry_n_0),
        .I2(A_bigger_i_2_n_0),
        .I3(A_bigger),
        .O(A_bigger_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000000000)) 
    A_bigger_i_2
       (.I0(operand_B[7]),
        .I1(operand_A[7]),
        .I2(operand_B[6]),
        .I3(operand_A[6]),
        .I4(A_bigger_i_3_n_0),
        .I5(A_bigger_i_4_n_0),
        .O(A_bigger_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    A_bigger_i_3
       (.I0(operand_A[3]),
        .I1(operand_B[3]),
        .I2(operand_B[5]),
        .I3(operand_A[5]),
        .I4(operand_B[4]),
        .I5(operand_A[4]),
        .O(A_bigger_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    A_bigger_i_4
       (.I0(operand_A[0]),
        .I1(operand_B[0]),
        .I2(operand_B[2]),
        .I3(operand_A[2]),
        .I4(operand_B[1]),
        .I5(operand_A[1]),
        .O(A_bigger_i_4_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    A_bigger_reg
       (.C(clk),
        .CE(1'b1),
        .D(A_bigger_i_1_n_0),
        .Q(A_bigger),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2322)) 
    B_bigger_i_1
       (.I0(A_bigger1_carry_n_0),
        .I1(A_bigger0_carry_n_0),
        .I2(A_bigger_i_2_n_0),
        .I3(B_bigger),
        .O(B_bigger_i_1_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    B_bigger_reg
       (.C(clk),
        .CE(1'b1),
        .D(B_bigger_i_1_n_0),
        .Q(B_bigger),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(operand_A[0]),
        .DI({operand_A[3:1],instruction[1]}),
        .O(data1[3:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\_inferred__0/i__carry__0_n_0 ,\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(operand_A[7:4]),
        .O(data1[7:4]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry__1 
       (.CI(\_inferred__0/i__carry__0_n_0 ),
        .CO(\NLW__inferred__0/i__carry__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__0/i__carry__1_O_UNCONNECTED [3:1],data1[8]}),
        .S({1'b0,1'b0,1'b0,i__carry__1_i_1_n_0}));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry__0_i_1
       (.I0(operand_A[7]),
        .I1(operand_B[7]),
        .I2(instruction[0]),
        .O(i__carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry__0_i_2
       (.I0(operand_B[6]),
        .I1(instruction[0]),
        .I2(operand_A[6]),
        .O(i__carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry__0_i_3
       (.I0(operand_B[5]),
        .I1(instruction[0]),
        .I2(operand_A[5]),
        .O(i__carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry__0_i_4
       (.I0(operand_B[4]),
        .I1(instruction[0]),
        .I2(operand_A[4]),
        .O(i__carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry__1_i_1
       (.I0(operand_A[7]),
        .I1(operand_B[7]),
        .I2(instruction[0]),
        .O(i__carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry_i_1
       (.I0(operand_B[3]),
        .I1(instruction[0]),
        .I2(operand_A[3]),
        .O(i__carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry_i_2
       (.I0(operand_B[2]),
        .I1(instruction[0]),
        .I2(operand_A[2]),
        .O(i__carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry_i_3
       (.I0(operand_B[1]),
        .I1(instruction[0]),
        .I2(operand_A[1]),
        .O(i__carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry_i_4
       (.I0(instruction[1]),
        .I1(operand_B[0]),
        .I2(instruction[0]),
        .O(i__carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[0]_i_1 
       (.I0(\operand_C[0]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[0]_i_2 
       (.I0(data1[0]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[0]),
        .I5(operand_B[0]),
        .O(\operand_C[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[1]_i_1 
       (.I0(\operand_C[1]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[1]_i_2 
       (.I0(data1[1]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[1]),
        .I5(operand_B[1]),
        .O(\operand_C[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[2]_i_1 
       (.I0(\operand_C[2]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[2]_i_2 
       (.I0(data1[2]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[2]),
        .I5(operand_B[2]),
        .O(\operand_C[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[3]_i_1 
       (.I0(\operand_C[3]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[3]_i_2 
       (.I0(data1[3]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[3]),
        .I5(operand_B[3]),
        .O(\operand_C[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[4]_i_1 
       (.I0(\operand_C[4]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[4]_i_2 
       (.I0(data1[4]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[4]),
        .I5(operand_B[4]),
        .O(\operand_C[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[5]_i_1 
       (.I0(\operand_C[5]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[5]_i_2 
       (.I0(data1[5]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[5]),
        .I5(operand_B[5]),
        .O(\operand_C[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[6]_i_1 
       (.I0(\operand_C[6]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(\operand_C[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[6]_i_2 
       (.I0(data1[6]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[6]),
        .I5(operand_B[6]),
        .O(\operand_C[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \operand_C[7]_i_1 
       (.I0(\operand_C[7]_i_2_n_0 ),
        .I1(instruction[3]),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    \operand_C[7]_i_2 
       (.I0(data1[7]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[7]),
        .I5(operand_B[7]),
        .O(\operand_C[7]_i_2_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[0]_i_1_n_0 ),
        .Q(operand_C[0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[1]_i_1_n_0 ),
        .Q(operand_C[1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[2]_i_1_n_0 ),
        .Q(operand_C[2]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[3]_i_1_n_0 ),
        .Q(operand_C[3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[4]_i_1_n_0 ),
        .Q(operand_C[4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[5]_i_1_n_0 ),
        .Q(operand_C[5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\operand_C[6]_i_1_n_0 ),
        .Q(operand_C[6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \operand_C_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(operand_C[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    overflow_i_1
       (.I0(overflow_i_2_n_0),
        .I1(\operand_C[7]_i_2_n_0 ),
        .I2(instruction[3]),
        .O(overflow_i_1_n_0));
  LUT6 #(
    .INIT(64'h0E38323802383208)) 
    overflow_i_2
       (.I0(data1[8]),
        .I1(instruction[1]),
        .I2(instruction[2]),
        .I3(instruction[0]),
        .I4(operand_A[7]),
        .I5(operand_B[7]),
        .O(overflow_i_2_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    overflow_reg
       (.C(clk),
        .CE(1'b1),
        .D(overflow_i_1_n_0),
        .Q(overflow),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    underflow_i_1
       (.I0(\operand_C[7]_i_2_n_0 ),
        .I1(overflow_i_2_n_0),
        .I2(instruction[3]),
        .O(underflow_i_1_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    underflow_reg
       (.C(clk),
        .CE(1'b1),
        .D(underflow_i_1_n_0),
        .Q(underflow),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "full_testbench_bd_alu_0_0,alu,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "alu,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (operand_A,
    operand_B,
    operand_C,
    overflow,
    underflow,
    A_bigger,
    B_bigger,
    AB_same,
    instruction,
    clk,
    reset);
  input [7:0]operand_A;
  input [7:0]operand_B;
  output [7:0]operand_C;
  output overflow;
  output underflow;
  output A_bigger;
  output B_bigger;
  output AB_same;
  input [3:0]instruction;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;

  wire AB_same;
  wire A_bigger;
  wire B_bigger;
  wire clk;
  wire [3:0]instruction;
  wire [7:0]operand_A;
  wire [7:0]operand_B;
  wire [7:0]operand_C;
  wire overflow;
  wire underflow;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_alu inst
       (.AB_same(AB_same),
        .A_bigger(A_bigger),
        .B_bigger(B_bigger),
        .clk(clk),
        .instruction(instruction),
        .operand_A(operand_A),
        .operand_B(operand_B),
        .operand_C(operand_C),
        .overflow(overflow),
        .underflow(underflow));
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
