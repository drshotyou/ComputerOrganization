//             Alden Rivera 0416329
//             Jorge Pineda 0416330
//Subject:     CO project 2 - Sign extend
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Sign_Extend(
    data_i,
    data_o
    );
               
//I/O ports
input   [16-1:0] data_i;
output  [32-1:0] data_o;

//Internal Signals
reg     [32-1:0] data_o;

//Sign extended
always@(*)
begin
    if(data_i[15])
     data_o = {16'b1111111111111111,data_i[15:0]};
    else
     data_o = {16'b0000000000000000,data_i[15:0]};
end
    
endmodule      
     