
class generator;
  transaction tr;
  mailbox gen2drv; //mailbox between driver and generator
  function new (mailbox gen2drv);
    this.gen2drv =gen2drv;
  endfunction
    
  task main ();
      repeat(4) 
        begin
          tr =new();
          tr.randomize();
          tr.display("generator class signals");
          gen2drv.put(tr);
        end
    endtask
endclass