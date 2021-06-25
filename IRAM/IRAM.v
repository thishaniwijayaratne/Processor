module IRAM(input clk,
				input [6:0] PC,
				output reg [19:0] instr_out);
				
	reg [19:0] ram [49:0];	//Needs to change
	
//	parameter = 

	
	initial begin
		ram [0] = 0011 000000000000 0001; //write 0 0000 Ax;
		ram [1] = 0011 010000000000 0010; //write 1024 Ay
		ram [2] = 0011 100000000000 0011; //write 1024 Az
		
		ram [3] = 0100 110000000000 0100; //LOADI 3072 Rx
		ram [4] = 0100 110000000001 0101; //LOADI 3073 Cx
		ram [5] = 0100 110000000010 0110; //LOADI 3074 Cy
		
		ram [6] = 0101 000000000101 0110; //MUL Cx Cy
		
		ram [7] = 0111 000000000000 1110; //MV Sy
		
		ram [8] = 0010 000000000000 1000; //RST TR2
		
		ram [9] = 0110 000000001001 0001; //LOAD Vx Ax
		ram [10] = 0010 000000000000 1000; //RST TR2
	
	end
	
	
	
	always @(posedge clk)begin
		instr_out = ram[PC];		
		
	end
	

endmodule 