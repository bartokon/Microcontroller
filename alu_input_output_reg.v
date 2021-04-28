`include "params.v"


module alu_input_output_reg
(data_in, data_out, enable, clk, reset);
 //Inputs
 input wire [`operand_size-1:0] data_in;
 input wire enable, clk, reset;
 
 //Outputs
 output reg [`operand_size-1:0] data_out;
 
 always @(posedge clk)begin
     if (~reset)begin
            data_out <= 0;
     end else if (enable) begin
        data_out <= data_in;
     end
      
 end
 
// always @(enable) begin
//        data_out <= data_in;
// end
 
 
 
endmodule
