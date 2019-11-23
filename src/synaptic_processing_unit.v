// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Synaptic Processing Unit


// this functional unit will wait to select a tag from the fired_fifo
// then loop through all tags once it receives a synaptic update job
// it will read from i_next and the efferent weight matrix, add the
// two values together, then write the result into i_next

// this processor needs its own FSM
// STATE wait OUT EDGE (fetch_src| !fifo_empty )
// STATE fetch_src OUT busy, req_deq EDGE (fetch_dst_wgt_inext)
// STATE fetch_dst_wgt_inext OUT busy

module synaptic_processing_unit(clk, asyn_reset, fifo_empty, req_deq, weight_in, i_next_in, i_next_out, src_tag_in, src_tag_out, dst_tag_out);

    parameter numneurons = 2
    parameter numwidth = 16 // just say no to semicolons
    parameter tagbits = 1


    input clk, asyn_reset, fifo_empty;
    input [numwidth:0] weight_in, i_next_in;
    input [tagbits-1:0] src_tag_in;

    output req_deq;
    output [numwidth:0] i_next_out;
    output [tagbits-1:0] src_tag_out, dst_tag_out;

    wire clk, asyn_reset, fifo_empty, req_deq;
    wire [numwidth:0] weight_in, i_next_in, i_next_out;
    wire [tagbits-1:0] src_tag_in, src_tag_out, dst_tag_out;

    reg [tagbits-1:0] src_tag_reg, dst_tag_reg;

    always @(posedge clk, posedge asyn_reset) begin
        if (asyn_reset) begin
            src_tag_reg[tagbits-1:0] <= 1'b0;
            dst_tag_reg[tagbits-1:0] <= 1'b0;
            src_done <= 1'b0;
        end
        else if (clk) begin
            

        end
    end
    assign src_tag_out = src_tag_reg;
    assign dst_tag_out = dst_tag_reg;
endmodule