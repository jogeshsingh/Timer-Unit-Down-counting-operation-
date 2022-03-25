`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Jogesh singh
// 
// Create Date: 09/19/2021 10:05:05 PM
// Design Name: Timer
// Module Name: Timer_v
// Project Name: Timer_down_count
// Target Devices: MAX 10
// Tool Versions: 20.1
// Description: In this project we generally design a counter which accepts the data and counts till 0, 
/// and outputs signal as 1 when it counts the data upto 0 (down count) and whenver the output signal
/// is 0 , it accepts the next data to count and repeats the process.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Timer_v 
#(parameter DATA_WIDTH = 4)
(i_clk , rst_n , data_in , cnt_out , enable , cnt_one) ;
input i_clk ;
input rst_n ;
input[DATA_WIDTH-1:0] data_in ;
input enable ;
output[DATA_WIDTH-1:0] cnt_out ;
output cnt_one ;
 
 
 
wire [DATA_WIDTH-1:0] count_next ;
reg [DATA_WIDTH-1:0] counter_out ;


always @ (posedge i_clk)
 begin
     if (rst_n==1'b0)
	     begin
	 	     counter_out <= data_in ;
          end
	else 
	  begin
	        if (enable==1'b1)
		     counter_out <= count_next ;
		  end
		end
	
assign count_next = (counter_out==1'b0) ? data_in : counter_out-1'b1 ;

assign cnt_one = (counter_out == 1'b0) ? 1'b1 : 1'b0 ;

assign cnt_out = counter_out ;

endmodule
	
	  