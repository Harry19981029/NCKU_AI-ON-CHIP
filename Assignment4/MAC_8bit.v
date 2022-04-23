`include "MAC_4bit.v"
`include "HA.v"
`include "FA.v"
module MAC_8bit (
    input   [7:0]   a,
    input   [7:0]   b,
    input   [23:0]  c,
    output  [23:0]  result,
    output          cout
);
wire [3:0] cout_temp;
wire [23:0] cc;
wire [11:0] temp1, temp2, temp3, temp4;
wire [7:0] c1, s1, c2, s2; 
wire [3:0] c3, s3;
MAC_4bit block1(.a(a[3:0]), .b(b[3:0]), .c(12'b0), .result(temp1), .cout(cout_temp[0]));
MAC_4bit block2(.a(a[7:4]), .b(b[3:0]), .c(12'b0), .result(temp2), .cout(cout_temp[1]));
MAC_4bit block3(.a(a[3:0]), .b(b[7:4]), .c(12'b0), .result(temp3), .cout(cout_temp[2]));
MAC_4bit block4(.a(a[7:4]), .b(b[7:4]), .c(12'b0), .result(temp4), .cout(cout_temp[3]));
HA HA_1(.s(s1[0]), .c(c1[0]), .x(temp2[0]), .y(temp3[0]));
FA FA_1(.s(s1[1]), .carry_out(c1[1]), .x(temp2[1]), .y(temp3[1]), .carry_in(c1[0]));
FA FA_2(.s(s1[2]), .carry_out(c1[2]), .x(temp2[2]), .y(temp3[2]), .carry_in(c1[1]));
FA FA_3(.s(s1[3]), .carry_out(c1[3]), .x(temp2[3]), .y(temp3[3]), .carry_in(c1[2]));
FA FA_4(.s(s1[4]), .carry_out(c1[4]), .x(temp2[4]), .y(temp3[4]), .carry_in(c1[3]));
FA FA_5(.s(s1[5]), .carry_out(c1[5]), .x(temp2[5]), .y(temp3[5]), .carry_in(c1[4]));
FA FA_6(.s(s1[6]), .carry_out(c1[6]), .x(temp2[6]), .y(temp3[6]), .carry_in(c1[5]));
FA FA_7(.s(s1[7]), .carry_out(c1[7]), .x(temp2[7]), .y(temp3[7]), .carry_in(c1[6]));
HA HA_2(.s(s2[0]), .c(c2[0]), .x(s1[0]), .y(temp1[4]));
FA FA_8(.s(s2[1]), .carry_out(c2[1]), .x(s1[1]), .y(temp1[5]), .carry_in(c2[0]));
FA FA_9(.s(s2[2]), .carry_out(c2[2]), .x(s1[2]), .y(temp1[6]), .carry_in(c2[1]));
FA FA_10(.s(s2[3]), .carry_out(c2[3]), .x(s1[3]), .y(temp1[7]), .carry_in(c2[2]));
FA FA_11(.s(s2[4]), .carry_out(c2[4]), .x(temp4[0]), .y(s1[4]), .carry_in(c2[3]));
FA FA_12(.s(s2[5]), .carry_out(c2[5]), .x(temp4[1]), .y(s1[5]), .carry_in(c2[4]));
FA FA_13(.s(s2[6]), .carry_out(c2[6]), .x(temp4[2]), .y(s1[6]), .carry_in(c2[5]));
FA FA_14(.s(s2[7]), .carry_out(c2[7]), .x(temp4[3]), .y(s1[7]), .carry_in(c2[6]));
FA FA_15(.s(s3[0]), .carry_out(c3[0]), .x(temp4[4]), .y(c1[7]), .carry_in(c2[7]));
FA FA_16(.s(s3[1]), .carry_out(c3[1]), .x(temp4[5]), .y(1'b0), .carry_in(c3[0]));
FA FA_17(.s(s3[2]), .carry_out(c3[2]), .x(temp4[6]), .y(1'b0), .carry_in(c3[1]));
FA FA_18(.s(s3[3]), .carry_out(c3[3]), .x(temp4[7]), .y(1'b0), .carry_in(c3[2]));
HA HA_3(.s(result[0]), .c(cc[0]), .x(c[0]), .y(temp1[0]));
FA FA_19(.s(result[1]), .carry_out(cc[1]), .x(c[1]), .y(temp1[1]), .carry_in(cc[0]));
FA FA_20(.s(result[2]), .carry_out(cc[2]), .x(c[2]), .y(temp1[2]), .carry_in(cc[1]));
FA FA_21(.s(result[3]), .carry_out(cc[3]), .x(c[3]), .y(temp1[3]), .carry_in(cc[2]));
FA FA_22(.s(result[4]), .carry_out(cc[4]), .x(c[4]), .y(s2[0]), .carry_in(cc[3]));
FA FA_23(.s(result[5]), .carry_out(cc[5]), .x(c[5]), .y(s2[1]), .carry_in(cc[4]));
FA FA_24(.s(result[6]), .carry_out(cc[6]), .x(c[6]), .y(s2[2]), .carry_in(cc[5]));
FA FA_25(.s(result[7]), .carry_out(cc[7]), .x(c[7]), .y(s2[3]), .carry_in(cc[6]));
FA FA_26(.s(result[8]), .carry_out(cc[8]), .x(c[8]), .y(s2[4]), .carry_in(cc[7]));
FA FA_27(.s(result[9]), .carry_out(cc[9]), .x(c[9]), .y(s2[5]), .carry_in(cc[8]));
FA FA_28(.s(result[10]), .carry_out(cc[10]), .x(c[10]), .y(s2[6]), .carry_in(cc[9]));
FA FA_29(.s(result[11]), .carry_out(cc[11]), .x(c[11]), .y(s2[7]), .carry_in(cc[10]));
FA FA_30(.s(result[12]), .carry_out(cc[12]), .x(c[12]), .y(s3[0]), .carry_in(cc[11]));
FA FA_31(.s(result[13]), .carry_out(cc[13]), .x(c[13]), .y(s3[1]), .carry_in(cc[12]));
FA FA_32(.s(result[14]), .carry_out(cc[14]), .x(c[14]), .y(s3[2]), .carry_in(cc[13]));
FA FA_33(.s(result[15]), .carry_out(cc[15]), .x(c[15]), .y(s3[3]), .carry_in(cc[14]));
FA FA_34(.s(result[16]), .carry_out(cc[16]), .x(c[16]), .y(1'b0), .carry_in(cc[15]));
FA FA_35(.s(result[17]), .carry_out(cc[17]), .x(c[17]), .y(1'b0), .carry_in(cc[16]));
FA FA_36(.s(result[18]), .carry_out(cc[18]), .x(c[18]), .y(1'b0), .carry_in(cc[17]));
FA FA_37(.s(result[19]), .carry_out(cc[19]), .x(c[19]), .y(1'b0), .carry_in(cc[18]));
FA FA_38(.s(result[20]), .carry_out(cc[20]), .x(c[20]), .y(1'b0), .carry_in(cc[19]));
FA FA_39(.s(result[21]), .carry_out(cc[21]), .x(c[21]), .y(1'b0), .carry_in(cc[20]));
FA FA_40(.s(result[22]), .carry_out(cc[22]), .x(c[22]), .y(1'b0), .carry_in(cc[21]));
FA FA_41(.s(result[23]), .carry_out(cout), .x(c[23]), .y(1'b0), .carry_in(cc[22]));
endmodule