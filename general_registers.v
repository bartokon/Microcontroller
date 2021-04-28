`include "params.v"


module general_registers(data_in, data_out, read, write, select_reg, enable, clk, reset);

     //Inputs
     input wire [`operand_size-1:0] data_in; 
     input wire [`number_of_registers-1:0] select_reg;
     input wire enable;
     input wire read;
     input wire write;
     input wire clk, reset;
     
     //internal counter
     reg [`operand_size-1:0] data_reg [`number_of_registers-1:0];
     
     //Outputs
     output reg [`operand_size-1:0] data_out;
       
    always @(negedge clk)begin      
        if (~reset) begin: clear_regs //for
            integer i;
            for ( i = 0; i < `number_of_registers; i = i + 1) begin
                data_reg[i] <= {`operand_size{1'b0}};
            end         
        end else if (enable) begin                            
                if (write & ~read) begin
                    data_reg[select_reg] <= data_in;
                end else if (read & ~write) begin
                    data_out <= data_reg[select_reg];
                end else begin
                    data_out <= {`operand_size{1'bz}};
                end
        end
     end                
                                    
     
     
    
endmodule

