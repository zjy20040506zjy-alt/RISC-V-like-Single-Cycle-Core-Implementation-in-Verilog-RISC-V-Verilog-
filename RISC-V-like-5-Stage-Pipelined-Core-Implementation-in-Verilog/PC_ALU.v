module PC_ALU(j_sel, j_value, ext_imm32, next_PC, PC_value);
input j_sel;
input [25:0] j_value;
input [31:0] ext_imm32, PC_value;

output[31:0] next_PC;

wire [31:0] temp1;
wire [31:0] temp2;

assign temp1 = ext_imm32 << 2;
assign temp2 = {PC_value[31:28], j_value[25:0], 2'b00};

assign next_PC = (j_sel == 1'b1) ? temp2 : temp1+PC_value+4;

endmodule
