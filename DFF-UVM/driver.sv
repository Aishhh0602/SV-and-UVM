class dff_driver extends uvm_driver #(dff_sequence_item);
  `uvm_component_utils (dff_driver)
  virtual dff_intf intf;
  dff_sequence_item tx;
  
  
  function new (string name ="dff_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("DRIVER class", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER class", "Build Phase", UVM_MEDIUM)
    
    if(!uvm_config_db#(virtual dff_intf)::get(this,"*","vif",intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever
      begin
        `uvm_info("DRIVER class", "Run Phase", UVM_MEDIUM)
        seq_item_port.get_next_item(tx); //get the next sequence item from the sequence via sequencer
        drive(tx); //drive the sequence item to the DUT
        seq_item_port.item_done();
      end//send ack to sequence via sequencer
        endtask
        
  task drive (dff_sequence_item tx);
          @(posedge intf.clk)
          intf.rst <= tx.rst;
          intf.d <= tx.d;
          intf.q <= tx.q;
        endtask
      
        
endclass