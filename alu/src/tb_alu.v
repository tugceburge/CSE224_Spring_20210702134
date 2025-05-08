`timescale 1ns / 1ps

module tb_alu;
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;
    wire [7:0] out;
    
    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .out(out)
    );
    
    initial begin
            A = 8'b00001100; B = 8'b00000011; opcode = 3'b000; #10;
            $display("A(00001100) + B(00000011) = %b = %d(in decimal)", out, out);
            A = 8'b00001100; B = 8'b00000011; opcode = 3'b001; #10;
            $display("A(00001100) - B(00000011) = %b = %d(in decimal)", out, out);
            A = 8'b00001100; B = 8'b00000011; opcode = 3'b010; #10;
            $display("A(00001100) & B(00000011) = %b = %d(in decimal)", out, out);
            A = 8'b00001100; B = 8'b00000011; opcode = 3'b011; #10;
            $display("A(00001100) | B(00000011) = %b = %d(in decimal)", out, out);
            A = 8'b00001100; B = 8'b00000011; opcode = 3'b100; #10;
            $display("A(00001100) ^ B(00000011) = %b = %d(in decimal)", out, out);
            A = 8'b00001100; opcode = 3'b101; #10;
            $display("~A(00001100) = %b = %d(in decimal)", out, out);
            A = 8'b00001100; B = 8'b00000011; opcode = 3'b110; #10;
            $display("A(00001100) * B(00000011) = %b = %d(in decimal)", out, out);
            
            $stop;
        end
    
endmodule
