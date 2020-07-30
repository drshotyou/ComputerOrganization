//             Alden Rivera 0416329
//             Jorge Pineda 0416330
//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

       
//Select exact operation
always@(*)
begin
    case(ALUOp_i)
        3'b010: 
        begin
            if(funct_i == 6'b100000) ALUCtrl_o = 4'b0010; //add
            else if(funct_i == 6'b100011) ALUCtrl_o = 4'b0110;//sub
            else if(funct_i == 6'b100100) ALUCtrl_o = 4'b0000;//AND
            else if(funct_i == 6'b100101) ALUCtrl_o = 4'b0001;//OR
            else if(funct_i == 6'b101010) ALUCtrl_o = 4'b0111;//SLT
         end
         3'b001://beq
            ALUCtrl_o = 4'b0110;
         3'b011:
            ALUCtrl_o = 4'b0010;
         3'b100:
            ALUCtrl_o = 4'b0111;
     endcase
end
endmodule     





                    
                    