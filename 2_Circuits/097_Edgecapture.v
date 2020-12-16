module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg[31:0] out
);
    integer i;
    reg[31:0] q;
    always@(posedge clk)begin
        for(i = 0; i < 32; i++)begin
            q[i] <= in[i];
            if(reset)
                out[i] <= 0;
            else if((q[i]!=in[i]) && (q[i]==1))
                out[i] <= 1;
            else
                out[i] <= out[i];
        end
    end
endmodule
