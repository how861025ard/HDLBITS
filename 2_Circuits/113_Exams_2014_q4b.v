module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	wire e, l, w;
	wire[3:0]r;
	wire[3:0]q;
	
	assign e = KEY[1];
	assign l = KEY[2];
	assign w = KEY[3];
	assign r = SW;
	assign LEDR = q;
	MUXDFF d0(KEY[0],q[1],SW[0],e,l,q[0]);
	MUXDFF d1(KEY[0],q[2],SW[1],e,l,q[1]);
	MUXDFF d2(KEY[0],q[3],SW[2],e,l,q[2]);
	MUXDFF d3(KEY[0],   w,SW[3],e,l,q[3]);
endmodule

module MUXDFF (    
    input clk,
    input w, r, e, l,
    output reg q
);
	always@(posedge clk)begin
		q <= l? r: (e? w: q);
	end
endmodule
