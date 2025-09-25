class monitor;
  virtual intf vif;
  mailbox mon2sb;
  
  function new (virtual intf vif, mailbox mon2sb);
    this.vif = vif;
    this.mon2sb = mon2sb;
  endfunction
  
  task main();
    repeat (2)
      @(vif.mon_cb)
      begin
        transaction trans ;
        trans = new();
        
      trans.d = vif.d;
      trans.q = vif.q;
      
      
      mon2sb.put(trans);
      #10
      trans.display("Monitor class signals");
        
      end
  endtask
  
  /*task mon_to_sb ();
    @(vif.mon_cb)
    begin
      trans.d <= vif.d;
      trans.rst <= vif.rst;
      trans.q <= vif.q;
      trans.qb <= vif.qb;
      
      mon2sb.put(trans);
      #10
      trans.display("Monitor class signals");
    end
  endtask*/
  
endclass
  