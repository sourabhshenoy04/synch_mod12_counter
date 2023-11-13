//d_flip_flop.sv file
//this module implements d flip flop using behavioural approach
module d_flip_flop(input d,input clk, input reset,output reg q, output reg qb);
always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            q = 1'b0; 
            qb= 1'b1; 
        end
        else
        begin
            q=d; 
            qb=~q; 
        end
    end
endmodule