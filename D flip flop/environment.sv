`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
   virtual intf vif;
   mailbox gen2drv;
  mailbox mon2sb;
  
 
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
 
  
  function new (virtual intf vif);
    this.vif =vif;
    gen2drv = new();
    mon2sb = new();
    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2sb);
    sb = new(mon2sb);
  endfunction
  
  
  task test_run();
    fork
      gen.main();
      drv.main();
      //drv.drive_to_design();
      mon.main();
      //mon.mon_to_sb();
      sb.main();
    join
  endtask
  
endclass
  