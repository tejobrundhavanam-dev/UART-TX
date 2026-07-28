module shift_register (
    input        clk,
    input        reset,
    input        load,
    input        shift,
    input  [7:0] tx_data,
    output       serial_out
);

    reg [7:0] shift_reg;

    assign serial_out = shift_reg[0];

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 8'b0;
        else if (load)
            shift_reg <= tx_data;
        else if (shift)
            shift_reg <= {1'b0, shift_reg[7:1]};
    end

endmodule