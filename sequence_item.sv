//`include "apb_pkg.sv"
class sequence_item1 extends uvm_sequence_item;
  //`uvm_object_utils(sequence_item1)

  rand bit [7:0] paddr;
  rand bit pwrite;
  rand bit psel;
  rand bit penable;
  rand bit [7:0] pwdata;
  rand bit [7:0] prdata;
  
  constraint c1 {
    pwdata inside {[0:255]};
    paddr inside {[0:255]};
  }
  
  `uvm_object_utils_begin(sequence_item1)
  `uvm_field_int(paddr,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(pwrite,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(psel,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(penable,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(pwdata,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(prdata,UVM_ALL_ON|UVM_DEC)
  `uvm_object_utils_end
  
  function new (string name="sequence_item1");
    super.new(name);
  endfunction
  
endclass
                