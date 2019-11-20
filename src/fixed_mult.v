// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Fixed Point Multiply


// This module will take two signed fixed-point
// numbers, multiply them, and return the result

parameter numwidth = 16 // 1 sign + 8 int + 8 frac, 0-based

module fixed_mult(
    input clk,
    input [numwidth:0] a, b,
    output [numwidth:0] ab,
    output clip_int, clip_frac);
    wire [2*numwidth:0] multresult;
    always @(posedge clk) // latch the multiplication result, everything else func logic
        multresult <= a[numwidth-1:0] * b[numwidth-1:0]; // exclude sign bit
    assign ab[numwidth-1:0] = multresult[(3*numwidth/2)-1:numwidth/2]; // ab is middle numwidth
    assign ab[numwidth] = a[numwidth] ^ b[numwidth] // insert the sign bit
    if (multresult[2*numwidth:3*numwidth/2])
        assign clip_int = 1'b1;
    else
        assign clip_int = 1'b0;
    if (multresult[(numwidth/2)-1:0])
        assign clip_frac = 1'b1;
    else
        assign clip_frac = 1'b0;
endmodule