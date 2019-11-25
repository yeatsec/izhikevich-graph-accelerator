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

module synaptic_processing_unit(clk, asyn_reset, fifo_empty, req_deq, req_write_i_next, weight_in, i_next_in, i_next_out, src_tag_in, src_tag_out, dst_tag_out);

    parameter numneurons = 2;
    parameter numwidth = 16;
    parameter tagbits = 1;

    // FSM States
    parameter numstates = 5;
    parameter wait_src = 5'b00001;
    parameter fetch_src = 5'b00010;
    parameter fetch_dst_wgt_inext = 5'b00100;
    parameter add_wgt_inext = 5'b01000;
    parameter write_inext = 5'b10000;

    input clk, asyn_reset, fifo_empty;
    input [numwidth:0] weight_in, i_next_in;
    input [tagbits-1:0] src_tag_in;

    output req_deq, req_write_i_next;
    output [numwidth:0] i_next_out;
    output [tagbits-1:0] src_tag_out, dst_tag_out;

    wire clk, asyn_reset, fifo_empty, req_deq;
    wire [numwidth:0] weight_in, i_next_in, i_next_out;
    wire [tagbits-1:0] src_tag_in, src_tag_out, dst_tag_out;

    reg [tagbits-1:0] src_tag_reg, dst_tag_reg, src_done;
    reg [numwidth:0] cur_i_next, cur_weight, result;
    reg [numstates-1:0] state;

    always @(posedge clk, posedge asyn_reset) begin
        if (asyn_reset) begin
            src_tag_reg[tagbits-1:0] <= 1'b0;
            dst_tag_reg[tagbits-1:0] <= 1'b0;
            src_done <= 1'b0;
            state <= wait_src;
        end
        else begin
            // fsm next state logic
            case(state)
                wait_src: begin 
                    // outputs
                    req_write_i_next <= 1'b0;
                    req_deq <= 1'b0;
                    if (!fifo_empty) begin
                        state <= #1 fetch_src;
                    end else begin
                        state <= #1 wait_src;
                    end
                end
                fetch_src: begin
                    // state deterministic
                    state <= #1 fetch_dst_wgt_inext;
                    src_tag_reg <= #1 src_tag_in; // add delay cuz don't need yet
                    // initialize dst_tag_reg to zero
                    dst_tag_reg <= 0;
                    // outputs
                    req_deq <= 1'b1; // using the value of tag next cycle
                    req_write_i_next <= 1'b0;
                end
                fetch_dst_wgt_inext: begin
                    state <= #1 add_wgt_inext;
                    // grab the values for addition
                    cur_i_next <= i_next_in;
                    cur_weight <= weight_in;
                    // outputs
                    req_deq <= 1'b0;
                    req_write_i_next <= 1'b0;
                end
                add_wgt_inext: begin
                    state <= #1 write_inext; // perform signed addition
                    result <= // need a fixed signed add module to do this work
                    req_deq <= 1'b0;
                    req_write_i_next <= 1'b0;
                end
                write_inext: begin
                    // broadcast addition result
                    req_write_i_next <= 1'b1;
                    // other outputs
                    req_deq <= 1'b0;
                    // calculate next dst_tag
                    dst_tag_reg <= dst_tag_reg + 1; // does this overflow scheme work?
                    if (dst_tag_reg == 0) begin // go to wait, no more dst tags
                        state <= #1 wait_src;
                    end else begin
                        state <= #1 fetch_dst_wgt_inext;
                    end
                end
            endcase          
        end
    end
    assign src_tag_out = src_tag_reg;
    assign dst_tag_out = dst_tag_reg;
    // TODO - assign i_next_out to be value of adder
endmodule