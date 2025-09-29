class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor)
  
  virtual apb_interface vif;
  uvm_analysis_port #(sequence_item1) item_collected_port;
  sequence_item1 req;
  
  function new(string name="apb_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONITOR class", "constructor", UVM_MEDIUM)
   endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   item_collected_port= new("item_collected_port",this);//object creation for analysis port
     req=sequence_item1::type_id::create("req");
    `uvm_info("MONITOR class", "build phase", UVM_MEDIUM)
    
    if(!uvm_config_db#(virtual apb_interface)::get(this,"*","label",vif))
      `uvm_fatal("no_apbif in monitor","virtual interface get failed from config db");
  endfunction
  //Task to capture data from DUT //
  task run_phase(uvm_phase phase);
    forever
      begin
        @(vif.mon_cb)
   		 req.psel = vif.mon_cb.psel;
       	 req.penable = vif.mon_cb.penable;
         req.pwrite = vif.mon_cb.pwrite;
    	 req.paddr = vif.mon_cb.paddr;
         //req.pready = vif.mon_cb.pready;
      end
    
        if(vif.mon_cb.pwrite)
      begin
        req.pwdata = vif.mon_cb.pwdata;
        `uvm_info(get_type_name(), $sformatf("Captured WRITE to addr=0x%0h data=0x%0h",req.paddr,req.pwdata), UVM_MEDIUM)
    end
    else
      begin
        req.prdata = vif.mon_cb.prdata;
        `uvm_info(get_type_name(), $sformatf("Captured read to addr=0x%0h data=0x%0h",req.paddr,req.prdata), UVM_MEDIUM)
    end
    
    //Send the data via analysis port into Scoreboard//
    item_collected_port.write(req);
    req.print();
    endtask
  
endclass
    
    
    
