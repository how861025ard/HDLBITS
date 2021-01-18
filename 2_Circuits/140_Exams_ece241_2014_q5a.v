module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

	reg[1:0] state, next_state;
	
	parameter A = 0, B = 1, C = 2;
	
	always@(posedge clk or posedge areset)begin
		if(areset)
			state <= A;
		else begin
			state <= next_state; 
		end
	end
	
	always@(*)begin
		case(state)
			A : begin next_state = x ? B : A;end
			B : begin next_state = x ? C : B;end
			C : begin next_state = x ? C : B;end
		endcase
	end
	
	assign z = ~(state == A || state == C);
endmodule
