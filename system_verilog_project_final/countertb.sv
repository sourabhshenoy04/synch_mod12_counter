//countertb.sv file
// This module implements a modulo-12 counter testbench using OOP concept
module countertb;
import counter_pkg::*;
modulo12counter dut (.clk(clk), .reset(reset), .q(q));
// Declare inputs/outputs
reg clk, reset;
bit [3:0] temp;
wire [3:0] q;
Mod12Counter mod12counter_expected = new(clk, reset);
initial 
    begin 
        $dumpfile("countertb.vcd"); 
        $dumpvars(0, countertb);    
        clk <= 1'b0;      
        reset = 1'b1;     
        #5 $display(" Mod-12 Counter Output: %b, Expected Output: %b", q, mod12counter_expected.q);
        #8 reset = ~reset; 
        temp = 4'b0;     
        repeat(50) 
        begin   
            #5 clk = ~clk; 
        end
        $finish;           
    end
always @(posedge clk, posedge reset) begin
    verify(clk, reset);
end
// Task for verifying the counter output
task verify;
    input bit clk, reset;
    begin
        mod12counter_expected.update(reset);    
        mod12counter_expected.getOutput(temp);  
        temp = mod12counter_expected.q;        
        if (q== mod12counter_expected.q) begin        
        #5 $display(" Mod-12 Counter Output: %b, Expected Output: %b, Expected and Actual Output Matched", q, mod12counter_expected.q);
        end
        else
        begin
        #5 $display(" Mod-12 Counter Output: %b, Expected Output: %b, Expected and Actual Output did not match", q, mod12counter_expected.q);
        end
    end
endtask
endmodule

