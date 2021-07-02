module IRAM(input clk,
				input [5:0] PC,
				output reg [19:0] instr_out);
				
	reg [19:0] ram [45:0];	//Needs to change
	
	initial begin
		ram [0]  = 32'b00110001000000000000; //write Ax 0000;
		ram [1]  = 32'b00110010010000000000; //write Ay 1024 
		ram [2]  = 32'b00110011100000000000; //write Az 2048 
		
		ram [3]  = 32'b01000100110000000000; //LOADI 3072 Rx
		ram [4]  = 32'b01000101110000000001; //LOADI 3073 Cx
		ram [5]  = 32'b01000110110000000010; //LOADI 3074 Cy
		
		ram [6]  = 32'b01010101011000000000; //MUL Cx Cy
		
		ram [7]  = 32'b01111110000000000000; //MV Sy
		
		ram [8]  = 32'b00101000000000000000; //RST TR2
		ram [9]  = 32'b00101011000000000000; //RST I
		ram [10] = 32'b00101100000000000000; //RST J
		ram [11] = 32'b00101101000000000000; //RST K
		
		ram [12] = 32'b01101001000100000000; //LOAD Vx Ax
		ram [13] = 32'b01101010001000000000; //LOAD Vy Ay
		ram [14] = 32'b01011001101000000000; //MUL Vx Vy
		ram [15] = 32'b01110111000000000000; //MV TR1
		ram [16] = 32'b10000111100000000000; //ADD TR1 TR2
		ram [17] = 32'b01111000000000000000; //MV TR2
		
		ram [18] = 32'b10011101000000000000; //INC K
		ram [19] = 32'b10100101110100000000; //SUB Cx K
		ram [20] = 32'b10111000010000000000; //JMPZ 33
		
		//Jumped..............
		
		ram [21] = 32'b00101101000000000000; //RST K		
		ram [22] = 32'b11011000001100000000; //STORE TR2 Az
		ram [23] = 32'b10010011000000000000; //INC Az
		
		ram [24] = 32'b00101000000000000000; //RST TR2
		ram [25] = 32'b10011100000000000000; //INC J
		ram [26] = 32'b10100110110000000000; //SUB Cy J
		ram [27] = 32'b10111001000000000000; //JUMPZ 36
		
		ram [28] = 32'b00101100000000000000; //RST J
		ram [29] = 32'b10011011000000000000; //INC I	
		ram [30] = 32'b10100100101000000000; //SUB Rx I
		ram [31] = 32'b10111010010000000000; //JUMPZ 41
		ram [32] = 32'b11100000000000000000; //END ?????????????????????????????????????????????????????
		

		ram [33] = 32'b10010001000000000000; //INC Ax
		ram [34] = 32'b10010010000000000000; //INC Ay
		ram [35] = 32'b11000011000000000000; //JMP 12
		
		ram [36] = 32'b10010010000000000000; //INC Ay
		ram [37] = 32'b10010001000000000000; //INC Ax
		ram [38] = 32'b10100001010100000000; //SUB Ax Cx
		ram [39] = 32'b01110001000000000000; //MV Ax
		ram [40] = 32'b11000011000000000000; //JMP 12
		
		
		ram [41] = 32'b10010001000000000000; //INC Ax
		ram [42] = 32'b10010010000000000000; //INC Ay
		ram [43] = 32'b10100010111000000000; //SUB Ay Sy
		ram [44] = 32'b01110010000000000000; //MV Ay
		ram [45] = 32'b11000011000000000000; //JMP 12
	
	end
	
	
	always @(posedge clk)begin
		instr_out = ram[PC];		
		
	end
	

endmodule 