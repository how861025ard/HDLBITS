module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire cout_temp[99:0];
    genvar i;
    generate
        for(i = 0; i < 100; i++)begin:block
            if(i == 0) bcd_fadd(a[3:0],b[3:0],cin,cout_temp[0],sum[3:0]);
            else bcd_fadd(a[4*(i+1)-1:4*(i+1)-4],b[4*(i+1)-1:4*(i+1)-4],cout_temp[i-1],cout_temp[i],sum[4*(i+1)-1:4*(i+1)-4]);
        end
    endgenerate
    
    assign cout = cout_temp[99];
endmodule
