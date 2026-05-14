module MUX1(RegDst, rd, rt, out);
input RegDst;
input[4:0] rd, rt;
output reg[4:0] out;

always@(*)
begin
case(RegDst)
1'b0: out <= rt;
1'b1: out <= rd;
endcase
end

endmodule