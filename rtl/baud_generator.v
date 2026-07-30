module baudgenerator (
    output baud_tick,
    input clk,
    input reset,
    input baud_enable);

    reg [8:0] baud_cnt;

    always @(posedge clk or posedge reset)begin
        if (reset || baud_enable == 0)begin
            baud_cnt  <= 0;
        end
        else if(baud_enable)begin
            if(baud_cnt == 9'd433)begin
                baud_cnt <= 0;
            end
            else
                baud_cnt <= baud_cnt + 1'b1;
        end

        

    end

    assign baud_tick = (baud_cnt == 9'd433);

        

                    
endmodule