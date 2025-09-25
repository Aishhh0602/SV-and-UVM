class monitor;
  virtual fa_interface vvif;
  mailbox mon2sb;
  
  function new (virtual fa_interface vvif, mailbox mon2sb);
    this.vvif = vvif;
    this.mon2sb=mon2sb;
  endfunction
  
  task main ();
    repeat (2)
      #1 
      begin
        transaction tr;
        tr=new();
        
        tr.a=vvif.a;
        tr.b=vvif.b;
        tr.cin=vvif.cin;
        tr.s=vvif.s;
        tr.c=vvif.c;
        
        mon2sb.put(tr);
        tr.display("Monitor class signals");
      end
  endtask
endclass