module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire sel;
    wire [15:0]in_0,in_1;
    add16 m_1(a[15:0], b[15:0], 0, sum[15:0], sel);
    add16 m_2(a[31:16], b[31:16], 0, in_0, );
    add16 m_3(a[31:16], b[31:16], 1, in_1, );
    assign sum[31:16] = sel? in_1: in_0;
endmodule
