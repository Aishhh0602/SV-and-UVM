class apb_environment extends uvm_env;
  `uvm_component_utils(apb_environment)
  apb_agent agt;
  apb_scoreboard sb;
  
  function new (string name="apb_environment", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  agt= apb_agent::type_id::create("agt",this);
  sb= apb_scoreboard::type_id::create("sb",this);
  endfunction 
  
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  agt.mon.item_collected_port.connect(sb.item_collected_export);
  endfunction
  
  
endclass
  
