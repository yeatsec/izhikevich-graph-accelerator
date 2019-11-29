//Izhikevich module
module izhikevich_pipeline (clk, a, b, c, d, v, u, i, v_prime, u_prime, fired);

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
reg [16:0] v_prime, u_prime;
reg fired;

// Internal signals
wire [16:0] mult1, mult2, mult3, mult4, mult5, inter, add1, add2, add3, add4, new_v, new_u, new_u2;
wire [16:0] mult_wire1_1, mult_wire2_1, mult_wire3_1, a_wire1, v_wire1, u_wire1, i_wire1, c_wire1, d_wire1;
wire [16:0] sub_wire1, mult_wire4_1, mult_wire2_2, a_wire2, v_wire2, u_wire2, i_wire2, c_wire2, d_wire2;
wire [16:0] mult_wire5_1, sub_wire2, i_wire3, v_wire3, u_wire3, c_wire3, d_wire3;
reg [16:0] mult_reg1_1, mult_reg2_1, mult_reg3_1, a_reg1, v_reg1, u_reg1, i_reg1, c_reg1, d_reg1; 
reg [16:0] sub_reg1, mult_reg4_1, mult_reg2_2, a_reg2, v_reg2, u_reg2, i_reg2, c_reg2, d_reg2;
reg [16:0] mult_reg5_1, sub_reg2, i_reg3, v_reg3, u_reg3, c_reg3, d_reg3;
 
// Combinational logic

// Stage 1 for V
fixed_mult U1(17'b0_0000_0000_0000_1010, v, mult1); // 0.039*v
fixed_mult U2(17'b0_0000_0101_0000_0000, v, mult2); // 5*v: PROBLEM- Limits our C because of overflow
fixed_mult U3(b, v, mult3); // b*v
// mult_reg1_1 <= mult1
assign mult_wire1_1 = mult_reg1_1;
// mult_reg2_1 <= mult2
assign mult_wire2_1 = mult_reg2_1;
// mult_reg3_1 <= mult3
assign mult_wire3_1 = mult_reg3_1;
// a_reg1 <= a
assign a_wire1 = a_reg1;
// v_reg1 <= v
assign v_wire1 = v_reg1;
// u_reg1 <= u
assign u_wire1 = u_reg1;
// i_reg1 <= i
assign i_wire1 = i_reg1;
// c_reg1 <= c
assign c_wire1 = c_reg1;
// d_reg1 <= d
assign d_wire1 = d_reg1;

// Stage 2 for V
fixed_mult U4(mult_wire1_1, v_wire1, mult4); // 0.039*v*v
fixed_adder2 U5(mult4, u_wire1, 1'b1, inter); // b*v - u
// sub_reg1 <= inter
assign sub_wire1 = sub_reg1;
// mult_reg4_1 <= mult4
assign mult_wire4_1 = mult_reg4_1;
// mult_reg2_2 <= mult_wire2_1
assign mult_wire2_2 = mult_reg2_2;
// a_reg2 <= a_wire1
assign a_wire2 = a_reg2;
// v_reg2 <= v_wire1
assign v_wire2 = v_reg2;
// u_reg2 <= u_wire1
assign u_wire2 = u_reg2;
// i_reg2 <= i_wire1
assign i_wire2 = i_reg2;
// c_reg2 <= c_wire1
assign c_wire2 = c_reg2;
// d_reg2 <= d_wire1
assign d_wire2 = d_reg2;

// Stage 3 for V
fixed_adder2 U6(mult_wire2_2, mult_wire4_1, 1'b0, add1); // 0.039*v*v + 5*v
fixed_adder2 U7(add1, 17'b0_1000_1100_0000_0000, 1'b0, add2); // 0.039*v*v + 5*v + 140
fixed_adder2 U8(add2, u_wire2, 1'b1, add3); // 0.039*v*v + 5*v + 140 - u
fixed_mult U9(a_reg2, sub_wire1, mult5); // a*(b*v - u)
// mult_reg5_1 <= mult5
assign mult_wire5_1 = mult_reg5_1;
// sub_reg2 <= add3
assign sub_wire2 = sub_reg2;
// i_reg3 <= i_wire2
assign i_wire3 = i_reg3;
// v_reg3 <= v_wire2
assign v_wire3 = v_reg3;
// u_reg3 <= u_wire2
assign u_wire3 = u_reg3;
// c_reg3 <= c_wire2
assign c_wire3 = c_reg3;
// d_reg3 <= d_wire2
assign d_wire3 = d_reg3;

// Stage 4 for V
fixed_adder2 U10(sub_wire2, i_wire3, 1'b0, add4); // 0.039*v*v + 5*v + 140 - u + i
fixed_adder2 U11(add4, v_wire3, 1'b0, new_v); // v + 0.039*v*v + 5*v + 140 - u + i
fixed_adder2 U12(mult_wire5_1, u_wire3, 1'b0, new_u); // u + a*(b*v - u)
fixed_adder2 U13(u_wire3, d_wire3, 1'b0, new_u2); // u + d
// v_prime <= new_v or c_wire3
// u_prime <= new_u or new_u2

// Sequential logic
always @ (posedge clk) begin
	if ((new_v[15:0] >= 16'b0001_1110_0000_0000) && (new_v[16] == 1'b0)) begin
		// Stage 1
		mult_reg1_1 <= mult1;
		mult_reg2_1 <= mult2;
		mult_reg3_1 <= mult3;
		a_reg1 <= a;
		v_reg1 <= v;
		u_reg1 <= u;
		i_reg1 <= i;
		c_reg1 <= c;
		d_reg1 <= d;

		// Stage 2
		sub_reg1 <= inter;
		mult_reg4_1 <= mult4;
		mult_reg2_2 <= mult_wire2_1;
		a_reg2 <= a_wire1;
		v_reg2 <= v_wire1;
		u_reg2 <= u_wire1;
		i_reg2 <= i_wire1;
		c_reg2 <= c_wire1;
		d_reg2 <= d_wire1;

		// Stage 3
		mult_reg5_1 <= mult5;
		sub_reg2 <= add3;
		i_reg3 <= i_wire2;
		v_reg3 <= v_wire2;
		u_reg3 <= u_wire2;
		c_reg3 <= c_wire2;
		d_reg3 <= d_wire2;

		// Stage 4
		v_prime <= c_wire3;
		u_prime <= new_u2;
		fired <= 1'b1;
	end
	else begin
		// Stage 1
		mult_reg1_1 <= mult1;
		mult_reg2_1 <= mult2;
		mult_reg3_1 <= mult3;
		a_reg1 <= a;
		v_reg1 <= v;
		u_reg1 <= u;
		i_reg1 <= i;
		c_reg1 <= c;
		d_reg1 <= d;

		// Stage 2
		sub_reg1 <= inter;
		mult_reg4_1 <= mult4;
		mult_reg2_2 <= mult_wire2_1;
		a_reg2 <= a_wire1;
		v_reg2 <= v_wire1;
		u_reg2 <= u_wire1;
		i_reg2 <= i_wire1;
		c_reg2 <= c_wire1;
		d_reg2 <= d_wire2;

		// Stage 3
		mult_reg5_1 <= mult5;
		sub_reg2 <= add3;
		i_reg3 <= i_wire2;
		v_reg3 <= v_wire2;
		u_reg3 <= u_wire2;
		c_reg3 <= c_wire2;
		d_reg3 <= d_wire2;

		// Stage 4
		v_prime <= new_v;
		u_prime <= new_u;
		fired <= 1'b0;
	end
end

endmodule