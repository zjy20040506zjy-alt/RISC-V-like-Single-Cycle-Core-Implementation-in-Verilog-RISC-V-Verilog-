module IF_ID(instruction, next_PC, clk, instruction_out, reset, PC_out);
input [31:0] instruction, next_PC;
input clk, reset;

output reg[31:0] instruction_out, PC_out;

// IF stage: load the value of next PC and the 
//fentched instruction from the last ins
always@(posedge clk, posedge reset)
begin
if(reset)begin
	instruction_out <= 0;
	PC_out <= 0;
end
else begin
	instruction_out <= instruction;
	PC_out <= next_PC;
end
end
endmodule

