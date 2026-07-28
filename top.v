module top(
    output serial_out,
    input clk,
    input reset,
    input tx_start,
    input [7:0]tx_data

);

wire load;
wire shift;
wire baud_tick;
wire baud_enable;
wire count_enable;
wire tx_done;

shift_register uut1 (clk,reset,load,shift,tx_data,serial_out);
baudgenerator uut2( baud_tick,clk,reset,baud_enable);
bit_counter uut3(tx_done, clk , reset, count_enable, baud_tick);
fsm uut4(clk,reset, tx_start,baud_tick,tx_done,load,shift, baud_enable,count_enable);

endmodule


