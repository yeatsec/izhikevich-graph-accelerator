// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Current Update


// This module will store the current and next current
// values for all neurons. it should support reads
// of I and writes to I_next concurrently
// At the end of a timestep, I_next should be copied
// into I and then I_next should have the decay applied

// support 1 read port of i
// support 1 read port of i_next
// support 1 write port of i_next


module current_update(clk, asyn_reset, swap, i_next_write_en, i_read_tag, i_next_read_tag, i_next_write_tag, i_next_write_value, i_next_read_value, i_read_value);
    
    parameter numwidth = 16;
    parameter tagbits = 1;
    parameter numneurons = 2;

    input clk, asyn_reset, swap;
    input i_next_write_en;
    input [tagbits-1:0] i_read_tag, i_next_read_tag, i_next_write_tag;
    input [numwidth:0] i_next_write_value;
    output [numwidth:0] i_next_read_value, i_read_value;
    
    wire clk, asyn_reset, swap;
    wire [tagbits-1:0] i_read_tag, i_next_read_tag, i_next_write_tag;
    wire [numwidth:0] i_next_write_value;
    wire [numwidth:0] i_next_read_value, i_read_value;
    reg [numwidth:0] i_next [0:numneurons-1];
    reg [numwidth:0] i [0:numneurons-1];
    reg [4:0] j;

    assign i_next_read_value = i_next[i_next_read_tag];
    assign i_read_value = i[i_read_tag];

    always @(posedge clk, posedge asyn_reset)
    begin
        if (asyn_reset) begin
	    for (j=0; j<numneurons; j=j+1)
            	i_next[j][numwidth:0] <= 17'b0_0000_0000_0000_0000;
	    for (j=0; j<numneurons; j=j+1)
            	i[j][numwidth:0] <= 17'b0_0000_0000_0000_0000;
	end
        else if (swap) begin
	    for (j=0; j<numneurons; j=j+1)
            	i[j][numwidth:0] <= i_next[j][numwidth:0];
	    for (j=0; j<numneurons; j=j+1) begin
            	i_next[j][numwidth-2:0] <= i_next[j][numwidth-1:1];
            	i_next[j][numwidth-1] <= 1'b0; // slip in a zero for right shift
	    end
	end
        else begin // do concurrent stuff
            if (i_next_write_en) // write i_next_write_value to i_next_write_tag
                i_next[i_next_write_tag] <= i_next_write_value;
	    end
    end    
endmodule