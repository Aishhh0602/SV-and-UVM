class dff_scoreboard extends uvm_scoreboard;
  `uvm_component_utils (dff_scoreboard)
  uvm_analysis_imp #(dff_sequence_item, dff_scoreboard) item_collected_export;
  dff_sequence_item queue[$];
  
  
  function new (string name ="dff_scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SCOREBOARD class", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export= new("item_collected_export", this);
  endfunction
  
  // write task - recives the pkt from monitor and pushes into queue
  virtual function void write(dff_sequence_item tx);
    //pkt.print();
    queue.push_back(tx);
  endfunction
  
  
  
  
endclass