module top(
  input clock_12mhz,
  output reg[7:0] led
  );

localparam overflow = 1000000/2;

reg[$clog2(overflow)+1:0] counter;
initial counter <= 0;
reg clock_12hz;
initial clock_12hz <= 0;

always @(posedge clock_12mhz)
begin
    counter <= counter + 1;
    if (counter == overflow)
    begin
        counter <= 0;
        clock_12hz <= ~clock_12hz;
    end
end

always @(posedge clock_12hz)
begin
    led <= led + 1;
end

endmodule
