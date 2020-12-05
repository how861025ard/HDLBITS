module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
	
    reg[7:0] q;
    wire[2:0] address;
    assign address = {A, B, C};
    always@(posedge clk)begin
        if(enable)begin
            q[0] <= S;
            q[7:1] <= q[6:0];
        end
        else
            q <= q;
    end
    assign Z = q[address];
endmodule
