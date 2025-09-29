//APB protocol

module apb (
  input pclk,
  input preset,
  input psel,
  input penable,
  input pwrite,
  
  input [7:0] paddr,
  input [7:0] pwdata,
  
  output reg [7:0] prdata,
  
  output reg pready
);
  
  
  logic [7:0] mem [0:7];
  logic [3:0] count;
  logic [1:0] apb_state;
  
  parameter IDLE = 0;
  parameter SETUP = 1;
  parameter ACCESS = 2;
  
  int i;
  reg [1:0] ps,ns;
  
 //IDLE TO SETUP
  always@(posedge pclk or posedge preset)
    begin
      if(preset)
        begin
        ps <= IDLE;
          for(i=0;i<=8; i=i+1)
        begin
          mem[i] <= 'hx;
        end
    end
  else
    ns <= ps;
    end
  
  always@(*)
    begin
      if(preset)
        ns <=0;
      else
        ns <= ps;
    end
  
  
  always @(posedge pclk)
    begin
      if(ns==IDLE)
        begin
          case({psel,penable})
            2'b00: ps<=IDLE; //No transfer
            2'b01: ps<=IDLE; //No condition exists where enable is high without selecting slave
            2'b10: ps<=SETUP;
            2'b11: ps<=IDLE;
            default:ps<=IDLE;
              endcase
             end
      
              else if(ps==SETUP)
                begin
                  case({psel,penable})
            2'b00: ps<=IDLE;
            2'b10: ps<=SETUP;
            2'b11: ps<=ACCESS;
            default: ps<=IDLE;
              endcase
                end
      
      else if(ps==ACCESS)
        begin
           case({psel,penable})
            2'b00: ps<=IDLE;
            2'b10: ps<=SETUP;
            2'b11: ps<=ACCESS;
            default: ps<=IDLE;
              endcase
                end
    end
  
  always@(posedge pclk)
    begin
      if(ps==ACCESS && pwrite==1 && pready==1)// begin
        mem[paddr]<=pwdata;
      else if(ps==ACCESS && pwrite==0 && pready==1)
        prdata<=mem[paddr];
    end
  assign apb_state=ps;
  
  always@(posedge pclk or negedge preset)
    begin
    if(preset)
      count <=0;
  else
    count <= $urandom_range(0,15);
    end
  assign pready=1;  //slave is ready for a transaction (without wait state)
  
endmodule
  