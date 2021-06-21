module ALU(A_bus,B_bus,op,C_bus,Z);
	input [31:0] A_bus;
	input [31:0] B_bus;
	input [3:0] op;
	output[31:0] C_bus;
	output reg Z=0;
	reg [31:0] C_bus;

	parameter ADD=4'b1010, SUB=4'b1011, MUL=4'b1100;
	
	always@(op or A_bus or B_bus)
	begin
	case (op)
		ADD: begin 
				C_bus=A_bus+B_bus;
				Z=0;
			end
		SUB: begin
				C_bus = A_bus-B_bus;
				Z=(C_bus==32'b0)?1'b1:1'b0;  //conditional expression ? true expression : false expression ;
				// If the result is true, true expression is evaluated
				// If the result is false, false expression is evaluated
			end
		MUL: begin
			C_bus = A_bus*B_bus;
			Z=(C_bus==32'b0)?1'b1:1'b0;
			end
		default: C_bus = A_bus + A_bus ; 
	endcase
	end
endmodule 