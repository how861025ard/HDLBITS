module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    wire a,b;
    
    assign a = mode & too_cold;
    assign b = ~mode & too_hot;
    assign heater = mode & too_cold;
    assign aircon = ~mode & too_hot;
    assign fan = a|b|fan_on;
endmodule
