//modulo12counter.sv file
//this module implements modulo12counter using d flip flops using structural approach 
module modulo12counter(clk,reset,q); 
input clk,reset;
output [3:0]q;
wire [3:0]qb;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
//according to circuit diagram
d_flip_flop dff0(qb[0],clk,reset,q[0],qb[0]);
xor x0(w1 ,q[0],q[1]);


d_flip_flop dff1(w1,clk,reset,q[1],qb[1]);

and a0(w2,q[2],qb[1]);
and a1(w3,q[2],qb[0]);
and a2(w4,qb[3],qb[2],q[1],q[0]);
or o1(w5,w2,w3,w4);

d_flip_flop dff2(w5,clk,reset,q[2],qb[2]);

and a3(w6,q[3],qb[1]);
and a4(w7,q[3],qb[0]);
and a5(w8,q[2],q[1],q[0]);
or o2(w9,w6,w7,w8);

d_flip_flop dff3(w9,clk,reset,q[3],qb[3]);

endmodule