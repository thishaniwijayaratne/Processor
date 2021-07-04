module DRAM
(
	input [31:0] dataIn_0,
	input [11:0] addr_0,
	input we_0, clk,
	output [31:0] dataOut_0,

	input [31:0] dataIn_1,
	input [11:0] addr_1,
	input we_1,
	output [31:0] dataOut_1,

	input [31:0] dataIn_2,
	input [11:0] addr_2,
	input we_2,
	output [31:0] dataOut_2,

	input [31:0] dataIn_3,
	input [11:0] addr_3,
	input we_3,
	output [31:0] dataOut_3
);

	reg [31:0] ram[3074:0];
	
	assign dataOut_0 = ram[addr_0];
	assign dataOut_1 = ram[addr_1];
	assign dataOut_2 = ram[addr_2];
	assign dataOut_3 = ram[addr_3];	

	////////////////////////////////////////////////////////
	//completer ram code here
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	
	always @ (posedge clk)
	begin
	// Write
		if (we_0)
			ram[addr_0] = dataIn_0;
		if (we_1)
			ram[addr_1] = dataIn_1;
		if (we_2)
			ram[addr_2] = dataIn_2;
		if (we_3)
			ram[addr_3] = dataIn_3;
	end
	
endmodule