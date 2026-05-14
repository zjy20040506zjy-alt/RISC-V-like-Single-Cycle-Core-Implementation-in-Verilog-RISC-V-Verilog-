module IFU(nPC_sel, zero, instruction, clk, rst, j_sel);
input nPC_sel, zero, clk, rst;
input j_sel;
output[31:0] instruction;

reg[7:0] Instrution_Memory[1023:0];
reg[31:0] PC_value;

wire[31:0] PC_new;
wire[31:0] PC_ext;
wire[15:0] imm16;
wire[31:0] ins0;
wire[31:0] ins1;
wire[25:0] j_value;
wire[31:0] temp_1;
wire[31:0] temp_2;

assign j_value = instruction[25:0];
assign imm16 = instruction[15:0];

assign temp_1 = {{16{imm16[15]}},imm16};
assign temp_2 = {PC_value[31:28], j_value[25:0], 2'b0};

// declare the reset operation of PC value
always@(posedge clk, posedge rst)
begin
if(rst)
// reset PC to 0x0000 3000
PC_value <= 32'h0000_3000;
else if(j_sel==1'b1)
PC_value <= PC_ext;
else
PC_value <= PC_new;
end


// considering the jump condition when extending the instruction
assign PC_ext = j_sel ? temp_2:temp_1 << 2;

// obtain the address of the next instruction in two cases:
// one is the normal senario 
assign ins0 = PC_value + 4;
// the other is the beq scenario
assign ins1 = ins0 + PC_ext;
// assign the value with PC
assign PC_new = (nPC_sel && zero) ? ins1 : ins0;

// concatenate the final value of instruction, which is composed of foure byte.
// note that PC_value is a 32-bit value; therfore, it is necesary to convert it to 10-bit.
assign instruction = {Instrution_Memory[PC_value[9:0]], Instrution_Memory[PC_value[9:0]+1], Instrution_Memory[PC_value[9:0]+2], Instrution_Memory[PC_value[9:0]+3]}; 

endmodule






 
