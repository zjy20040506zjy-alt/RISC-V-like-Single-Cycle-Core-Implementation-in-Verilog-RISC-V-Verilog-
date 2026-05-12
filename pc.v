module pc(
    input clk,
    input reset,
    input [31:0] npc_in,    // NPC????????
    output reg [31:0] pc_out
);
// ????????? 0x0000_3000
always @(posedge clk or posedge reset) begin
    if(reset)
        pc_out <= 32'h0000_3000;
    else
        pc_out <= npc_in;
end
endmodule
