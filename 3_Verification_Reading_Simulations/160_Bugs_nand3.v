module top_module (input a, input b, input c, output out);//
	
    wire m_out;
    andgate inst1 (m_out, a, b, c, 1, 1);
    assign out = ~m_out;
  
endmodule
