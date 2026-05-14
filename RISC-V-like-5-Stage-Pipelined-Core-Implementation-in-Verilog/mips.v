module mips(clk, rst);
input clk, rst;
wire [1:0] ExtOp, ALUctr;
wire RegDst, RegWr, MemWr, MemtoReg, ALUSrc, j_sel, nPC_sel;
wire [31:0] instruction_value;

controller ctr(.instruction(instruction_value), .RegDst(RegDst), .RegWr(RegWr), .nPC_sel(nPC_sel), .ExtOp(ExtOp), .ALUSrc(ALUSrc), .ALUctr(ALUctr), .MemWr(MemWr), .MemtoReg(MemtoReg), .j_sel(j_sel));
dp_top dp(.clk(clk), .rst(rst), .RegDst(RegDst), .RegWr(RegWr), .MemWr(MemWr), .ExtOp(ExtOp), .nPC_sel(nPC_sel), .ALUctr(ALUctr),.MemtoReg(MemtoReg), .ALUSrc(ALUSrc), .j_sel(j_sel), .instruction_value(instruction_value));

endmodule
