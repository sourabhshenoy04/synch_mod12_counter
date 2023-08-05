//counter_pkg.sv file
//This module implements modulo 12 counter package (using OOP concepts)
package counter_pkg;
class Mod12Counter;
// Member variables
bit [3:0] q;
bit clk;
bit reset;
//Constructor
function new(bit clk1, bit reset1);
    clk = clk1;
    reset = reset1;
endfunction
// Mod-12 counter logic
function void update(reset);
    if (reset)
        q = 4'b0000;
    else if (q <4'b1111)
        q = q + 1'b1;
    else
        q= 4'b0000;
endfunction
    function void getOutput(  bit [3:0] out);
    if (reset==0)
        out = q;
    endfunction
    endclass
endpackage