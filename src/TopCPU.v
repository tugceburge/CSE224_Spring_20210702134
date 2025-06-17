module TopCPU(
    input clk,
    input control,
    input reset,
    output [6:0] seg
);
    CPU cpu_inst(
        .clk(clk),
        .control(control),
        .reset(reset),
        .seg(seg)
    );
endmodule
