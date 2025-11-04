# Single-Cycle Microcontroller in Verilog

A simple 8-bit single-cycle microcontroller implemented in Verilog for FPGA synthesis and simulation.

## Overview

This project implements a basic microcontroller architecture with:
- **8-bit data path** for arithmetic and logic operations
- **16-bit instruction set** with 16 different instruction types
- **Single-cycle execution** - each instruction completes in one clock cycle
- **256 bytes of RAM** for data storage
- **256 instruction program memory**
- **16 general-purpose registers**
- **ALU with comparison and overflow detection**

## Project Status

✅ **FULLY REFACTORED AND BUG-FIXED** (2025)

This is a complete reorganization of the original project with all critical bugs fixed. See [Bug Fixes Documentation](docs/bug_fixes.md) for details on what was corrected.

---

## Directory Structure

```
microcontroller/
├── rtl/                          # RTL source files
│   ├── core/                     # Core microcontroller modules
│   │   ├── alu.v                 # Arithmetic Logic Unit
│   │   ├── control_unit.v        # Control Unit (instruction decoder)
│   │   ├── general_registers.v   # General purpose register file
│   │   └── alu_input_output_reg.v # ALU input registers
│   ├── memory/                   # Memory modules
│   │   ├── program_memory.v      # Instruction memory (ROM)
│   │   └── cu_ram.v              # Data RAM
│   ├── utils/                    # Utility modules
│   │   └── multiplexer.v         # Data path multiplexers
│   ├── params.v                  # Global parameters and definitions
│   └── microcontroller_top.v     # Top-level integration module
├── sim/                          # Simulation testbenches
│   └── tb_microcontroller.v      # Main microcontroller testbench
├── scripts/                      # Build and simulation scripts
│   └── run_sim.tcl               # Vivado simulation script
├── docs/                         # Documentation
│   └── bug_fixes.md              # List of bugs fixed
└── README.md                     # This file
```

---

## Architecture

### Block Diagram

```
┌─────────────────┐
│ Program Memory  │ (256 x 16-bit instructions)
└────────┬────────┘
         │ instruction
         ▼
┌─────────────────┐     ┌──────────┐
│  Control Unit   │────▶│   ALU    │ (8-bit operations)
└────────┬────────┘     └────┬─────┘
         │                   │
         │ control signals   │ result
         ▼                   ▼
┌─────────────────┐     ┌──────────┐
│ General Regs    │     │   RAM    │ (256 x 8-bit)
│ (16 registers)  │     │          │
└─────────────────┘     └──────────┘
```

### Key Components

1. **Control Unit** (`control_unit.v`)
   - Fetches instructions from program memory
   - Decodes opcodes and generates control signals
   - Manages program counter and conditional jumps
   - Implements 16 different instruction types

2. **ALU** (`alu.v`)
   - Performs arithmetic operations (ADD, SUB)
   - Performs logic operations (AND, OR, NOT)
   - Generates status flags (overflow, underflow, comparison)
   - 8-bit signed arithmetic with 9-bit internal representation

3. **General Registers** (`general_registers.v`)
   - 16 general-purpose 8-bit registers
   - Read/write operations controlled by control unit
   - Used for intermediate storage between operations

4. **RAM** (`cu_ram.v`)
   - 256 bytes of data memory
   - 8-bit address bus, 8-bit data bus
   - Synchronous read/write operations

5. **Program Memory** (`program_memory.v`)
   - 256 x 16-bit instruction storage
   - Pre-loaded with test programs
   - Read-only memory (ROM)

---

## Instruction Set

### Format
All instructions are 16 bits wide: `[15:12] Opcode | [11:0] Operands/Address`

### Instructions

| Opcode | Mnemonic | Format | Description |
|--------|----------|--------|-------------|
| 0000 | NOP | `0000_0000_0000_0000` | No operation |
| 0001 | ADD | `0001_0000_0000_0000` | Add A + B → C |
| 0010 | SUB | `0010_0000_0000_0000` | Subtract A - B → C |
| 0011 | AND | `0011_0000_0000_0000` | Bitwise A AND B → C |
| 0100 | OR | `0100_0000_0000_0000` | Bitwise A OR B → C |
| 0101 | NOT | `0101_0000_0000_0000` | Bitwise NOT A → C |
| 1000 | MOV C→R | `1000_0000_0000_RRRR` | Move ALU result to register |
| 1001 | MOV R→A | `1001_0000_0000_RRRR` | Move register to ALU input A |
| 1010 | MOV R→B | `1010_0000_0000_RRRR` | Move register to ALU input B |
| 1100 | MOV RAM→AB | `1100_AAAAAAAA_00SS` | Move RAM to ALU input (SS: 01=A, 10=B) |
| 1101 | LOAD | `1101_DDDDDDDD_0000` | Load constant to CU output |
| 1110 | SAVE | `1110_AAAAAAAA_00SS` | Save to RAM (SS: 01=CU, 10=Reg) |
| 1111_0000 | JUMP | `1111_AAAAAAAA_0000` | Unconditional jump |
| 1111_0001 | JUMP_OV | `1111_AAAAAAAA_0001` | Jump if overflow |
| 1111_0010 | JUMP_UN | `1111_AAAAAAAA_0010` | Jump if underflow |
| 1111_0011 | JUMP_EQ | `1111_AAAAAAAA_0011` | Jump if A == B |
| 1111_0100 | JUMP_GT | `1111_AAAAAAAA_0100` | Jump if A > B |
| 1111_0101 | JUMP_LT | `1111_AAAAAAAA_0101` | Jump if A < B |

---

## Getting Started

### Prerequisites

- **Xilinx Vivado** (2020.2 or later)
- **Verilog simulator** (Vivado built-in xsim, ModelSim, or Icarus Verilog)
- **TCL support** for running automation scripts

### Quick Start - Vivado Simulation

1. **Navigate to the microcontroller directory:**
   ```bash
   cd microcontroller
   ```

2. **Run the Vivado simulation script:**
   ```bash
   vivado -mode batch -source scripts/run_sim.tcl
   ```

3. **Or open in Vivado GUI:**
   ```bash
   vivado -mode gui -source scripts/run_sim.tcl
   ```

4. **Run simulation from Vivado GUI:**
   - Flow → Run Simulation → Run Behavioral Simulation
   - Or in TCL console: `launch_simulation; run all`

### Manual Simulation Setup

If you prefer manual setup:

1. Create a new Vivado project
2. Add all files from `rtl/` directory (add `params.v` first)
3. Add testbench from `sim/tb_microcontroller.v`
4. Set `tb_microcontroller` as top module
5. Run behavioral simulation

---

## Example Programs

The program memory is pre-loaded with three test programs:

### Program 1: Simple Addition (Address 0-12)
```
LOAD 1        ; Load constant 1
SAVE RAM[0]   ; Save to RAM address 0
LOAD 2        ; Load constant 2
SAVE RAM[1]   ; Save to RAM address 1
MOV RAM[0]→A  ; Move RAM[0] to ALU input A
MOV RAM[1]→B  ; Move RAM[1] to ALU input B
ADD           ; Perform A + B
MOV C→Reg[0]  ; Save result to register 0
```

### Program 2: Increment Loop with Overflow Detection (Address 16-27)
Continuously increments a value until overflow occurs, then jumps to next program.

### Program 3: Double Addition Loop (Address 50-68)
Performs repeated addition operations with overflow detection.

---

## Testing

### Running Tests

The main testbench (`tb_microcontroller.v`) will:
1. Initialize the microcontroller
2. Release reset
3. Enable the processor
4. Run for 500ns
5. Display results

### Expected Output

```
==========================================
Microcontroller Testbench Starting
==========================================
Time: 0
[4] Reset released, microcontroller enabled
[6] PC=1 Debug_Out=0x00
[8] PC=2 Debug_Out=0x01
...
==========================================
Simulation Complete at time: 504
==========================================
```

---

## Design Specifications

| Parameter | Value |
|-----------|-------|
| Data Width | 8 bits |
| Instruction Width | 16 bits |
| Clock Cycle | Single-cycle execution |
| Program Memory Size | 256 instructions |
| Data RAM Size | 256 bytes |
| General Registers | 16 registers |
| ALU Operations | 6 operations |
| Addressing Modes | Immediate, Direct, Register |

---

## Bug Fixes from Original Design

This refactored version fixes **7 critical bugs** from the original design:

1. ✅ RAM size calculation (XOR vs exponentiation)
2. ✅ RAM array dimension (8 → 256 locations)
3. ✅ Register select signal extraction
4. ✅ Blocking assignments in sequential logic
5. ✅ Mixed assignment types in ALU
6. ✅ Duplicate macro definitions
7. ✅ Opcode mismatch in macros

See [docs/bug_fixes.md](docs/bug_fixes.md) for detailed information on each fix.

---

## Future Enhancements

Potential improvements for future versions:

- [ ] Multi-cycle execution for complex instructions
- [ ] Pipeline architecture for better throughput
- [ ] Interrupt support
- [ ] I/O peripheral interfaces
- [ ] Larger instruction and data memory
- [ ] Stack pointer and subroutine support
- [ ] Hardware multiplier/divider

---

## License

This project is provided as-is for educational purposes.

---

## Author

Original design: 2021
Refactored and bug-fixed: 2025

---

## References

- Xilinx Vivado Design Suite User Guide
- Verilog HDL Coding Standards
- Digital Design and Computer Architecture (Harris & Harris)
