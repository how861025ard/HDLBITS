module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	integer i;
    always@(*)begin
        for(i = 0;i < 100; i++)begin
            if(i == 0) {cout[i],sum[i]} = a[i]+b[i]+cin;  
            else {cout[i],sum[i]} = a[i]+b[i]+cout[i-1];  
        end
    end
endmodule
