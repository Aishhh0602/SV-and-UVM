`include "environment.sv"
program test (fa_interface vif);
  environment env;
  
  initial
    begin
      env=new(vif);
      env.test_run;
    end
endprogram
