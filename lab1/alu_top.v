`timescale 1ns/1ps

module alu_top(
	src1,       //1 bit source 1 (input)
	src2,       //1 bit source 2 (input)
	less,       //1 bit less     (input)
	A_invert,   //1 bit A_invert (input)
	B_invert,   //1 bit B_invert (input)
	cin,        //1 bit carry in (input)
	operation,  //operation      (input)
	result,     //1 bit result   (output)
	cout      //1 bit carry out(output)
);

input			src1;
input			src2;
input			less;
input			A_invert;
input			B_invert;
input			cin;
input	[2-1:0]	operation;

output			result;
output			cout;

reg				result;
reg             cout;
reg             a,b;

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
        cout=0;
    end
    
    if(operation==1)
    begin
        result= a|b;
        cout=0;
    end
    
    if(operation==2)
    begin
        result = a^b^cin;
     //   $display (a^b^cin);
        cout = (a&b) | (a&cin) | (b&cin);
     //   $display (a^b^cin);
    end
    
    if(operation==3)
    begin
        result=less;
        cout=(a&b) | (a&cin) | (b&cin);
    end
    
end

endmodule
