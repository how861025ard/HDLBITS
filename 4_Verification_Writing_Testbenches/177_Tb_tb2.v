module top_module();
    reg clk, in;
    reg [2:0] s;
    reg out;
	
	q7 m_q7(clk, in, s, out);
.v
            s = 2;
            in = 1;
        #10 
            s = 7;
            in = 0;
        #10
            s = 0;
            in = 1;
        #30 in = 0;
    end
	
    always #5 clk = ~clk;
    
endmodule
	
