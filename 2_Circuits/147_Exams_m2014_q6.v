module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

	reg[2:0] state, next_state;

	parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
	
	
	always@(posedge clk)begin
		if(reset)begin
			state <= A;
		end
		else begin
			state <= next_state;
		end
	end
	
	always@(*)begin
		case(state)
			A : begin next_state = w ? A: B; end
			B : begin next_state = w ? D: C; end
			C : begin next_state = w ? D: E; end
			D : begin next_state = w ? A: F; end
			E : begin next_state = w ? D: E; end
			F : begin next_state = w ? D: C; end
		endcase
	end
	
	assign z = (state == E) || (state == F);
	
endmodule
