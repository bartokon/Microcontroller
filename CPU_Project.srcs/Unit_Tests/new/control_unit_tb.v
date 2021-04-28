`timescale 1ns / 1ps


`include "params.v"

module control_unit_tb;

//Inputs
reg [`program_data_size-1:0] program_data;
reg enable, clk, reset;
reg overflow, underflow, A_bigger, B_bigger, AB_same;
 
//Outputs
wire [`instruction_size-1:0] alu_instruction;
wire [`number_of_alu_registers-1:0] alu_register_enable; 
wire [`number_of_registers-1:0] register_select;
wire register_write;
wire register_read;
wire register_enable;

control_unit control_unit_DUT(
    .alu_instruction(alu_instruction),
    .alu_register_enable(alu_register_enable),
    .register_enable(register_enable),
    .register_write(register_write),
    .register_read(register_read),
    .register_select(register_select),
    .program_data(program_data),
    .program_data_address(program_data_address),
    .output_data(output_data),
    .ram_address(ram_address),
    .overflow(overflow),
    .underflow(underflow),
    .A_bigger(A_bigger),
    .B_bigger(B_bigger),
    .AB_same(AB_same),
    .enable(enable),
    .clk(clk),
    .reset(reset)
    );


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
initial enable = 1;

//Begin testbench
initial begin
    #8 reset = 1;
 
    for (integer i = 0; i < `instruction_count; i = i + 1) begin
        instruction(i);
    end
            
    #2 $finish();
end
 
    
endmodule
