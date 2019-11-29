// Eric Yeats / Brady Taylor

// Final Project
// Module that just adds

module just_add (a, b, sum);
	
	parameter numwidth = 16;
	input [numwidth:0] a, b;
	output [numwidth:0] sum; 

	wire [numwidth:0] a, b;
	wire [numwidth:0] sum;

	assign sum = 				
						(((a[numwidth] == b[numwidth])) ? 
							{a[numwidth], a[numwidth-1:0] + b[numwidth-1:0]} : 
							(((a[numwidth-1:0] > b[numwidth-1:0]) && (a[numwidth] != b[numwidth])) ? 
								{a[numwidth], a[numwidth-1:0] + ~b[numwidth-1:0] + 1'b1} : 
								(((b[numwidth-1:0] > a[numwidth-1:0]) && (a[numwidth] != b[numwidth])) ? 
									{b[numwidth], ~a[numwidth-1:0] + b[numwidth-1:0] + 1'b1} : 
									0)));

endmodule