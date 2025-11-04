`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// 4-to-1 Multiplexer
//
// Selects between two input sources or constant values (0 or all 1s)
// Used for routing data between different modules in the microcontroller
//==============================================================================

module multiplexer(
    input wire [1:0] sel,
    input wire [`operand_size-1:0] in1,
    input wire [`operand_size-1:0] in2,
    output reg [`operand_size-1:0] outpt
);

    //==========================================================================
    // Multiplexer Selection Logic
    // 00: Output all zeros
    // 01: Output in1 (e.g., from general registers or CU output)
    // 10: Output in2 (e.g., from RAM or general output)
    // 11: Output all ones
    //==========================================================================
    always @(*) begin
        case (sel)
            2'b00: outpt = {`operand_size{1'b0}};      // All zeros
            2'b01: outpt = in1;                         // Input 1
            2'b10: outpt = in2;                         // Input 2
            2'b11: outpt = {`operand_size{1'b1}};      // All ones
            default: outpt = {`operand_size{1'b0}};    // Default to zeros
        endcase
    end

endmodule
