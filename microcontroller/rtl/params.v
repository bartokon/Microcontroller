// Microcontroller Parameters and Definitions
// Fixed version - All bugs corrected

`ifndef _params_
`define _params_

//==============================================================================
// Timing Delays
//==============================================================================
// LHS delay
`define LHS_delay #(1:1:1)
// RHS delay
`define RHS_delay #(1:1:1)

//==============================================================================
// Data Size Definitions
//==============================================================================
// Size of ALU operands (8-bit data)
`define operand_size 8

// Instruction size (16-bit instructions)
`define instruction_size 16

// ALU instruction bus size (4-bit opcode)
`define ALU_INSTRUCTION_BUS_SIZE 4

//==============================================================================
// ALU and Control Unit Operation Codes
// Format: [15:12] = Opcode, [11:0] = Operands/Address/Flags
//==============================================================================

// ALU Operations (0x0 - 0x7)
`define NOP     `instruction_size'b0000_0000_0000_0000    // No operation
`define ADD     `instruction_size'b0001_0000_0000_0000    // Addition
`define SUB     `instruction_size'b0010_0000_0000_0000    // Subtraction
`define AND     `instruction_size'b0011_0000_0000_0000    // Bitwise AND
`define OR      `instruction_size'b0100_0000_0000_0000    // Bitwise OR
`define NOT     `instruction_size'b0101_0000_0000_0000    // Bitwise NOT
`define UNUSED_6 `instruction_size'b0110_0000_0000_0000   // Reserved - Not used
`define UNUSED_7 `instruction_size'b0111_0000_0000_0000   // Reserved - Not used

//==============================================================================
// Data Movement Operations
//==============================================================================

// Move ALU output (C) to register X
// Format: 1000_0000_0000_RRRR (RRRR = register address)
`define MOV_C_regX `instruction_size'b1000_0000_0000_????
`define instruction_MOV_C_regX(address) {4'b1000, 8'd0, 4'd``address``}

// Move register X to ALU operand A
// Format: 1001_0000_0000_RRRR (RRRR = register address)
`define MOV_regX_A `instruction_size'b1001_0000_0000_????
`define instruction_MOV_regX_A(address) {4'b1001, 8'd0, 4'd``address``}

// Move register X to ALU operand B
// Format: 1010_0000_0000_RRRR (RRRR = register address)
`define MOV_regX_B `instruction_size'b1010_0000_0000_????
`define instruction_MOV_regX_B(address) {4'b1010, 8'd0, 4'd``address``}

// Save register Y value to RAM address X
// Format: 1011_AAAAAAAA_RRRR (AAAAAAAA = RAM address, RRRR = register)
`define MOV_regY_ramX `instruction_size'b1011_????_????_????
`define instruction_MOV_regY_ramX(ram_addr, reg_addr) {4'b1011, 8'd``ram_addr``, 4'd``reg_addr``}

// Move RAM value to ALU register A or B
// Format: 1100_AAAAAAAA_00SS (AAAAAAAA = RAM address, SS = 01:A, 10:B)
`define MOV_ramX_AB `instruction_size'b1100_????_????_00??
`define instruction_MOV_ramX_A1orB2(ram_addr, select) {4'b1100, 8'd``ram_addr``, 2'b00, 2'd``select``}

//==============================================================================
// Load/Store Operations
//==============================================================================

// Load constant from program memory to CU output
// Format: 1101_DDDDDDDD_0000 (DDDDDDDD = 8-bit constant data)
`define LOAD `instruction_size'b1101_????_????_0000
`define instruction_LOAD(data) {4'b1101, 8'd``data``, 4'b0000}

// Save to RAM
// Format: 1110_AAAAAAAA_00SS
//   SS = 01: Save CU output to RAM
//   SS = 10: Save general register output to RAM
`define SAVE `instruction_size'b1110_????_????_00??
`define instruction_SAVE_CU(address) {4'b1110, 8'd``address``, 4'b0001}
`define instruction_SAVE_GEN_OUT(address) {4'b1110, 8'd``address``, 4'b0010}

//==============================================================================
// Jump Operations
//==============================================================================

// Unconditional jump to address
// Format: 1111_AAAAAAAA_0000 (AAAAAAAA = target address)
`define jump_x `instruction_size'b1111_????_????_0000
`define instruction_JUMP(address) {4'b1111, 8'd``address``, 4'b0000}

// Conditional jumps (all use same address format)
`define jump_x_if_ov `instruction_size'b1111_????_????_0001    // Jump if overflow
`define instruction_JUMP_OV(address) {4'b1111, 8'd``address``, 4'b0001}

`define jump_x_if_un `instruction_size'b1111_????_????_0010    // Jump if underflow
`define instruction_JUMP_UN(address) {4'b1111, 8'd``address``, 4'b0010}

`define jump_x_if_sa `instruction_size'b1111_????_????_0011    // Jump if A == B (same)
`define instruction_JUMP_SA(address) {4'b1111, 8'd``address``, 4'b0011}

`define jump_x_if_Ab `instruction_size'b1111_????_????_0100    // Jump if A > B
`define instruction_JUMP_Ab(address) {4'b1111, 8'd``address``, 4'b0100}

`define jump_x_if_aB `instruction_size'b1111_????_????_0101    // Jump if A < B
`define instruction_JUMP_aB(address) {4'b1111, 8'd``address``, 4'b0101}

//==============================================================================
// RAM Control Select Encoding
//==============================================================================
// RAM_CU_SELECT values:
//   00: CU_RAM_DATA_IN = 8'b0 (zeros)
//   01: CU_RAM_DATA_IN = CU_OUTPUT_DATA (from control unit)
//   10: CU_RAM_DATA_IN = GENERAL_OUTPUT (from general registers)
//   11: CU_RAM_DATA_IN = 8'b11111111 (ones)

//==============================================================================
// Architecture Parameters
//==============================================================================

// Program memory
`define program_data_size `instruction_size
`define program_data_max_length 16    // 16-bit address space (64K instructions max)

// ALU configuration
`define number_of_alu_registers 2     // Two input registers (A and B)

// General purpose registers
`define number_of_registers 16        // 16 general purpose registers (4-bit address)

// RAM configuration
`define ram_addres_bus_size 8         // 8-bit address = 256 locations
`define ram_depth 256                 // 256 bytes of RAM

//==============================================================================
// Debug Flags (uncomment to enable detailed logging)
//==============================================================================
//`define _DEBUG_ALU_
//`define _DEBUG_GENERAL_REGISTERS_
//`define _DEBUG_CONTROL_UNIT_
//`define _DEBUG_RAM_

`endif
