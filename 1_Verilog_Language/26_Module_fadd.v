module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    reg cout[15:0];
    wire drop;
    
    integer i;

    add16 m_16(a[15:0], b[15:0], 0, sum[15:0], cout[15]); 
    add16 m_17(a[31:16], b[31:16], cout[15], sum[31:16], drop); 
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign  {cout, sum} = a + b + cin;
endmodule
