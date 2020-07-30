//             Alden Rivera 0416329
//             Jorge Pineda 0416330
`timescale 1ns / 1ps

module adv_instr(
		instr,
		regs,
		regt,
		result
    );
input [32-1:0] 	  instr;
input signed [32-1:0]		  regs;
input signed [32-1:0] regt;
output reg signed [32-1:0] result;

//disposable registers
reg signed [5-1:0]	 shamt;
reg [16-1:0] imm;
reg [32-1:0] ext_imm;

always@(*)
begin
shamt = instr[10:6];
imm = instr[15:0];
if(instr[15]==1'b1)
     ext_imm = {16'b1111111111111111,instr[15:0]};
    else
     ext_imm = {16'b0000000000000000,instr[15:0]};

case(instr[31:26])	//case based on OP field
	6'b000000:
	begin
		if(instr[5:0] == 6'b000011)	//SRA
			result = regt >>> shamt;
		else									//SRAV
			result = regt >>> regs;
	end
	6'b001111:								//LUI
		result = (imm*(2**16));
	6'b001101:								//ORI
		result = regs | ext_imm;
endcase
end
endmodule
