//Current Decay module
module decay (clk, write, decay, curr_in1, curr_in2, i_prime1, i_prime2, i1, i2);

// Outputs
output [15:0] i1, i2;

// Inputs
input clk, write;
input [15:0] decay, curr_in1, curr_in2, i_prime1, i_prime2;

// Wire declarations
wire clk, write;
wire [15:0] decay, curr_in1, curr_in2;

// Register declarations
reg [15:0] i1, i2, i_prime1, i_prime2;

// Internel signals
reg [15:0] buff1, buff2;

// Sequential logic
always @ (posedge clk) begin
	if (write == 1'b1) begin
		i_prime1 <= curr_in1;
		i_prime2 <= curr_in2;
		i1 <= 1'b0;
		i2 <= 1'b0;
	end
	else begin
		buff1 = i1*decay;
		buff2 = i2*decay;
		i1 = i_prime1;
		i2 = i_prime2;
		i_prime1 = buff1;
		i_prime2 = buff2;
	end
end

endmodule