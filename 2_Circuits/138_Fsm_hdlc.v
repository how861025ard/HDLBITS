module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
  
    reg[9:0] state ,next_state;
	
	always@(posedge clk)begin
		if(reset)
			state <= 10'b0000_0000_01;
		else
			state <= next_state;
	end
	
    always@(*)begin
		next_state[0] <= state[0] & ~in | state[1] & ~in | state[2] & ~in | state[3] & ~in | state[4] & ~in | state[8] & ~in | state[9] & ~in | state[7] & ~in; 
		next_state[1] <= state[0] & in | state[8] & in | state[9] & in;
		next_state[2] <= state[1] & in;
		next_state[3] <= state[2] & in;
		next_state[4] <= state[3] & in;
		next_state[5] <= state[4] & in;
		next_state[6] <= state[5] & in;
		next_state[7] <= state[6] & in | state[7] & in;
		next_state[8] <= state[5] & ~in;
		next_state[9] <= state[6] & ~in;
	end
	
	assign err = state[7] == 1;
	assign disc = state[8] == 1;
	assign flag = state[9] == 1;

endmodule
