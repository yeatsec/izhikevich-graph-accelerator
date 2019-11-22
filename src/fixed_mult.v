// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Fixed Point Multiply


// This module will take two signed fixed-point
// numbers, multiply them, and return the result

//parameter numwidth = 16; 1 sign + 8 int + 8 frac, 0-based

module fixed_mult(a, b, ab); //, clip_int, clip_frac);
    input [16:0] a, b;
    output [16:0] ab;
    // output clip_int, clip_frac;

    wire [16:0] a, b;
    wire [16:0] ab;
    wire[31:0] multresult;
    // wire clip_int, clip_frac;

    assign multresult = a[15:0] * b[15:0]; // exclude sign bit
    assign ab[15:0] = multresult[23:8]; // ab is middle numwidth
    assign ab[16] = a[16] ^ b[16]; // insert the sign bit
    // assign clip_int = |multresult[31:24];
    // assign clip_frac = |multresult[7:0];

endmodule