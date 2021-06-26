module DRAM_tb;
	reg [31:0] data;
	reg [11:0] addr;
	reg we;
	reg clk;
	wire [31:0] q ;
	
	DRAM single_port_ram(
		.data(data),
		.addr(addr),
		.we(we),
		.clk(clk),
		.q(q)
	

	);
	
	initial begin
		clk=1'b1;
		forever #50 clk =~clk;
	end

	initial begin
		data = 32'h01;
		addr = 12'd0;
		we = 1'b1;
		#100;

		data = 32'h02;
		addr = 12'd01;
		#100;

		data = 32'h03;
		addr = 12'd02;
		#100;
		
	//read
		addr = 12'd0;
		we = 1'b0;
		#100;
	
		addr = 12'd1;
		#100;

		addr = 12'd2;
		#100;
	end
	
endmodule 