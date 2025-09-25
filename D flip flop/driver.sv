class driver;
 mailbox gen2drv;
   virtual intf vif;
  
  function new (virtual intf vif, mailbox gen2drv );
    this.gen2drv=gen2drv;
    this.vif=vif;
  endfunction
  
  task main();
    repeat(5)
      @(vif.drv_cb)
      begin
        transaction trans;
        gen2drv.get(trans);
         vif.d <= trans.d;
        //vif.rst <= trans.rst;
        
        
        #5;
        //trans.display("Driver class signals");

      end
  endtask
    
    /*task drive_to_design();
      @(vif.drv_cb)
      begin
        vif.d <= trans.d;
        vif.rst <= trans.rst;
        #5
        trans.display("Driver class signals");
      end
    endtask*/
  
  
  
endclass
        