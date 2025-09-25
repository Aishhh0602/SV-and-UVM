class transaction;
  rand bit d;
  bit q;
 /* constraint valid {
    d inside {0,1};
    if(d==0) d!=1;
  }*/
  
  function void display (string name);
    $display("____%s_____",name);
    $display("d=%b,q=%b",d,q);
  endfunction
endclass

