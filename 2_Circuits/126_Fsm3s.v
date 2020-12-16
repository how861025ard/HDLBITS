module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    parameter A = 0, B = 1, C = 2, D = 3;
    
    reg[1:0] state,next_state;
    
    always@(posedge clk)begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    always@(*)begin
        case({state,in})
            {A, 1'b0} : next_state = A;
            {A, 1'b1} : next_state = B;
            {B, 1'b0} : next_state = C;
            {B, 1'b1} : next_state = B;
            {C, 1'b0} : next_state = A;
            {C, 1'b1} : next_state = D;
            {D, 1'b0} : next_state = C;
            {D, 1'b1} : next_state = B;
        endcase
    end
		
    assign out = state == D;
    
endmodule

