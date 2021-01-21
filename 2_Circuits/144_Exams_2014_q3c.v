module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
	
    always@(*)begin
        if(y == 0)begin Y0 <= x ? 1 : 0; z <= 0;end
        else if(y == 1)begin Y0 <= x ? 0 : 1; z <= 0;end
        else if(y == 2)begin Y0 <= x ? 1 : 0; z <= 0;end
        else if(y == 3)begin Y0 <= x ? 0 : 1; z <= 1;end
        else if(y == 4)begin Y0 <= x ? 0 : 1; z <= 1;end
        else begin Y0 <= 0; z <= 0;end
	end
	
endmodule
