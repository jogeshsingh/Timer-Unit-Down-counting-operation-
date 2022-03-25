`timescale 1ns/1ps 

////////testbench module//////////

module Timer_v_tb (); 
parameter WIDTH = 4 ;
reg i_clk ;
reg rst_n ;
reg enable ;
reg [WIDTH-1:0] data_in ;
wire [WIDTH-1:0] cnt_out ;
wire cnt_one ;

///instantiation ///
Timer_v DUT (i_clk , rst_n , data_in , cnt_out , enable , cnt_one) ;



initial
 begin
  i_clk = 1'b0 ;
  rst_n = 1'b0 ;
   end

always 
  begin
    #5 i_clk = ~i_clk ;
	   end
		
		
initial
  begin
     #2 rst_n = 1'b0 ;
	  #26 rst_n = 1'b1 ; 
	  
	    end
		 
initial
 begin
   #3 enable = 1'b1 ;
   #1 data_in = 4'b1000 ;
   #180 data_in = 4'b0100;
	#26 data_in = 4'b1001;
	#1000 $stop ; 
    end	
		 
		 
endmodule		 