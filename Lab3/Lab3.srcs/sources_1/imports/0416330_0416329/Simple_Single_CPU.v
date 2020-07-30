//             Alden Rivera 0416329
//             Jorge Pineda 0416330
//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		rst_i
		);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
wire [32-1:0]   pc_out_o_wire;
wire [32-1:0]   adder1_sum_o_wire;
wire [32-1:0]   instr_o_wire;
reg [32-1:0]   instr_o_wire2;
wire [32-1:0]   RTdata_o_wire;
wire [32-1:0]   RSdata_o_wire;
wire [32-1:0]   Mux_ALUai_o_wire;
wire [32-1:0]   adv_instr_o_wire;
wire [32-1:0]   Sign_Extend_data_o_wire;
wire [32-1:0]   Mux_ALUSrc_wire;
wire [32-1:0]   ALU_result_o_wire;
wire [32-1:0]   adder2_sum_o_wire;
wire [32-1:0]   shifter_data_o;
wire [32-1:0]   initial_feed;
wire [32-1:0]   MEMdata_o;
wire [32-1:0]   regdata_o;
wire [32-1:0]   regdata2_o;
wire [5-1:0]    Mux_Write_Reg_wire;
wire [5-1:0]    Mux_Write_Reg_wire2;
wire [4-1:0]    ALUCtrl_o_wire;
wire [3-1:0]    ALU_op_o_wire;
wire            RegWrite_o_wire;
wire            RegWrite_o_wire2;
wire            ALUSrc_o_wire;
wire            RegDst_o_wire;
wire            Branch_o_wire;
wire            ai_select_wire;
wire            branch_select_wire;
wire            Mux_Branch_wire;
wire            Mux_Branch_wire1;
wire            ALU_zero_o_wire;
wire mainstream = 0;
wire [32-1:0]   ShifterJump_o;
wire            Jump_o;
wire [32-1:0]   PCSource_mux;
wire [32-1:0]   PCSource2_mux;
wire            MemRead_o;
wire            MemWrite_o;
wire            MemtoReg_o;
wire            Jumpal_o;
reg             Jumpr_o;
wire             slt_o;
wire            Branchslt_o;

//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(initial_feed) ,   
	    .pc_out_o(pc_out_o_wire) 
	    );
	
Adder Adder1(
        .src1_i(pc_out_o_wire),     
	    .src2_i(32'd4),     
	    .sum_o(adder1_sum_o_wire)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_out_o_wire),  
	    .instr_o(instr_o_wire)    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr_o_wire[20:16]),
        .data1_i(instr_o_wire[15:11]),
        .select_i(RegDst_o_wire),
        .data_o(Mux_Write_Reg_wire)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(instr_o_wire[25:21]) ,  
        .RTaddr_i(instr_o_wire[20:16]) ,  
        .RDaddr_i(Mux_Write_Reg_wire2) ,  
        .RDdata_i(regdata2_o)  , 
        .RegWrite_i (RegWrite_o_wire2),
        .RSdata_o(RSdata_o_wire) ,  
        .RTdata_o(RTdata_o_wire)   
        );
        
MUX_2to1 #(.size(1))RegWrite_mux(
        .data0_i(RegWrite_o_wire),
        .data1_i(1'b0),
        .select_i(Jumpr_o),
        .data_o(RegWrite_o_wire2)
        );
	
Decoder Decoder(
        .instr_op_i(instr_o_wire2[31:26]), 
	    .RegWrite_o(RegWrite_o_wire), 
	    .ALU_op_o(ALU_op_o_wire),   
	    .ALUSrc_o(ALUSrc_o_wire),   
	    .RegDst_o(RegDst_o_wire),   
		.Branch_o(Branch_o_wire),
		.Jump_o(Jump_o),
		.MemRead_o(MemRead_o),
		.MemWrite_o(MemWrite_o),
		.MemtoReg_o(MemtoReg_o),
		.Jumpal_o(Jumpal_o), 
		.Branchslt_o(Branchslt_o)  
	    );

ALU_Ctrl AC(
        .funct_i(instr_o_wire[5:0]),   
        .ALUOp_i(ALU_op_o_wire),   
        .ALUCtrl_o(ALUCtrl_o_wire) 
        );
//AV modules
adv_instr_sel ai(.op_field_i(instr_o_wire[31:26]), .function_field_i(instr_o_wire[5:0]), .select(ai_select_wire));

MUX_2to1 #(.size(32)) 
Mux_ALUai(.data0_i(ALU_result_o_wire),
                                .data1_i(adv_instr_o_wire),
                                .select_i(ai_select_wire),
                                .data_o(Mux_ALUai_o_wire) );
                                
MUX_2to1 #(.size(32))
Mux_ALUregdata(
        .data0_i(Mux_ALUai_o_wire),
        .data1_i(MEMdata_o),
        .select_i(MemtoReg_o),
        .data_o(regdata_o) 
        );
MUX_2to1 #(.size(32)) Mux_ALUregdata2(
        .data0_i(regdata_o),
        .data1_i(adder1_sum_o_wire),
        .select_i(Jumpal_o),
        .data_o(regdata2_o)
        );
                                
adv_instr a(.instr(instr_o_wire), .regs(RSdata_o_wire), .regt(RTdata_o_wire), .result(adv_instr_o_wire));
branch_sel b(.instr(instr_o_wire[31:26]), .select(branch_select_wire));

MUX_2to1 #(.size(1)) 
Mux_Branch(.data0_i(ALU_zero_o_wire && Branch_o_wire),
           .data1_i((~ALU_zero_o_wire) && Branch_o_wire),
           .select_i(branch_select_wire),
           .data_o(Mux_Branch_wire1)
           );
MUX_2to1 #(.size(1)) Mux_Branch2 (
            .data0_i(Mux_Branch_wire1),
            .data1_i(slt_o),
            .select_i(Branchslt_o),
            .data_o(Mux_Branch_wire)
            );
                                
//----------------------------------------------------------------------------------------------        
Sign_Extend SE(
        .data_i(instr_o_wire[15:0]),
        .data_o(Sign_Extend_data_o_wire)
        );

MUX_2to1 #(.size(32)) 
Mux_ALUSrc( .data0_i(RTdata_o_wire),
            .data1_i(Sign_Extend_data_o_wire),
            .select_i(ALUSrc_o_wire),
            .data_o(Mux_ALUSrc_wire)
        );	
		
ALU ALU(
        .src1_i(RSdata_o_wire),
	    .src2_i(Mux_ALUSrc_wire),
	    .ctrl_i(ALUCtrl_o_wire),
	    .result_o(ALU_result_o_wire),
		.zero_o(ALU_zero_o_wire)
	    );
	    
ALU ALU2(
        .src1_i(RSdata_o_wire),
        .src2_i(RTdata_o_wire),
        .ctrl_i(4'b0111),
        .result_o(slt_o)
        );
		
Adder Adder2(
        .src1_i(adder1_sum_o_wire),     
	    .src2_i(shifter_data_o),     
	    .sum_o(adder2_sum_o_wire)      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(Sign_Extend_data_o_wire),
        .data_o(shifter_data_o)
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(adder1_sum_o_wire),
        .data1_i(adder2_sum_o_wire),
        .select_i(Mux_Branch_wire),
        .data_o(PCSource_mux)
        );	
        
Data_Memory Data_Memory(
        .clk_i(clk_i),
        .addr_i(ALU_result_o_wire),
        .data_i(RTdata_o_wire),
        .MemRead_i(MemRead_o),
        .MemWrite_i(MemWrite_o),
        .data_o(MEMdata_o)
        );    
        
Shift_Left_Two_32 ShifterJump(
        .data_i(instr_o_wire),
        .data_o(ShifterJump_o)
        ); 
        
MUX_2to1 #(.size(32)) Mux_PC_Source2(
        .data0_i({adder1_sum_o_wire[31:28],ShifterJump_o[27:0]}),
        .data1_i(PCSource_mux),
        .select_i(Jump_o),
        .data_o(PCSource2_mux)
         );   
        
MUX_2to1 #(.size(32)) Mux_PC_Source3(
        .data0_i(PCSource2_mux),
        .data1_i(RSdata_o_wire),
        .select_i(Jumpr_o),
        .data_o(initial_feed)
        );
         
MUX_2to1 #(.size(5)) Mux_WriteReg2(
        .data0_i(Mux_Write_Reg_wire),
        .data1_i(5'b11111),
        .select_i(Jumpal_o),
        .data_o(Mux_Write_Reg_wire2)
        );
        


always@(*)
begin
    if(instr_o_wire==0)
    begin
        instr_o_wire2 = {6'b111111,26'b0};
    end else instr_o_wire2 = instr_o_wire;
end

always@(*)
begin
    if(instr_o_wire[31:26]==6'b000000 && instr_o_wire[5:0]==6'b001000)
    begin
        Jumpr_o = 1'b1;
    end else Jumpr_o = 1'b0;
end


endmodule
		  


