//             Alden Rivera 0416329
//             Jorge Pineda 0416330
`timescale 1ns / 1ps



module adv_instr_sel(
		op_field_i,
		function_field_i,
		select
    );
input [6-1:0] op_field_i;
input [6-1:0] function_field_i;
output reg 	  select;

always@(*)
begin
	if((op_field_i == 6'b000000) && (function_field_i == 6'b000011))
		select = 1;
	else if((op_field_i == 6'b000000) && (function_field_i == 6'b000111))
		select = 1;
	else if(op_field_i == 6'b001111)
		select = 1;
	else if(op_field_i == 6'b001101)
		select = 1;
	else if(op_field_i == 6'b000101)
		select = 1;
	else 
		select = 0;
end
endmodule