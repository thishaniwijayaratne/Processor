module SINGLE_CORE_PROCESSOR(
	input wire [19:0] Instruction,
	input wire [31:0] Data,
	input wire clk,
	
	output reg [5:0] PC_out,
	output reg [11:0] AR_out,
	output wire DRAM_we
);
	
//	REGISTER FILE
	regfile (
					.rpa(RPA), 
					.rpb(RPB), 
					.din(Data_in) ,
					.wp(WPN), 
					.we(Reg_write_en), 
					.clk(clk), 
					.rst(Reg_rst_en), 
					.douta(douta), 
					.doutb(doutb));
	
//	ALU
	ALU ALU_main(
						.A_bus(douta), 
						.B_bus(doutb), 
						.op(op), 
						.C_bus(ALU_out),
						.Z(Z));
	
	
//	Control Unit	
	control Control_Unit(
									.clk(clk), 
									.z(Z), 
									.instruction(IR_out), 
									.alu_en(op), 
									.M1(M1),
									.M2(M2),
									.M3(M3),
									.M4(M4),
									.rpa(RPA),
									.rpb(RPB),
									.wpn(WPN),
									.rst_en(Reg_rst_en),
									.write_en(Reg_write_en),
									.alpha(alpha),
									.gamma(gamma),
									.write_dram(DRAM_we)
								);
								
//	PC Register
	parameter PC_width = 6; 
	
	REGISTER #(.width(PC_width)) PC (
													.din(PC_in),
													.clk(clk),
													.dout(PC_out));
	
//	PC_ALU
//	wire [5:0] PC_ALU_out;
	PC_ALU PC_adder(
							.PC(PC_out),
							.PC_1(PC_ALU_out));
	
//	PC 2->1  MUX	
	mux2to1 M3_mux(
					.dina(gamma),
					.dinb(PC_ALU_out), 
					.s(M3), 
					.dout(PC_in));
	
//	IR
	parameter IR_width = 12;
	REGISTER #(.width(IR_width)) IR (
													.din(Instruction),
													.clk(clk),
													.dout(IR_out));
	
//	AC
	parameter AC_width = 32;
	REGISTER #(.width(IR_width)) AC (
													.din(ALU_out),
													.clk(clk),
													.dout(AC_out));

//	AR 2->1  MUX	
	mux2to1 M4_mux(
					.dina(alpha),
					.dinb(douta), 
					.s(M4), 
					.dout(AR_in));
					
//	AR
	parameter AR_width = 12;
	REGISTER #(.width(IR_width)) AR (
													.din(AR_in),
													.clk(clk),
													.dout(AR_out));
//	DR 2->1  MUX	
	mux2to1 M2_mux(
					.dina(Data),
					.dinb(douta), 
					.s(M2), 
					.dout(DR_in));

//	DR
	parameter DR_width = 32;
	REGISTER #(.width(IR_width)) DR (
													.din(DR_in),
													.clk(clk),
													.dout(DR_out));
													
//	DR 3->1  MUX	
	mux3to1 M1_mux(
						.dina(alpha),
						.dinb(DR_out),
						.dinc(AC_out),
						.s(M1),
						.dout(Data_in));
					
endmodule 