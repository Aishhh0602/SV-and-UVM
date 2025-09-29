class apb_sequence extends uvm_sequence #(sequence_item1);
  `uvm_object_utils(apb_sequence)
  
  sequence_item1 trans;
  
  function new (string name="apb_sequence");
    super.new(name);
  endfunction
  
  task body ();
    repeat (5)
      begin
        trans = sequence_item1::type_id::create("trans");
        `uvm_info(get_type_name(), "Task Body Called", UVM_LOW)

        
        start_item(trans);
        if(!trans.randomize())
        `uvm_fatal(get_type_name(), "Randomization Failure")
          finish_item(trans);
        trans.print();
      end
  endtask
endclass
