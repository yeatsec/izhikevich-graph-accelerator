// Efferent Weight Matrix Testbench
module efferent_weight_matrix_tb();

reg in_clk, in_src_tag, in_dst_tag, in_write_en;
reg [16:0] in_weight_in;
wire [16:0] out_weight_out;

//create an FSM instance.
efferent_weight_matrix U1 (.clk (in_clk),
		.src_tag (in_src_tag),
		.dst_tag (in_dst_tag),
		.write_en (in_write_en),
		.weight_in (in_weight_in),
		.weight_out (out_weight_out));

initial
begin

// cycle 0
in_src_tag = 1'b0;
in_dst_tag = 1'b0;
in_write_en = 1'b1;
in_weight_in = 17'b1_0000_1000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 1
in_src_tag = 1'b0;
in_dst_tag = 1'b1;
in_write_en = 1'b1;
in_weight_in = 17'b0_0000_0110_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 2
in_src_tag = 1'b1;
in_dst_tag = 1'b0;
in_write_en = 1'b1;
in_weight_in = 17'b1_0001_1000_0010_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 3
in_src_tag = 1'b1;
in_dst_tag = 1'b1;
in_write_en = 1'b1;
in_weight_in = 17'b0_0110_0000_0110_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 4
in_src_tag = 1'b0;
in_dst_tag = 1'b0;
in_write_en = 1'b0;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 5
in_src_tag = 1'b0;
in_dst_tag = 1'b1;
in_write_en = 1'b0;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 6
in_src_tag = 1'b1;
in_dst_tag = 1'b0;
in_write_en = 1'b0;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

// cycle 7
in_src_tag = 1'b1;
in_dst_tag = 1'b1;
in_write_en = 1'b0;
in_weight_in = 17'b0_0000_0000_0000_0000;
in_clk = 1'b1;
#5
in_clk = 1'b0;
#5

$display ("in_clk, \t in_src_tag, \t in_dst_tag, \t in_write_en, \t in_weight_in, \t out_weight_out");
$stop;

end 

endmodule