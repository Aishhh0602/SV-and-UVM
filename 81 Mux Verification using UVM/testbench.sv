`include "uvm_macros.svh"
import uvm_pkg ::*;

`include "mux_interface.sv"
`include "mux_trans.sv"
`include "mux_sequence.sv"
`include "mux_sequencer.sv"
`include "mux_drv.sv"
`include "mux_monitor.sv"
`include "mux_agent.sv"
`include "mux_scoreboard.sv"
`include "mux_env.sv"
`include "mux_test.sv"



module mux_tb;
  mux_if vif ();
  
  mux81 dut (
    .d(vif.d),
    .sel(vif.sel),
    .y(vif.y)
  );
  
  
  

      //For all the lower level components which need the use of Interface, we send the interface as virtual to the config db and set it in the top
      initial begin
      uvm_config_db #(virtual mux_if) :: set(null, "*", "vif", vif);
      end
      
      initial 
        begin
          run_test("mux_test");
        end
  
  
  initial begin
    //`uvm_info("mux_tb","info from top",UVM_NONE);
    $dumpfile("dump.vcd");
  		$dumpvars;
	end
      
   
      
      endmodule