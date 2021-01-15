module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    reg [2:0] state, next_state;
    parameter S1 = 0, S2 = 1, S3 = 2, S4 = 3, S5 = 4, S6 = 5;

    always @(posedge clk) begin
        if (reset) begin
            state <= S1;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            S1: next_state = s[1] ? S2 : S1;
            S2: next_state = s[2] ? S4 : (s[1] ? S2 : S1);
            S3: next_state = s[2] ? S4 : (s[1] ? S3 : S1);
            S4: next_state = s[3] ? S6 : (s[2] ? S4 : S3);
            S5: next_state = s[3] ? S6 : (s[2] ? S5 : S3);
            S6: next_state = s[3] ? S6 : S5;
            default: next_state = 3'bxxx;
        endcase
    end

    always @(*) begin
        case (state)
            S1: {fr3, fr2, fr1, dfr} = 4'b1111;
            S2: {fr3, fr2, fr1, dfr} = 4'b0110;
            S3: {fr3, fr2, fr1, dfr} = 4'b0111;
            S4: {fr3, fr2, fr1, dfr} = 4'b0010;
            S5: {fr3, fr2, fr1, dfr} = 4'b0011;
            S6: {fr3, fr2, fr1, dfr} = 4'b0000;
            default: {fr3, fr2, fr1, dfr} = 4'bxxxx;
        endcase
    end
endmodule
