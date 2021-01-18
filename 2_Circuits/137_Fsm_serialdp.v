module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg[7:0] out_byte,
    output done
); //

    parameter IDLE = 0, DATA = 1, CHECK = 2, STOP = 3, ERROR = 4;
    
    reg[2:0] state, next_state;
    reg[3:0] count;
    reg check;
    wire odd;
	 reg p_reset;
    
    parity m_parity(
        .clk(clk),
        .reset(reset | p_reset),
        .in(in),
        .odd(odd));    
    
    always@(*)begin
        p_reset = 0;
        case(state)
            IDLE:begin 
				next_state = in ? IDLE : DATA; 
				p_reset=1; 
			end
            DATA:
				next_state = (count==8) ? CHECK : DATA;
            CHECK:
				next_state = in ? STOP : ERROR;
            STOP:begin 
				next_state = in ? IDLE : DATA; 
				p_reset=1; 
			end
            ERROR:
				next_state = in ? IDLE : ERROR;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    always@(posedge clk)begin
        if(reset)
            count <= 0;
        else
            case(state)
                DATA:
					count <= count+1;
                default:
					count <= 0;
            endcase
    end
    
    always@(posedge clk)begin
        if(reset)
            out_byte <= 0;
        else
            case(next_state)
                DATA:out_byte <= {in,out_byte[7:1]};
            endcase
    end
    
    always@(posedge clk)begin
        if(reset)
            check <= 0;
        else
            check <= odd;
    end

    assign done = check & (state == STOP);
                
endmodule
