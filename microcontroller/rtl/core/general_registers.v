`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// General Purpose Register File
//
// Provides storage for general purpose registers accessible by the control unit
// Supports read and write operations with register selection
//==============================================================================

module general_registers(
    // Data interface
    input wire [`operand_size-1:0] data_in,
    output reg [`operand_size-1:0] data_out,

    // Register selection
    input wire [`number_of_registers-1:0] select_reg,

    // Control signals
    input wire read,
    input wire write,
    input wire enable,

    // System signals
    input wire clk,
    input wire reset
);

    //==========================================================================
    // Internal Register Array
    // Array of general purpose registers
    //==========================================================================
    reg [`operand_size-1:0] data_reg [`number_of_registers-1:0];

    //==========================================================================
    // Register Operations
    // Read and write on negative clock edge
    //==========================================================================
    always @(negedge clk) begin
        if (~reset) begin: clear_regs
            integer i;
            for (i = 0; i < `number_of_registers; i = i + 1) begin
                data_reg[i] <= {`operand_size{1'b0}};
            end
        end else if (enable) begin
            if (write & ~read) begin
                // Write operation
                data_reg[select_reg] <= data_in;
            end else if (read & ~write) begin
                // Read operation
                data_out <= data_reg[select_reg];
            end else begin
                // No operation - output high-Z
                data_out <= {`operand_size{1'bz}};
            end
        end
    end

`ifdef _DEBUG_GENERAL_REGISTERS_
    // Debug output for simulation
    always @(negedge clk) begin
        if (enable && write && ~read) begin
            $display("[GEN_REG] Time=%0t Write: reg=%0d data=0x%02x",
                     $time, select_reg, data_in);
        end
        if (enable && read && ~write) begin
            $display("[GEN_REG] Time=%0t Read: reg=%0d data=0x%02x",
                     $time, select_reg, data_out);
        end
    end
`endif

endmodule
