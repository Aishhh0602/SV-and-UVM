class dff_agent extends uvm_agent;
  `uvm_component_utils (dff_agent)
  
 dff_driver drv;
  dff_sequencer seqr;
  dff_monitor mon;
  
  function new (string name ="dff_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT class", "constructor", UVM_MEDIUM)
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     
     drv = dff_driver :: type_id :: create("drv",this);
     seqr = dff_sequencer :: type_id :: create("seqr",this);
     mon = dff_monitor :: type_id :: create("mon",this);
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Agent class", "connect phase", UVM_MEDIUM)
    drv.seq_item_port.connect(seqr.seq_item_export);
     
  endfunction
  
endclass