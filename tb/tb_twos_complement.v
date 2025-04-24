timescale 1ns / 1ps

module tb_twos_complement;
    reg [7:0] a1;
    wire [7:0] b1;

    twos_complement uut (
        .a1(a1),
        .b1(b1)
    );

    initial begin
        a1 = 8'b00000000; #10;
        a1 = 8'b00000001; #10;
        a1 = 8'b00000010; #10;
        a1 = 8'b01111111; #10;
        a1 = 8'b10000000; #10;
        a1 = 8'b11111111; #10;
        a1 = 8'b11111110; #10;
        $stop;
    end
endmodule
