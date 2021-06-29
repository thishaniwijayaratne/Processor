module processor_tb();

    reg [19:0] Instruction;
	reg [31:0] Data;
	reg clk;
	wire [5:0] PC_out;
	wire [11:0] AR_out;
	wire DRAM_we;
	wire [31:0] DR_out;
	
	SINGLE_CORE_PROCESSOR Single_Core_Processor(
                    .Instruction(Instruction),
	                .Data(Data),
	                .clk(clk),
                    .PC_out(PC_out),
	                .AR_out(AR_out),
	                .DRAM_we(DRAM_we),
	                .DR_out(DR_out)
);
	
	initial begin
		clk=1'b1;
		forever #100 clk =~clk;
	end

	initial begin
		Instruction = 20'b00110001000000000000;
	    Data = 32'b0;	
		#100;

		Instruction = 20'b00110010010000000000;
	    Data = 32'b1100;	
		#100;

		Instruction = 20'b00110011100000000000;
	    Data = 32'b10100;	
		#100;
		
		Instruction = 20'b01000100110000000000;
	    Data = 32'b11001;	
		#100;
	
		Instruction = 20'b01000101110000000001;
	    Data = 32'b1001011;
		#100;

		Instruction = 20'b01000110110000000010;
	    Data = 32'b1000101;
		#100;
	end
	
endmodule 