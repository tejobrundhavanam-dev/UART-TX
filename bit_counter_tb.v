module tb;

    reg clk =0;
    reg reset =0;
    reg count_enable =0;
    reg baud_tick = 0;
    wire tx_done;


bit_counter  DUT(
     tx_done,
     clk ,
     reset,
     count_enable,
     baud_tick
);

    always #5 clk = ~clk;

    initial begin
    $dumpfile("wave3.vcd");
    $dumpvars;
end

    initial begin

        
        reset = 1 ;@(posedge clk);
        
        $display("time = %0t  |  count_enable = %0b   |  bit_count = %0b  | tx_done = %0b",
         $time,count_enable,DUT.bit_cnt,tx_done);
         reset = 0 ;@(posedge clk);
    end 
    initial begin
        repeat(5) begin
            @(posedge clk);
        end

         count_enable = 1;
         



         repeat(9)begin 
            baud_tick = 1;
            @(posedge clk);
            baud_tick = 0;
            $display("time = %0t  |  count_enable = %0b   |  bit_count = %0b  | tx_done = %0b",
         $time,count_enable,DUT.bit_cnt,tx_done); 

            

    end
    $finish;
    end

    endmodule

