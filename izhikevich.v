//Izhikevich module
module izhikevich (clk, a, b, c, d, v, u, i, v_prime, u_prime, fired);

// Outputs
output [15:0] v_prime, u_prime, fired;

// Inputs
input clk;
input [15:0] a, b, c, d, v, u, i;

// Wire declarations
wire clk;
wire [15:0] a, b, c, d, v, u, i;

// Register declarations
reg [15:0] v_prime, u_prime, fired;

// Internal signals
wire [15:0] new_v;
wire [15:0] new_u;

// Combinational logic
assign new_v = 16'b0000_0000_0000_1010*v*v + 16'b0000_0101_0000_0000*v + 16'b1000_1100_0000_0000 - u + i;
assign new_u = a*(b*v - u);

// Sequential logic
always @ (posedge clk) begin
	if (new_v >= 16'b0001_1110_0000_0000) begin
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