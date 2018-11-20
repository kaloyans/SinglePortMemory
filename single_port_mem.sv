module single_port_mem(
		 address,           
		 din,                
		 wen,              
		 clock,             
		 dout              
		 );
	input [7:0] address;
	input [15:0] din;
	input wen;
	input clock;

	output [15:0] dout;

	reg [15:0]  dout;
	reg [15:0]  memory [0:255];
	reg [15:0]  din1;
	reg [7:0]   address1;
	reg  	    wen1;


	always @ (posedge clock)
  		begin
			address1 <= address;
			wen1 <= wen;
			din1 <= din;
  		end
	always @ (*) begin
		if (wen1)
			begin 
				memory [address1] = din1;
			end
		end

	assign dout = memory [address1];  

      
endmodule             //   single_port_mem



