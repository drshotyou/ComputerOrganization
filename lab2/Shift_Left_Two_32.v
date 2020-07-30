//             Alden Rivera 0416329
//             Jorge Pineda 0416330
//Subject:      CO project 2 - Shift_Left_Two_32
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Shift_Left_Two_32(
    data_i,
    data_o
    );

//I/O ports                    
input [32-1:0] data_i;
output reg [32-1:0] data_o;

//shift left 2
always@(*)
begin
    data_o=data_i << 2;
end
endmodule
