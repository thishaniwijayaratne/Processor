module alu(
	A_bus, 
	B_bus, 
	op, 
	C_bus, 
	Z
);

	input [31:0] A_bus;
	input [31:0] B_bus;
	input [2:0] op;
	output reg signed [31:0]  C_bus;
	output reg Z;

	parameter ADD=3'b001, SUB=3'b010, MUL=3'b011, DIV=3'b100, MOD=3'b101;
	
	always@(op or A_bus or B_bus)
	begin
	case (op)
		ADD: begin 
				C_bus = A_bus + B_bus;
				Z = 0;
			end
		SUB: begin
				C_bus = A_bus - B_bus;
				Z = (C_bus > 0) ? 1'b0 : 1'b1;
			end
		MUL: begin
				C_bus = A_bus * B_bus;
				Z = 0;
			end
		DIV: begin
				C_bus = A_bus / B_bus;
				Z = 0;
			end 
		MOD: begin
				C_bus = A_bus % B_bus;
				Z = 0;
			end
		default: begin
				C_bus = A_bus + A_bus;
				Z = 0;
			end
	endcase
	end
endmodule 