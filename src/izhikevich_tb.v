module izhikevich_tb();

reg in_clk;
reg [16:0] in_a, in_b, in_c, in_d, in_v, in_u, in_i;
wire [16:0] out_v_prime, out_u_prime;
wire out_fired;

//create an FSM instance.
izhikevich U1 (.clk (in_clk),
		.a (in_a),
               	.b (in_b),
               	.c (in_c),
		.d (in_d),
		.v (in_v),
		.u (in_u),
		.i (in_i),
		.v_prime (out_v_prime),
		.u_prime (out_u_prime),
		.fired (out_fired));

initial
begin

// cycle 0
in_a = 17'b0_0000_0011_0000_0000;
in_b = 17'b0_0001_0100_0000_0000;
in_c = 17'b0_0000_0011_0000_0000;
in_d = 17'b0_0000_0011_0000_0000;
in_v = 17'b0_0000_1010_0000_0000;
in_u = 17'b0_1011_0100_0000_0000;
in_i = 17'b0_0000_0110_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_a = 17'b0_0000_0010_0000_0000;
in_b = 17'b0_0000_1111_0000_0000;
in_c = 17'b0_0010_0000_0000_0000;
in_d = 17'b0_0000_0101_0000_0000;
in_v = 17'b0_0000_1010_0000_0000;
in_u = 17'b0_0110_0100_0000_0000;
in_i = 17'b0_0000_0110_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("in_clk, \t in_a, \t in_b, \t in_c, \t in_d, \t in_v, \t in_u, \t in_i, \t out_v_prime, \t out_u_prime, \t out_fired");  
$stop;

end 

endmodule