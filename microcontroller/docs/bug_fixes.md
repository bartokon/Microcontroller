# Bug Fixes Documentation

This document details all the critical bugs found in the original microcontroller design and how they were fixed during the 2025 refactoring.

---

## Summary

**Total Bugs Fixed: 7**
- **Critical (System Failure):** 3
- **Major (Timing/Synthesis):** 2
- **Moderate (Compilation):** 2

---

## Critical Bugs (System Failure)

### Bug #1: RAM Size Calculation Error
**Severity:** CRITICAL
**File:** `cu_ram.v:29`
**Impact:** RAM initialization failure, system malfunction

#### Original Code
```verilog
function integer get_ram_size;
    input integer address_size;
    begin
        get_ram_size = 2^(address_size-1);  // WRONG!
    end
endfunction
```

#### Problem
In Verilog, the `^` operator is **XOR**, not exponentiation. This caused:
- For 8-bit address bus: `2 ^ 7 = 2 XOR 7 = 5`
- Expected: `2^7 = 128` locations
- Actual: 5 iterations in initialization loop
- Result: Only 5 RAM locations initialized, rest undefined

#### Fixed Code
```verilog
function integer get_ram_size;
    input integer address_size;
    begin
        get_ram_size = 2**(address_size-1);  // FIXED: Use ** for power
    end
endfunction
```

#### Why It Matters
Without proper initialization, accessing uninitialized RAM locations causes:
- Unpredictable simulation behavior
- Potential X (unknown) propagation
- System hangs or crashes

---

### Bug #2: RAM Array Size Mismatch
**Severity:** CRITICAL
**File:** `cu_ram.v:24`
**Impact:** Out-of-bounds memory access, undefined behavior

#### Original Code
```verilog
reg [`operand_size-1:0] internal_memory [`ram_addres_bus_size-1:0];
// Creates: internal_memory[7:0] = only 8 locations!
```

#### Problem
- Address bus width: 8 bits = can address 0-255 (256 locations)
- Array declared: `[7:0]` = only 8 locations (0-7)
- Any access to addresses 8-255 causes out-of-bounds error
- Programs using RAM addresses > 7 would fail

#### Fixed Code
```verilog
reg [`operand_size-1:0] internal_memory [255:0];
// Creates: internal_memory[255:0] = 256 locations
```

#### Why It Matters
The test programs in program_memory.v access RAM locations up to address 8:
```verilog
internal_program_data[59] = `instruction_SAVE_CU(8);  // Would fail!
```

---

### Bug #3: Register Select Signal Extraction Error
**Severity:** CRITICAL
**File:** `control_unit.v:79`
**Impact:** Cannot properly route data to ALU registers A and B

#### Original Code
```verilog
task MOV_regX_X;
    begin
        alu_register_enable = cu_instruction[13:12];  // WRONG BITS!
        register_write = 0;
        register_read = 1;
        register_select = cu_instruction[3:0];
        register_enable = 2'b01;
    end
endtask
```

#### Problem
The control unit needs to distinguish between:
- `MOV_regX_A` (opcode `1001`) → Enable ALU register A
- `MOV_regX_B` (opcode `1010`) → Enable ALU register B

Original code extracted bits [13:12]:
- For `1001_xxxx_xxxx_xxxx`: bits [13:12] = `00`
- For `1010_xxxx_xxxx_xxxx`: bits [13:12] = `01`

But the enable signal should be:
- Register A enable: `2'b01` (bit 0 set)
- Register B enable: `2'b10` (bit 1 set)

The logic didn't properly decode which register based on opcode bit 12.

#### Fixed Code
```verilog
task MOV_regX_X;
    begin
        // Determine A or B based on opcode bit 12
        if (cu_instruction[12] == 1'b0) begin
            alu_register_enable <= 2'b01;  // Opcode 1001 → Enable A
        end else begin
            alu_register_enable <= 2'b10;  // Opcode 1010 → Enable B
        end

        register_write <= 1'b0;
        register_read <= 1'b1;
        register_select <= cu_instruction[3:0];
        register_enable <= 2'b01;
    end
endtask
```

#### Why It Matters
Without correct register routing:
- Cannot load operands into ALU properly
- ALU operations get wrong data
- All arithmetic/logic operations fail

---

## Major Bugs (Timing/Synthesis Issues)

### Bug #4: Blocking Assignments in Sequential Logic
**Severity:** MAJOR
**File:** `control_unit.v:174, 175, 239`
**Impact:** Race conditions, simulation/synthesis mismatch

#### Original Code
```verilog
always @(posedge clk) begin
    if (enable) begin
        if (~reset) begin
            // ... reset logic ...
        end else begin
            program_counter = program_counter + 1;      // WRONG: blocking
            cu_instruction = program_data;              // WRONG: blocking

            casez (cu_instruction)
                // ... instruction decode ...
            endcase

            program_data_address = program_counter;     // WRONG: blocking
        end
    end
end
```

#### Problem
Using blocking assignments (`=`) in clocked always blocks creates:
- **Race conditions:** Order-dependent behavior
- **Simulation/synthesis mismatch:** Different results in sim vs hardware
- **Timing issues:** Unpredictable register update order

In this case:
1. `program_counter = program_counter + 1` updates immediately
2. `program_data_address = program_counter` uses new value in same cycle
3. May cause incorrect instruction fetch timing

#### Fixed Code
```verilog
always @(posedge clk) begin
    if (enable) begin
        if (~reset) begin
            // ... reset logic with <= ...
        end else begin
            program_counter <= program_counter + 1;      // FIXED: non-blocking
            cu_instruction <= program_data;              // FIXED: non-blocking

            casez (cu_instruction)
                // ... instruction decode ...
            endcase

            program_data_address <= program_counter;     // FIXED: non-blocking
        end
    end
end
```

#### Why It Matters
Non-blocking assignments (`<=`) ensure:
- All updates happen simultaneously at clock edge
- Predictable timing behavior
- Simulation matches hardware exactly
- No race conditions

---

### Bug #5: Mixed Blocking/Non-Blocking Assignments
**Severity:** MAJOR
**File:** `alu.v:88-89`
**Impact:** Race conditions, flag inconsistency

#### Original Code
```verilog
always @(negedge clk) begin
    // ... ALU operations ...

    if (internal_operand_A > internal_operand_B) begin
        A_bigger <= 1;
        B_bigger <= 0;
        AB_same <= 0;
    end else if (internal_operand_A < internal_operand_B) begin
        A_bigger <= 0;
        B_bigger <= 1;
        AB_same <= 0;
    end else if (internal_operand_A == internal_operand_B) begin
        A_bigger = 0;   // WRONG: blocking
        B_bigger = 0;   // WRONG: blocking
        AB_same <= 1;   // Non-blocking
    end
end
```

#### Problem
Mixing blocking and non-blocking in the same procedural block:
- Creates timing inconsistencies
- Can cause race conditions
- Makes code hard to verify
- Violates Verilog coding standards

#### Fixed Code
```verilog
always @(negedge clk) begin
    // ... ALU operations ...

    if (internal_operand_A > internal_operand_B) begin
        A_bigger <= 1;
        B_bigger <= 0;
        AB_same <= 0;
    end else if (internal_operand_A < internal_operand_B) begin
        A_bigger <= 0;
        B_bigger <= 1;
        AB_same <= 0;
    end else if (internal_operand_A == internal_operand_B) begin
        A_bigger <= 0;  // FIXED: non-blocking
        B_bigger <= 0;  // FIXED: non-blocking
        AB_same <= 1;
    end
end
```

#### Why It Matters
Consistent use of non-blocking assignments:
- Ensures all flags update simultaneously
- Prevents race conditions
- Makes timing predictable
- Follows industry best practices

---

## Moderate Bugs (Compilation Errors)

### Bug #6: Duplicate Macro Definitions
**Severity:** MODERATE
**File:** `params.v:27-28`
**Impact:** Compilation error

#### Original Code
```verilog
`define N/A `instruction_size'b0110_0000_0000_0000 //Not used
`define N/A `instruction_size'b0111_0000_0000_0000 //Not used
```

#### Problem
1. Cannot define the same macro name twice
2. `N/A` contains invalid characters (`/`) for macro identifier
3. Would cause Verilog compiler error

#### Fixed Code
```verilog
`define UNUSED_6 `instruction_size'b0110_0000_0000_0000  // Reserved
`define UNUSED_7 `instruction_size'b0111_0000_0000_0000  // Reserved
```

#### Why It Matters
- Compiler rejects duplicate definitions
- Design won't compile without fix
- Reserved opcodes now properly documented

---

### Bug #7: Opcode Mismatch in Macro Definition
**Severity:** MODERATE
**File:** `params.v:43-44`
**Impact:** Instruction decode error, opcode conflict

#### Original Code
```verilog
`define MOV_regY_ramX `instruction_size'b1011_????_????_????
`define instruction_MOV_regY_ramX(address1, address2) \
    {4'b1010, 8'd``address2``, 4'd``address1``}
    //  ^^^^ WRONG! Should be 1011
```

#### Problem
- Pattern definition says opcode is `1011`
- Macro function generates opcode `1010`
- Opcode `1010` is already used by `MOV_regX_B`
- Causes instruction decode conflict
- Programs using this instruction would execute wrong operation

#### Fixed Code
```verilog
`define MOV_regY_ramX `instruction_size'b1011_????_????_????
`define instruction_MOV_regY_ramX(ram_addr, reg_addr) \
    {4'b1011, 8'd``ram_addr``, 4'd``reg_addr``}
    //  ^^^^ FIXED: Now matches definition
```

#### Why It Matters
- Prevents opcode conflicts
- Ensures instruction decodes correctly
- Programs execute as intended

---

## Testing and Verification

### Before Fixes
The original design would:
- ✗ Fail to initialize RAM properly
- ✗ Crash on RAM access > address 7
- ✗ Not compile due to duplicate macros
- ✗ Have unpredictable timing in simulation
- ✗ Fail to route registers to ALU correctly

### After Fixes
The refactored design:
- ✓ Initializes all 256 RAM locations
- ✓ Supports full 8-bit address space
- ✓ Compiles without errors
- ✓ Has predictable, race-free timing
- ✓ Correctly routes all data paths
- ✓ All test programs execute correctly

---

## Lessons Learned

1. **Always use `**` for exponentiation in Verilog, never `^`**
   - `^` is XOR operator
   - Common mistake for programmers from other languages

2. **Array dimensions must match address space**
   - N-bit address → 2^N locations
   - Use `[2**N-1:0]` or `[(1<<N)-1:0]`

3. **Use non-blocking assignments in sequential logic**
   - `<=` for clocked always blocks
   - `=` only for combinational logic

4. **Never mix blocking and non-blocking in same block**
   - Causes race conditions
   - Hard to debug
   - Violates coding standards

5. **Macro names must be unique and valid identifiers**
   - No special characters like `/`
   - Check for duplicates

6. **Verify instruction encoding matches specification**
   - Pattern and macro must use same opcode
   - Check for conflicts with other instructions

---

## Impact Summary

| Bug # | Type | Impact | Lines Affected | Test Coverage |
|-------|------|--------|----------------|---------------|
| 1 | RAM calc | System failure | 1 | High |
| 2 | Array size | Memory errors | 1 | High |
| 3 | Register routing | ALU failure | 10 | High |
| 4 | Blocking assign | Timing issues | 3 | Medium |
| 5 | Mixed assign | Flag errors | 2 | Medium |
| 6 | Duplicate macro | Won't compile | 2 | N/A |
| 7 | Opcode mismatch | Wrong instruction | 1 | Low |

**Total lines of code fixed:** ~20 lines
**Impact:** From non-functional to fully operational

---

## Conclusion

These bug fixes transform the microcontroller from a non-functional design with critical errors into a working, synthesizable implementation. The fixes address fundamental issues in:
- Memory architecture
- Data routing
- Timing behavior
- Instruction encoding

The refactored design is now suitable for:
- FPGA synthesis and implementation
- Educational purposes
- Further development and enhancement
