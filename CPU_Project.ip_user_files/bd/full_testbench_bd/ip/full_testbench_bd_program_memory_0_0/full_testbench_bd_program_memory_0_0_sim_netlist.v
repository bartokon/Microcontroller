// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:20 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_program_memory_0_0/full_testbench_bd_program_memory_0_0_sim_netlist.v
// Design      : full_testbench_bd_program_memory_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "full_testbench_bd_program_memory_0_0,program_memory,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "program_memory,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module full_testbench_bd_program_memory_0_0
   (program_data_address,
    program_data,
    clk);
  input [15:0]program_data_address;
  output [15:0]program_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;

  wire \<const0> ;
  wire clk;
  wire [15:0]\^program_data ;
  wire [15:0]program_data_address;

  assign program_data[15:12] = \^program_data [15:12];
  assign program_data[11] = \<const0> ;
  assign program_data[10] = \<const0> ;
  assign program_data[9:4] = \^program_data [9:4];
  assign program_data[3] = \<const0> ;
  assign program_data[2] = \<const0> ;
  assign program_data[1:0] = \^program_data [1:0];
  GND GND
       (.G(\<const0> ));
  full_testbench_bd_program_memory_0_0_program_memory inst
       (.clk(clk),
        .program_data({\^program_data [15:12],\^program_data [9:4],\^program_data [1:0]}),
        .program_data_address(program_data_address[6:0]));
endmodule

(* ORIG_REF_NAME = "program_memory" *) 
module full_testbench_bd_program_memory_0_0_program_memory
   (program_data,
    program_data_address,
    clk);
  output [11:0]program_data;
  input [6:0]program_data_address;
  input clk;

  wire clk;
  wire [11:0]program_data;
  wire \program_data[0]_i_1_n_0 ;
  wire \program_data[12]_i_2_n_0 ;
  wire \program_data[12]_i_3_n_0 ;
  wire \program_data[13]_i_2_n_0 ;
  wire \program_data[13]_i_3_n_0 ;
  wire \program_data[14]_i_1_n_0 ;
  wire \program_data[14]_i_2_n_0 ;
  wire \program_data[15]_i_1_n_0 ;
  wire \program_data[1]_i_1_n_0 ;
  wire \program_data[4]_i_2_n_0 ;
  wire \program_data[4]_i_3_n_0 ;
  wire \program_data[5]_i_1_n_0 ;
  wire \program_data[6]_i_1_n_0 ;
  wire \program_data[7]_i_1_n_0 ;
  wire \program_data[8]_i_1_n_0 ;
  wire \program_data[8]_i_2_n_0 ;
  wire \program_data[9]_i_1_n_0 ;
  wire [6:0]program_data_address;
  wire \program_data_reg[12]_i_1_n_0 ;
  wire \program_data_reg[13]_i_1_n_0 ;
  wire \program_data_reg[4]_i_1_n_0 ;

  LUT6 #(
    .INIT(64'h13133131FF1200C4)) 
    \program_data[0]_i_1 
       (.I0(program_data_address[3]),
        .I1(program_data_address[1]),
        .I2(program_data_address[4]),
        .I3(program_data_address[5]),
        .I4(program_data_address[0]),
        .I5(program_data_address[2]),
        .O(\program_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC8C8C8C88FFFCBF8)) 
    \program_data[12]_i_2 
       (.I0(program_data_address[6]),
        .I1(program_data_address[1]),
        .I2(program_data_address[0]),
        .I3(program_data_address[4]),
        .I4(program_data_address[5]),
        .I5(program_data_address[2]),
        .O(\program_data[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBF00BF00FFFFAF00)) 
    \program_data[12]_i_3 
       (.I0(program_data_address[6]),
        .I1(program_data_address[5]),
        .I2(program_data_address[0]),
        .I3(program_data_address[1]),
        .I4(program_data_address[2]),
        .I5(program_data_address[4]),
        .O(\program_data[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFAFF50F5AEFFA40A)) 
    \program_data[13]_i_2 
       (.I0(program_data_address[1]),
        .I1(program_data_address[4]),
        .I2(program_data_address[5]),
        .I3(program_data_address[0]),
        .I4(program_data_address[6]),
        .I5(program_data_address[2]),
        .O(\program_data[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5555BAFFBA20)) 
    \program_data[13]_i_3 
       (.I0(program_data_address[1]),
        .I1(program_data_address[5]),
        .I2(program_data_address[4]),
        .I3(program_data_address[0]),
        .I4(program_data_address[6]),
        .I5(program_data_address[2]),
        .O(\program_data[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h24FF2400)) 
    \program_data[14]_i_1 
       (.I0(program_data_address[1]),
        .I1(program_data_address[2]),
        .I2(program_data_address[4]),
        .I3(program_data_address[3]),
        .I4(\program_data[14]_i_2_n_0 ),
        .O(\program_data[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AA572217FF5772)) 
    \program_data[14]_i_2 
       (.I0(program_data_address[1]),
        .I1(program_data_address[5]),
        .I2(program_data_address[0]),
        .I3(program_data_address[2]),
        .I4(program_data_address[4]),
        .I5(program_data_address[6]),
        .O(\program_data[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB7B7B7B7FFEFFFFE)) 
    \program_data[15]_i_1 
       (.I0(program_data_address[3]),
        .I1(program_data_address[1]),
        .I2(program_data_address[0]),
        .I3(program_data_address[4]),
        .I4(program_data_address[6]),
        .I5(program_data_address[2]),
        .O(\program_data[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1080)) 
    \program_data[1]_i_1 
       (.I0(program_data_address[3]),
        .I1(program_data_address[0]),
        .I2(program_data_address[2]),
        .I3(program_data_address[1]),
        .O(\program_data[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8BAB132388A844A4)) 
    \program_data[4]_i_2 
       (.I0(program_data_address[1]),
        .I1(program_data_address[0]),
        .I2(program_data_address[4]),
        .I3(program_data_address[5]),
        .I4(program_data_address[6]),
        .I5(program_data_address[2]),
        .O(\program_data[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF40044000000000)) 
    \program_data[4]_i_3 
       (.I0(program_data_address[2]),
        .I1(program_data_address[4]),
        .I2(program_data_address[5]),
        .I3(program_data_address[0]),
        .I4(program_data_address[6]),
        .I5(program_data_address[1]),
        .O(\program_data[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000A0400000000)) 
    \program_data[5]_i_1 
       (.I0(program_data_address[3]),
        .I1(program_data_address[0]),
        .I2(program_data_address[5]),
        .I3(program_data_address[4]),
        .I4(program_data_address[2]),
        .I5(program_data_address[1]),
        .O(\program_data[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4040F00000000000)) 
    \program_data[6]_i_1 
       (.I0(program_data_address[5]),
        .I1(program_data_address[3]),
        .I2(program_data_address[0]),
        .I3(program_data_address[6]),
        .I4(program_data_address[4]),
        .I5(program_data_address[1]),
        .O(\program_data[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF0088F0008000)) 
    \program_data[7]_i_1 
       (.I0(program_data_address[5]),
        .I1(program_data_address[3]),
        .I2(program_data_address[0]),
        .I3(program_data_address[1]),
        .I4(program_data_address[6]),
        .I5(program_data_address[2]),
        .O(\program_data[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888B88888888888)) 
    \program_data[8]_i_1 
       (.I0(\program_data[8]_i_2_n_0 ),
        .I1(program_data_address[3]),
        .I2(program_data_address[0]),
        .I3(program_data_address[6]),
        .I4(program_data_address[4]),
        .I5(program_data_address[1]),
        .O(\program_data[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4340)) 
    \program_data[8]_i_2 
       (.I0(program_data_address[5]),
        .I1(program_data_address[1]),
        .I2(program_data_address[4]),
        .I3(program_data_address[2]),
        .I4(program_data_address[6]),
        .O(\program_data[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h02020E0000000000)) 
    \program_data[9]_i_1 
       (.I0(program_data_address[3]),
        .I1(program_data_address[0]),
        .I2(program_data_address[5]),
        .I3(program_data_address[6]),
        .I4(program_data_address[4]),
        .I5(program_data_address[1]),
        .O(\program_data[9]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[0]_i_1_n_0 ),
        .Q(program_data[0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data_reg[12]_i_1_n_0 ),
        .Q(program_data[8]),
        .R(1'b0));
  MUXF7 \program_data_reg[12]_i_1 
       (.I0(\program_data[12]_i_2_n_0 ),
        .I1(\program_data[12]_i_3_n_0 ),
        .O(\program_data_reg[12]_i_1_n_0 ),
        .S(program_data_address[3]));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data_reg[13]_i_1_n_0 ),
        .Q(program_data[9]),
        .R(1'b0));
  MUXF7 \program_data_reg[13]_i_1 
       (.I0(\program_data[13]_i_2_n_0 ),
        .I1(\program_data[13]_i_3_n_0 ),
        .O(\program_data_reg[13]_i_1_n_0 ),
        .S(program_data_address[3]));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[14]_i_1_n_0 ),
        .Q(program_data[10]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[15]_i_1_n_0 ),
        .Q(program_data[11]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[1]_i_1_n_0 ),
        .Q(program_data[1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data_reg[4]_i_1_n_0 ),
        .Q(program_data[2]),
        .R(1'b0));
  MUXF7 \program_data_reg[4]_i_1 
       (.I0(\program_data[4]_i_2_n_0 ),
        .I1(\program_data[4]_i_3_n_0 ),
        .O(\program_data_reg[4]_i_1_n_0 ),
        .S(program_data_address[3]));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[5]_i_1_n_0 ),
        .Q(program_data[3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[6]_i_1_n_0 ),
        .Q(program_data[4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[7]_i_1_n_0 ),
        .Q(program_data[5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[8]_i_1_n_0 ),
        .Q(program_data[6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \program_data_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\program_data[9]_i_1_n_0 ),
        .Q(program_data[7]),
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
