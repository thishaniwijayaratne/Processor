`timescale 1ns/1ns

module regfile_tb;
	reg [31:0] din; // data of write port
	reg [3:0] rpa; // reg # of read port A
	reg [3:0] rpb; // reg # of read port B
	reg [3:0] wp; // reg # of write port
	reg we,rste; // write reset enable
	reg clk;
	wire [31:0] douta;
	wire [31:0] doutb;

	initial begin
		clk = 1'b0;
		forever begin
			#1;
			clk = ~clk;
		end
	end

	regfile r (rpa, rpb, din ,wp, we, clk, rste, douta, doutb);
	initial begin
	@(posedge clk);
        	rpa = 4'd15;
        	rpb = 4'd0;
        	din = 32'h11111111;
        	wp=4'd0;
        	we = 0;
        	rste=1;
	@(posedge clk);
        	rpa = 4'd15;
        	rpb = 4'd0;
        	din = 32'h11111111;
        	wp=4'd0;
        	we = 0;
        	rste=1;
	@(posedge clk);
        	rpa = 4'd15;
        	rpb = 4'd0;
        	din = 32'h11111111;
        	wp=4'd0;
        	we = 0;
        	rste=0;
	 $stop;
	end
	// always #1 clk = ~clk;
endmodule