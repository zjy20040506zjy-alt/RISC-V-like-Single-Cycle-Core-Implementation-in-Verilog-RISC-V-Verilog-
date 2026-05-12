module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] alu_op,     // ????????
    output reg [31:0] alu_out,
    output zero             // ??????beq????
);
assign zero = (alu_out == 32'd0);
// ??????addu/subu/ori/lui
always @(*) begin
    case(alu_op)
        4'b0000: alu_out = A + B;      // addu ????
        4'b0001: alu_out = A - B;      // subu ????
        4'b0010: alu_out = A | B;      // ori ????
        4'b0011: alu_out = {B[15:0], 16'd0};// lui ?????16?
        default: alu_out = 32'd0;
    endcase
end
endmodule
