class mux_trans extends uvm_sequence_item;
  `uvm_object_utils(mux_trans)
  
  rand logic [7:0] d;
  randc logic [2:0] sel;
  logic y; // output should not be randomized
  
  function new (string name="mux_trans");
    super.new(name);
  endfunction
  
endclass