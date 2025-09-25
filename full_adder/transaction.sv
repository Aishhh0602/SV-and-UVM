//Transaction class: Declare signals of DUT and interface

class transaction; //packet class
  
  rand bit a;
  rand bit b;
  rand bit cin;
  
  	bit s;
  	bit c; //Since they are outputs,do not randomize
  
  function void display (string name);
    $display ("_________%s_____________",name);
    $display ("a=%b,b=%b,cin=%b,s=%b,c=%b",a,b,cin,s,c);
  endfunction
endclass
  