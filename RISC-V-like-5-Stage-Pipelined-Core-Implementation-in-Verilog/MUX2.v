module MUX2(ALUSrc, busB, ext_out, out);
input ALUSrc;
input[31:0] busB, ext_out;
output reg[31:0] out;

always@(*)
begin
case(ALUSrc)
1'b0: out <= busB;
1'b1: out <= ext_out;
endcase
end

endmodule