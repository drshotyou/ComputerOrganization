//             Alden Rivera 0416329
//             Jorge Pineda 0416330
`timescale 1ns / 1ps
//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	Jump_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o,
	Jumpal_o,
	Branchslt_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         Jump_o;
output         MemRead_o;
output         MemWrite_o;
output         MemtoReg_o; 
output         Jumpal_o;
output         Branchslt_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            Jump_o;
reg            MemRead_o;
reg            MemWrite_o;
reg            MemtoReg_o;
reg            Jumpal_o;
reg            Branchslt_o;

//Parameter


//Main function
always@(*)
begin
    case(instr_op_i)
    6'b000000:
        begin
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b010;
            ALUSrc_o = 1'b0;
            RegDst_o = 1'b1;
            Branch_o = 1'b0;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
    6'b001000:
        begin
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b011;
            ALUSrc_o = 1'b1;
            RegDst_o = 1'b0;
            Branch_o = 1'b0;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
    6'b001011:
        begin
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b100;
            ALUSrc_o = 1'b1;
            RegDst_o = 1'b0;
            Branch_o = 1'b0;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
     6'b000100:
        begin
            RegWrite_o = 1'b0;
            ALU_op_o = 3'b001;
            ALUSrc_o = 1'b0;
            RegDst_o = 1'b1;
            Branch_o = 1'b1;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
     6'b001111:
        begin
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b101;
            ALUSrc_o = 1'b1;
            RegDst_o = 1'b0;
            Branch_o = 1'b0;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
     6'b001101:
        begin
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b110;
            ALUSrc_o = 1'b1;
            RegDst_o = 1'b0;
            Branch_o = 1'b0;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
     6'b000101:
        begin
            RegWrite_o = 1'b0;
            ALU_op_o = 3'b001;
            ALUSrc_o = 1'b0;
            RegDst_o = 1'b1;
            Branch_o = 1'b1;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            Jumpal_o = 1'b0;
        end
     6'b100011:
        begin
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b011;//add
            ALUSrc_o = 1'b1;
            RegDst_o = 1'b0;
            Branch_o = 1'b0;
            Branchslt_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b1;
            MemWrite_o = 1'b0;
            MemtoReg_o = 1'b1;  
            Jumpal_o = 1'b0;         
        end
     6'b101011:
        begin
        RegWrite_o = 1'b0;
        ALU_op_o = 3'b011;//add
        ALUSrc_o = 1'b1;
        RegDst_o = 1'b0;
        Branch_o = 1'b0;
        Branchslt_o = 1'b0;
        Jump_o = 1'b1;
        MemRead_o = 1'b0;
        MemWrite_o = 1'b1;
        MemtoReg_o = 1'b0; 
        Jumpal_o = 1'b0;            
        end
     6'b000010:
        begin
        RegWrite_o = 1'b0;
        ALU_op_o = 3'b011;//add
        ALUSrc_o = 1'b1;
        RegDst_o = 1'b0;
        Branch_o = 1'b0;
        Branchslt_o = 1'b0;
        Jump_o = 1'b0;
        MemRead_o = 1'b0;
        MemWrite_o = 1'b0;
        MemtoReg_o = 1'b0; 
        Jumpal_o = 1'b0;
        end
     6'b111111:
     begin
     RegWrite_o = 1'b0;
     ALU_op_o = 3'b011;//add
     ALUSrc_o = 1'b1;
     RegDst_o = 1'b0;
     Branch_o = 1'b0;
     Branchslt_o = 1'b0;
     Jump_o = 1'b1;
     MemRead_o = 1'b0;
     MemWrite_o = 1'b0;
     MemtoReg_o = 1'b0;
     Jumpal_o = 1'b0;
     end
     6'b000011:
     begin
     RegWrite_o = 1'b1;
     ALU_op_o = 3'b011;//add
     ALUSrc_o = 1'b1;
     RegDst_o = 1'b0;
     Branch_o = 1'b0;
     Branchslt_o = 1'b0;
     Jump_o = 1'b0;
     MemRead_o = 1'b0;
     MemWrite_o = 1'b0;
     MemtoReg_o = 1'b0;   
     Jumpal_o = 1'b1;  
     end
     6'b000110:
     begin
     RegWrite_o = 1'b0;
 //    ALU_op_o = 3'b101;//blt
 //    ALUSrc_o = 1'b1;
     RegDst_o = 1'b0;
     Branch_o = 1'b0;
     Branchslt_o = 1'b1;
     Jump_o = 1'b0;
     MemRead_o = 1'b0;
     MemWrite_o = 1'b0;
     MemtoReg_o = 1'b0;   
     Jumpal_o = 1'b0;      
     end
     6'b000101:
     begin
      RegWrite_o = 1'b0;
 //    ALU_op_o = 3'b101;//blt
 //    ALUSrc_o = 1'b1;
     RegDst_o = 1'b0;
     Branch_o = 1'b1;
     Branchslt_o = 1'b0;
     Jump_o = 1'b0;
     MemRead_o = 1'b0;
     MemWrite_o = 1'b0;
     MemtoReg_o = 1'b0;   
     Jumpal_o = 1'b0;       
     end
     6'b000001:
     begin
     RegWrite_o = 1'b0;
 //    ALU_op_o = 3'b101;//blt
 //    ALUSrc_o = 1'b1;
     RegDst_o = 1'b0;
     Branch_o = 1'b0;
     Branchslt_o = 1'b1;
     Jump_o = 1'b0;
     MemRead_o = 1'b0;
     MemWrite_o = 1'b0;
     MemtoReg_o = 1'b0;   
     Jumpal_o = 1'b0;        
     end
    6'b001111:
    begin
    RegWrite_o = 1'b1;
    ALU_op_o = 3'b011;
    ALUSrc_o = 1'b1;
    RegDst_o = 1'b0;
    Branch_o = 1'b0;
    Branchslt_o = 1'b0;
    Jump_o = 1'b1;
    MemRead_o = 1'b0;
    MemWrite_o = 1'b0;
    MemtoReg_o = 1'b0;
    Jumpal_o = 1'b0;    
    end
   endcase
end
endmodule





                    
                    