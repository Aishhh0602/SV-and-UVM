class scoreboard;
  mailbox mon2sb;
 
  function new (mailbox mon2sb);
    this.mon2sb=mon2sb;
  endfunction
  
  task main();
    transaction tr;
    repeat(3);
    begin
      mon2sb.get(tr);
      tr.display("scoreboard signals");
      if(((tr.a ^ tr.b ^ tr.cin)== tr.s) && (((tr.a & tr.b) |(tr.b & tr.cin) |(tr.a & tr.cin)) ==tr.c))
        $display("Pass");
      else
        $display("fail");
      $display("Done");
    end
  endtask
endclass
    