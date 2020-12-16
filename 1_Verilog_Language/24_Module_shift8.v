module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire[7:0] a,b,c;
    my_dff8 dff1(clk,d,a);
    my_dff8 dff2(clk,a,b);
    my_dff8 dff3(clk,b,c);
    
    always@(*)
       begin
           if(sel == 2'b00) q = d;
           else if(sel == 2'b01) q = a;
           else if(sel == 2'b10) q = b;
           else q = c;
       end
endmodule
