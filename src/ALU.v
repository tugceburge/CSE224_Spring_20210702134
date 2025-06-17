module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUop,
    output reg [31:0] Result
);
    always @(*) begin
        case(ALUop)
            3'b000: Result = A + B;      // ADD
            3'b001: Result = A - B;      // SUB
            3'b010: Result = A << B;     // SHIFTL
            default: Result = 32'b0;     // Default: 0
        endcase
    end
endmodule
