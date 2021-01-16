module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    reg[1:0] state, next_state;
    parameter BYTE1 = 0, BYTE2 = 1, BYTE3 = 2, DONE = 3; 
    
    // State transition logic (combinational)
    always@(*)begin
        case(state)
            BYTE1 : next_state = in[3] ? BYTE2 : BYTE1;
            BYTE2 : next_state = BYTE3;
            BYTE3 : next_state = DONE;
            DONE : next_state = in[3] ? BYTE2 : BYTE1;
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk)begin
        if(reset)
            state <= BYTE1;
        else
            state <= next_state;
    end
    // Output logic
    assign done = state == DONE;
    
    // New: Datapath to store incoming bytes.
    always@(posedge clk)begin
        case(state)
            BYTE1 : out_bytes[23:16]<=in;
            BYTE2 : out_bytes[15: 8]<=in;
            BYTE3 : out_bytes[ 7: 0]<=in;
            DONE : out_bytes[23:16]<=in;
        endcase
    end
endmodule
