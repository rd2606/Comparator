module comp_2bit(y,a,b);

//two 2-bit inputs
input [1:0] a,b;

//y[2]-a>b
//y[1]-a=b
//y[0]-a<b
output [2:0] y;

//interconnects
wire [7:0] t;

//a>b
and(t[0],a[1],~b[1]);
and(t[1],a[0],~b[0],~b[1]);
and(t[2],a[0],a[1],~b[0]);
or(y[2],t[0],t[1],t[2]);
//a=b
xnor(t[3],a[0],b[0]);
xnor(t[4],a[1],b[1]);
and(y[1],t[3],t[4]);

//a<b
and(t[5],~a[1],b[1]);
and(t[6],~a[1],~a[0],b[0]);
and(t[7],~a[0],b[1],b[0]);
or(y[0],t[5],t[6],t[7]);

endmodule
