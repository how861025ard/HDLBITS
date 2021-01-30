module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
	
	parameter START = 0, S1 = 1, S11 = 2, S110 = 3, S1101 = 4;
	
	reg[2:0] state, next_state;
	
	always@(posedge clk)begin
		if(reset)
			state <= START;
		else
			state <= next_state;
	end
	
	always@(*)begin
		case(state)
			START : next_state = data ? S1 : START;
			S1 : next_state = data ? S11 : START;
			S11 : next_state = data ? S11 : S110;
			S110 : next_state = data ? S1101 : START;
			S1101 : next_state = data ? S1 : START;
		endcase
	end
	
	always@(posedge clk)begin
		if(reset)
			start_shifting <= 0;
		else if(state == S110 && data == 1)
			start_shifting <= 1;
	end
	
endmodule
