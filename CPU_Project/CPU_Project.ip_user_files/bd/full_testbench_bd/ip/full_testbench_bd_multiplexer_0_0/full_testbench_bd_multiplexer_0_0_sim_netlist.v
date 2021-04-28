// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:21 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_multiplexer_0_0/full_testbench_bd_multiplexer_0_0_sim_netlist.v
// Design      : full_testbench_bd_multiplexer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "full_testbench_bd_multiplexer_0_0,multiplexer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "multiplexer,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module full_testbench_bd_multiplexer_0_0
   (sel,
    in1,
    in2,
    outpt);
  input [1:0]sel;
  input [7:0]in1;
  input [7:0]in2;
  output [7:0]outpt;

  wire [7:0]in1;
  wire [7:0]in2;
  wire [7:0]outpt;
  wire [1:0]sel;

  full_testbench_bd_multiplexer_0_0_multiplexer inst
       (.in1(in1),
        .in2(in2),
        .outpt(outpt),
        .sel(sel));
endmodule

(* ORIG_REF_NAME = "multiplexer" *) 
module full_testbench_bd_multiplexer_0_0_multiplexer
   (outpt,
    in2,
    in1,
    sel);
  output [7:0]outpt;
  input [7:0]in2;
  input [7:0]in1;
  input [1:0]sel;

  wire [7:0]in1;
  wire [7:0]in2;
  wire [7:0]outpt;
  wire [1:0]sel;

  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[0]_INST_0 
       (.I0(in2[0]),
        .I1(in1[0]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[0]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[1]_INST_0 
       (.I0(in2[1]),
        .I1(in1[1]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[1]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[2]_INST_0 
       (.I0(in2[2]),
        .I1(in1[2]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[2]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[3]_INST_0 
       (.I0(in2[3]),
        .I1(in1[3]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[3]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[4]_INST_0 
       (.I0(in2[4]),
        .I1(in1[4]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[4]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[5]_INST_0 
       (.I0(in2[5]),
        .I1(in1[5]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[5]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[6]_INST_0 
       (.I0(in2[6]),
        .I1(in1[6]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[6]));
  LUT4 #(
    .INIT(16'hFCA0)) 
    \outpt[7]_INST_0 
       (.I0(in2[7]),
        .I1(in1[7]),
        .I2(sel[1]),
        .I3(sel[0]),
        .O(outpt[7]));
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
