class apb_test extends uvm_test;
  `uvm_component_utils(apb_test)
  apb_environment env;
  apb_sequence aseq;  
  
  function new(string name="apb_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = apb_environment :: type_id ::create("env",this);
     aseq = apb_sequence:: type_id :: create("aseq",this);
   endfunction
  
   function void end_of_elaboration_phase(uvm_phase phase);
     print();
    endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    aseq.start(env.agt.seqr);
    #50
    phase.drop_objection(this);
  endtask
endclass

