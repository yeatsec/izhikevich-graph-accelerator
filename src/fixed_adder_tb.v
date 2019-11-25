// Fixed Adder Testbench
module fixed_adder_tb();

reg in_clk, in_sub;
reg [16:0] in_a, in_b;
wire [16:0] out_sum;

fixed_adder U1 (.clk (in_clk),
               .a (in_a),
               .b (in_b),
               .sub (in_sub),
               .sum (out_sum));

initial
begin

// cycle 0
in_a = 17'b0_0000_0010_0000_0000;
in_b = 17'b0_0000_0100_0000_0000;
in_sub = 1'b0;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_a = 17'b0_0000_0010_0000_0000;
in_b = 17'b1_0000_0100_0000_0000;
in_sub = 1'b1;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("in_clk, \t in_a, \t in_b, \t in_sub, \t out_sum"); 
$stop;

end 

endmodule