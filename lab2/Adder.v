//             Alden Rivera 0416329
//             Jorge Pineda 0416330
//Subject:     CO project 2 - Adder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Adder(
    src1_i,
	src2_i,
	sum_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
output [32-1:0]	 sum_o;

//Internal Signals
wire    [32-1:0]	 sum_o;

//Parameter
    
//Main function
ALU adder(.src1_i(src1_i), .src2_i(src2_i), .ctrl_i(4'b0010), .result_o(sum_o), .zero_o()); //sets alu to adder
endmodule





                    
                    