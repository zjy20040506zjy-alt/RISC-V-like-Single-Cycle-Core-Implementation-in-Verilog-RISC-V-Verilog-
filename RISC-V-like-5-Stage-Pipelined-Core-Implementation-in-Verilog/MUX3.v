module MUX3(MemtoReg, ALU_out, DM_out, out);
input[31:0] ALU_out, DM_out;
input MemtoReg;
output reg[31:0] out;

always@(*)
begin
case(MemtoReg)
1'b0: out <= ALU_out;
1'b1: out <= DM_out;
endcase
end

endmodule
