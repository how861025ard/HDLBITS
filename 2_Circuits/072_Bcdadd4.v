module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
	
    wire cout1[4:0];
    bcd_fadd a1(a[3:0],b[3:0],cin,cout1[0],sum[3:0]);
    bcd_fadd b1(a[7:4],b[7:4],cout1[0],cout1[1],sum[7:4]);
    bcd_fadd c1(a[11:8],b[11:8],cout1[1],cout1[2],sum[11:8]);
    bcd_fadd d1(a[15:12],b[15:12],cout1[2],cout,sum[15:12]);
    
endmodule
