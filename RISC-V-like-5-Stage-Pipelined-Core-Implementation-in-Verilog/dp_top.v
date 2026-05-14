module dp_top(clk, rst, RegDst, RegWr, MemWr, ExtOp, nPC_sel, ALUctr, MemtoReg, ALUSrc, j_sel, instruction_value);
input clk, rst;
input [1:0] ExtOp, ALUctr;
input ALUSrc, MemWr, MemtoReg, RegWr, j_sel, RegDst, nPC_sel;
output [31:0] instruction_value;

wire [31:0] instruction;
wire zero;
wire [31:0] busA, busB, busW, Mux2_out, Mux3_out, imm32, ALU_out, Addr, data_in, dm_out;
wire [4:0] rw;
wire [4:0] rd;
wire [4:0] rt;
wire [4:0] rs;
wire [15:0] imm16;

assign instruction_value = instruction;
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign imm16 = instruction[15:0];


IFU ifu(.nPC_sel(nPC_sel), .zero(zero), .instruction(instruction), .clk(clk), .rst(rst), .j_sel(j_sel));
MUX1 mux1(.RegDst(RegDst), .rd(rd), .rt(rt), .out(rw));
GPR gpr(.rw(rw), .ra(rs), .rb(rt), .regWr(RegWr), .busW(Mux3_out), .clk(clk), .busA(busA), .busB(busB), .data_in(data_in), .rst(rst));
EXT ext(.imm16(imm16), .out32(imm32), .ExtOp(ExtOp));
MUX2 mux2(.ALUSrc(ALUSrc), .busB(busB), .ext_out(imm32), .out(Mux2_out));
ALU alu(.data1(busA), .data2(Mux2_out), .zero(zero),.Addr(Addr), .ALUctr(ALUctr), .out(ALU_out));
DM data_memory(.data_in(data_in), .clk(clk), .WrEn(MemWr), .Addr(Addr), .out(dm_out), .rst(rst));
MUX3 mux3(.MemtoReg(MemtoReg), .ALU_out(ALU_out), .DM_out(dm_out), .out(Mux3_out));

endmodule



