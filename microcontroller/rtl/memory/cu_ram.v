`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// Control Unit RAM Module
//
// BUGS FIXED:
// 1. Array size changed from 8 to 256 locations (was: internal_memory [7:0])
// 2. get_ram_size function fixed: 2**address_size instead of 2^address_size
//    (^ is XOR operator in Verilog, not exponentiation!)
//==============================================================================

module cu_ram(
    input wire [`ram_addres_bus_size-1:0] address,
    input wire [`operand_size-1:0] data_in,
    input wire write,
    input wire read,
    input wire enable,
    input wire clk,
    input wire reset,
    output reg [`operand_size-1:0] data_out
);

    //==========================================================================
    // Internal Memory
    // FIXED: Changed from [`ram_addres_bus_size-1:0] (8 locations)
    //        to [255:0] (256 locations) to match 8-bit address bus
    //==========================================================================
    reg [`operand_size-1:0] internal_memory [255:0];

    //==========================================================================
    // Function to calculate RAM size from address bus width
    // FIXED: Changed from 2^(address_size-1) to 2**(address_size-1)
    //        In Verilog: ^ is XOR, ** is exponentiation
    //==========================================================================
    function integer get_ram_size;
        input integer address_size;
        begin
            get_ram_size = 2**(address_size-1);  // FIXED: Use ** for power, not ^
        end
    endfunction

    //==========================================================================
    // Memory Reset - Clear all memory locations on reset
    //==========================================================================
    always @(posedge clk) begin
        if (~reset) begin: clear_regs
            integer i;
            for (i = 0; i < get_ram_size(`ram_addres_bus_size); i = i + 1) begin
                internal_memory[i] <= {`operand_size{1'b0}};
            end
        end
    end

    //==========================================================================
    // Memory Read/Write Operations
    // Read and write operations occur on negative clock edge
    //==========================================================================
    always @(negedge clk) begin
        if (enable) begin
            if (read & ~write) begin
                // Read operation: output data from addressed location
                data_out <= internal_memory[address];
            end else if (write & ~read) begin
                // Write operation: store data to addressed location
                internal_memory[address] <= data_in;
            end else begin
                // No operation: output high-Z
                data_out <= {`operand_size{1'bz}};
            end
        end else begin
            // Module disabled: output high-Z
            data_out <= {`operand_size{1'bz}};
        end
    end

`ifdef _DEBUG_RAM_
    // Debug output for simulation
    always @(posedge clk) begin
        if (enable && write && ~read) begin
            $display("[RAM] Time=%0t Write: addr=0x%02x data=0x%02x",
                     $time, address, data_in);
        end
        if (enable && read && ~write) begin
            $display("[RAM] Time=%0t Read: addr=0x%02x data=0x%02x",
                     $time, address, data_out);
        end
    end
`endif

endmodule
