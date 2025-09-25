class dff_monitor extends uvm_monitor;
  `uvm_component_utils (dff_monitor)
  
  virtual dff_intf intf;
  uvm_analysis_port #(dff_sequence_item) item_collected_port;//user defined name
  dff_sequence_item tx;
  
  function new (string name ="dff_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONITOR class", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port= new("item_collected_port",this); //tells that item_collected_port is an analysis port which u register with the parent class,scoreboard
    `uvm_info("MONITOR class", "build phase", UVM_MEDIUM)
    
    if(!uvm_config_db#(virtual dff_intf)::get(this,"*","vif",intf))
      `uvm_fatal("no_inif in monitor","virtual interface get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
     tx= dff_sequence_item::type_id::create("tx");
    wait (!intf.rst) //sample the values only when reset=0;
    
    @(posedge intf.clk)
    tx.rst=intf.rst;
    tx.d=intf.d;
    tx.q=intf.q;
  endtask
    
endclass