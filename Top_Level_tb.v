`timescale 1ns/1ns

module Top_Level_tb();
    
    wire End_core0;
    wire [5:0] PC0_out;

    wire End_core1;
    wire [5:0] PC1_out;

    wire End_core2;
    wire [5:0] PC2_out;

    wire End_core3;
    wire [5:0] PC3_out;

	reg clk=1'b0;
    
    initial begin
	    // repeat (1506) //ID=0 in 1506, ID=1 in 1048 (3*4 4*3)
        // repeat (4254) //single core (3*4 4*3)
        // repeat (2422) //dual core (3*4 4*3)
        repeat (1506) //quad core (3*4 4*3)

        #10 clk = ~clk;
        $stop;
	end

     Top_Level_Module Top_Module(
	    .clk(clk),

        .End_core0(End_core0),
        .PC0_out(PC0_out),
        
        .End_core1(End_core1),
        .PC1_out(PC1_out),
        
        .End_core2(End_core2),
        .PC2_out(PC2_out),
        
        .End_core3(End_core3),
        .PC3_out(PC3_out)        
    );

endmodule

