module ctrl(
    input [31:0] instr,
    // ????????
    output reg reg_we,      // ???????
    output reg [1:0] reg_wd_sel, // ???????MUX
    output reg [1:0] reg_wa_sel, // ????????MUX
    output reg alu_src_sel,  // ALU?????????/????
    output reg [3:0] alu_op, // ALU?????
    output reg ext_op,      // ?????0????1????
    output reg dm_we,       // ?????????sw?
    output reg j_en,        // j??????
    output reg beq_en        // beq??????
);
wire [5:0] op;
wire [5:0] func;
assign op = instr[31:26];
assign func = instr[5:0];

always @(*) begin
    // ????????????????
    reg_we = 1'b0;
    reg_wd_sel = 2'b00;
    reg_wa_sel = 2'b00;
    alu_src_sel = 1'b0;
    alu_op = 4'b0000;
    ext_op = 1'b1;
    dm_we = 1'b0;
    j_en = 1'b0;
    beq_en = 1'b0;

    case(op)
        6'b000000: begin    // R??? addu/subu
            if(func == 6'b100001) begin // addu
                reg_we = 1'b1;
                reg_wa_sel = 2'b10; // ????rd [15:11]
                alu_op = 4'b0000;
            end
            else if(func == 6'b100011) begin // subu
                reg_we = 1'b1;
                reg_wa_sel = 2'b10;
                alu_op = 4'b0001;
            end
        end
        6'b001111: begin    // lui ?????
            reg_we = 1'b1;
            alu_src_sel = 1'b1;
            alu_op = 4'b0011;
            reg_wa_sel = 2'b01; // ????rt [20:16]
        end
        6'b001101: begin    // ori ????
            reg_we = 1'b1;
            alu_src_sel = 1'b1;
            alu_op = 4'b0010;
            ext_op = 1'b0;  // ???
            reg_wa_sel = 2'b01;
        end
        6'b100011: begin    // lw ????
            reg_we = 1'b1;
            alu_src_sel = 1'b1;
            alu_op = 4'b0000;
            reg_wd_sel = 2'b01; // ?????DM
            reg_wa_sel = 2'b01;
        end
        6'b101011: begin    // sw ????
            dm_we = 1'b1;
            alu_src_sel = 1'b1;
            alu_op = 4'b0000;
        end
        6'b000100: begin    // beq ????
            beq_en = 1'b1;
            alu_op = 4'b0001;
        end
        6'b000010: begin    // j ?????
            j_en = 1'b1;
        end
    endcase
end
endmodule
