`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Naveen
// 
// Create Date:    12:18:57 07/23/2023 
// Design Name: 
// Module Name:    sequence detector
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//101 sequence detector non overlapping
module sequence_detector(input clk, rst, input x, output reg z
    );
// x is the external input and z is the external output

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
reg[1:0] present_state=s0;
reg[1:0] next_state;


//sequential circuit - present state,  therefore using non blocking assignment
always @(posedge clk)
begin
if(rst)
present_state <= s0;
else
present_state<=next_state;
end


//next state -combinational circuit
always @ (present_state, x)
begin
case(present_state)
s0: if(x==1) begin
next_state = s1;
z=0;
end

else begin
next_state = s0;
z=0;
end


s1: if(x==0) begin
next_state = s2;
z=0;
end
else begin
next_state = s1;
z=0;
end


s2: if(x==0) begin
next_state = s0;
z=0;
end

else begin
next_state = s0;
z=1;
end


default: next_state = s0;

endcase
end
endmodule
