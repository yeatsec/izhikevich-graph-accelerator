//Izhikevich module
module izhikevich (clk, a, b, c, d, v, u, i, v_prime, u_prime, fired);

// Outputs
output [16:0] v_prime, u_prime;
output fired;

// Inputs
input clk;
input [16:0] a, b, c, d, v, u, i;

// Wire declarations
wire clk;
wire [16:0] a, b, c, d, v, u, i;

// Register declarations
reg [16:0] v_prime, u_prime, fired;

// Internal signals
wire [16:0] new_v, new_u, mult1, mult2, mult3, mult4, inter, add1, add2, add3;

// Combinational logic
fixed_mult U1(17'b0_0000_0000_0000_1010,v,mult1);
fixed_mult U2(mult1,v,mult2);
fixed_mult U3(17'b0_0000_0101_0000_0000,v,mult3);

fixed_adder U6(clk, mult2, mult3, 1'b0, add1);
fixed_adder U7(clk, add1, 17'b0_1000_1100_0000_0000, 1'b0, add2);
fixed_adder U8(clk, add2, u, 1'b1, add3);
fixed_adder U9(clk, add3, i, 1'b0, new_v);

//assign new_v = mult2 + mult3 + 17'b0_1000_1100_0000_0000 - u + i;
fixed_mult U4(b,v,mult4);
fixed_adder U10(clk, mult4, u, 1'b1, inter);
//assign inter = mult4 - u;
fixed_mult U5(a,inter,new_u);

// Sequential logic
always @ (posedge clk) begin
	if (new_v >= 17'b0_0001_1110_0000_0000) begin
		v_prime <= c;
		u_prime <= u + d;
		fired <= 1'b1;
	end
	else begin
		v_prime <= new_v;
		u_prime <= new_u;
		fired <= 1'b0;
	end
end

endmodule