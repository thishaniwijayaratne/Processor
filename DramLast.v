module single_port_ram
(
	input [31:0] data,
	input [11:0] addr,
	input we, clk,
	output [31:0] q
);

	reg [31:0] ram[4095:0];
	
	reg [11:0] addr_reg;

	initial 
		$readmemh("last.txt",ram,0);
		//$readmemh("2st_mat_file.txt",ram,1024);
		//$readmemh("3st_mat_file.txt",ram,2048 );
	
	
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
