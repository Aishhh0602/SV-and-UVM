class mux_drv extends uvm_driver#(mux_trans);
  `uvm_component_utils(mux_drv)
  
  virtual mux_if vif;
  mux_trans req;
  
  function new (string name= "mux_drv", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("Driver phase started");
    if (!uvm_config_db#(virtual mux_if)::get(this, "", "vif", vif))
      begin
        `uvm_fatal("fp_sub_drv", "Failed to get vif from uvm-config_db")
      end
  endfunction
  
  virtual task run_phase (uvm_phase phase);
    super.run_phase(phase);
    repeat(8)
      begin
        req = mux_trans::type_id::create("req");
        seq_item_port.get_next_item(req);
        vif.d = req.d; //take the data from the packet and assign to the interface for it to send it to the DUT
        vif.sel = req.sel;
        seq_item_port.item_done();
        #10;
      end
  endtask
    endclass
    
        
        