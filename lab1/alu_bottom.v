`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2018 08:56:23 PM
// Design Name: 
// Module Name: alu_bottom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_bottom(
    src1,       //1 bit source 1 (input)
    src2,       //1 bit source 2 (input)
    less,       //1 bit less     (input)
    A_invert,   //1 bit A_invert (input)
    B_invert,   //1 bit B_invert (input)
    cin,        //1 bit carry in (input)
    operation,  //operation      (input)
    result,     //1 bit result   (output)
    set,        //1 bit set(output)
    overflow,    //1 bit overflow(output)
    cout
);

input            src1;
input            src2;
input            less;
input            A_invert;
input            B_invert;
input            cin;
input    [2-1:0] operation;

output            result;
output            set;
output            overflow;
output             cout;

reg                result,set,overflow,cout;
reg                a,b;

always@(*)
begin
        if(A_invert==1)
        begin
            a=~src1;
        end else
        begin
            a=src1;
        end

        if(B_invert==1)
        begin
            b=~src2;
        end else
        begin
            b=src2;
        end
end

always@( * )
begin
    
    if(operation==0)
    begin
        result= a&b;
        set=0;
        overflow=0;
        cout=0;
        
    end
    
    if(operation==1)
    begin
        result= a|b;
        set=0;
        overflow=0;
        cout=0;
        
    end
    
    if(operation==2)
    begin
        result = a^b^cin;
        cout = (a&b) | (a&cin) | (b&cin);
        overflow = (~B_invert) & ((a&b) | (a&cin) | (b&cin));
        set=0;
    end
    
    if(operation==3)
    begin
        result=less;
        set = (a^b^cin)|(~b);
        overflow = ~b;
        cout=0;
    end
    
end



endmodule
