module mux2_32(     // 2?1 32??????
    input [31:0] in0,
    input [31:0] in1,
    input sel,
    output [31:0] out
);
assign out = sel ? in1 : in0;
endmodule

module mux3_5(      // 5???3?1????????????MUX?rt/rd?
    input [4:0] in0,
    input [4:0] in1,
    input [4:0] in2,
    input [1:0] sel,
    output [4:0] out
);
assign out = (sel==2'b00) ? in0 : (sel==2'b01) ? in1 : in2;
endmodule
