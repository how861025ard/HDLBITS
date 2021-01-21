module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

	reg[2:0] state, next_state;

	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
	
	
	always@(posedge clk)begin
		if(reset)begin
			state <= S0;
		end
		else begin
			state <= next_state;
		end
	end
	
	always@(*)begin
		case(state)
			S0 : begin next_state = x ? S1: S0; end
			S1 : begin next_state = x ? S4: S1; end
			S2 : begin next_state = x ? S1: S2; end
			S3 : begin next_state = x ? S2: S1; end
			S4 : begin next_state = x ? S4: S3; end
		endcase
	end
	
	assign z = (state == S3) || (state == S4);
	
endmodule
