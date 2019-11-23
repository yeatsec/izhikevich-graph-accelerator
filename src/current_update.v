// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Current Update


// This module will store the current and next current
// values for all neurons. it should support reads
// of I and writes to I_next concurrently
// At the end of a timestep, I_next should be copied
// into I and then I_next should have the decay applied

parameter numwidth = 16
parameter tagbits = 1
parameter numneurons = 2

// support 1 read port of i
// support 1 read port of i_next
// support 1 write port of i_next


module current_update(
    input clk, asyn_reset, swap,
    input i_next_write_en,
    input [tagbits-1:0] i_read_tag, i_next_read_tag, i_next_write_tag,
    input [numwidth:0] i_next_write_value,
    output [numwidth:0] i_next_read_value, i_read_value);

    reg [numwidth:0] i_next [0:numneurons-1];
    reg [numwidth:0] i [0:numneurons-1];
    always @(posedge clk, posedge asyn_reset)
    begin
        if (asyn_reset) // preference for reset
            i_next[0:numneurons-1] <= 0;
            i[0:numneurons-1] <= 0;
        else if (swap) // spook
            i <= i_next; // other modules might need to be careful of "-0"
            i_next[0:numneurons][numwidth-2:0] <= i_next[0:numneurons][numwidth-1:1]
            i_next[0:numneurons][numwidth] <= i_next[0:numneurons][numwidth] // perhaps this is unecessary
            i_next[0:numneurons][numwidth-1] <= 1'b0; // slip in a zero for right shift
        else // posedge clock; do concurrent stuff
            // support i_next_write
            if (i_next_write_en) // write i_next_write_value to i_next_write_tag
                i_next[i_next_write_tag] <= i_next_write_value;
            // support i_next_read
            i_next_read_value <= i_next[i_next_read_tag];
            // support i_read
            i_read_value <= i[i_read_tag]
    end     
endmodule