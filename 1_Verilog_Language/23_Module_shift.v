module top_module ( input clk, input d, output q );
	wire a,b;
    my_dff dff1(clk,d,a);
    my_dff dff2(clk,a,b);
    my_dff dff3(clk,b,q);
endmodule
