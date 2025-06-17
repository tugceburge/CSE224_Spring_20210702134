module CPU(
    input clk,
    input control,
    input reset,
    output [6:0] seg
);
    reg [31:0] PC;
    wire [31:0] instr;
    wire [2:0] ALUop;
    wire [4:0] rs1, rs2, rd;
    wire [31:0] imm;
    wire isImm, isBranch, isJump;
    wire [31:0] RD1, RD2, ALUinB, Result;

    reg [31:0] instr_mem [0:31];
    initial begin
        instr_mem[0] = 32'b110_00000_01010_0000000000001010; // ADDI r10, r0, 10
        instr_mem[1] = 32'b110_00000_01111_0000000000001111; // ADDI r15, r0, 15
        instr_mem[2] = 32'b010_01010_01111_11001_000000000000; // ADD r25, r10, r15
        instr_mem[3] = 32'b111_11001_10100_0000000000000101; // SUBI r20, r25, 5
        instr_mem[4] = 32'b110_00000_10101_0000000000000010; // ADDI r21, r0, 2
        instr_mem[5] = 32'b100001_00000000000000000000001100; // J 12
        instr_mem[6] = 32'b100_00111_10101_11110_000000000000; // SHIFTL r30, r7, r21
        instr_mem[12]= 32'b110_00000_00100_0000000000000100; // ADDI r4, r0, 4
        instr_mem[13]= 32'b010_00000_00000_00101_000000000000; // ADD r5, r0, r0
        instr_mem[14]= 32'b100000_00100_00101_0000000000000111; // BEQ r4, r5, 7
        instr_mem[15]= 32'b110_00000_00110_0000000000000001; // ADDI r6, r0, 1
        instr_mem[16]= 32'b110_00000_00111_0000000000000001; // ADDI r7, r0, 1
        instr_mem[17]= 32'b010_00110_00111_01000_000000000000; // ADD r8, r6, r7
        instr_mem[18]= 32'b010_00111_00000_00110_000000000000; // ADD r6, r7, r0
        instr_mem[19]= 32'b010_01000_00000_00111_000000000000; // ADD r7, r8, r0
        instr_mem[20]= 32'b110_00101_00101_0000000000000001; // ADDI r5, r5, 1
        instr_mem[21]= 32'b100001_00000000000000000000001110; // J 14
    end

    assign instr = (control) ? instr_mem[PC] : 32'b0;

    Decoder decoder(instr, ALUop, rs1, rs2, rd, imm, isImm, isBranch, isJump);
    RegisterFile rf(clk, control, rs1, rs2, rd, Result, RD1, RD2);

    assign ALUinB = (isImm) ? imm : RD2;

    ALU alu(RD1, ALUinB, ALUop, Result);

    always @(posedge clk or posedge reset) begin
        if (reset)
            PC <= 0;
        else if (control) begin
            if (isJump)
                PC <= instr[25:0];
            else if (isBranch && (RD1 == RD2))
                PC <= instr[18:0];
            else
                PC <= PC + 1;
        end
    end
    SevenSeg ss0(Result[3:0], seg);
endmodule
