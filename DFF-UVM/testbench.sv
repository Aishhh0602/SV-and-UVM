`include "uvm_macros.svh"
import uvm_pkg ::* ;

`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  logic clk;
  
  dff dut (
    .clk(intf.clk),
    .rst(intf.rst),
    .d(intf.d),
    .q(intf.q) //all these signals come to the dut through interface so instantiating from interface
  );
  
  dff_intf intf(.clk(clk));
  
  initial
    begin
      uvm_config_db#(virtual dff_intf):: set(null,"*","vif",intf);
    end
      
  initial
      clk=0;
      always #10 clk= ~clk;
  
  initial
    begin
      $monitor($time, "clk=%d",clk);
      #100 $finish;
    end
  
  initial
    begin
      run_test("dff_test");
    end
  
  
endmodule


