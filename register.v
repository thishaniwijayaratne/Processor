module register (din, clk, rst, we, dout); // a 32-bit register
	input [31:0] din; // input
	input we; // we: enable
	input clk, rst; // clock and reset
	output reg [31:0] dout; // output 
	always @(posedge clk or posedge rst)
		if (rst) dout <= 0; //  if reset
		else if (we) dout <= din; // save d if enabled
endmodule
