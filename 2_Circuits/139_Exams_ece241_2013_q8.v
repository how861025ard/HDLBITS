module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	
	reg[1:0]state, next_state;
	
	parameter A = 0, B = 1, C = 2;
	
	always@(posedge clk or negedge aresetn)begin
		if(!aresetn)
			state <= A;
		else begin
			state <= next_state; 
		end
	end
	
	always@(*)begin
		z = 0;
		case(state)
			A : next_state = x ? B : A;
			B : next_state = x ? B : C;
            C : begin next_state = x ? B : A; z = x;end
		endcase
	end
	
endmodule
