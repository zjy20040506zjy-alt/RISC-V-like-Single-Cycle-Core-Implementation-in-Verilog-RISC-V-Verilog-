module dm(
    input clk,
    input reset,
    input [31:0] addr,
    input [31:0] wd,
    input dm_we,        // ?????????sw???
    output [31:0] rd
);
reg [7:0] dm_mem[1023:0];   // 1KB???????
integer i;
always @(posedge reset) begin
    for(i=0;i<1024;i=i+1) dm_mem[i] <= 8'd0;
end
// ???
always @(posedge clk) begin
    if(dm_we) begin
        dm_mem[addr[9:0]]   <= wd[31:24];
        dm_mem[addr[9:0]+1] <= wd[23:16];
        dm_mem[addr[9:0]+2] <= wd[15:8];
        dm_mem[addr[9:0]+3] <= wd[7:0];
    end
end
// ???
assign rd = {dm_mem[addr[9:0]], dm_mem[addr[9:0]+1], dm_mem[addr[9:0]+2], dm_mem[addr[9:0]+3]};
endmodule
