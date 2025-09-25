class scoreboard;
  mailbox mon2sb;
  
  function new (input mailbox mon2sb);
    this.mon2sb=mon2sb;
  endfunction
  
  task main();
    transaction trans;
    repeat (2)
      begin
      mon2sb.get(trans);
    trans.display("Scoreboard signals");
    
    //if(vif.imon_cb.rst==1)
     // begin
      ////q=0;qb=1;
    //$display("Reset condition passed");
        if (trans.d==trans.q)
      $display("****PASS****");
               else
                 $display("-----FAIL-----");
                          //end
                          end
                          endtask
                          endclass
                          