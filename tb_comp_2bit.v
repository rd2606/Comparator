`timescale 1ns / 1ps

module tb_comp_2bit();
reg [1:0] in1,in2;
wire [2:0] out;

comp_2bit C(out,in1,in2);

integer i;
initial 
begin
for(i=0;i<16;i=i+1)
begin
{in1,in2}=i;
#10;
end
end

initial
$monitor($time,"out=%b,in1=%b,in2=%b",out,in1,in2);

initial
#160 $finish;

endmodule
