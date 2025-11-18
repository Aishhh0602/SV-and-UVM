class mux_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(mux_scoreboard)
  uvm_analysis_imp #(mux_trans, mux_scoreboard) sb_ap;
  mux_trans req;
  
  
  function new (string name ="mux_scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SCOREBOARD class", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_ap= new("sb_ap", this);
  endfunction
  
  task check_result;
    $display(".........Logic verification started.............");
    
    
    if(req.sel == 3'b000)
      begin
        if( (req.d[0]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b001)
      begin
        if( (req.d[1]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b010)
      begin
        if( (req.d[2]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b011)
      begin
        if( (req.d[3]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b100)
      begin
        if( (req.d[4]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b101)
      begin
        if( (req.d[5]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b110)
      begin
        if( (req.d[6]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
    
    
    if(req.sel == 3'b111)
      begin
        if( (req.d[7]==1) && (req.y==1) )
          $display("Check Passed and the values are d=%8b,sel=%3b, y=%0b", req.d,req.sel,req.y);
        else
          $display("Check Failed");
      end
  endtask
  
  virtual function void write(mux_trans req);
    this.req = req;
     `uvm_info("SCOREBOARD write", "check", UVM_MEDIUM)
endfunction
  
  
endclass