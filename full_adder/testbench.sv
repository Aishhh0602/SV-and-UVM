// TOP Module
`include "interface.sv"
`include "test.sv"

module testbench;

  fa_interface vif(); // Interface ( Name and instance)
  test tst (vif); //Test (Name and instance , along wih the type of interface
  
  fa f1 (
    .a(vif.a),
    .b(vif.b),
    .cin(vif.cin),
    .s(vif.s),
    .c(vif.c)
  ); //We are mapping the DUT signals to Interface because the DUT is communicationg with TB through interface
  
  
   initial begin
    $dumpfile("dump.vcd"); // to get waveform
    $dumpvars;
  end
  
  initial
    #100 $finish;
endmodule