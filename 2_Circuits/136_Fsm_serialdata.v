module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg[7:0] out_byte,
    output done
);

    reg[1:0] state, next_state;
    reg[100:0] count;
	reg flag;//for count reset
    parameter idle = 0, receive = 1, stop = 2;
    
    always@(posedge clk)begin
        if(reset)begin
            state <= idle;
            count <= 0;
        end
        else if(state == receive)begin
            state <= next_state;
        	count <= count + 1;
        end
        else if(state == idle)begin 
            state <= next_state;
        	count <= 0;
        end
        else begin
			if(flag == 1) count <= 0;
            state <= next_state;
		end
    end
    
    always@(*)begin
        case(state)
            idle : begin next_state = (in == 0) ? receive : idle; end
            receive : begin
				flag = 0;
                if(count == 8 && in == 1) next_state = stop;
                else if(count < 8) next_state = receive;
                else if(count > 8 && in == 0) next_state = receive;
                else  begin 
					if(in) next_state = idle;
					else begin
						next_state = receive;
						flag = 1;
					end
				end
            end
            stop : begin 
				if(in) next_state = idle;
				else begin
					next_state = receive;
					flag = 1;
				end
			end
        endcase
    end
    
    always@(posedge clk)begin
		if(reset)begin
            out_byte <= 0;
        end
        else if(state == receive)begin
			if(count < 8)
                out_byte <= {in, out_byte[7:1]};
        end
    end
    
    assign done = (state == stop);
    
endmodule
