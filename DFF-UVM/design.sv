// Code your design here
module dff(
   input clk,rst,d,
   output reg q
);
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        q<=d;
    end
endmodule
    