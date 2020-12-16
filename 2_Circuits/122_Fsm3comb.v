module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;
	
    always@(*)begin
        case({state, in})
            {A, 1'b0} : begin next_state = A; out = 0; end
            {A, 1'b1} : begin next_state = B; out = 0; end
            {B, 1'b0} : begin next_state = C; out = 0; end
            {B, 1'b1} : begin next_state = B; out = 0; end
            {C, 1'b0} : begin next_state = A; out = 0; end
            {C, 1'b1} : begin next_state = D; out = 0; end
            {D, 1'b0} : begin next_state = C; out = 1; end
            {D, 1'b1} : begin next_state = B; out = 1; end
        endcase
    end
endmodule
