module core_top(
    input clk,
    input reset
);
// ??????
wire [31:0] pc_now;
wire [31:0] npc_out;
wire [31:0] instr;
wire [4:0] rs, rt, rd;
wire [31:0] gpr_rd1, gpr_rd2;
wire [31:0] ext_out;
wire [31:0] alu_B;
wire [31:0] alu_result;
wire zero;
wire [31:0] dm_rd;
wire [4:0] reg_wa;
wire [31:0] reg_wd;

// ????????
wire reg_we;
wire [1:0] reg_wd_sel;
wire [1:0] reg_wa_sel;
wire alu_src_sel;
wire [3:0] alu_op;
wire ext_op;
wire dm_we;
wire j_en;
wire beq_en;

// ?????? ????????????
assign rs = instr[25:21];
assign rt = instr[20:16];
assign rd = instr[15:11];

// ==================== ???? ??????? ====================
// 1. PC??
pc u_pc(
    .clk(clk), .reset(reset),
    .npc_in(npc_out), .pc_out(pc_now)
);
// 2. NPC?????
npc u_npc(
    .pc_now(pc_now),
    .j_imm(instr[25:0]),
    .beq_imm(ext_out),
    .beq_en(beq_en & zero),
    .j_en(j_en),
    .npc_out(npc_out)
);
// 3. ?????IM
im u_im(
    .pc(pc_now), .instr(instr)
);
// 4. ???CTRL
controller u_controller(
    .instr(instr),
    .reg_we(reg_we), .reg_wd_sel(reg_wd_sel), .reg_wa_sel(reg_wa_sel),
    .alu_src_sel(alu_src_sel), .alu_op(alu_op), .ext_op(ext_op),
    .dm_we(dm_we), .j_en(j_en), .beq_en(beq_en)
);
// 5. ????GPR
mux3_5 u_reg_wa_mux(
    .in0(5'd0), .in1(rt), .in2(rd),
    .sel(reg_wa_sel), .out(reg_wa)
);
reg_file u_reg_file(
    .clk(clk), .reset(reset),
    .rs(rs), .rt(rt), .rd(reg_wa),
    .reg_we(reg_we), .wd(reg_wd),
    .rd1(gpr_rd1), .rd2(gpr_rd2)
);
// 6. ????EXT
ext u_ext(
    .imm_in(instr[15:0]), .ext_op(ext_op), .imm_out(ext_out)
);
// 7. ALU????????? + ALU
mux2_32 u_alu_src_mux(
    .in0(gpr_rd2), .in1(ext_out), .sel(alu_src_sel), .out(alu_B)
);
alu u_alu(
    .A(gpr_rd1), .B(alu_B), .alu_op(alu_op),
    .alu_out(alu_result), .zero(zero)
);
// 8. ?????DM
dm u_dm(
    .clk(clk), .reset(reset),
    .addr(alu_result), .wd(gpr_rd2), .dm_we(dm_we),
    .rd(dm_rd)
);
// 9. ???????????
mux2_32 u_reg_wd_mux1(
    .in0(alu_result), .in1(dm_rd), .sel(reg_wd_sel[0]), .out(reg_wd)
);

endmodule
