module top_module ( );
    reg clk;
    
    dut m_dut(clk);
    
    initial begin
    clk = 0; 
    end
    
    always #5 clk = ~clk;
    
endmodule
