module single_port_ram
(
	input [31:0] data,
	input [11:0] addr,
	input we, clk,
	output [31:0] q
);

	reg [31:0] ram[4095:0];
	
	reg [11:0] addr_reg;
	
	always @ (posedge clk)
	begin
	// Write
		if (we)
			ram[addr] <= data;
		else
			addr_reg <= addr;
		
	end
		
	
	assign q = ram[addr_reg];
	
endmodule
