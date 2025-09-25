interface intf (input clk,rst); //same clock is shared between all components using interface
  logic d,q;
  
  clocking drv_cb @(posedge clk);
    default input #0 output #0;
    output d;
    input q;
  endclocking
  
  clocking mon_cb @(posedge clk);
    default input #0 output #0;
    input d;
    input q;
  endclocking
  
  modport DRV (clocking drv_cb);
    modport MON (clocking mon_cb);
      
      endinterface