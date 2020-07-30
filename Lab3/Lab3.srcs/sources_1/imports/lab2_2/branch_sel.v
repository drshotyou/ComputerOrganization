//             Alden Rivera 0416329
//             Jorge Pineda 0416330
`timescale 1ns / 1ps

module branch_sel(
		instr,
		select
    );
input [6-1:0] instr;
output reg select;

always@(*)
begin
if(instr == 6'b000100)
	select = 1'b0;
else
	select = 1'b1;
end

endmodule
