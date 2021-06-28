module REGISTER 
	#(parameter width = 32)
	(
		input [width-1:0] din, // input
		input clk,
		output reg [width-1:0] dout // output 
	);
	
	reg [width-1:0] space;
	
	always @(posedge clk) begin
		space <= din;
	end
	
	assign dout = space;
		
endmodule

//module REGISTER
//	(din, clk, rst, dout); // a 32-bit register
//	input [width-1:0] din; // input
//	input we; // we: enable
//	input clk, rst; // clock and reset
//	output reg [width-1:0] dout; // output 
	
//	always @((posedge clk) or (posedge rst)) begin
//		
////		if (rst) 
////			dout <= 0; //  if reset
////			
////		else if (we) 
////			dout <= din; // save d if enabled
//	end
//endmodule