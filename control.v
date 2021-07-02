module control(clk, z, instruction, alu_en, M1,M2,M3,M4,rpa,rpb,wpn,rst_en,write_en,alpha,gamma,write_dram,End);

input clk;
input z;
input [19:0] instruction;  //instruction lenght to be decided
output reg [1:0] alu_en;
output reg [1:0] M1;
output reg M2;
output reg M3;
output reg M4;
output reg [3:0]rpa;
output reg [3:0]rpb;
output reg [3:0]wpn;
output reg rst_en;
output reg write_en;
output reg [5:0] gamma;
output reg [11:0] alpha;
output reg write_dram;
output reg End = 0;


integer present = 5'd20;


parameter present0 = 5'd0;
parameter fetch1 = 5'd1;
parameter fetch2 = 5'd2;
parameter rst    = 5'd3;
parameter loadI1 = 5'd4;
parameter loadI2 = 5'd5;
parameter loadI3 = 5'd6;
parameter mul    = 5'd7;
parameter add    = 5'd8;
parameter sub    = 5'd9;
parameter jmpz   = 5'd10;
parameter jmp    = 5'd11;
parameter store1 = 5'd12;
parameter store2 = 5'd13;
parameter inc1   = 5'd14;
parameter inc2   = 5'd15;
parameter load1  = 5'd16;
parameter load2  = 5'd17;
parameter load3  = 5'd18;
parameter mv     = 5'd19;
parameter write  = 5'd20;
parameter next_instruction = 5'd30;
parameter End1 = 5'd21;

integer checks = 0 ;


initial begin
	gamma = 6'b0;
	M3 = 1'b1;
	write_en = 1'b0;

end 



always @(posedge clk)begin
//present <=next;



if(present == next_instruction)begin
if(instruction[19:16] == 4'b0010) 
           present = rst;        
else if(instruction[19:16] == 4'b0011)
           present = write; 
else if(instruction[19:16] == 4'b0100)
           present = loadI1;
else if(instruction[19:16] == 4'b0101)
           present = mul;
else if(instruction[19:16] == 4'b0110)
           present = load1;
else if(instruction[19:16] == 4'b0111)
           present = mv;
else if(instruction[19:16] == 4'b1000)
           present = add;
else if(instruction[19:16] == 4'b1001)
           present = inc1;
else if(instruction[19:16] == 4'b1010)
           present = sub;
else if(instruction[19:16] == 4'b1011)
           present = jmpz;
else if(instruction[19:16] == 4'b1100)
           present = jmp;
else if(instruction[19:16] == 4'b1101)
           present = store1;
else if(instruction[19:16] == 4'b1110)
           present = End1;
else
           present = present0;

end




case(present)

fetch1 : begin
//instruction register write_en
present = fetch2;
end

fetch2 : begin
M3 = 1'b0;
present=next_instruction;
end


rst : begin
rst_en = 1  ;
wpn <= instruction[15:12];
present = fetch1;
end

write : begin
write_en <= 1;
wpn <= instruction[15:12];
alpha <= instruction[11:0];
M1 <= 2'b10;
present = fetch1;
end

loadI1 : begin
alpha <= instruction[11:0];
M4 = 1'b0;
present = loadI2;
end

loadI2 :begin
M2 = 1'b1;
present = loadI3;
end


loadI3 :begin
M1 = 2'b01;
write_en = 1;
wpn = instruction[15:12];
present = fetch1;
end

mul :begin
alu_en <= 2'b11;
rpa <= instruction[15:12];
rpb <= instruction[11:8];
present = fetch1;
end

add :begin
alu_en <= 2'b01;
rpa <= instruction[15:12];
rpb <= instruction[11:8];
present = fetch1;
end

sub :begin
alu_en <= 2'b10;
rpa <= instruction[15:12];
rpb <= instruction[11:8];
present = fetch1;
end

jmpz : begin
if(z==0)begin
     gamma <= instruction[15:10];
     M3 <= 1'b1;
end
present = fetch1;
end

jmp :begin
gamma <= instruction[15:10];
M3<=1'b1;
present =fetch1;
end

store1 : begin
M4 <= 1'b1;
rpa <= instruction[11:8];
present =store2;
end

store2 : begin
rpb <= instruction[15:12];
M2 <= 1'b0;
write_dram <= 1;
present = fetch1;
end

inc1 : begin
rpa <=instruction[15:12];
rpb <=4'b1111;
alu_en <= 2'b01;
present = inc2;
end

inc2 : begin
M1 <=2'b11;
wpn <= instruction[15:12];
write_en <=1;
present = fetch1;
end

load1 : begin
M4 <=1;
rpa <= instruction[11:8];
present = load2;
end

load2 : begin
M2 <= 1;
present = load3;
end


load3 : begin
M1 <= 2'b01;
wpn <= instruction[15:12];
write_en <=1;
present = fetch1;
end

mv : begin
M1 <= 2'b11;
wpn <= instruction[15:12];
write_en <=1;
present = fetch1;
end

End1: begin
End = 1'b1;
end

next_instruction:begin
alu_en <=2'b01;
end


default:begin
//M3 <=2'b1;
checks = 1;

end
endcase

end



endmodule