module Top_Level_Module(
	input clk
//	input BEGIN
);

//	Core Wires
	wire [19:0] Instr;
	wire [31:0] Data;
//        reg clk;
	
	wire [5:0] PC_out;
	wire [11:0] AR_out;
	wire DRAM_we;
	wire [31:0] DR_out;
	wire End;

	SINGLE_CORE_PROCESSOR core1(
	
	.Instruction(Instr),	
	.Data(Data),
	.clk(clk),
//	.BEGIN(BEGIN),
	
	.PC_out(PC_out),
	.AR_out(AR_out),
	.DRAM_we(DRAM_we),
	.DR_out(DR_out),
	.End(End)
);

	DRAM DRAM(
			.data(DR_out),
			.addr(AR_out),
			.we(DRAM_we),
			.clk(clk),
			.End(End),
			.q(Data)
);
			
	IRAM IRAM(
			.clk(clk),
			.PC(PC_out),
			.instr_out(Instr));
			
//	initial begin
//		clk=1'b1;
//		forever #100 clk =~clk;
//				
//	end

endmodule 