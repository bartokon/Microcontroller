`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// Top-Level Microcontroller Module
//
// Integrates all microcontroller components:
// - Control Unit (instruction decode and execution)
// - ALU (arithmetic and logic operations)
// - General Purpose Registers
// - ALU Input Registers (A and B)
// - Program Memory (instruction storage)
// - RAM (data storage)
// - Multiplexers (data routing)
//==============================================================================

module microcontroller_top(
    input wire clk,
    input wire reset,
    input wire enable,
    output wire [`operand_size-1:0] debug_output
);

    //==========================================================================
    // Internal Wires - Control Unit Outputs
    //==========================================================================
    wire [`ALU_INSTRUCTION_BUS_SIZE-1:0] alu_instruction;
    wire [1:0] alu_register_enable;
    wire [1:0] register_enable;
    wire register_write;
    wire register_read;
    wire [`number_of_registers-1:0] register_select;
    wire [`program_data_max_length-1:0] program_data_address;
    wire [`operand_size-1:0] cu_output_data;
    wire [`ram_addres_bus_size-1:0] ram_address;
    wire [1:0] ram_cu_select;

    //==========================================================================
    // Internal Wires - Program Memory
    //==========================================================================
    wire [`program_data_size-1:0] program_data;

    //==========================================================================
    // Internal Wires - ALU
    //==========================================================================
    wire [`operand_size-1:0] alu_operand_A;
    wire [`operand_size-1:0] alu_operand_B;
    wire [`operand_size-1:0] alu_operand_C;
    wire alu_overflow;
    wire alu_underflow;
    wire alu_A_bigger;
    wire alu_B_bigger;
    wire alu_AB_same;

    //==========================================================================
    // Internal Wires - Registers and RAM
    //==========================================================================
    wire [`operand_size-1:0] gen_reg_data_out;
    wire [`operand_size-1:0] ram_data_out;

    //==========================================================================
    // Internal Wires - Multiplexers
    //==========================================================================
    wire [`operand_size-1:0] mux_to_alu_regs;  // Mux output to ALU input regs
    wire [`operand_size-1:0] mux_to_ram;       // Mux output to RAM input

    //==========================================================================
    // Internal Wires - Register Enable Slicing
    //==========================================================================
    wire alu_reg_A_enable;
    wire alu_reg_B_enable;
    wire gen_reg_enable;
    wire ram_enable;

    // Extract individual enable signals
    assign alu_reg_A_enable = alu_register_enable[0];
    assign alu_reg_B_enable = alu_register_enable[1];
    assign gen_reg_enable = register_enable[0];
    assign ram_enable = register_enable[1];

    // Debug output
    assign debug_output = mux_to_alu_regs;

    //==========================================================================
    // Module Instantiations
    //==========================================================================

    //--------------------------------------------------------------------------
    // Control Unit - Brain of the microcontroller
    //--------------------------------------------------------------------------
    control_unit cu_inst (
        .alu_instruction(alu_instruction),
        .alu_register_enable(alu_register_enable),
        .register_enable(register_enable),
        .register_write(register_write),
        .register_read(register_read),
        .register_select(register_select),
        .program_data(program_data),
        .program_data_address(program_data_address),
        .output_data(cu_output_data),
        .ram_address(ram_address),
        .overflow(alu_overflow),
        .underflow(alu_underflow),
        .A_bigger(alu_A_bigger),
        .B_bigger(alu_B_bigger),
        .AB_same(alu_AB_same),
        .ram_cu_select(ram_cu_select),
        .enable(enable),
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------------------------------
    // Program Memory - Stores instructions
    //--------------------------------------------------------------------------
    program_memory prog_mem_inst (
        .program_data_address(program_data_address),
        .program_data(program_data),
        .clk(clk)
    );

    //--------------------------------------------------------------------------
    // ALU - Arithmetic and Logic Unit
    //--------------------------------------------------------------------------
    alu alu_inst (
        .operand_A(alu_operand_A),
        .operand_B(alu_operand_B),
        .operand_C(alu_operand_C),
        .overflow(alu_overflow),
        .underflow(alu_underflow),
        .A_bigger(alu_A_bigger),
        .B_bigger(alu_B_bigger),
        .AB_same(alu_AB_same),
        .instruction(alu_instruction),
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------------------------------
    // ALU Input Register A
    //--------------------------------------------------------------------------
    alu_input_output_reg alu_reg_A (
        .data_in(mux_to_alu_regs),
        .data_out(alu_operand_A),
        .enable(alu_reg_A_enable),
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------------------------------
    // ALU Input Register B
    //--------------------------------------------------------------------------
    alu_input_output_reg alu_reg_B (
        .data_in(mux_to_alu_regs),
        .data_out(alu_operand_B),
        .enable(alu_reg_B_enable),
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------------------------------
    // General Purpose Registers
    //--------------------------------------------------------------------------
    general_registers gen_regs_inst (
        .data_in(alu_operand_C),
        .data_out(gen_reg_data_out),
        .read(register_read),
        .write(register_write),
        .select_reg(register_select),
        .enable(gen_reg_enable),
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------------------------------
    // RAM - Data Memory
    //--------------------------------------------------------------------------
    cu_ram ram_inst (
        .address(ram_address),
        .data_out(ram_data_out),
        .data_in(mux_to_ram),
        .write(register_write),
        .read(register_read),
        .enable(ram_enable),
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------------------------------
    // Multiplexer 0 - Routes data to ALU input registers
    // Selects between general registers and RAM
    //--------------------------------------------------------------------------
    multiplexer mux_0 (
        .sel(register_enable),
        .in1(gen_reg_data_out),
        .in2(ram_data_out),
        .outpt(mux_to_alu_regs)
    );

    //--------------------------------------------------------------------------
    // Multiplexer 1 - Routes data to RAM input
    // Selects between CU output and general register output
    //--------------------------------------------------------------------------
    multiplexer mux_1 (
        .sel(ram_cu_select),
        .in1(cu_output_data),
        .in2(mux_to_alu_regs),
        .outpt(mux_to_ram)
    );

endmodule
