module tb;

reg clk=0;
reg reset=0;
reg tx_start =0;
reg baud_tick =0;
reg tx_done=0;
wire load;
wire shift;
wire baud_enable;
wire count_enable;


fsm dut(
 clk,
 reset,

 tx_start,      // Request to start transmission
 baud_tick,     // One-clock pulse from baud generator
 tx_done ,       // One-clock pulse from bit counter

  load,
  shift,

 baud_enable,
 count_enable
);

always #5 clk = ~clk;

task print_status;
begin
    $display("time=%0t state=%0d load=%0b shift=%0b baud=%0b count=%0b",
             $time, dut.ps, load, shift,
             baud_enable, count_enable);
end
endtask

initial begin
    $dumpfile("wave4.vcd");
    $dumpvars;
    
    reset = 1;@(posedge clk);
    reset = 0;@(posedge clk);
    print_status();
end
initial begin
    repeat(6)@(posedge clk);
    tx_start =1;@(posedge clk);
   print_status();
     tx_start =0;@(posedge clk);
     repeat(4)@(posedge clk);
    print_status();
     repeat(2)@(posedge clk);
     
     repeat(10)begin
        baud_tick =1;
         @(posedge clk);
         
         
         @(posedge clk);
         baud_tick =0;
         #1;
         print_status();
     end
     tx_done = 1;
     @(posedge clk);
   print_status();
    tx_done = 0;
     @(posedge clk);
    print_status();
    

      $finish;

     end


endmodule




