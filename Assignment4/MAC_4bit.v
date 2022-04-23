`include "HA.v"
`include "FA.v"
module MAC_4bit (
    input   [3:0]   a,
    input   [3:0]   b,
    input   [11:0]  c,
    output  [11:0]  result,
    output          cout
);
wire [3:0] temp1, temp2, temp3, temp4;
wire c11, c12, c13, c21, c22, c23, c31, c32, c33, c41, c42, c43;
wire out11, out12, out13, out21, out22, out23, out31, out32, out33, out41, out42, out43;
wire [10:0]cc;
wire [7:0] mul;
assign temp1[0] = a[0] && b[0];
assign temp1[1] = a[1] && b[0];
assign temp1[2] = a[2] && b[0];
assign temp1[3] = a[3] && b[0];
assign temp2[0] = a[0] && b[1];
assign temp2[1] = a[1] && b[1];
assign temp2[2] = a[2] && b[1];
assign temp2[3] = a[3] && b[1];
assign temp3[0] = a[0] && b[2];
assign temp3[1] = a[1] && b[2];
assign temp3[2] = a[2] && b[2];
assign temp3[3] = a[3] && b[2];
assign temp4[0] = a[0] && b[3];
assign temp4[1] = a[1] && b[3];
assign temp4[2] = a[2] && b[3];
assign temp4[3] = a[3] && b[3];
HA HA_1(.s(out11), .c(c11), .x(temp1[1]), .y(temp2[0]));
HA HA_2(.s(out12), .c(c12), .x(temp1[2]), .y(temp2[1]));
HA HA_3(.s(out13), .c(c13), .x(temp1[3]), .y(temp2[2]));
FA FA_1(.s(out21), .carry_out(c21), .x(out12), .y(temp3[0]), .carry_in(c11));
FA FA_2(.s(out22), .carry_out(c22), .x(out13), .y(temp3[1]), .carry_in(c12));
FA FA_3(.s(out23), .carry_out(c23), .x(temp2[3]), .y(temp3[2]), .carry_in(c13));
FA FA_4(.s(out31), .carry_out(c31), .x(out22), .y(temp4[0]), .carry_in(c21));
FA FA_5(.s(out32), .carry_out(c32), .x(out23), .y(temp4[1]), .carry_in(c22));
FA FA_6(.s(out33), .carry_out(c33), .x(temp3[3]), .y(temp4[2]), .carry_in(c23));
FA FA_7(.s(out41), .carry_out(c41), .x(out32), .y(1'b0), .carry_in(c31));
FA FA_8(.s(out42), .carry_out(c42), .x(out33), .y(c41), .carry_in(c32));
FA FA_9(.s(out43), .carry_out(c43), .x(temp4[3]), .y(c42), .carry_in(c33));
assign mul[7] = c43;
assign mul[6] = out43;
assign mul[5] = out42;
assign mul[4] = out41;
assign mul[3] = out31;
assign mul[2] = out21;
assign mul[1] = out11;
assign mul[0] = temp1[0];
HA HA_4(.s(result[0]), .c(cc[0]), .x(c[0]), .y(mul[0]));
FA FA_10(.s(result[1]), .carry_out(cc[1]), .x(c[1]), .y(mul[1]), .carry_in(cc[0]));
FA FA_11(.s(result[2]), .carry_out(cc[2]), .x(c[2]), .y(mul[2]), .carry_in(cc[1]));
FA FA_12(.s(result[3]), .carry_out(cc[3]), .x(c[3]), .y(mul[3]), .carry_in(cc[2]));
FA FA_13(.s(result[4]), .carry_out(cc[4]), .x(c[4]), .y(mul[4]), .carry_in(cc[3]));
FA FA_14(.s(result[5]), .carry_out(cc[5]), .x(c[5]), .y(mul[5]), .carry_in(cc[4]));
FA FA_15(.s(result[6]), .carry_out(cc[6]), .x(c[6]), .y(mul[6]), .carry_in(cc[5]));
FA FA_16(.s(result[7]), .carry_out(cc[7]), .x(c[7]), .y(mul[7]), .carry_in(cc[6]));
FA FA_17(.s(result[8]), .carry_out(cc[8]), .x(c[8]), .y(1'b0), .carry_in(cc[7]));
FA FA_18(.s(result[9]), .carry_out(cc[9]), .x(c[9]), .y(1'b0), .carry_in(cc[8]));
FA FA_19(.s(result[10]), .carry_out(cc[10]), .x(c[10]), .y(1'b0), .carry_in(cc[9]));
FA FA_20(.s(result[11]), .carry_out(cout), .x(c[11]), .y(1'b0), .carry_in(cc[10]));
endmodule