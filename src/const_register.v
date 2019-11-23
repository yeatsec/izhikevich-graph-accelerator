// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Constant Register


// This module will store the a, b, c, d constants
// for each of the neurons in the network
// Support a write port and read port, however the
// write port will only be used at user program time

parameter numwidth = 16
parameter linewidth = numwidth*4 + 3 // room for a, b, c, d; inc. sign bits
parameter numneurons = 2
parameter tagbits = 1

module const_register(clk, write_en, write_tag, write_value, read_tag, read_value);
    // inputs
    input clk, write_en;
    input [linewidth:0] write_value;
    input [tagbits-1:0] write_tag, read_tag;

    // output
    output [linewidth:0] read_value;
    
    // local storage
    reg [linewidth:0] mem [0:numneurons-1];
    always @(posedge clk) begin
        // support write port
        if (write_en)
            mem[write_tag] <= write_value;
    end
    // support functional read port
    assign read_value = mem[read_tag];
endmodule
