`include "MAC.v"

module MAC_tb;
    reg signed [7:0]   a;
    reg signed [7:0]   b;
    reg signed [23:0]  c;
    wire [23:0] result;
	
    
	MAC MAC0(
        .ifmap(a),
        .filter(b),
        .psum(c),
        .updated_psum(result)
    );
  
	
	reg signed [23:0] answer;
	reg signed [23:0]  test_c[5] = {{24{1'b1}}, 24'b0, 24'b0101_0101_0101_0101_0101_0101, 24'b1010_1010_1010_1010_1010_1010, 24'b0011_0011_0011_0011_0011_0011};


    integer i, j, k;
    integer err;
    
    initial begin
		`ifdef FSDB
			$fsdbDumpfile("MAC.fsdb");
			$fsdbDumpvars("+struct", "+mda", MAC0);
		`endif
		
        err = 0;
        //result = $signed(acc);
        for (i = 8'b0; i <= 8'b1111_1111; i = i+1) begin
            for (j = 8'b0; j <= 8'b1111_1111; j = j+1) begin
				for (k = 8'd0; k <= 8'd4; k = k+1) begin
					a = i;
					b = j;
					c = test_c[k]; 
					//c = 16'd0;
					answer = a * b + c;
					#100
					if ($isunknown(result) == 1'd1)begin
						$display("Your result:%d*%d+%d is unknown",a,b,c);
						err = err + 1;
					end else if(answer != result) begin
						$display("Error      :%d*%d+%d=%d", a, b, c, answer);
						$display("Your result:%d*%d+%d=%d", a, b, c, $signed(result));
						err = err + 1;
					end else begin
						err = err;
					end
				end
            end
        end
        if(err > 0)begin
			$display("****************************               sad  GIRAFFE   ");
			$display("****************************                 __     *  	  ");
			$display("**                        **                 \\ \\____|___	  ");
			$display("**                        **                  \\    Q    \\   ");
			$display("**                        **                   |     __  )  ");
			$display("**   OOOOOOOOOOOOOPS!     **                   |     ___/   ");
			$display("**   Oh! NOOOOOOOOOO!     **                   |    | 	     ");
			$display("**   OOOOOOOOOOOOOPS!     **                   |_   |       ");
			$display("**                        **                   |_)  |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |   _|       ");
			$display("**                        **                   |  (_|       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |_   |       ");
			$display("**                        **                   |_)  |       ");
			$display("**                        **                   |    |       ");
			$display("** Simulation Failed!!    **                   |    |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |   _|       ");
			$display("**                        **                   |  (_|       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |   _|       ");
			$display("**                        **                   |  (_|       ");
			$display("**                        **           _______ |    |       ");
			$display("****************************          /             |       ");
			$display("****************************        ./_       __    |       ");
			$display("                                   /|__)     /  \\   |       ");
			$display("                                  / |        \\__/   |       ");
			$display("                              /\\ /  |    ______     |       ");
			$display("                             /__\\   |   |       |   |       ");
			$display("                                    |   |       |   |       ");
			$display("                                    |___|       |___|       ");
			$display("                                    |___|       |___|       ");
			$display("Totally has %d errors", err);
        end 
        else begin
			$display("%c[1;33m",27);
			$display("****************************               HAPPY  GIRAFFE   ");
			$display("****************************                 __     *  	  ");
			$display("**                        **                 \\ \\____|___	  ");
			$display("**                        **                  \\    ^    \\   ");
			$display("**                        **                   |         )  ");
			$display("**   UUUUU~ HOOOOOOO~     **                   |     ___/   ");
			$display("**   CONGRATULATIONS!     **                   |    | 	     ");
			$display("**   UUUUU~ HOOOOOOO~     **                   |_   |       ");
			$display("**                        **                   |_)  |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |   _|       ");
			$display("**                        **                   |  (_|       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |_   |       ");
			$display("**                        **                   |_)  |       ");
			$display("**                        **                   |    |       ");
			$display("**   Simulation PASS!!    **                   |    |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |   _|       ");
			$display("**                        **                   |  (_|       ");
			$display("**                        **                   |    |       ");
			$display("**                        **                   |    |       ");
			$display("**                        **  __               |   _|       ");
			$display("**                        ** \\  /              |  (_|       ");
			$display("**                        **  \\/\\      _______ |    |       ");
			$display("****************************     \\   /              |       ");
			$display("****************************      \\./_        __    |       ");
			$display("                                   |__)      /  \\   |       ");
			$display("                                   |         \\__/   |       ");
			$display("                                   |     ______     |       ");
			$display("                                   |   |        |   |       ");
			$display("                                   |   |        |   |       ");
			$display("                                   |___|        |___|       ");
			$display("                                   |___|        |___|       ");
			$display("Totally has %d errors", err);
			$write("%c[0m",27);
        end
    end

endmodule

