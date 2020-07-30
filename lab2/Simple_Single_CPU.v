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
wire [5-1:0]    Mux_Write_Reg_wire;
wire [4-1:0]    ALUCtrl_o_wire;
wire [3-1:0]    ALU_op_o_wire;
wire            RegWrite_o_wire;
wire            ALUSrc_o_wire;
wire            RegDst_o_wire;
wire            Branch_o_wire;
wire            ai_select_wire;
wire            branch_select_wire;
wire            Mux_Branch_wire;
wire            ALU_zero_o_wire;
wire mainstream = 0;





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
        .RDaddr_i(Mux_Write_Reg_wire) ,  
        .RDdata_i(Mux_ALUai_o_wire)  , 
        .RegWrite_i (RegWrite_o_wire),
        .RSdata_o(RSdata_o_wire) ,  
        .RTdata_o(RTdata_o_wire)   
        );
	
Decoder Decoder(
        .instr_op_i(instr_o_wire[31:26]), 
	    .RegWrite_o(RegWrite_o_wire), 
	    .ALU_op_o(ALU_op_o_wire),   
	    .ALUSrc_o(ALUSrc_o_wire),   
	    .RegDst_o(RegDst_o_wire),   
		.Branch_o(Branch_o_wire)   
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
                                
adv_instr a(.instr(instr_o_wire), .regs(RSdata_o_wire), .regt(RTdata_o_wire), .result(adv_instr_o_wire));
branch_sel b(.instr(instr_o_wire[31:26]), .select(branch_select_wire));

MUX_2to1 #(.size(1)) 
Mux_Branch(.data0_i(ALU_zero_o_wire && Branch_o_wire),
           .data1_i((~ALU_zero_o_wire) && Branch_o_wire),
           .select_i(branch_select_wire),
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
        .data_o(initial_feed)
        );	

endmodule
		  


