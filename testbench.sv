`include "uvm_macros.svh"
import uvm_pkg::* ;

`include "sequence_item.sv"
`include "interface.sv"
`include "sequence.sv"
`include "scoreboard.sv"
`include "monitor.sv"
`include "driver.sv"
`include "sequencer.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"





module top;
  
  bit pclk;
  bit preset;
  
  apb_interface apbif (pclk);
  
   initial 
    pclk=0;
  always #10 pclk = ~pclk;
  
  initial
    begin
      preset=1;
      #10;
      preset=0;
    end
  
  
  
  apb dut (
    .pclk(pclk),
    .preset(preset),
    .psel(apbif.psel),
    .penable(apbif.penable),
    .pwrite(apbif.pwrite),
    .paddr(apbif.paddr),
    .pwdata(apbif.pwdata),
    .pready(apbif.pready)
  );
  
   initial
    begin
      uvm_config_db#(virtual apb_interface)::set(null, "*","label", apbif);
    end
  
  
  initial begin
    $dumpfile("dump.vcd");
      $dumpvars();
  		end
  
 initial
   begin
     run_test("apb_test");
    end
  
  	
  
endmodule
  
 
  
  
           
           
      
      