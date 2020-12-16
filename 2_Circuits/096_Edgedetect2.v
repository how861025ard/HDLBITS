module top_module (
    input clk,
    input [7:0] in,
    output reg[7:0] anyedge
);
    integer i;
    reg [7:0]q;
    always@(posedge clk)begin
        for(i = 0; i < 8;i++)begin
            q[i] <= in[i];
            if(q[i]!=in[i])
                anyedge[i] <= 1;
            else
                anyedge[i] <= 0; 
        end
    end
endmodule
