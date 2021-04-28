`timescale 1ns / 1ps

`include "params.v"


module alu (operand_A, operand_B, operand_C, overflow, underflow, A_bigger, B_bigger, AB_same, instruction, clk, reset);
parameter NOP = `NOP;
parameter ADD = `ADD;
parameter SUB = `SUB;
parameter AND = `AND;
parameter OR = `OR;
parameter NOT = `NOT;

  //Inputs
    input wire [`operand_size-1:0] operand_A, operand_B;    
    input wire [`ALU_INSTRUCTION_BUS_SIZE-1:0] instruction;
    input wire clk, reset;
  
  //Outputs
    output reg [`operand_size-1:0] operand_C;
    output reg overflow;
    output reg underflow;
    output reg A_bigger;
    output reg B_bigger;
    output reg AB_same;
  
    
  //Internal registers
    reg [`ALU_INSTRUCTION_BUS_SIZE-1:0] internal_instruction;
    reg signed [`operand_size:0] internal_operand_A, internal_operand_B;
    reg signed [`operand_size:0] internal_operand_C;
   
  always  @(posedge clk) begin
      if (~reset)
          begin
              //Set everything to zeros
                `LHS_delay internal_instruction <= `RHS_delay 0;
                `LHS_delay internal_operand_A <= `RHS_delay 0;
                `LHS_delay internal_operand_B <= `RHS_delay 0;
                `LHS_delay internal_operand_C <= `RHS_delay 0;
          end
    end
   
   always  @(negedge clk) begin
        //Fetch new instruction and operands to alu
        internal_instruction = instruction;
        internal_operand_A = ({operand_A[`operand_size-1], operand_A});
        internal_operand_B = ({operand_B[`operand_size-1], operand_B});
        
        //Do calculation
        case (internal_instruction)
            NOP[15:12]: internal_operand_C = internal_operand_C;
            ADD[15:12]: internal_operand_C = internal_operand_A + internal_operand_B;
            SUB[15:12]: internal_operand_C = internal_operand_A - internal_operand_B;
            AND[15:12]: internal_operand_C = internal_operand_A & internal_operand_B;
            OR[15:12]: internal_operand_C = internal_operand_A | internal_operand_B;
            NOT[15:12]: internal_operand_C = ~internal_operand_A;           
            default: internal_operand_C = internal_operand_C;
        endcase
        
        operand_C = internal_operand_C[`operand_size-1:0];
        
        //Flags
        //Check if overflow
        if (internal_operand_C[`operand_size:`operand_size-1] == 2'b01 ) begin
            overflow <= 1;
        end else begin
            overflow <= 0;
        end
        
        //check if underflow
        if (internal_operand_C[`operand_size:`operand_size-1] == 2'b10 ) begin
            underflow <= 1;
        end else begin
            underflow <= 0;
        end
        
        //Compare input arguments
        if (internal_operand_A > internal_operand_B) begin 
            A_bigger <= 1; 
            B_bigger <= 0;
            AB_same <= 0;
        end else if(internal_operand_A < internal_operand_B) begin
            A_bigger <= 0; 
            B_bigger <= 1;
            AB_same <= 0;
        end else if (internal_operand_A == internal_operand_B) begin
            A_bigger = 0; 
            B_bigger = 0;
            AB_same <= 1;
        end 
   end
  

   
    
endmodule
