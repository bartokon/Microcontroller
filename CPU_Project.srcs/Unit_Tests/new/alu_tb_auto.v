`timescale 1ns / 1ps

`include "params.v"

//Test bench for ALU unit
//nb_of_test_vectors => how many test vectors should be send to alu
//random_modulus => modulus of random generated integer for overflow/underflow test
module alu_tb_auto#(parameter nb_of_test_vectors = 128, parameter random_modulus = 10);

//Inputs
reg signed [`operand_size-1:0] operand_A;
reg signed [`operand_size-1:0] operand_B;
reg [`instruction_size-1:0] instruction;

//Outputs
wire signed [`operand_size-1:0] operand_C;
wire overflow;
wire underflow;
wire A_bigger; 
wire B_bigger;
wire AB_same;
//Control signals
reg clk;
reg reset;

//Helper variables
reg operation;
reg signed [`operand_size:0] acu_temp;
reg [`ALU_INSTRUCTION_BUS_SIZE-1:0] alu_inst;
 

alu alu_dut(
    .operand_A(operand_A),
    .operand_B(operand_B),
    .operand_C(operand_C),
    .overflow(overflow),
    .underflow(underflow),
    .instruction(alu_inst),
    .A_bigger(A_bigger),
    .B_bigger(B_bigger),
    .AB_same(AB_same),
    .clk(clk),
    .reset(reset)
    );
    
//Setup clock signal    
initial clk = 0;
always #1 clk = ~clk;
//Setup reset
initial reset = 0; //Reset alu at first clock cycle

//Begin testbench
initial begin
    #8 reset = 1;
    
    for (integer i = 0; i < nb_of_test_vectors; i = i + 1) begin
        @(posedge clk) begin        
            operand_A = $random%random_modulus;
            operand_B = $random%random_modulus;      
               
            operation = ($random)%100;
            `ifdef _DEBUG_ALU_
                $display("\n operation: %d", operation);
            `endif  
            if (operation) begin
                instruction = `ADD;               
            end else begin
                instruction = `SUB;              
            end
            alu_inst = instruction[15:12];
        end
        //#2 //wait for half clock cycle
        @(posedge clk) begin                     
            `ifdef _DEBUG_ALU_
                $display("Instruction: %d", instruction);
            `endif          
            case (instruction)
                `ADD: begin           
                    acu_temp = (({operand_A[`operand_size-1], operand_A}) + ({operand_B[`operand_size-1], operand_B}));
                    `ifdef _DEBUG_ALU_
                        $display("%d +%d =%d, gold: %d ", operand_A, operand_B, operand_C, acu_temp);
                    `endif
                    if(operand_C != acu_temp) begin
                        if (overflow == 1) begin
                            `ifdef _DEBUG_ALU_
                                $display("OVERFLOW!");
                            `endif
                        end else if (underflow == 1) begin
                            `ifdef _DEBUG_ALU_
                                $display("UNDERFLOW!");
                            `endif                      
                        end else begin
                            $display("TEST FAILED!");   
                            $stop();
                            $finish();
                        end
                    end                    
                end
                
                `SUB: begin
                    acu_temp = (({operand_A[`operand_size-1], operand_A}) - ({operand_B[`operand_size-1], operand_B}));
                    `ifdef _DEBUG_ALU_
                        $display("%d -%d =%d, gold: %d ", operand_A, operand_B, operand_C, acu_temp);
                    `endif    
                    if(operand_C != acu_temp) begin
                        if (underflow == 1) begin
                            `ifdef _DEBUG_ALU_
                                $display("UNDERFLOW!");
                            `endif  
                        end else if (overflow == 1) begin
                            `ifdef _DEBUG_ALU_
                                $display("OVERFLOW!");
                            `endif  
                        end else begin
                            $display("TEST FAILED!");
                            $stop();
                            $finish();
                        end
                    end  
                end
            endcase
            if (operand_A > operand_B) begin
                `ifdef _DEBUG_ALU_
                        $display("COMPARE A > B");
                `endif  
                if (A_bigger != 1 & B_bigger != 0 & AB_same != 0) begin 
                    $display("TEST FAILED!");
                    $display("COMPARE A > B");
                    $stop();
                    $finish();
                end
            end else if(operand_A < operand_B) begin
                `ifdef _DEBUG_ALU_
                        $display("COMPARE A < B");
                `endif 
                if (A_bigger != 0 & B_bigger != 1 & AB_same != 0) begin 
                    $display("TEST FAILED!");
                    $display("COMPARE A < B");
                    $stop();
                    $finish();
                end
            end else if (operand_A == operand_B) begin
                `ifdef _DEBUG_ALU_
                        $display("COMPARE A == B");
                `endif 
                if (A_bigger != 0 & B_bigger != 0 & AB_same != 1) begin 
                    $display("TEST FAILED!");
                    $display("COMPARE A == B");
                    $stop();
                    $finish();
                end
        end      
        end
    end
    
    $display("ALU TEST PASSED!");    
    //$finish();
end

endmodule
