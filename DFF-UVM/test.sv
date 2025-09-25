class dff_test extends uvm_test;
  `uvm_component_utils (dff_test)
  dff_env env;
  dff_sequence seq;
  
  function new (string name ="dff_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("Test class", "constructor", UVM_MEDIUM)
  endfunction
  
  //build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = dff_env :: type_id :: create("env",this);
    seq = dff_sequence :: type_id :: create("seq",this);
  endfunction
  
  virtual function void end_of_elaboration();
    `uvm_info("Test class", "elaboration phase", UVM_MEDIUM)
    print ();
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("Test class", "Run Phase", UVM_MEDIUM)
    
    phase.raise_objection(this);
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
  
  
    
endclass