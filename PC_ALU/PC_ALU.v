module PC_ALU(PC, PC_4);
	input wire [11:0] PC;
	output reg [11:0] PC_4;
	
	
	always @(PC)begin
		PC_4 = PC + 12'b100;
	end
endmodule 