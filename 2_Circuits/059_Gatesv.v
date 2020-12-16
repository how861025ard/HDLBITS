module top_module( 
    input [3:0] in,
    output reg[2:0] out_both,
    output reg[3:1] out_any,
    output reg[3:0] out_different );
	
    integer i ,j, k;
    always@(*)begin
        for(i = 0; i < 3; i++)begin
            out_both[i] = in[i]&in[i+1]?1:0;
        end
        for(j = 1; j < 4; j++)begin
            out_any[j] = in[j]|in[j-1]?1:0;
        end
        for(k = 0; k < 4; k++)begin
            out_different[k] = (in[k]^in[(k+1)%4])?1:0;
        end
    end
    
endmodule
