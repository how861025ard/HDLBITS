module top_module(
    input d,
    input done_counting,
    input ack,
    input [9:0] state,    // 10-bit one-hot current state
    output B3_next,
    output S_next,
    output S1_next,
    output Count_next,
    output Wait_next,
    output done,
    output counting,
    output shift_ena
); //

    // You may use these parameters to access state bits using e.g., state[B2] instead of state[6].
    parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9;
	
	reg [9:0] next_state;

	always@(*)begin
		next_state[S] = (state[S1] && ~d) || (state[S] && ~d) || (state[S110] && ~d) || (state[Wait] && ack);
        next_state[S1] = (state[S] &&  d);
        next_state[S11] = (state[S1] &&  d) || (state[S11] && d);
        next_state[S110] = (state[S11] && ~d);
        next_state[B0] =(state[S110] && d);
        next_state[B1] = (state[B0]);
        next_state[B2] = (state[B1]);
        next_state[B3] = (state[B2]);
        next_state[Count] = state[B3] || (state[Count] && ~done_counting);
        next_state[Wait] = (state[Count] && done_counting) || (state[Wait] && ~ack);
	end
	
	assign B3_next    = next_state[B3];
    assign S_next     = next_state[S];
    assign S1_next    = next_state[S1];
    assign Count_next = next_state[Count];
    assign Wait_next  = next_state[Wait];
    assign done       = state[Wait] ;
    assign counting   = state[Count];
    assign shift_ena  = state[B0] || state[B1] || state[B2] || state[B3];
endmodule
