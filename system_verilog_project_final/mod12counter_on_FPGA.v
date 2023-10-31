//Code for Mod12COunter Implementation in FPGA
//seperate code (only this code was used for FPGA implementation)
module mod12counter(clk,reset,q, segment, ctrl);
input clk,reset;
output [3:0]q;
output reg [7:0] segment;
output reg [3:0] ctrl;
wire [3:0]qb;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
integer i,j; 
reg clkdiv, clkdiv2, flag; 
initial begin
		i = 0;
		j = 0;
		clkdiv = 1'b0;
		clkdiv2 = 1'b0;
		flag = 1'b0;
end
always @(posedge clk) begin
		i = i+1; j = j+1;
		if (i == 2000000) begin
			clkdiv = ~clkdiv;
			i = 0;
		end
		if (j == 2000) begin
			clkdiv2 = ~clkdiv2;
			j = 0;
		end
end
always@(posedge clkdiv2) begin
	if (flag == 1'b0) begin
		ctrl = 4'b0111;
		case (q)
			4'd0:segment=8'b11111100;
			4'd1:segment=8'b01100000; 
			4'd2:segment=8'b11011010;  
			4'd3:segment=8'b11110010; 
			4'd4:segment=8'b01100110; 
			4'd5:segment=8'b10110110; 
			4'd6:segment=8'b10111110; 
			4'd7:segment=8'b11100000; 
			4'd8:segment=8'b11111110; 
			4'd9:segment=8'b11110110;  
			4'd10:segment=8'b11111100;
			4'd11:segment=8'b01100000;
			4'd12:segment=8'b01100000; 
		endcase
		flag = 1'b1;
	end
	else begin
ctrl = 4'b1011;
		case (q)
			4'd10:segment=8'b01100000;
			4'd11:segment=8'b01100000; 
			4'd12:segment=8'b01100000;  
			default: segment=8'b11111100;       
		endcase
		flag = 1'b0;
	end
end
//according to circuit diagram
d_flip_flop dff0(qb[0],clkdiv,reset,q[0],qb[0]);
xor x0(w1 ,q[0],q[1]);
d_flip_flop dff1(w1,clkdiv,reset,q[1],qb[1]);

and a0(w2,q[2],qb[1]);
and a1(w3,q[2],qb[0]);
and a2(w4,qb[3],qb[2],q[1],q[0]);
or o1(w5,w2,w3,w4);

d_flip_flop dff2(w5,clkdiv,reset,q[2],qb[2]);

and a3(w6,q[3],qb[1]);
and a4(w7,q[3],qb[0]);
and a5(w8,q[2],q[1],q[0]);
or o2(w9,w6,w7,w8);

d_flip_flop dff3(w9,clkdiv,reset,q[3],qb[3]);

endmodule