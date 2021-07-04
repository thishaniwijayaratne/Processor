module regfile (
		rpa, 
		rpb, 
		din,
		wp, 
		we, 
		clk, 
		douta, 
		doutb,
		coreID
); 
	
	input [31:0] din; // data of write port
	input [4:0] rpa; // reg # of read port A
	input [4:0] rpb; // reg # of read port B
	input [4:0] wp; // reg # of write port
	input [2:0] coreID;
	input we; 
	input clk; // clock
	output [31:0] douta, doutb; // read ports A and B
	reg [31:0] register [20:1]; // 20 32-bit registers
	
	
	assign douta = (rpa <= 0)? 0 : register[rpa]; // read port A
	assign doutb = (rpb <= 0)? 0 : register[rpb]; // read port B
	
	initial begin
		register[19] <= 32'd1;
		register[20] <= 32'd4;  
	end

	always @(posedge clk) begin // write port
		register[15] <= {29'b0, coreID};	
		if (wp) begin 
			if (we) register[wp] <= din;
			else register[wp] <= 32'd0;
		end 
	end
endmodule
