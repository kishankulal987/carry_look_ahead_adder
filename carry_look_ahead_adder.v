`timescale 1ns / 1ps
module carry_look_ahead_adder(input [3:0]a,b,input cin,output [3:0]sum,output cout);
wire [3:0]p,g;//wire for carry generator and carry propagator
wire [3:0]c;
xor x0(p[0],a[0],b[0]),
    x1(p[1],a[1],b[1]),
    x2(p[2],a[2],b[2]),
    x3(p[3],a[3],b[3]);

and a0(g[0],a[0],b[0]),
    a1(g[1],a[1],b[1]),
    a2(g[2],a[2],b[2]),
    a3(g[3],a[3],b[3]);
    
assign c[0]=g[0]|(p[0]&cin);
assign c[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
assign c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
assign c[3]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);

xor x4(sum[0],p[0],cin),
    x5(sum[1],p[1],c[0]),
    x6(sum[2],p[2],c[1]),
    x7(sum[3],p[3],c[2]);
    
buf b1(cout,c[3]);  
endmodule


//testbench
module testbench();
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
carry_look_ahead_adder m1(a,b,cin,sum,cout);
initial begin
cin=1;
for(integer i=0;i<2**4;i=i+1)
begin
a=i;
for(integer j=0;j<2**4;j=j+1)
begin
b=j;
#10;
end
end
$finish;
end
endmodule