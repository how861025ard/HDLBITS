module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] sum1,sum2;
    wire c,drop;
    add16 add1(a[15:0],b[15:0],0,sum1,c);
    add16 add2(a[31:16],b[31:16],c,sum2,drop);
    assign sum = {sum2[15:0],sum1[15:0]};
endmodule
