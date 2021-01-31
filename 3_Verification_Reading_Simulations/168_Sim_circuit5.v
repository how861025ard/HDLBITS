module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );


	always@(*)begin
		q = 4'hf;
		case(c)
			4'h 2 : q = a;
			4'h 0 : q = b;
			4'h 3 : q = d;
			4'h 1 : q = e;
        endcase	
	end
	
endmodule
