//modulo12counter_tb.sv file
//This module implements modulo12counter using normal testbench 
module modulo12counter_tb;
    parameter PERIOD = 10;
    parameter HALF_PERIOD = PERIOD / 2;
    reg clk;//inputs
    reg reset;
    wire [3:0] q; //output
    modulo12counter dut(clk, reset, q);
    always #HALF_PERIOD clk = ~clk;
    initial begin
      $dumpfile("modulo12counter_tb.vcd");
      $dumpvars(0,modulo12counter_tb);
    clk = 0;
    reset = 1;
    #1;
    reset = 0;
    repeat(30) @(posedge clk);
    $finish;
    end
    always @(posedge clk) begin
    $display("Output: %b", q);
    end
endmodule