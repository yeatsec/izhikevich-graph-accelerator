// Compute In Memory Testbench

module compute_in_memory_tb();

reg in_clk, in_asyn_reset, in_swap, in_fifo_empty;
reg [0:0] in_fired_tag, in_i_tag;
wire [16:0] out_i_out;
wire out_busy, out_req_deq;
wire [1:0] out_state_out;
compute_in_memory U1 (.clk (in_clk),
								.asyn_reset (in_asyn_reset),
                                .swap (in_swap),
                                .fifo_empty (in_fifo_empty),
                                .busy (out_busy),
                                .req_deq (out_req_deq),
                                .fired_tag (in_fired_tag),
                                .i_tag (in_i_tag),
                                .i_out (out_i_out),
                                .state_out (out_state_out));

initial
begin

// cycle 0
in_asyn_reset = 1'b1;
in_swap = 1'b0;
in_fifo_empty = 1'b0;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 2
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 3 - fetch tag
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b0;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 4 - do add
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b0;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 5 - latch result, next tag
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b0;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 6 - fetch tag
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 7 - do add
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 8 - compute i_next
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 9 - wait
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 10 - swap
in_asyn_reset = 1'b0;
in_swap = 1'b1;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 11 - check swap
in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 12 - check swap (2nd cycle)
in_asyn_reset = 1'b0;
in_swap = 1'b1;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

in_asyn_reset = 1'b0;
in_swap = 1'b0;
in_fifo_empty = 1'b1;
in_fired_tag = 1'b0;
in_i_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5


$display ("clk, \t in_asyn_reset, \t in_fifo_empty, \t in_fired_tag, \t in_i_tag, \t out_busy, \t out_req_deq, \t out_i_out, \t out_state_out");
$stop;

end

endmodule