//Test
`ifndef _params_
`define _params_

//Delays
//LHS delay
`define LHS_delay #(1:1:1)
//RHS delay
`define RHS_delay #(1:1:1)


//Size of alu input variable
`define operand_size 8 //Doesnt care
`define instruction_size 16 //Look down
`define ALU_INSTRUCTION_BUS_SIZE 4
//Alu & Control unit 


//TASKS ARE WAY BETTER FOR THIS PURPOSE! but, I wanted to learn macros.
// Alu and CU Operation codes from excel
`define	NOP	`instruction_size'b0000_0000_0000_0000	
`define	ADD	`instruction_size'b0001_0000_0000_0000	
`define	SUB	`instruction_size'b0010_0000_0000_0000	
`define	AND	`instruction_size'b0011_0000_0000_0000	
`define	OR	`instruction_size'b0100_0000_0000_0000	
`define	NOT	`instruction_size'b0101_0000_0000_0000	
`define	N/A	`instruction_size'b0110_0000_0000_0000 //Not used	
`define	N/A	`instruction_size'b0111_0000_0000_0000 //Not used

//Move alu output to regX
`define	MOV_C_regX	`instruction_size'b1000_0000_0000_????
`define instruction_MOV_C_regX(address) {4'b1000,8'd0,4'd``address``}

//Move regX to alu operand A	
`define	MOV_regX_A	`instruction_size'b1001_0000_0000_????
`define instruction_MOV_regX_A(address) {4'b1001,8'd0,4'd``address``}

//Move regX to alu operand B	
`define	MOV_regX_B	`instruction_size'b1010_0000_0000_????
`define instruction_MOV_regX_B(address) {4'b1010,8'd0,4'd``address``}

//Save regY value to ramX addr	
`define	MOV_regY_ramX	`instruction_size'b1011_????_????_????
`define instruction_MOV_regY_ramX(address1, address2) {4'b1010,8'd``address2``,4'd``address1``}
	
//Mov ram value to reg A or B
`define	MOV_ramX_AB	`instruction_size'b1100_????_????_00??
`define instruction_MOV_ramX_A1orB2(address1, address2) {4'b1010, 8'd``address1``, 2'b00, 2'd``address2} 

//Load data from ????_???? ram addr and put it on cu_output	
`define	LOAD	`instruction_size'b1101_????_????_0000
`define instruction_LOAD(address) {4'b1101,8'd``address``,4'b0000}

// 8x addr | 2x reg_enable to 10 Ram  01 genreg | from 2x ram_cu_select 01, cu 10 from gen out
`define	SAVE	`instruction_size'b1110_????_????_00??
`define instruction_SAVE_CU(address) {4'b1110,8'd``address``,4'b0001}  
`define instruction_SAVE_GEN_OUT(address) {4'b1110,8'd``address``,4'b0010}  

//Jump to addres  	
`define	jump_x	`instruction_size'b1111_????_????_0000
`define instruction_JUMP(address) {4'b1111,8'd``address``,4'b0000}
	
//Jump if overflow flag	
`define	jump_x_if_ov	`instruction_size'b1111_????_????_0001
`define instruction_JUMP_OV(address) {4'b1111,8'd``address``,4'b0001}

//Jump if underflow flag	
`define	jump_x_if_un	`instruction_size'b1111_????_????_0010
`define instruction_JUMP_UN(address) {4'b1111,8'd``address``,4'b0010}

//Jump if A == B	
`define	jump_x_if_sa	`instruction_size'b1111_????_????_0011
`define instruction_JUMP_SA(address) {4'b1111,8'd``address``,4'b0011}

//Jump if A > B	
`define	jump_x_if_Ab	`instruction_size'b1111_????_????_0100
`define instruction_JUMP_Ab(address) {4'b1111,8'd``address``,4'b0100}

//Jump if A < B	
`define	jump_x_if_aB	`instruction_size'b1111_????_????_0101
`define instruction_JUMP_aB(address) {4'b1111,8'd``address``,4'b0101}

//RAM_CU_SELECT -> 
// 00 CU_RAM_DATA_IN = `opsize 1'b0;
// 01 CU_RAM_DATA_IN = CU_OUTPUT_DATA;
// 10 CU_RAM_DATA_IN = GENERAL_OUTPUT;
// 11 CU)RAM_DATA_IN = `opsize 1'b1;	



//Control unit 
//For testbench
`define instruction_count 15 //Useless

//input ram bus size -> depends on ammount ALU and CU operation codes 10 op -> 4 bits
`define program_data_size `instruction_size
`define program_data_max_length `instruction_size //in bits
 
//Number of registers to alu (input arguments)
`define number_of_alu_registers 2
//Number of external registers as "cache"
`define number_of_registers 4

`define ram_addres_bus_size 8
`define ram_depth `operand_size //operand_size deph

//For more tb info uncomment
//`define _DEBUG_ALU_
//`define _DEBUG_GENERAL_REGISTERS_


`endif