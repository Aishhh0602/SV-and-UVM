class apb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(apb_scoreboard)
  uvm_analysis_imp#(sequence_item1,apb_scoreboard) item_collected_export;
  sequence_item1 queue [$];
  bit [7:0] memory [0:7];
  
  function new (string name="apb_scoreboard",uvm_component parent);
      super.new(name,parent);
    endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export= new("item_collected_export", this);
  endfunction
  
  function void write(sequence_item1 req);
    req.print();
    queue.push_back(req);
  endfunction
  
  task run_phase(uvm_phase phase);
    sequence_item1 req;
    forever
      begin
        wait(queue.size() >0); //wait for the queue size to be greater than zero
        req = queue.pop_front();
        
        if(req.pwrite)
          begin
            memory[req.paddr] = req.pwdata;
            $display("******DATA WRITTEN******");
            $display("expected data =%d,actual data=%d",memory[req.paddr],req.prdata);
          end
        else if(req.pwrite==0 && memory[req.paddr] == req.prdata)
          begin
            $display("******READ MATCH******");
            $display("expected data =%d,actual data=%d",memory[req.paddr],req.prdata);
          end
        else
          begin
            $display("******READ MISMATCH******");
            $display("expected data =%d,actual data=%d",memory[req.paddr],req.prdata);
          end
          
      end
  endtask
  
endclass
        
          
           
  
  
    