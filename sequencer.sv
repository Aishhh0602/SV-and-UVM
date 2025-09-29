class apb_sequencer extends uvm_sequencer#(sequence_item1);
  `uvm_component_utils(apb_sequencer)
  
  
  function new(string name="apb_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
  
  