class apb_driver extends uvm_driver#(sequence_item1);
  `uvm_component_utils(apb_driver)
  virtual apb_interface apbif;
  sequence_item1 req;
  
  function new(string name="apb_driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual apb_interface)::get(this,"*","label",apbif))
      `uvm_fatal("no_apbif in driver","virtual interface get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever 
      begin
        //wait(apbif.preset)
        seq_item_port.get_next_item(req);
        req.print();
        drive_to_design(req);
        seq_item_port.item_done();
      end
  endtask
  
  task drive_to_design(sequence_item1 req);
    @(apbif.drv_cb)
    `uvm_info("DRIVERRRRR", "Driving started",UVM_MEDIUM);
    apbif.drv_cb.psel <= req.psel;
    apbif.drv_cb.penable <= req.penable;
    apbif.drv_cb.pwrite <= req.pwrite;
    apbif.drv_cb.paddr <= req.paddr;
    apbif.drv_cb.pwdata <= req.pwdata;
  endtask
  
  
endclass
    
    
  
  
  