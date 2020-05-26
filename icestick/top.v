
module top(
  input clock_12mhz,
  output led_green
  );

reg[24:0] counter;
initial counter = 0;

always @(posedge clock_12mhz)
begin
    counter = counter + 1;
end

assign led_green = counter[23];

endmodule
