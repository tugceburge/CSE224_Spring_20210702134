module five (
    input clk,
    input reset,
    input control,
    output [31:0] result,
    output [6:0] seg_out,
    output [3:0] an
);

    wire [2:0] pc_address;
    wire [31:0] instruction;
    wire [5:0] opcode;
    wire [4:0] rs, rt, rd;
    wire [15:0] imm16;
    wire [31:0] imm_ext;
    wire [31:0] reg_data1, reg_data2;
    wire [2:0] alu_op;
    wire reg_write_signal;



    assign instruction = 32'h01010101;  // Geçici sabit veri
    assign pc_address = 3'b000;

    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign imm16 = instruction[15:0];
    assign imm_ext = {{16{imm16[15]}}, imm16};

    assign alu_op = (opcode == 6'b010000) ? 3'b010 :
                    (opcode == 6'b011000) ? 3'b011 :
                    (opcode == 6'b100000) ? 3'b100 :
                    (opcode == 6'b101000) ? 3'b101 :
                    (opcode == 6'b110000) ? 3'b110 :
                    (opcode == 6'b111000) ? 3'b111 :
                    3'b000;

    assign reg_write_signal = (opcode == 6'b010000 ||
                               opcode == 6'b011000 ||
                               opcode == 6'b100000 ||
                               opcode == 6'b101000 ||
                               opcode == 6'b110000 ||
                               opcode == 6'b111000);



    assign reg_data1 = 32'd5;  // Geçici sabit veri
    assign reg_data2 = 32'd2;  // Geçici sabit veri



    assign result = reg_data1 + reg_data2; // Geçici ALU işlemi

    assign seg_out = 7'b0000000;
    assign an = 4'b0000;

endmodule
