module ID_EX(RegWriteD, MemtoRegD, MemWriteD, nPC_sel_D, ALUControlD, 
	     ALUsrcD, RegDstD, RD1_D, RD2_D, RtD, RdD, ext_imm32D, next_PC,
	     RegWriteE, MemtoRegE, MemWriteE, nPC_sel_E, ALUControlE, 
	     ALUsrcE, RegDstE, RD1_E, RD2_E, RtE, RdE, ext_imm32E, 
             PC_out, clk, data_in_D, data_in_E,
	     j_value_D, j_value_E, j_sel_E, j_sel_D);

// define the input pins
input RegWriteD, MemtoRegD, MemWriteD, ALUsrcD, RegDstD, clk, nPC_sel_D, j_sel_D;
input [1:0] ALUControlD;
input [31:0] RD1_D, RD2_D, data_in_D;
input [4:0] RtD, RdD;
input [31:0] ext_imm32D;
input [31:0] next_PC;
input [25:0] j_value_D;

// define the output pins
output reg RegWriteE, MemtoRegE, MemWriteE, ALUsrcE, RegDstE, nPC_sel_E, j_sel_E;
output reg[1:0] ALUControlE;
output reg[31:0] RD1_E, RD2_E, data_in_E;
output reg[4:0] RtE, RdE;
output reg[31:0] ext_imm32E;
output reg[31:0] PC_out;
output reg[25:0] j_value_E;

// EX Stage: execute for load
always@(posedge clk)
begin
     RegWriteE <= RegWriteD;
     MemtoRegE <= MemtoRegD;
     MemWriteE <= MemWriteD;
     ALUsrcE <= ALUsrcD;
     RegDstE <= RegDstD;
     nPC_sel_E <= nPC_sel_D; 
     ALUControlE <= ALUControlD;
     RD1_E <= RD1_D;
     RD2_E <= RD2_D; 
     data_in_E <= data_in_D;
     RtE <= RtD; 
     RdE <= RdD;
     ext_imm32E <= ext_imm32D;
     PC_out <= next_PC; 
     j_sel_E <= j_sel_D;
     j_value_E <= j_value_D;
end

endmodule





	    