// Synaptic Processing Unit 2 Testbench

module synaptic_processing_unit_tb2();

reg in_clk, in_asyn_reset, in_fifo_empty, in_src_tag_in;
reg [16:0] in_weight_in, in_i_next_in;
wire out_req_write_i_next, out_req_deq, out_busy, out_src_tag_out, out_dst_tag_out;
wire [16:0] out_i_next_out;
wire [4:0] out_state;

synaptic_processing_unit2 U1 (.clk (in_clk),
								.asyn_reset (in_asyn_reset),
								.fifo_empty (in_fifo_empty),
								.weight_in (in_weight_in),
								.i_next_in (in_i_next_in),
								.src_tag_in (in_src_tag_in),
								.state(out_state),
								.req_write_i_next (out_req_write_i_next),
								.req_deq (out_req_deq),
								.busy (out_busy),
								.i_next_out (out_i_next_out),
								.src_tag_out (out_src_tag_out),
								.dst_tag_out (out_dst_tag_out));

initial
begin

// cycle 0
// in_asyn_reset = 1'b1;
// in_fifo_empty = 1'b0;
// in_weight_in = 17'b0_0000_0000_0000_0000;
// in_i_next_in = 17'b0_0000_0000_0000_0000;
// in_src_tag_in = 1'b0;
// in_clk = 1'b1;
// #5
// in_clk = 1'b0;
// #5

// cycle 0
in_asyn_reset = 1'b1;
in_fifo_empty = 1'b0;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_i_next_in = 17'b0_0000_0000_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_i_next_in = 17'b0_0000_0000_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_i_next_in = 17'b0_0000_0000_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_i_next_in = 17'b0_0000_0000_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 4
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b0;
in_weight_in = 17'b0_0000_1000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0000;
in_src_tag_in = 1'b1;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 5 read in src tag
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b0;
in_weight_in = 17'b0_0000_1000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0000;
in_src_tag_in = 1'b1;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 6 read in weight and i next
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b0;
in_weight_in = 17'b0_0000_1000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 7 does addition
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b0;
in_weight_in = 17'b0_0000_1000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 8 assert write i_next
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0000_1000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0000;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 9 fsm goes to fetch dst weight inext
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0001_0000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0001;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 10 perform addition
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0001_0000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0001;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 11 writeback for dst=1
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0001_0000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0001;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 12 go to wait
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0001_0000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0001;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 13 stay in wait
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b0; // fifo will be ready to dequeue
in_weight_in = 17'b0_0001_0000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0001;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 14 start working on next job
in_asyn_reset = 1'b0;
in_fifo_empty = 1'b1;
in_weight_in = 17'b0_0001_0000_0000_0000;
in_i_next_in = 17'b0_0000_0001_0000_0001;
in_src_tag_in = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("clk, \t in_asyn_reset, \t in_fifo_empty, \t in_weight_in, \t in_i_next_in, \t in_src_tag_in, \t out_req_write_i_next, \t out_req_deq, \t out_busy, \t out_i_next_out, \t out_src_tag_out, \t out_dst_tag_out");
$stop;

end

endmodule