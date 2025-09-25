class dff_sequence_item extends uvm_sequence_item;
  `uvm_object_utils (dff_sequence_item)
  
  rand logic rst;
  rand logic d;
  logic q;
  
  function new (string name ="dff_sequence_item");
    super.new(name);
    `uvm_info("SEQUENCE_ITEM class", "constructor", UVM_MEDIUM)
  endfunction
  
  constraint c1 {rst !=1;};
endclass