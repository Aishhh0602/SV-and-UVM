class mux_env extends uvm_env;
  `uvm_component_utils(mux_env)
  
  mux_agent agt;
  mux_scoreboard scb;
  
  
  function new(string name="mux_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = mux_agent::type_id::create("agt",this);
    scb = mux_scoreboard :: type_id :: create("scb",this);
  endfunction
  
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      agt.mon.mon_ap.connect(scb.sb_ap);
  endfunction
  
endclass