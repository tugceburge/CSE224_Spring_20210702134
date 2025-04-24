module twos_complement(
    input [7:0] a1,
    output [7:0] b1
);
    assign b1 = ~a1 + 1;
endmodule

