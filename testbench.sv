module tb();
  parameter CYCLE = 2;
  logic clk,reset,init;
  logic [7:0] load ;
  logic [1:0] ctrl ;
  initial begin
    clk=0;
    forever #(CYCLE/2) clk = ~clk;
  end
  
  initial begin
    reset =1;#2
    reset =0;
    init = 1;
    load=8'h0f;#2
    init=0;
    ctrl=2'b00;
  end
  counter_4 counter_win(.clk(clk),.reset(reset),.in_signal(maincounter.winner));
  counter_4 counter_lose(.clk(clk),.reset(reset),.in_signal(maincounter.loser));
  counter_main maincounter(.clk(clk),.reset(reset),.ctrl(ctrl),.init(init),.load(load));
  
  always@(posedge clk)
    begin
      if(counter_win.result && !reset)
        begin
          $display("WHO is :01");
          reset<=1;#2
          reset<=0;
        end
           
      else if(counter_lose.result && !reset)
         begin
           $display("WHO is :10");
          reset<=1;#2
           reset<=0;
        end
    end
   
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
    #10000 $finish;
  end 
endmodule