// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// FIFO

// Redoing the Fire Fifo

module fifo(clk, enq, deq, asyn_reset, in_tag, out_tag, full, empty);

    parameter numneurons = 2;
    parameter tagbits = 1;

    input clk, enq, deq, asyn_reset;
    input [tagbits-1:0] in_tag;
    output [tagbits-1:0] out_tag;
    output full, empty;

    wire clk, enq, deq, asyn_reset;
    reg full, empty;
    reg [tagbits-1:0] out_tag;

    reg [tagbits-1:0] mem [0:numneurons-1];
    reg [tagbits-1:0] ptr;

    reg [tagbits-1:0] ptr_next;
    reg isfull, isempty;
    reg isfull_next, isempty_next;
    reg [tagbits:0] j;

    // state update
    always @(posedge clk, posedge asyn_reset) begin

        if (asyn_reset) begin 
            for (j=0; j<numneurons; j=j+1)
                mem[j] <= 0;
            ptr <= 0;
            isfull <= 1'b0;
            isempty <= 1'b1;
        end else begin
            if (!isfull)
                mem[ptr] = in_tag;
            else
                mem[ptr] = mem[ptr];
            ptr = ptr_next;
            isfull <= isfull_next;
            isempty <= isempty_next;
        end
    end

    // state change logic
    always @(*) begin
        if (enq && deq && !isempty && !isfull) begin
            ptr_next <= ptr;
            isfull_next <= isfull;
            isempty_next <= isempty;
        end else if (enq && !deq && !isfull) begin
            ptr_next <= ptr + 1;
            if (ptr_next == 0) // will evaluate correctly once ptr_next updates
                isfull_next <= 1'b1;
            else
                isfull_next <= 1'b0;
            isempty_next <= 1'b0; // cannot be empty
        end else if (!enq && deq && !isempty) begin
            ptr_next <= ptr - 1;
            if (ptr_next == 0) // will evaluate correctly once ptr_next updates
                isempty_next <= 1'b1;
            else
                isempty_next <= 1'b0;
            isfull_next <= 1'b0; // cannot be full
        end else begin // default
            ptr_next <= ptr;
            isfull_next <= isfull;
            isempty_next <= isempty;
        end
    end

    // outputs
    always @(*) begin
        full <= isfull;
        empty <= isempty;
        out_tag <= mem[0];
    end

endmodule