module Top_Level_tb();
   
	reg clk;
    // reg BEGIN;
    initial begin

        // BEGIN = 1'b1;
	    clk=1'b1;
		forever #100 clk =~clk;

        
	end
     Top_Level_Module Top_Module(
	.clk(clk)
    // .BEGIN(BEGIN)
    );

    initial begin
        repeat (6) @(posedge clk);
        $stop; 
    end

endmodule

