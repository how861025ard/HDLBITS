module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire[7:0] a_b_min,c_d_min;
    
    assign a_b_min = a < b ? a : b ;
	assign c_d_min = c < d ? c : d ;
	assign min = a_b_min < c_d_min ? a_b_min : c_d_min ;
endmodule
