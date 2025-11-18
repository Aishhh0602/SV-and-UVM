class mux_seq extends uvm_sequence#(mux_trans);
  `uvm_object_utils(mux_seq)
  mux_trans req;
  
  function new (string name ="mux_seq");
    super.new(name);
  endfunction
  
  virtual task body ();
    int i;
    
    //mux_trans req;
    req= mux_trans::type_id::create("req");
    
    req.sel = 3'b0;
    req.d = 8'b0;
    repeat(8)
      begin
    
    //Driver-Sequencer communication
        start_item(req);
        req.d= 2**i;
        finish_item(req);
        
        #10;
        req.sel= req.sel+1;
        i=i+1;
      end
  endtask
endclass
    
    