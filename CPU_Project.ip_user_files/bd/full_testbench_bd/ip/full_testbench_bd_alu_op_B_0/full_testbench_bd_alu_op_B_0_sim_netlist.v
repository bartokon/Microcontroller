// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 16:56:13 2021
// Host        : DESKTOP-VSR39OG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/LOLNO/CPU_Project/CPU_Project.gen/sources_1/bd/full_testbench_bd/ip/full_testbench_bd_alu_op_B_0/full_testbench_bd_alu_op_B_0_sim_netlist.v
// Design      : full_testbench_bd_alu_op_B_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "full_testbench_bd_alu_op_B_0,alu_input_output_reg,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "alu_input_output_reg,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module full_testbench_bd_alu_op_B_0
   (data_in,
    data_out,
    enable,
    clk,
    reset);
  input [7:0]data_in;
  output [7:0]data_out;
  input enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;

  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire enable;
  wire reset;

  full_testbench_bd_alu_op_B_0_alu_input_output_reg inst
       (.clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .enable(enable),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "alu_input_output_reg" *) 
module full_testbench_bd_alu_op_B_0_alu_input_output_reg
   (data_out,
    enable,
    data_in,
    clk,
    reset);
  output [7:0]data_out;
  input enable;
  input [7:0]data_in;
  input clk;
  input reset;

  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire enable;
  wire p_0_in;
  wire reset;

  LUT1 #(
    .INIT(2'h1)) 
    \data_out[7]_i_1 
       (.I0(reset),
        .O(p_0_in));
  FDRE \data_out_reg[0] 
       (.C(clk),
        .CE(enable),
        .D(data_in[0]),
        .Q(data_out[0]),
        .R(p_0_in));
  FDRE \data_out_reg[1] 
       (.C(clk),
        .CE(enable),
        .D(data_in[1]),
        .Q(data_out[1]),
        .R(p_0_in));
  FDRE \data_out_reg[2] 
       (.C(clk),
        .CE(enable),
        .D(data_in[2]),
        .Q(data_out[2]),
        .R(p_0_in));
  FDRE \data_out_reg[3] 
       (.C(clk),
        .CE(enable),
        .D(data_in[3]),
        .Q(data_out[3]),
        .R(p_0_in));
  FDRE \data_out_reg[4] 
       (.C(clk),
        .CE(enable),
        .D(data_in[4]),
        .Q(data_out[4]),
        .R(p_0_in));
  FDRE \data_out_reg[5] 
       (.C(clk),
        .CE(enable),
        .D(data_in[5]),
        .Q(data_out[5]),
        .R(p_0_in));
  FDRE \data_out_reg[6] 
       (.C(clk),
        .CE(enable),
        .D(data_in[6]),
        .Q(data_out[6]),
        .R(p_0_in));
  FDRE \data_out_reg[7] 
       (.C(clk),
        .CE(enable),
        .D(data_in[7]),
        .Q(data_out[7]),
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
