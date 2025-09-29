interface apb_interface (input bit pclk);
 
  logic psel;
  logic penable;
  logic pwrite;
  logic [7:0] paddr;
  logic [7:0] pwdata;
  logic [7:0] prdata;
  logic pready;
  logic pslverr;
  
  //Clocking block for driver
  
  clocking drv_cb @(posedge pclk);
    default input #1 output #0;
    output penable,psel,pwrite,paddr,pwdata;
  endclocking
  
  //Clocking block for write monitor
  clocking mon_cb @(posedge pclk);
    default input #1 output #0;
    input penable,psel,pwrite,paddr,pwdata,prdata,pready;
  endclocking
  
  
  
  //Modport declaration
  
  modport DRV (clocking drv_cb);
    modport MON (clocking mon_cb);
      
        
        endinterface