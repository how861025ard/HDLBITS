module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

	reg state, next_state;
	
	parameter A = 0, B = 1;
	
	always@(posedge clk or posedge areset)begin
		if(areset)
			state <= A;
		else begin
			state <= next_state; 
		end
	end
	
	always@(*)begin
		case(state)
			A : begin next_state = x ? B : A; z = x; end
			B : begin next_state = B; z = ~x; end
		endcase
	end
	
endmodule
