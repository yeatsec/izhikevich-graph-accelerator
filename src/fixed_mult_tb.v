module fixed_mult_tb();

reg [16:0] in_a, in_b;
// wire out_clip_int, out_clip_frac;
wire [16:0] out_ab;

//create an FSM instance.
fixed_mult U1 (.a (in_a),
               .b (in_b),
               .ab (out_ab)//,
               //.clip_int (out_clip_int),
               //.clip_frac (out_clip_frac)
        	   );

initial
begin

// cycle 0
in_a = 17'b0_0000_0010_0000_0000;
in_b = 17'b0_0000_0010_0000_0000;
#5

// cycle 1
in_a = 17'b1_0000_0010_0000_0000;
in_b = 17'b0_0000_0010_0000_0000;
#5

// cycle 2
in_a = 17'b1_0000_0010_0000_0000;
in_b = 17'b1_0000_0010_0000_0000;
#5

// cycle 3
in_a = 17'b0_0000_0000_1000_0000;
in_b = 17'b0_0000_0000_1000_0000;
#5

$display ("in_clk, \t in_a, \t in_b, \t out_ab"); 
//, \t out_clip_int, \t out_clip_frac"); 
$stop;

end 

endmodule