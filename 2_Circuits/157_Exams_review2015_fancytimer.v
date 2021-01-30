module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	
	parameter S = 0, S1 = 1, S11 = 2, S110 = 3, B0 = 4, B1 = 5, B2 = 6, B3 = 7, COUNT = 8, WAIT = 9;
	
	reg [3:0] m_count;
	reg [13:0] cnt;//(m_count + 1) * 1000
	reg flag;
	reg[3:0] state, next_state;
	
	always@(posedge clk)begin
		if(reset)
			state <= S;
		else 
			state <= next_state;
	end
	
	always@(*)begin
		case(state)
			S : next_state = data ? S1 : S;
			S1 : next_state = data ? S11 : S;
			S11 : next_state = data ? S11 : S110;
			S110 : next_state = data ? B0 : S;
			B0 : next_state = B1;
			B1 : next_state = B2;
			B2 : next_state = B3;
			B3 : next_state = COUNT;
			COUNT : next_state = cnt == 0 ? WAIT : COUNT;
			WAIT : next_state = ack ? S : WAIT;
		endcase
	end
	
	always@(*)begin
		/*if(reset) m_count <= 0;
		else begin*/
			case(state)
				B0 : m_count[3] <= data;
				B1 : m_count[2] <= data;
				B2 : m_count[1] <= data;
				B3 : m_count[0] <= data;
			endcase
		//end
	end

	always@(posedge clk)begin
		if(reset || state == S)
			flag <= 0;
		else if(state == B3 && !flag)begin
			cnt <= (m_count + 1) * 1000 - 1;
			flag <= 1;
		end
		else if(state == COUNT && flag)
			cnt <= cnt - 1;
	end
	
	assign counting = state == COUNT ? 1 : 0;
	assign done = state == WAIT;
	assign count = cnt / 1000;
	
endmodule
