// Decay Testbench
module decay_tb();

reg in_clk, in_write;
reg [16:0] in_decay, in_curr_in1, in_curr_in2;
wire [16:0] out_i_prime1, out_i_prime2, out_i1, out_i2;

//create an FSM instance.
decay U1 (.clk (in_clk),
		.write (in_write),
               	.decay (in_decay),
               	.curr_in1 (in_curr_in1),
		.curr_in2 (in_curr_in2),
		.i_prime1 (out_i_prime1),
		.i_prime2 (out_i_prime2),
		.i1 (out_i1),
		.i2 (out_i2));

initial
begin

// cycle 0
in_write = 1'b1;
in_decay = 17'b0_0000_0000_1000_0000;
in_curr_in1 = 17'b0_1000_0000_0000_0000;
in_curr_in2 = 17'b0_1000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_write = 1'b0;
in_decay = 17'b0_0000_0000_1000_0000;
in_curr_in1 = 17'b0_0000_0000_0000_0000;
in_curr_in2 = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 2
in_write = 1'b0;
in_decay = 17'b0_0000_0000_1000_0000;
in_curr_in1 = 17'b0_0000_0000_0000_0000;
in_curr_in2 = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 3
in_write = 1'b0;
in_decay = 17'b0_0000_0000_1000_0000;
in_curr_in1 = 17'b0_0000_0000_0000_0000;
in_curr_in2 = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("in_clk, \t in_write, \t in_decay, \t in_curr_in1, \t in_curr_in2, \t out_i_prime1, \t out_i_prime2, \t out_i1, \t out_i2");  
$stop;

end 

endmodule