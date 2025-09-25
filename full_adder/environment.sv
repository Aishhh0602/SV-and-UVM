`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  mailbox gen2drv;
  mailbox mon2sb;
  
  virtual fa_interface vvif;
  
  function new (virtual fa_interface vvif);
    this.vvif=vvif;
        gen2drv=new();
    	mon2sb=new();

    gen=new(gen2drv);
    drv=new(vvif,gen2drv);
    mon=new(vvif, mon2sb);
    sb=new(mon2sb);
  endfunction
  
  task test_run ();
    fork
      gen.main();
      drv.main();
      mon.main();
      sb.main();
    join
  endtask
endclass