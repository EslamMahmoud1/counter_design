// Code your design here
module counter_main (clk,reset,ctrl,init,load,count,winner,loser);
  input  clk,reset,init;
  input logic [1:0] ctrl;
  input logic [7:0] load;
  output reg [7:0] count;
  output logic winner,loser;
  
  always@(posedge clk)
    begin
      if(reset)
        count<=1;
      else if(init)
        count<=load;
      else if(ctrl==2'b00)
        count=count+1;
      else if(ctrl==2'b01)
        count=count+2;   
      else if(ctrl==2'b10)
        count=count-1;   
      else if(ctrl==2'b11)
        count=count-2;   
    end
  always@(posedge clk)
    begin
      if(count == 8'hff)
        begin
          winner<=1;
          winner<=#2 0;
        end
      
      else if (count == 8'h00)
        begin
          loser<=1;
          loser<=#2 0;
        end
    end
  endmodule


module counter_4(clk,reset,in_signal,count,result);
  input clk,reset,in_signal;
  output reg [3:0] count;
  output reg result;
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          count<=0;
          result<=0;
        end
        	
      if(in_signal)
        count<=count+1;
      if(count== 4'hf)     
          result<=1; 
    end
endmodule
        
  
        
  