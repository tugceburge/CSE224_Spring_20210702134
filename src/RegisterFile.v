module RegisterFile(
    input clk,
    input WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output [31:0] RD1, RD2
);
    reg [31:0] registers [0:31];
   
    assign RD1 = registers[A1];
    assign RD2 = registers[A2];

    always @(posedge clk) begin
        if (WE3)
            registers[A3] <= WD3;
    end
endmodule
