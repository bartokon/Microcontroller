`timescale 1ns / 1ps

`include "params.v"

///Full test
module program_memory_tb_auto;


  reg clk;
  reg reset;
  reg cu_enable;
  wire [3:0]gen_reg_data_out;

  full_testbench_bd full_testbench_bd_i
       (.clk(clk),
        .cu_enable(cu_enable),
        .gen_reg_data_out(gen_reg_data_out),
        .reset(reset));

//Setup clock signal    
initial clk = 0;
always #1 clk = ~clk;
//Setup reset
initial reset = 0; //Reset alu at first clock cycle
//Enable module
initial cu_enable = 1;


  initial begin
  #8 reset = 1;
  
  #100 $finish();
  end

endmodule
