module top_module( 
    input [99:0] in,
    output reg [99:0] out
);
    integer i;
    always@(*)begin
    for(i = 0; i < 100; i++)begin
        out[i] = in[99-i];
    end
    end
    
endmodule
