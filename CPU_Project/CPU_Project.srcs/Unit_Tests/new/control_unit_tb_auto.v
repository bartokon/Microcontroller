`timescale 1ns / 1ps


`include "params.v"

//Tests whole block design
module control_unit_tb_auto;

  reg clk;
  reg cu_enable; 
  reg [`instruction_size-1:0]program_data;
  reg reset;
  wire [`operand_size-1:0]gen_reg_data_out;
    
  control_unit_tb_auto_bd control_unit_tb_auto_bd_i
       (.clk(clk),
        .cu_enable(cu_enable),
        .gen_reg_data_out(gen_reg_data_out),
        .program_data(program_data),
        .reset(reset));

task instruction;
    input [`instruction_size-1:0] cu_instruction;
    begin
        @(posedge clk) program_data = cu_instruction;
    end
endtask

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
    //Start setup
    force control_unit_tb_auto_bd_i.general_registers_0.inst.data_reg[0] = 1;   
        instruction(`instruction_size'b1001_0000_0000_0000); //Save to A
        instruction(`instruction_size'b1010_0000_0000_0001); // Save to B
        instruction(`NOP);
    release control_unit_tb_auto_bd_i.general_registers_0.inst.data_reg[0];
    //End setup
        instruction(`ADD);     //each instruction takes one clock cycle
        instruction(`instruction_size'b1000_0000_0000_0001);  
        instruction(`instruction_size'b1001_0000_0000_0001);
        instruction(`ADD);
        instruction(`instruction_size'b1000_0000_0000_0010);
        instruction(`NOP);
        if (control_unit_tb_auto_bd_i.general_registers_0.inst.data_reg[2] != 3) begin
            $display("Test failed!");
            $stop();
        end
        $display("CONTROL UNIT TEST PASSED!");
        //$finish();
end
 
    
endmodule
