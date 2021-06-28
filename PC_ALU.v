module PC_ALU(PC, PC_1);
	input wire [11:0] PC;
	output reg [11:0] PC_1;
	
	
	always @(PC)begin
		PC_1 = PC + 12'b1;
	end
endmodule 