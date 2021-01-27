module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
	parameter IDLE = 1, AFTRSt = 2, X_MNT = 3, X_0 = 4, X_1 = 5, X_10 = 6, X_101 = 7, Y_0 = 8, G_0 = 9, G_1 = 10;

	reg[3:0] state, next_state;
	
	always@(posedge clk)begin
		if(!resetn)
			state <= IDLE;
		else
			state <= next_state;
	end
	
	always@(*)begin
		case(state)
			IDLE : next_state = AFTRSt;
			AFTRSt : next_state = X_MNT;
			X_MNT : next_state = x ? X_1 : X_0;
			X_0 : next_state = x ? X_1 : X_0;
			X_1 : next_state = x ? X_1 : X_10;
			X_10 : next_state = x ? X_101 : X_0;
			X_101 : next_state = y ? G_1 : Y_0;
			Y_0 : next_state = y ? G_1 : G_0;
			G_0 : next_state = G_0;
			G_1 : next_state = G_1;
		endcase
	end
	
	assign f = state == AFTRSt;
	assign g = state == X_101 || state == Y_0 || state == G_1;
endmodule
