module DRAM
(
	input [31:0] data,
	input [11:0] addr,
	input we, clk, End,
	output [31:0] q
);

	reg [31:0] ram[3074:0]; //4095
	
	reg [11:0] addr_reg;
	integer outfile, i, Flag = 0;
	
//	initial 
//		$readmemh("last.txt",ram,0);
//	initial
//		outfile=$fopen("A_write_dec.txt","w");
		//$readmemh("2st_mat_file.txt",ram,1024);
		//$readmemh("3st_mat_file.txt",ram,2048 );
	
	always @ (posedge clk)
	begin
		
	// Write
		if (!Flag)begin
			$readmemh("../../last.txt",ram,0);
			Flag = 1;
		end
		
		else if (we)
			ram[addr] <= data;
		else if (!we)
			addr_reg <= addr;
		
		if (End)begin
			outfile = $fopen("../../outMatrix.txt","w");
			for (i = 0; i<300; i = i + 1) begin
				$fdisplay(outfile, "%d", ram[i]);
			end
			$fclose(outfile);
		end
		
	end
		
	
	assign q = ram[addr_reg];
	
endmodule