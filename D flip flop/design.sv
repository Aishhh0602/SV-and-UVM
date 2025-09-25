// D Flip flop

module dff (clk,rst,d,q);
  input clk,rst,d;
  output reg q;
  always @(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        q<=d;
    end
 // assign qb=~q;
endmodule
