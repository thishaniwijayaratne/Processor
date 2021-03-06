module mux2to1 (dina, dinb, s, dout); // multiplexer, 32 bits
	input [31:0] dina, dinb; // inputs, 32 bits
	input s; // input, 1 bit
	output [31:0] dout; // output, 32 bits
	assign dout = s ? dina : dinb; 
endmodule
