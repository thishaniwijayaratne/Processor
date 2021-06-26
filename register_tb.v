`timescale 1ns/1ns
module register_tb;
	reg [31:0] din; // input
	reg we; // we: enable
	reg clk, rst; // clock and reset
	wire [31:0] dout; // output 

	initial begin
		clk = 1'b0;
		forever begin
			#1;
			clk = ~clk;
			end
	end
	register r (din, clk, rst, we, dout);
	initial begin
		@(posedge clk);
		din = 32'hFFFFFFFF;
		we = 1;
		rst = 0;
		@(posedge clk);
		din = 32'hFFFFFFFF;
		we = 0;
		rst = 1;
		#3 $stop;
	end
endmodule