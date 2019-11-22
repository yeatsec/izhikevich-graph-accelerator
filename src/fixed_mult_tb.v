module fixed_mult_tb();

reg in_clk;
reg [16:0] in_a, in_b;
wire out_clip_int, out_clip_frac;
wire [16:0] out_ab;

//create an FSM instance.
fixed_mult U1 (.clk (in_clk),
        	   .a (in_a),
        	   .b (in_b),
        	   .ab (out_ab),
        	   .clip_int (out_clip_int),
               .clip_out (out_clip_frac)
        	   );

initial
begin

// cycle 0
in_a = 16'b0000_0010_0000_0000;
in_b = 16'b0000_0010_0000_0000;
in_clk = 0;
#5
in_clk = 1;
#5

$dumpfile ("fixed_mult_tb.vcd"); 
$dumpvars;
$display ("in_clk, \t in_a, \t in_b, \t out_ab, \t out_clip_int, \t out_clip_frac"); 
$stop;

end 

endmodule