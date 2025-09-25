`include "interface.sv"
`include "test.sv"

module testbench;
  
  bit clk;
  bit rst;
  
   intf intff(clk,rst);
  dff dut (
    .clk(intff.clk),
    .rst(intff.rst),
    .d(intff.d),
    .q(intff.q)
  );
   test tst (intff);
  
  initial begin
    
    clk=0;
    forever #5 clk=~clk;
    rst=1'b1;
    #10 rst=1'b0;
    end
  
initial begin
    $dumpfile("dump.vcd"); // to get waveform
    $dumpvars;
  end
  
 
  initial
    begin
#100 ;
    $finish;
  end
endmodule 
  