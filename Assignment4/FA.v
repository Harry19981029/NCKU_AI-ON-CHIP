`include "HA.v"
module FA(s, carry_out, x, y, carry_in);
input x, y, carry_in;
output s, carry_out;
wire s1, c1, c2;
HA HA_1(.s(s1), .c(c1), .x(x), .y(y));
HA HA_2(.s(s), .c(c2), .x(carry_in), .y(s1));
or (carry_out, c1, c2);
endmodule

