// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// State Register


// This module will store the v, u state for each
// neuron in the simulation. The state information
// will be addressable by neuron tag.

parameter numwidth = 16 // 1 sign + 8 int + 8 frac, 0-based
parameter numneurons = 2 // should be a power of two
parameter tagbits = 1
parameter memcols = 2*numwidth+1
parameter memrows = numneurons-1

module state_register(
    input clk, write, read, asyn_reset,
    input [numwidth:0] v_new, u_new,
    input [tagbits-1:0] tag, // only one bit in 2-neuron case
    output [numwidth:0] v, u);
    reg [memcols:0] mem [0:memrows] // store v, u together

    always @(posedge clk, posedge asyn_reset)
    begin
        if (asyn_reset) // preference to asyn_reset
            // set to default values -- zero
            mem[0:memrows][0:memcols] <= 1'b0 // set everything to zero
        else // switch on read, write
            if (read) // preference to read
                v <= mem[tag][memcols:numwidth+1]
                u <= mem[tag][numwidth:0]
            else if (write)
                mem[tag][memcols:numwidth+1] <= v_new
                mem[tag][numwidth:0] <= u_new
    end
endmodule