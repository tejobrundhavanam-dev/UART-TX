module tb;


    reg         clk=0;
    reg        reset=0;
    reg       load=0;
    reg        shift=0;
    reg  [7:0] tx_data ;
    wire       serial_out;


 shift_register  UUT(clk,reset,load,shift,tx_data,serial_out);

always #5 clk = ~clk;

initial begin
    $dumpfile("wave1.vcd");
    $dumpvars(0,tb);
end
initial begin 
    tx_data =  8'b10110010;
end
initial begin
     
    reset = 1;
     @(posedge clk);
     reset = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    shift =1;
    repeat(8)begin
        @(posedge clk);
    $display("Time=%0t  serial_out=%b", $time, serial_out);
    $display("----------------------------------");
    end
    shift = 0;
    $display("Loaded Data = %b", tx_data);

    $finish;
end

initial begin
     @(posedge clk);
     @(posedge clk);
    load = 1;
     @(posedge clk);
    load =0;
    $display("Time=%0t  serial_out=%b", $time, serial_out);
    $display("----------------------------------");
$display("Loaded Data = %b", tx_data);
end    
endmodule



