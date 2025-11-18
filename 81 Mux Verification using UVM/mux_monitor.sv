class mux_mon extends uvm_monitor;
  `uvm_component_utils(mux_mon)
  
  virtual mux_if vif;
  uvm_analysis_port #(mux_trans) mon_ap;
  mux_trans req;
  
  function new(string name="mux_mon", uvm_component parent);
    super.new(name,parent);
   endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap = new("mon_ap",this);
    `uvm_info("MONITOR class", "build phase", UVM_MEDIUM)
    
    
    if(!uvm_config_db#(virtual mux_if)::get(this ,"", "vif", vif))
      begin
        `uvm_fatal("MONITOR", "Failed to get interface handle")
      end
  endfunction
  
  
  virtual task run_phase(uvm_phase phase);
    req= mux_trans::type_id::create("req");
    #10;
    repeat(8)
      begin
        req.d =vif.d;
        req.sel=vif.sel;
        req.y= vif.y;
        mon_ap.write(req);
        end
     
      
  endtask
  
endclass
  
  