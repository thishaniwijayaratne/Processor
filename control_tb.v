`timescale 1ns/1ns
module control_tb;
	reg [35:0] instruction; 
	reg z; 
	reg clk; 
	wire [1:0] alu_en; 
        wire [1:0] M1;
        wire M2;
        wire [1:0] M3;
        wire M4;
        wire [4:0]rpa;
        wire [4:0]rpb;
        wire [4:0]wpn;
        wire rst_en;
        wire write_en;

	initial begin
		clk = 1'b0;
		forever begin
			#1;
			clk = ~clk;
			end
	end
	control r (clk, z, instruction, alu_en, M1,M2,M3,M4,rpa,rpb,wpn,rst_en,write_en);
	initial begin
		@(posedge clk);
		instruction = 36'b000000000000000000000000000000000100;
		z= 0;
		@(posedge clk);
		instruction = 36'b000000000000000000000000000000000100;
		z= 0;
	        @(posedge clk);
		instruction = 36'b000000000000000000000000000000000100;
		z= 0;   
                @(posedge clk);
		instruction = 36'b000000000000000000000000000000000010;
		z= 0;
                @(posedge clk);
		instruction = 36'b000000000000000000000000000000000010;
		z= 0;
                @(posedge clk);
		instruction = 36'b000000000000000000000000000000000010;
		z= 0;
                @(posedge clk);
		instruction = 36'b000000000000000000000000000000000010;
		z= 0;
                @(posedge clk);
		instruction = 36'b000000000000000000000000000000001000;
		z= 0;
     
		
		#15 $stop;
	end
endmodule
