class apb_sequence extends uvm_sequence #(sequence_item1);
  `uvm_object_utils(apb_sequence)
  
  sequence_item1 req;
  
  function new (string name="apb_sequence");
    super.new(name);
  endfunction
  
  task body ();
    repeat (5)
      begin
        req = sequence_item1::type_id::create("req");
        
        wait_for_grant();
        req.randomize() with {req.pwrite==1;};
         req.print();
        send_request(req);
        wait_for_item_done();
      end
    
    repeat (5)
      begin
         req = sequence_item1::type_id::create("req");
        
        wait_for_grant();
        req.randomize() with {req.pwrite==0;};
         req.print();
        send_request(req);
        wait_for_item_done();
       
      end
    
    
  endtask
endclass
