module top_module ();
    reg clk, reset, t;
    reg q;
    
    tff m_tff(clk, reset, t, q);
    
    initial begin
        clk = 0;
        reset = 0;
        t = 0;
        #4 reset = 1;
        #8 reset = 0;
        #12 t = 1;
    end
    
    always #2 clk = ~clk;
   
endmodule
