`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// ALU Input/Output Register
//
// Provides buffering for ALU operand inputs (A and B)
// Latches data on positive clock edge when enabled
//==============================================================================

module alu_input_output_reg(
    input wire [`operand_size-1:0] data_in,
    output reg [`operand_size-1:0] data_out,
    input wire enable,
    input wire clk,
    input wire reset
);

    //==========================================================================
    // Register Logic
    // Latches input data on positive clock edge when enabled
    //==========================================================================
    always @(posedge clk) begin
        if (~reset) begin
            data_out <= {`operand_size{1'b0}};
        end else if (enable) begin
            data_out <= data_in;
        end
    end

endmodule
