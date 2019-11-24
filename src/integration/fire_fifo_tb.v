// Fire FIFO Testbench
module fire_fifo_tb();

reg in_clk, in_enq, in_deq, in_asyn_reset, in_in_tag;
wire out_out_tag, out_full, out_empty;

//create an FSM instance.
fire_fifo U1 (.clk (in_clk),
		.enq (in_enq),
		.deq (in_deq),
		.asyn_reset (in_asyn_reset),
		.in_tag (in_in_tag),
		.out_tag (out_out_tag),
		.full (out_full),
		.empty (out_empty));

initial
begin

// cycle 0
in_enq = 1'b0;
in_deq = 1'b0;
in_asyn_reset = 1'b1;
in_in_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_enq = 1'b1;
in_deq = 1'b0;
in_asyn_reset = 1'b0;
in_in_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 2
in_enq = 1'b1;
in_deq = 1'b0;
in_asyn_reset = 1'b0;
in_in_tag = 1'b1;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 3
in_enq = 1'b0;
in_deq = 1'b1;
in_asyn_reset = 1'b0;
in_in_tag = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 4
in_enq = 1'b0;
in_deq = 1'b1;
in_asyn_reset = 1'b0;
in_in_tag = 1'b1;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("in_clk, \t in_enq, \t in_deq, \t in_asyn_reset, \t in_in_tag, \t out_out_tag, \t out_full, \t out_empty");
$stop;

end 

endmodule