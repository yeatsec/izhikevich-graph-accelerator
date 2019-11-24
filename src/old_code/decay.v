//Current Decay module
module decay (clk, write, decay, curr_in1, curr_in2, i_prime1, i_prime2, i1, i2);

// Outputs
output [16:0] i1, i2, i_prime1, i_prime2;

// Inputs
input clk, write;
input [16:0] decay, curr_in1, curr_in2;

// Wire declarations
wire clk, write;
wire [16:0] decay, curr_in1, curr_in2;

// Register declarations
reg [16:0] i1, i2, i_prime1, i_prime2;

// Internel signals
wire [16:0] buff1, buff2;

// Keep multiplication of I on hand to eventually assign to I'
fixed_mult U1(i1, decay, buff1);
fixed_mult U2(i2, decay, buff2);

// Sequential logic
always @ (posedge clk) begin
	if (write == 1'b1) begin
		i_prime1 <= buff1;
		i_prime2 <= buff2;
		i1 <= curr_in1;
		i2 <= curr_in2;
	end
	else begin
		i1 <= i_prime1;
		i2 <= i_prime2;
		i_prime1 <= buff1;
		i_prime2 <= buff2;
	end
end

endmodule