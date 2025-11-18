class mux_test extends uvm_test;
  `uvm_component_utils (mux_test)
  
  mux_env env;
  mux_seq seq;
  
  function new (string name ="mux_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = mux_env::type_id::create("env",this);
    seq = mux_seq::type_id::create("seq",this);
  endfunction
  
  virtual function void end_of_elaboration();
    print(); //prints the uvm topology
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass
    