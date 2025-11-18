

class mux_agent extends uvm_agent;
  `uvm_component_utils(mux_agent)
  
  mux_drv drv;
  mux_sequencer seqr;
  mux_mon mon;
  
  function new (string name = "mux_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = mux_drv::type_id::create("drv",this);
    mon = mux_mon::type_id::create("mon",this);
    seqr= mux_sequencer::type_id::create("seqr",this);
  endfunction
    
    virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
    endclass