module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

	reg[1:0] state, next_state;
	parameter A = 0, B = 1, C = 2, D = 3;

	always@(posedge clk)begin
		if(!resetn)
			state <= A;
		else
			state <= next_state;
	end

	always@(*)begin
		if(state == A)begin
			if(r[1]) next_state = B;
			else if(~r[1] & r[2]) next_state = C;
			else if(~r[1] & ~r[2] & r[3]) next_state = D;
			else if(~r[1] & ~r[2] & ~r[3]) next_state = A;
		end
		else if(state == B)begin
			if(r[1]) next_state = B;
			else next_state = A;
		end
		else if(state == C)begin
			if(r[2]) next_state = C;
			else if(~r[2]) next_state = A;
		end
		else if(state == D)begin
			if(r[3]) next_state = D;
			else if(~r[3]) next_state = A;
		end
	end
	
	assign g[1] = state == B;
	assign g[2] = state == C;
	assign g[3] = state == D;
	
endmodule
