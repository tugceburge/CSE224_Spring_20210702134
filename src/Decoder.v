module Decoder(
    input [31:0] instr,
    output reg [2:0] ALUop,
    output reg [4:0] rs1, rs2, rd,
    output reg [31:0] imm,
    output reg isImm, isBranch, isJump
);
    always @(*) begin
        ALUop = instr[31:29];
        rs1 = instr[28:24];
        rs2 = instr[23:19];
        rd  = instr[18:14];
        imm = {{20{instr[13]}}, instr[13:0]}; 
        isImm = (ALUop == 3'b110 || ALUop == 3'b111);
        isBranch = (instr[31:26] == 6'b100000); 
        isJump = (instr[31:26] == 6'b100001);   
    end
endmodule
