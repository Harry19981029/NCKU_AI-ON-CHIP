module MAC (
	input signed [7:0] ifmap,	//input feature map
	input signed [7:0] filter, 
	input signed [23:0] psum,	//partial sum
	output [23:0] updated_psum	//updated partial sum
);
reg signed [16:0] temp;
wire signed [15:0] product;
integer i;

assign product = temp[16:1];
assign updated_psum = product + psum;

always @(*)
begin
	temp = {8'd0, filter, 1'b0};
	for(int i = 0; i < 8; i = i + 1)
	begin
		case(temp[1:0])
			2'b01:
				temp[16:9] = temp[16:9] + ifmap;
			2'b10:
				temp[16:9] = temp[16:9] - ifmap;
			default:
				temp = temp;
		endcase
		temp = temp >> 1;
		temp[16] = temp[15];
	end
	if(ifmap == 8'b10000000)
	begin
		if(filter > 8'b10000000)
			temp = ~temp + 17'd3;
		else if(filter == 8'b10000000)
			temp = ~temp + 17'd2;
		else
			temp = ~temp + 17'd1;
	end
end


endmodule
