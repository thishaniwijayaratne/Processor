module SINGLE_CORE_PROCESSOR(
	input wire [19:0] Instruction,
	input wire [31:0] Data,
	input wire clk,
	
	output wire [5:0] PC_out,
	output wire [11:0] AR_out,
	output DRAM_we
);
	
//	Control Unit
	reg [19:0] IR_in;
	reg [0:0] Z;
	
	
//	PC
	reg [5:0] PC_in;
//	wire [5:0] PC_out;
	parameter PC_width = 6; 
	
	REGISTER #(.width(PC_width)) PC (.din(PC_in),.clk(clk),.dout(PC_out));
	
	
	
	
	

endmodule 