module EX_MEM(RegWriteE, MemtoRegE, MemWriteE, BranchE, clk, 
	      ALUOutE, WriteDataE, WriteRegE, ext_out_E, zeroE,
	      RegWriteM, MemtoRegM, MemWriteM, BranchM, zeroM,
	      ALUOutM, WriteDataM, WriteRegM, ext_out_M, next_PC_E,
              next_PC_M, j_sel_E, j_sel_M);
// define the input pins
input RegWriteE, MemtoRegE, MemWriteE, clk, zeroE, BranchE, j_sel_E;
input [4:0] WriteRegE;
input [31:0] ALUOutE, WriteDataE, ext_out_E, next_PC_E;

// define the output pins
output reg RegWriteM, MemtoRegM, MemWriteM, zeroM, BranchM, j_sel_M;
output reg [4:0] WriteRegM;
output reg [31:0] ALUOutM, WriteDataM, ext_out_M, next_PC_M;

// EX stage: execute for load
always@(posedge clk)
begin
RegWriteM <= RegWriteE;
MemtoRegM <= MemtoRegE;
MemWriteM <= MemWriteE;
zeroM <= zeroE;
BranchM <= BranchE;
WriteRegM <= WriteRegE;
ALUOutM <= ALUOutE;
WriteDataM <= WriteDataE;
ext_out_M <= ext_out_E;
j_sel_M <= j_sel_E;
next_PC_M <= next_PC_E;
end

endmodule
