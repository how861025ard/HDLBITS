module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);
	
    reg[3:0] dff;
    
    always@(posedge clk)begin 
        out <= dff[0];
        if(!resetn)
            dff <= 0;
        else begin 
            dff <= {in, dff[3:1]};
        end
    end
endmodule
