class dff_env extends uvm_env;
  `uvm_component_utils (dff_env)
  
  dff_agent agt;
  dff_scoreboard scb;
  
  function new (string name ="dff_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV class", "constructor", UVM_MEDIUM)
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     agt = dff_agent :: type_id :: create("agt",this);
     scb = dff_scoreboard :: type_id :: create("scb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV class", "connect phase", UVM_MEDIUM)
    agt.mon.item_collected_port.connect(scb.item_collected_export);
     
  endfunction
  
endclass