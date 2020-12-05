module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg[7:0] hh,
    output reg[7:0] mm,
    output reg[7:0] ss); 

    always@(posedge clk)begin
        if(reset)begin
            pm = 0;
            hh = 8'h12;
            mm = 8'h00;
            ss = 8'h00;
        end
        else if(ena && !reset)begin
            ss[3:0] = ss[3:0] + 1;
            if(ss[3:0] == 10)begin
                ss[3:0] = 0;
                ss[7:4] = ss[7:4] + 1;
            end
            if(ss[7:4] == 6)begin
                ss[7:4] = 0;
                mm[3:0] =  mm[3:0] + 1;
            end
            if(mm[3:0] == 10)begin
                mm[3:0] = 0;
                mm[7:4] =  mm[7:4] + 1;
            end
            if(mm[7:4] == 6)begin
                mm[7:4] = 0;
                if(hh[7:4] != 1&& hh[3:0] < 9)begin
                    hh[3:0] = hh[3:0] + 1;
                end
				else if(hh == 8'h09) hh = 8'h10;
                else if(hh[7:4] == 1 && hh[3:0] < 2)begin
                    hh[3:0] = hh[3:0] + 1;
					if(hh == 8'h12) pm = ~pm;
                end
                else begin
					hh = 8'h01;
                end
            end           
        end
        else begin
        	pm = pm;
            hh = hh;
            mm = mm;
            ss = ss;
        end
    end
endmodule
