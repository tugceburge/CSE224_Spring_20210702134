module registerfile(
 input CLK,
 input WE3,
 input [4:0] A1,
input [4:0] A2,
input [4:0] A3,
 input [31:0] WD3,
 output [31:0] RD1, RD2
);
 reg [31:0] registers [0:31];
 assign RD1 = registers[A1];
 assign RD2 = registers[A2];
 always @(posedge CLK) begin
 if (WE3)
 registers[A3] <= WD3;
 end
endmodule
module ALU(
 input [31:0] inputA,
input [31:0] inputB,
 input [1:0] opcode,
 output reg [31:0] result
);
 always @(*) begin
 case (opcode)
 2'b00: result = inputA + inputB;
 2'b01: result = inputA - inputB;
 2'b10: result = inputA << inputB;
 2'b11: result = inputA >> inputB;
 default: result = 32'b0;
 endcase
 end
endmodule
module topmodule(
 input CLK,
 input WE3,
 input [4:0] A1, 
 input [4:0] A2,
 input [4:0] A3,
 input [31:0] WD3,
 input [1:0] opcode,
 output [31:0] result
);
 wire [31:0] RD1, RD2;
 registerfile rf(
 .CLK(CLK),
 .WE3(WE3),
 .A1(A1),
 .A2(A2),
 .A3(A3),
 .WD3(WD3),
 .RD1(RD1),
 .RD2(RD2)
 );
 ALU alu(
 .inputA(RD1),
 .inputB(RD2),
 .opcode(opcode),
 .result(result)
 );
endmodule
