// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Fire Fifo


// This module will store the tags of neurons
// that fire in a given time step. The tags are
// stored for processing by the synaptic update proc.
// the producer should only enqueue when not full
// the consumer should only dequeue when not empty

module fire_fifo(clk, enq, deq, asyn_reset, in_tag, out_tag, full, empty);
    
    parameter numneurons = 2;
    parameter tagbits = 1;

    input clk, enq, deq, asyn_reset;
    input [tagbits-1:0] in_tag;
    output [tagbits-1:0] out_tag;
    output full, empty;
    
    wire clk, enq, deq, asyn_reset, full, empty;
    wire [tagbits-1:0] in_tag, out_tag;
    
    reg [tagbits-1:0] next; // points to next position to fill
    reg [tagbits-1:0] mem [0:numneurons-1]; // tagbits-wide mem with numneurons elements
    reg isfull, isempty;
    reg [3:0] j;
    
    // do some good good assignment
    assign full = isfull;
    assign empty = isempty;
    assign out_tag = mem[0];
    
    // stateful info
    always @(posedge clk, posedge asyn_reset) begin
        if (asyn_reset) begin
	    for (j=0; j<numneurons; j=j+1)
            	mem[j] <= 0; // set all to zero :|
            next <= 0;
            isfull <= 1'b0;
            isempty <= 1'b1;
	end
        else begin
            if (enq && deq) begin // shift down and insert weird
                if (!isempty) begin
                    mem[next-1] <= in_tag;
                    isempty <= 1'b0;
                    if (next > 1) begin// more than one thing in the fifo, shift & insert
                        for (j=1; j<next; j=j+1)
			    mem[j-1] <= mem[j]; // confusing
                        mem[next-1] <= in_tag;
		    end
                    else // only one thing in fifo, just replace
                        mem[0] <= in_tag;
		end
	    end
            else
                if (enq) begin
                    if (!isfull) begin // there is still room
                        mem[next] <= in_tag;
                        next <= next + 1;
                        isempty <= 1'b0;
                        if (next == (tagbits-1)) // overflow
                            isfull <= 1'b1;
		    end
		end
                if (deq) begin
                    if (!isempty) begin
			for (j=1; j<numneurons; j=j+1)
                        	mem[j-1] <= mem[j]; // shift down
                        mem[numneurons-1] <= 0;
                        next <= next - 1;
                        isfull <= 1'b0;
                        if (next == 0)
                            isempty <= 1'b1;
		    end
		end
	    end
    	end
endmodule