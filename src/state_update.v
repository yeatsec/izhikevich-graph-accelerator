// State Update Module
module state_update(clk, asyn_reset, i_in, v_out, u_out, fired_out);

// Inputs
input clk, asyn_reset;
input [16:0] i_in;

// Outputs
output fired_out;
output [16:0] v_out, u_out;

// Wires
wire clk, asyn_reset;
wire [16:0] i_in;

// Regs
reg fired_out;
reg [16:0] v_out, u_out;


// Internal Signals
wire [16:0] v_inter, u_inter, v_in, u_in; // inter goes from iz to regs, in goes from regs to iz
wire fire_inter; // inter goes from iz to regs

assign v_in = v_out;
assign u_in = u_out;
izhikevich U1(clk, 17'b0_0000_0000_0000_0101, 17'b0_0000_0000_0011_0011, 17'b1_0011_0000_0000_0000, 17'b0_0000_0010_0000_0000, v_in, u_in, i_in, v_inter, u_inter, fire_inter);

always @(posedge clk, posedge asyn_reset) begin
	if (asyn_reset) begin
		fired_out <= 1'b0;
		v_out <= 17'b0_0000_0000_0000_0000;
		u_out <= 17'b0_0000_0000_0000_0000;
	end
	else begin
		fired_out <= fire_inter;
		v_out <= v_inter;
		u_out <= u_inter;
	end
end

endmodule