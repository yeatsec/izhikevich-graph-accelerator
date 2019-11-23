// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Fire Fifo


// This module will store the tags of neurons
// that fire in a given time step. The tags are
// stored for processing by the synaptic update proc.
// the producer should only enqueue when not full
// the consumer should only dequeue when not empty

parameter numneurons = 2
parameter tagbits = 1


module fire_fifo(clk, enq, deq, asyn_reset, in_tag, out_tag, full, empty);
    input clk, enq, deq, asyn_reset;
    input [tagbits-1:0] in_tag;
    output [tagbits-1:0] out_tag;
    output full, empty;
    reg [tagbits-1:0] next; // points to next position to fill
    reg [tagbits-1:0] mem [0:numneurons-1]; // tagbits-wide mem with numneurons elements
    reg isfull, isempty;
    // do some good good assignment
    assign full = isfull;
    assign empty = isempty;
    assign out_tag = mem[0];
    // stateful info
    always @(posedge clk, posedge asyn_reset)
    begin
        if (asyn_reset)
            mem[0:numneurons-1] <= 0; // set all to zero :|
            next <= 0;
            isfull <= 1'b0;
            isempty <= 1'b1;
        else
            if (enq && deq) // shift down and insert weird
                if ('isempty)
                    mem[next-1] <= in_tag;
                    isempty <= 1'b0;
                    if (next > 1) // more than one thing in the fifo, shift & insert
                        mem[0:next-2] <= mem[1:next-1]; // confusing
                        mem[next-1] <= in_tag;
                    else // only one thing in fifo, just replace
                        mem[0] <= in_tag
            else
                if (enq)
                    if ('isfull) // there is still room
                        mem[next] <= in_tag;
                        next <= next + 1;
                        isempty <= 1'b0;
                        if (next == 0) // overflow
                            isfull <= 1'b1
                else if (deq) // else not necessary; already est enq/deq exclusive here
                    if ('isempty)
                        mem[numneurons-2:0] <= mem[numneurons-1:1] // shift down
                        mem[numneurons-1] <= 0;
                        next <= next - 1;
                        isfull <= 1'b0;
                        if (next == 0)
                            isempty <= 1'b1;
    end
endmodule