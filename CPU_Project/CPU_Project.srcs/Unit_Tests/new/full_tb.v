`timescale 1ns / 1ps

`include "params.v"

module full_tb;

  reg clk;
  reg cu_enable;
  wire [`operand_size-1:0]gen_reg_data_out;
  reg reset;

full_testbench_bd full_tb_DUT
   (.clk(clk),
    .cu_enable(cu_enable),
    .gen_reg_data_out(gen_reg_data_out),
    .reset(reset)
    );

//Setup clock signal    
initial clk = 0;
always #1 clk = ~clk;
//Setup reset
initial reset = 0; //Reset alu at first clock cycle
//Enable module
initial cu_enable = 1;

//Begin testbench
initial begin
    #8 reset = 1;
//    force control_unit_tb_auto_bd_i.general_registers_0.inst.data_reg[0] = 1;   
//    release control_unit_tb_auto_bd_i.general_registers_0.inst.data_reg[0] = 1;   
    #100 $finish();
end

endmodule
