module GPR(rw, ra, rb, regWr, busW, clk, busA, busB, data_in, rst);
input[4:0] rw, ra, rb;
input[31:0] busW;
input clk, regWr, rst;
output[31:0] busA, busB, data_in;

// declare the register array 
reg[31:0] registers[31:0];

// initialize all the registers
integer i;
always@(posedge rst)
begin
if(rst)
for(i=0; i<32; i = i + 1)
begin
registers[i] <= 0;
end
end

// write in the register
always@(posedge clk)
begin
if(regWr)
registers[rw] <= busW;
// note that the first register cannot be written
registers[0] <= 0;
end  

// assign values to the outputs
assign busA = registers[ra];
assign busB = registers[rb];
assign data_in = registers[rb];

endmodule
