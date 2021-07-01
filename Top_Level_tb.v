module Top_Level_tb();
   
	reg clk;
    initial begin
	    	clk=1'b1;
		    forever #100 clk =~clk;
	end
     Top_Level_Module Top_Module(
	.clk(clk)
    );

    initial begin
        repeat (10000000) @(posedge clk);
        $stop; 
    end

endmodule

