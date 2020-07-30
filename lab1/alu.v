`timescale 1ns/1ps

module alu(
	rst_n,         // negative reset            (input)
	src1,          // 32 bits source 1          (input)
	src2,          // 32 bits source 2          (input)
	ALU_control,   // 4 bits ALU control input  (input)
	//bonus_control, // 3 bits bonus control input(input)
	result,        // 32 bits result            (output)
	zero,          // 1 bit when the output is 0, zero must be set (output)
	cout,          // 1 bit carry out           (output)
	overflow       // 1 bit overflow            (output)
);


input				rst_n;
input	[32-1:0]	src1;
input	[32-1:0]	src2;
input	[4-1:0]		ALU_control;
//input	[3-1:0]		bonus_control;

output	[32-1:0]	result;
output				zero;
output				cout;
output				overflow;

//reg		[32-1:0]	result;
reg					zero;
//reg					cout;
wire					overflow;
reg                 less_zero=1'b0;
reg                 a_invert,b_invert;
wire                 cin0,cin1,cin2,cin3,cin4,cin5,cin6,cin7,cin8,cin9,
                    cin10,cin11,cin12,cin13,cin14,cin15,cin16,cin17,cin18,cin19,
                    cin20,cin21,cin22,cin23,cin24,cin25,cin26,cin27,cin28,cin29,cin30,cin31;
reg[2-1:0]          operation;
wire                 result0,result1,result2,result3,result4,result5,result6,result7,result8,result9,
                    result10,result11,result12,result13,result14,result15,result16,result17,result18,result19,
                    result20,result21,result22,result23,result24,result25,result26,result27,result28,result29,result30,result31;
wire                 set;


alu_top alutop0(src1[0],src2[0],set,a_invert,b_invert,b_invert,operation,result0,cin1);
alu_top alutop1(src1[1],src2[1],less_zero,a_invert,b_invert,cin1,operation,result1,cin2);
alu_top alutop2(src1[2],src2[2],less_zero,a_invert,b_invert,cin2,operation,result2,cin3);
alu_top alutop3(src1[3],src2[3],less_zero,a_invert,b_invert,cin3,operation,result3,cin4);
alu_top alutop4(src1[4],src2[4],less_zero,a_invert,b_invert,cin4,operation,result4,cin5);
alu_top alutop5(src1[5],src2[5],less_zero,a_invert,b_invert,cin5,operation,result5,cin6);
alu_top alutop6(src1[6],src2[6],less_zero,a_invert,b_invert,cin6,operation,result6,cin7);
alu_top alutop7(src1[7],src2[7],less_zero,a_invert,b_invert,cin7,operation,result7,cin8);
alu_top alutop8(src1[8],src2[8],less_zero,a_invert,b_invert,cin8,operation,result8,cin9);
alu_top alutop9(src1[9],src2[9],less_zero,a_invert,b_invert,cin9,operation,result9,cin10);
alu_top alutop10(src1[10],src2[10],less_zero,a_invert,b_invert,cin10,operation,result10,cin11);
alu_top alutop11(src1[11],src2[11],less_zero,a_invert,b_invert,cin11,operation,result11,cin12);
alu_top alutop12(src1[12],src2[12],less_zero,a_invert,b_invert,cin12,operation,result12,cin13);
alu_top alutop13(src1[13],src2[13],less_zero,a_invert,b_invert,cin13,operation,result13,cin14);
alu_top alutop14(src1[14],src2[14],less_zero,a_invert,b_invert,cin14,operation,result14,cin15);
alu_top alutop15(src1[15],src2[15],less_zero,a_invert,b_invert,cin15,operation,result15,cin16);
alu_top alutop16(src1[16],src2[16],less_zero,a_invert,b_invert,cin16,operation,result16,cin17);
alu_top alutop17(src1[17],src2[17],less_zero,a_invert,b_invert,cin17,operation,result17,cin18);
alu_top alutop18(src1[18],src2[18],less_zero,a_invert,b_invert,cin18,operation,result18,cin19);
alu_top alutop19(src1[19],src2[19],less_zero,a_invert,b_invert,cin19,operation,result19,cin20);
alu_top alutop20(src1[20],src2[20],less_zero,a_invert,b_invert,cin20,operation,result20,cin21);
alu_top alutop21(src1[21],src2[21],less_zero,a_invert,b_invert,cin21,operation,result21,cin22);
alu_top alutop22(src1[22],src2[22],less_zero,a_invert,b_invert,cin22,operation,result22,cin23);
alu_top alutop23(src1[23],src2[23],less_zero,a_invert,b_invert,cin23,operation,result23,cin24);
alu_top alutop24(src1[24],src2[24],less_zero,a_invert,b_invert,cin24,operation,result24,cin25);
alu_top alutop25(src1[25],src2[25],less_zero,a_invert,b_invert,cin25,operation,result25,cin26);
alu_top alutop26(src1[26],src2[26],less_zero,a_invert,b_invert,cin26,operation,result26,cin27);
alu_top alutop27(src1[27],src2[27],less_zero,a_invert,b_invert,cin27,operation,result27,cin28);
alu_top alutop28(src1[28],src2[28],less_zero,a_invert,b_invert,cin28,operation,result28,cin29);
alu_top alutop29(src1[29],src2[29],less_zero,a_invert,b_invert,cin29,operation,result29,cin30);
alu_top alutop30(src1[30],src2[30],less_zero,a_invert,b_invert,cin30,operation,result30,cin31);

alu_bottom alubot(src1[31],src2[31],less_zero,a_invert,b_invert,cin31,operation,result31,set,overflow,cout);

assign result[31:0] = { result31,result30,result29,result28,result27,result26,result25,result24,result23,
                  result22,result21,result20,result19,result18,result17,result16,result15,result14,result13,
                  result12,result11,result10,result9,result8,result7,result6,result5,result4,result3,result2,
                  result1,result0};
                  

always@(*)
begin
    if(rst_n==1)
    begin
        if(ALU_control==4'b0000)
        begin
             operation= 0;
             a_invert = 0;
             b_invert = 0;
        end
        
        if(ALU_control==4'b0001)
        begin
            operation= 1;
            a_invert= 0;
            b_invert= 0;
        end
        
        if(ALU_control==4'b0010)
        begin
            operation= 2;
            a_invert= 0;
            b_invert= 0;
        end
        
        if(ALU_control==4'b0110)
        begin
            operation= 2;
            a_invert= 0;
            b_invert= 1;
        end
        
        if(ALU_control==4'b1100)
        begin
            operation= 0;
            a_invert= 1;
            b_invert= 1;
        end
        
        if(ALU_control==4'b1101)
        begin
            operation= 1;
            a_invert= 1;
            b_invert= 1;
        end
        
        if(ALU_control==4'b0111)
        begin
            operation= 3;
            a_invert= 0;
            b_invert= 1;
        end
        
        zero= ~( result0|result1|result2|result3|result4|result5|result6|result7|result8|result9|
                 result10|result11|result12|result13|result14|result15|result16|result17|result18|result19|
                 result20|result21|result22|result23|result24|result25|result26|result27|result28|result29|result30|result31);
                
    end
end


endmodule
