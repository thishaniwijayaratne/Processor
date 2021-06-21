`timescale 1ns / 1ps 

module ALU_test();
//Inputs
 reg[31:0] A_bus,B_bus;
 reg[3:0] op;

//Outputs
 wire[31:0] C_bus;
 wire Z;
 // Verilog code for ALU
 integer i;
 ALU test_ALU_1(
            .A_bus(A_bus),
				.B_bus(B_bus),  // ALU 8-bit Inputs                 
            .op(op),// ALU Selection
            .C_bus(C_bus), // ALU 8-bit Output
            .Z(Z)// Carry Out Flag
     );
	  
	 
    initial begin
    // hold reset state for 100 ns.
      A_bus = 32'b1011;
      B_bus = 32'b1000;
      op = 4'b1100;
		
		#10;
      
//      for (i=0;i<=31;i=i+1) begin
//			op = op + 4'b1;
//			#10;
//		 end;
      
      A_bus = 32'b1011;
      B_bus = 32'b1000;
      op = 4'b1011;
		#10;
		
		A_bus = 32'b1011;
      B_bus = 32'b1000;
      op = 4'b1010;
      #10;
		
		$finish;
		
    end
endmodule 