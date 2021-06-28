module SINGLE_CORE_PROCESSOR(
	input wire [19:0] Instruction,
	input wire [31:0] Data,
	input wire clk,
	
	output wire [5:0] PC_out,
	output wire [11:0] AR_out,
	output DRAM_we
);
	
//	REGISTER FILE
	regfile (rpa, rpb, din ,wp, we, clk, rst, douta, doutb);
	
//	ALU
	ALU ALU_main(.A_bus(), .B_bus(), .op(), .C_bus(),.Z());
	
	
//	Control Unit
	reg [19:0] IR_in;
	reg [0:0] Z;
	
	control (.clk(clk), .z(), instruction, alu_en, M1,M2,M3,M4,rpa,rpb,wpn,rst_en,write_en,alpha,write_dram);
	
	
//	PC
//	reg [5:0] PC_in;
	parameter PC_width = 6; 
	
	REGISTER #(.width(PC_width)) PC (.din(PC_in),.clk(clk),.dout(PC_out));
	
//	PC_ALU
	wire [5:0] PC_ALU_out;
	
	PC_ALU PC_adder(.PC(PC_out),.PC_1(PC_ALU_out));
	
//	PC MUX
//	reg [5:0] gamma;
//	reg [0:0] M3;
	
	mux2to1 (.dina(gamma),.dinb(PC_ALU_out), .s(M3), .dout(PC_in));
	
	

endmodule 