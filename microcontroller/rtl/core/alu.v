`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// Arithmetic Logic Unit (ALU) Module
//
// BUGS FIXED:
// 1. Fixed mixed blocking/non-blocking assignments in flag comparison logic
//    Lines 88-89: Changed A_bigger = 0 and B_bigger = 0 to non-blocking (<=)
//    Ensures consistent timing behavior and prevents race conditions
//==============================================================================

module alu (
    // Input operands
    input wire [`operand_size-1:0] operand_A,
    input wire [`operand_size-1:0] operand_B,

    // Output result
    output reg [`operand_size-1:0] operand_C,

    // Status flags
    output reg overflow,
    output reg underflow,
    output reg A_bigger,
    output reg B_bigger,
    output reg AB_same,

    // Control
    input wire [`ALU_INSTRUCTION_BUS_SIZE-1:0] instruction,
    input wire clk,
    input wire reset
);

    //==========================================================================
    // Local Parameters - Instruction Opcodes
    //==========================================================================
    localparam NOP = `NOP;
    localparam ADD = `ADD;
    localparam SUB = `SUB;
    localparam AND = `AND;
    localparam OR  = `OR;
    localparam NOT = `NOT;

    //==========================================================================
    // Internal Registers
    // Using signed arithmetic with extra bit for overflow/underflow detection
    //==========================================================================
    reg [`ALU_INSTRUCTION_BUS_SIZE-1:0] internal_instruction;
    reg signed [`operand_size:0] internal_operand_A;
    reg signed [`operand_size:0] internal_operand_B;
    reg signed [`operand_size:0] internal_operand_C;

    //==========================================================================
    // Reset Logic - Clear all registers on reset
    //==========================================================================
    always @(posedge clk) begin
        if (~reset) begin
            `LHS_delay internal_instruction <= `RHS_delay {`ALU_INSTRUCTION_BUS_SIZE{1'b0}};
            `LHS_delay internal_operand_A <= `RHS_delay {`operand_size+1{1'b0}};
            `LHS_delay internal_operand_B <= `RHS_delay {`operand_size+1{1'b0}};
            `LHS_delay internal_operand_C <= `RHS_delay {`operand_size+1{1'b0}};
        end
    end

    //==========================================================================
    // ALU Operation Logic - Execute on negative clock edge
    //==========================================================================
    always @(negedge clk) begin
        // Fetch instruction and operands
        internal_instruction = instruction;
        // Sign-extend operands to 9 bits for overflow detection
        internal_operand_A = {operand_A[`operand_size-1], operand_A};
        internal_operand_B = {operand_B[`operand_size-1], operand_B};

        // Execute operation based on instruction opcode
        case (internal_instruction)
            NOP[15:12]: internal_operand_C = internal_operand_C;  // No operation
            ADD[15:12]: internal_operand_C = internal_operand_A + internal_operand_B;
            SUB[15:12]: internal_operand_C = internal_operand_A - internal_operand_B;
            AND[15:12]: internal_operand_C = internal_operand_A & internal_operand_B;
            OR[15:12]:  internal_operand_C = internal_operand_A | internal_operand_B;
            NOT[15:12]: internal_operand_C = ~internal_operand_A;
            default:    internal_operand_C = internal_operand_C;  // Hold previous value
        endcase

        // Output lower 8 bits as result
        operand_C <= internal_operand_C[`operand_size-1:0];

        //======================================================================
        // Overflow Flag
        // Overflow occurs when result is positive but top bit indicates negative
        // Pattern: [8:7] = 2'b01 (sign bit = 0, but MSB = 1)
        //======================================================================
        if (internal_operand_C[`operand_size:`operand_size-1] == 2'b01) begin
            overflow <= 1'b1;
        end else begin
            overflow <= 1'b0;
        end

        //======================================================================
        // Underflow Flag
        // Underflow occurs when result is negative but representation is wrong
        // Pattern: [8:7] = 2'b10 (sign bit = 1, but MSB = 0)
        //======================================================================
        if (internal_operand_C[`operand_size:`operand_size-1] == 2'b10) begin
            underflow <= 1'b1;
        end else begin
            underflow <= 1'b0;
        end

        //======================================================================
        // Comparison Flags
        // FIXED: Changed blocking assignments (=) to non-blocking (<=)
        //        for consistent timing behavior
        //======================================================================
        if (internal_operand_A > internal_operand_B) begin
            A_bigger <= 1'b1;
            B_bigger <= 1'b0;
            AB_same <= 1'b0;
        end else if (internal_operand_A < internal_operand_B) begin
            A_bigger <= 1'b0;
            B_bigger <= 1'b1;
            AB_same <= 1'b0;
        end else if (internal_operand_A == internal_operand_B) begin
            // FIXED: Changed from blocking (=) to non-blocking (<=)
            A_bigger <= 1'b0;
            B_bigger <= 1'b0;
            AB_same <= 1'b1;
        end
    end

`ifdef _DEBUG_ALU_
    // Debug output for simulation
    always @(negedge clk) begin
        $display("[ALU] Time=%0t Instr=%0d A=%0d B=%0d C=%0d OV=%b UN=%b",
                 $time, internal_instruction, internal_operand_A,
                 internal_operand_B, operand_C, overflow, underflow);
    end
`endif

endmodule
