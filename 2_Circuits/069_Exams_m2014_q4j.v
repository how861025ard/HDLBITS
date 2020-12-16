module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire cout[2:0];
    
    add(x[0],y[0],0,cout[0],sum[0]);
    add(x[1],y[1],cout[0],cout[1],sum[1]);
    add(x[2],y[2],cout[1],cout[2],sum[2]);
    add(x[3],y[3],cout[2],sum[4],sum[3]);
endmodule

module add (
    input x,
    input y, 
    input cin,
    output cout,
    output sum);

    assign {cout, sum} = x + y + cin;
    
endmodule
