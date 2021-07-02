module PC_ALU(PC, PC_1);

	input wire [5:0] PC;
	output reg [5:0] PC_1;
		
	always @(PC)begin
		PC_1 = PC + 6'b1;
	end
	
endmodule 