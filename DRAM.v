module DRAM
(
	input End_core0,
	input End_core1,
	input End_core2,
	input End_core3,


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

	integer outfile, i, Flag = 0; 
	
	always @ (posedge clk)
	begin
	// Read from Text File
		if (!Flag)begin
			$readmemh("../../last.txt",ram,0);
			Flag = 1;
		end
	// Write
		if (we_0)
			ram[addr_0] = dataIn_0;
		if (we_1)
			ram[addr_1] = dataIn_1;
		if (we_2)
			ram[addr_2] = dataIn_2;
		if (we_3)
			ram[addr_3] = dataIn_3;

	// Writing output to text File 
		if (End_core0 && End_core1 && End_core2 && End_core3)begin
		
			outfile = $fopen("../../outMatrix.txt","w");
			$fdisplay(outfile, "%d", ram[3072]);
			$fdisplay(outfile, "%d", ram[3074]);
			for (i = 2048; i<(2048+(ram[3072]*ram[3074])); i = i + 1) begin
				// A = ram[i];
				$fdisplay(outfile, "%d", ram[i]);
			end
			$fclose(outfile);

		end
	end
	
endmodule