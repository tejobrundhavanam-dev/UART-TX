module tb;

wire serial_out;
reg clk =0;
reg reset =0;
reg tx_start=0;
reg [7:0] tx_data =8'b1011_0100;


top uut(serial_out,clk,reset,tx_start,tx_data);

always #5 clk = ~clk;

initial begin
    $dumpfile("topwave.vcd");
    $dumpvars;
end
task print;
begin
    $display(" time = %0t | serial_out = %0b",$time,serial_out);
end
endtask


initial begin
    
    reset = 1;
    @(posedge clk);
    print();
    reset = 0;
    @(posedge clk);
    print();
end

initial begin 
    repeat(5) @(posedge clk);
    tx_start = 1;
    @(posedge clk);
    tx_start=0;
    repeat(9)begin
        repeat(434)begin
        @(posedge clk);end 
        print();
    end
    $finish;
end

endmodule




