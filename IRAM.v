module IRAM(
	input clk,
	input [5:0] PC0,
	output [20:0] INS_0,

	input [5:0] PC1,
	output [20:0] INS_1,

	input [5:0] PC2,
	output [20:0] INS_2,

	input [5:0] PC3,
	output [20:0] INS_3
	);
				
	reg [20:0] ram [51:0];	
	
	assign INS_0 = ram[PC0];
	assign INS_1 = ram[PC1];
	assign INS_2 = ram[PC2];
	assign INS_3 = ram[PC3];
	
	initial begin
		ram [0]  = 21'b001100001000000000000;
		ram [1]  = 21'b001100010010000000000;
		ram [2]  = 21'b001100011100000000000;

		ram [3]  = 21'b010000100110000000000;	
		ram [4]  = 21'b010000101110000000001;
		ram [5]  = 21'b010000110110000000010;

		ram [6]  = 21'b010100100001100000000;
		ram [7]  = 21'b011101110000000000000;
		ram [8]  = 21'b001001000000000000000;
		ram [9]  = 21'b001001011000000000000;
		ram [10] = 21'b001001100000000000000;
		ram [11] = 21'b001001101000000000000;
		ram [12] = 21'b001010010000000000000;
		ram [13] = 21'b100010010011110000000;
		ram [14] = 21'b011110010000000000000;
		ram [15] = 21'b100000011100100000000;
		ram [16] = 21'b011100011000000000000;
		ram [17] = 21'b101001110100100000000;
		ram [18] = 21'b101111001100000000000;
		ram [19] = 21'b111010010001100000000;
		ram [20] = 21'b011101011000000000000;
		ram [21] = 21'b111110010001100000000;
		ram [22] = 21'b011101100000000000000;
		ram [23] = 21'b010101011001010000000;
		ram [24] = 21'b011100111000000000000;
		ram [25] = 21'b100000001001110000000;
		ram [26] = 21'b011110000000000000000;
		ram [27] = 21'b010101100001010000000;
		ram [28] = 21'b011100111000000000000;
		ram [29] = 21'b100000010001110000000;
		ram [30] = 21'b011110001000000000000;
		ram [31] = 21'b011001001100000000000;
		ram [32] = 21'b011001010100010000000;
		ram [33] = 21'b010101001010100000000;
		ram [34] = 21'b011100111000000000000;
		ram [35] = 21'b100000111010000000000;
		ram [36] = 21'b011101000000000000000;
		ram [37] = 21'b100101101000000000000;
		ram [38] = 21'b101000101011010000000;
		ram [39] = 21'b101110101100000000000;
		ram [40] = 21'b100110000000000000000;
		ram [41] = 21'b100110001000000000000;
		ram [42] = 21'b110001111100000000000;
		ram [43] = 21'b001001101000000000000;
		ram [44] = 21'b110101000000110000000;
		ram [45] = 21'b001001000000000000000;
		ram [46] = 21'b100010010101000000000;
		ram [47] = 21'b011110010000000000000;
		ram [48] = 21'b100000011101000000000;
		ram [49] = 21'b011100011000000000000;
		ram [50] = 21'b110001000100000000000;
		ram [51] = 21'b000100000000000000000;
	
	end
	

endmodule 