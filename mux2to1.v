module mux2to1
	#(parameter width = 32)
	(
		dina, 
		dinb, 
		s, 
		dout); // multiplexer, 32 bits

	input [width-1:0] dina, dinb; // inputs, 32 bits
	input s; // input, 1 bit
	output [width-1:0] dout; // output, 32 bits
	
	assign dout = s ? dina : dinb; 

	endmodule