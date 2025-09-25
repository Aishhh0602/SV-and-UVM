class driver;
  virtual fa_interface vvif; 
  mailbox gen2drv;
  
  function new (virtual fa_interface vvif, mailbox gen2drv);
    this.vvif=vvif;
    this.gen2drv=gen2drv; //Get the packet from mailbox
  endfunction
  
  task main ();
    repeat (2)
      begin
        transaction tr;
        gen2drv.get(tr);
        vvif.a <=tr.a; //transfer the packet to interface to send to dut
        vvif.b <=tr.b;
        vvif.cin <=tr.cin;
        #1
        
        tr.display ("Driver class signals");
      end
  endtask
endclass
     