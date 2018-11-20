`include "single_port_mem.sv"
module testbench ();
   reg [7:0] address1;		
   reg [15:0] din1;
   reg wen1;
   reg clk;

   wire [15:0] rdata;

   single_port_mem memS2(
		  .address(address1),
		  .din(din1),
		  .wen(wen1),
		  .clock(clk),
		  .dout(rdata)
		  );
   
     initial
       begin

	wen1 <= 0;
	clk <= 0; 
	din1 <= 16'h8;
	address1 <= 8'h9;	 

       #0 begin
	  wen1 = 1;
	  din1 = 16'h10;
	 address1 = 8'h11;
       end 
       #20 begin
          wen1 = 0;
          din1 = 16'h12;
       end
   
       #20 begin
	  wen1 = 1;
	din1 = 16'h13;
	 address1 = 8'h14;
       end
       #20 begin
	 wen1 = 0;
	  din1 = 16'h15;
       end

       #20 begin
	  wen1 = 1;
	  din1 = 16'h60;
	  address1 = 8'h16;
       end
       #20 begin
	  wen1 = 0;
          din1 = 16'h66;
       end

       #20 begin
	  wen1 = 1;
	  din1 = 16'h50;
	  address1 = 8'h15;
       end
       #20 begin
	  wen1 = 0;
	  din1 = 16'h55;
       end
	  
     $finish;
    end

	initial 
		begin
			forever #6 clk = ~clk;
		end
endmodule // testbench

