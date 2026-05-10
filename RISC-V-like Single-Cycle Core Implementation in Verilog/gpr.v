module gpr(
    input clk,
    input reset,
    input [4:0] rs,         // ????1?? [25:21]
    input [4:0] rt,         // ????2?? [20:16]
    input [4:0] rd,         // ?????? [15:11]
    input reg_we,           // ??????
    input [31:0] wd,        // ????
    output [31:0] rd1,      // ????1
    output [31:0] rd2       // ????2
);
reg [31:0] regs[31:0];
integer i;
// ???????????0
always @(posedge reset) begin
    for(i=0;i<32;i=i+1) regs[i] <= 32'd0;
end
// ??? ????
assign rd1 = (rs == 5'd0) ? 32'd0 : regs[rs];
assign rd2 = (rt == 5'd0) ? 32'd0 : regs[rt];
// ??? ????
always @(posedge clk) begin
    if(reg_we && (rd != 5'd0))
        regs[rd] <= wd;
end
endmodule
