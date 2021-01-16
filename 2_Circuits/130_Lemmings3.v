module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
	
    parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5;
    reg[2:0] state, next_state;
	
    
    always @(*) begin
        case(state)
            LEFT : next_state = (ground == 0) ? FALL_L : dig ? DIG_L : (bump_left) ? RIGHT : LEFT;
            RIGHT : next_state = (ground == 0) ? FALL_R : dig ? DIG_R : (bump_right) ? LEFT : RIGHT;
            FALL_L : next_state = (ground) ? LEFT : FALL_L;
            FALL_R : next_state = (ground) ? RIGHT : FALL_R;
            DIG_L : next_state = ground ? DIG_L : FALL_L;
            DIG_R : next_state = ground ? DIG_R : FALL_R;
            default : next_state = LEFT; 
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state <= LEFT;
        else state <= next_state;
    end
    
    assign digging = (state == DIG_L || state == DIG_R);  
    assign aaah = (state == FALL_L || state == FALL_R);  
    assign walk_left = (state == LEFT );
    assign walk_right = (state == RIGHT);

endmodul
