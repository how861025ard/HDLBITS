module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    always@(*)begin
        if(clock == 1)
            p = a;
        else
            q = p;
    end

endmodule
