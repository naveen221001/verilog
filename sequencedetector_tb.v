// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Naveen
//
// Create Date:   19:08:06 07/23/2023
// Design Name:   examplenew
// Module Name:   C:/Users/DELL/mooreexample/exampleb.v
// Project Name:  mooreexample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: examplenew
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sequencedetector_tb;

	// Inputs
	reg clk;
	reg rst;
	reg x;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	sequence_detector_101 uut (
		.clk(clk), 
		.rst(rst), 
		.x(x), 
		.z(z)
	);

	initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
		// Initialize Inputs
		clk = 1;
		rst = 0;
		x = 1;
#10 rst=0; x=0;
#10 rst=0; x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=1;
		// Wait 100 ns for global reset to finish        
		// Add stimulus here
      #200 $finish;
	end
      always #5 clk=~clk;  
endmodule

