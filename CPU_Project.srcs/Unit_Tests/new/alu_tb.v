`timescale 1ns / 1ps

`include "params.v"

//Test bench for ALU unit

module alu_tb;

//Alu inputs
reg signed [`operand_size-1:0] operand_A;
reg signed [`operand_size-1:0] operand_B;
reg [`instruction_size-1:0] instruction;

//Alu outputs
wire signed [`operand_size-1:0] operand_C;
wire overflow;
wire underflow;

//Control signals
reg clk;
reg reset;

alu alu_dut(
    .operand_A(operand_A),
    .operand_B(operand_B),
    .operand_C(operand_C),
    .overflow(overflow),
    .underflow(underflow),
    .instruction(instruction),
    .A_bigger(A_bigger),
    .B_bigger(B_bigger),
    .AB_same(AB_same),
    .clk(clk),
    .reset(reset)
    );
    
//Setup clock signal    
initial clk = 0;
always #1 clk = ~clk;
//Setup reset
initial reset = 0; //Reset alu at first clock cycle

//Begin testbench
initial begin
    #8 reset = 1;
    instruction = `ADD;
    for (integer i = 0; i < 8; i = i + 1) begin
        @(posedge clk) begin
        operand_A = i;
        operand_B = 0;
        end      
        @(posedge clk) begin
            $display("%d + %d = %d, gold: %d ", operand_A, operand_B, operand_C, operand_A + operand_B);
        end     
    end
        
    instruction = `SUB;
    #4 //wait for full clock cycle
    for (integer i = 0; i < 8; i = i + 1) begin
        @(posedge clk) begin
        operand_A = 0;
        operand_B = i;
        end      
        @(posedge clk) begin
            $display("%d - %d = %d, gold: %d ", operand_A, operand_B, operand_C, operand_A - operand_B);
        end     
    end
    $finish();
end

endmodule
