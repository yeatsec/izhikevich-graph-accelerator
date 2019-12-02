module state_update_tb();

reg in_clk;
reg [16:0] in_i_in;
wire [16:0] out_v_out, out_u_out;
wire out_fired_out;

state_update U1 (.clk (in_clk),
		.i_in (in_i_in),
		.v_out (out_v_out),
		.u_out (out_u_out),
		.fired_out (out_fired_out));

initial
begin

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 0
in_i_in = 17'b0_0000_1100_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("clk, \t in_i_in, \t out_v_out, \t out_u_out, \t out_fired_out");  
$stop;

end 

endmodule