module regfile 
	(
		rpa, 
		rpb, 
		din ,
		wp, 
		we, 
		clk, 
		rst, 
		douta, 
		doutb); // 32x32 regfile
	
	input [31:0] din; // data of write port
	input [3:0] rpa; // reg # of read port A
	input [3:0] rpb; // reg # of read port B
	input [3:0] wp; // reg # of write port
	input we,rst; // write / reset enable
	input clk; // clock
	output [31:0] douta, doutb; // read ports A and B
	reg [31:0] register [0:15]; // 16 32-bit registers
	
	assign register[15] =  32'd1;
	assign douta = (rpa == 0)? 0 : register[rpa]; // read port A
	assign doutb = (rpb == 0)? 0 : register[rpb]; // read port B
	
	always @(posedge clk && (wp!=0)) // write port
		if (rst)
			register[wp] <= 32'd0; // reset
		else if (we) // not reg[0] & enabled
			register[wp] <= din; // write d to reg[wn]
endmodule
