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

module synaptic_processing_unit(clk, asyn_reset, fifo_empty, weight_in, i_next_in, src_tag_in, req_write_i_next, req_deq, busy, i_next_out, src_tag_out, dst_tag_out, state);

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

    output req_deq, req_write_i_next, busy;
    output [numwidth:0] i_next_out;
    output [tagbits-1:0] src_tag_out, dst_tag_out;
    output [numstates-1:0] state;

    wire clk, asyn_reset, fifo_empty;
    wire [tagbits-1:0] src_tag_in;
    wire [numwidth:0] weight_in, i_next_in, add1;
    reg req_deq, busy, req_write_i_next;
    reg [numwidth:0] i_next_out;
    reg [tagbits-1:0] src_tag_out, dst_tag_out;

    reg [tagbits-1:0] src_tag_reg, dst_tag_reg;
    reg [numwidth:0] cur_i_next, cur_weight, result;
    reg [numstates-1:0] state, state_next;
    fixed_adder2 U1(cur_i_next, cur_weight, 1'b0, add1);

    // State Update
    always @(posedge clk, posedge asyn_reset) begin
        if (asyn_reset) begin
            src_tag_reg <= 0;
            dst_tag_reg <= 0;
            state <= wait_src;
        end
        else begin
            // FSM next state logic
            case(state)
                wait_src: begin 
                    dst_tag_reg <= dst_tag_reg;
                    src_tag_reg <= src_tag_reg;
                    cur_i_next <= cur_i_next;
                    cur_weight <= cur_weight;
                    result <= result;
                    busy <= 1'b0;
                    req_deq <= 1'b0;
                    req_write_i_next <= 1'b0;
                    if (!fifo_empty) begin 
                        state_next <= fetch_src;
                    end 
                    else begin
                        state_next <= wait_src;
                    end
                end
                fetch_src: begin
                    state_next <= fetch_dst_wgt_inext;
                    dst_tag_reg <= dst_tag_reg;
                    src_tag_reg <= src_tag_in; // latch
                    cur_i_next <= cur_i_next;
                    cur_weight <= cur_weight;
                    result <= result;
                    busy <= 1'b1;
                    req_deq <= 1'b1; // FIFO state change
                    req_write_i_next <= 1'b0;
                end
                fetch_dst_wgt_inext: begin
                    state_next <= add_wgt_inext;
                    dst_tag_reg <= dst_tag_reg;
                    src_tag_reg <= src_tag_reg;
                    cur_i_next <= i_next_in; // latch
                    cur_weight <= weight_in; // latch
                    result <= result;
                    busy <= 1'b1;	
                    req_deq <= 1'b0;
                    req_write_i_next <= 1'b0;
                end
                add_wgt_inext: begin
                    state_next <= write_inext;
                    dst_tag_reg <= dst_tag_reg;
                    src_tag_reg <= src_tag_reg;
                    cur_i_next <= cur_i_next;
                    cur_weight <= cur_weight;
                    result <= add1; // latch
                    busy <= 1'b1;
                    req_deq <= 1'b0;
                    req_write_i_next <= 1'b0;
                end
                write_inext: begin
                    dst_tag_reg <= dst_tag_reg + 1;
                    src_tag_reg <= src_tag_reg;
                    cur_i_next <= cur_i_next;
                    cur_weight <= cur_weight;
                    result <= result;
                    busy <= 1'b1;
                    req_deq <= 1'b0;
                    req_write_i_next <= 1'b1; // current_update state
                    if (dst_tag_reg == 0) begin // go to wait, no more dst tags
                        state_next <= wait_src;
                    end 
                    else begin
                        state_next <= fetch_dst_wgt_inext;
                    end
                end
            endcase

            // FSM output
            state <= state_next;
            i_next_out <= result; // result always up
            src_tag_out <= src_tag_reg;
            dst_tag_out <= dst_tag_reg;
        end
    end
        

endmodule