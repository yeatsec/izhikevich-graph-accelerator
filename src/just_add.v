// Eric Yeats / Brady Taylor

// Final Project
// Module that just adds

module just_add (a, b, sum);
	
	parameter numwidth = 16;
	input [numwidth:0] a;
	input [7:0] b;
	output [numwidth:0] sum; 

	wire [numwidth:0] a;
	wire [7:0] b;
	wire [numwidth:0] sum;

	assign sum = 				
						(((a[numwidth] == b[7])) ? 
							{a[numwidth], a[numwidth-1:0] + b[6:0]} : 
							(((a[numwidth-1:0] > b[6:0]) && (a[numwidth] != b[7])) ? 
								{a[numwidth], a[numwidth-1:0] + ~b[6:0] + 1'b1} : 
								(((b[6:0] > a[numwidth-1:0]) && (a[numwidth] != b[7])) ? 
									{b[7], ~a[numwidth-1:0] + b[6:0] + 1'b1} : 
									0)));

endmodule