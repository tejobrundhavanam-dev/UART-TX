module tb;

reg clk =0;
reg reset =0;
reg baud_enable = 0;
wire baud_tick ;

 baudgenerator dut(
     baud_tick,
     clk,
     reset,
     baud_enable);

     always #5 clk = ~clk;

initial begin

    $dumpfile("wave2.vcd");
    $dumpvars;

    reset = 1'b1;
    @(posedge clk);

    $display("time=%0t cnt=%0d tick=%b",
          $time,
          dut.baud_cnt,
          baud_tick);
    repeat(4)@(posedge clk);
    reset = 1'b0;
    $display("time=%0t cnt=%0d tick=%b",
          $time,
          dut.baud_cnt,
          baud_tick);
    
end

initial begin
    repeat(10)@(posedge clk);
    baud_enable = 1'b1;
    repeat(436)begin
    @(posedge clk);
    $display("time=%0t cnt=%0d tick=%b",
          $time,
          dut.baud_cnt,
          baud_tick);
    end
     $finish;
end

endmodule

