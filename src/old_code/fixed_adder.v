// Fixed Adder

module fixed_adder (clk, a, b, sub, sum);
	
	parameter numwidth = 16;
	input [numwidth:0] a, b;
	input clk, sub;
	output [numwidth:0] sum;

	wire clk, sub;
	wire [numwidth:0] a, b;
	reg [numwidth:0] sum;

	always @ (posedge clk) begin
		if (sub == 1'b0) begin
			if ((a[numwidth-1:0] > b[numwidth-1:0]) && (a[numwidth] != b[numwidth])) begin
				sum[numwidth] <= a[numwidth];
				sum[numwidth-1:0] <= a[numwidth-1:0] + ~b[numwidth-1:0] + 1'b1;
			end
			if ((b[numwidth-1:0] > a[numwidth-1:0]) && (a[numwidth] != b[numwidth])) begin
				sum[numwidth] <= b[numwidth];
				sum[numwidth-1:0] <= ~a[numwidth-1:0] + b[numwidth-1:0] + 1'b1;
			end
			if ((a[numwidth-1:0] == b[numwidth-1:0]) && (a[numwidth] != b[numwidth])) begin
				sum[numwidth] <= 1'b0;
				sum[numwidth-1:0] <= 0;
			end
			if ((a[numwidth] == b[numwidth])) begin
				sum[numwidth] <= a[numwidth];
				sum[numwidth-1:0] <= a[numwidth-1:0] + b[numwidth-1:0];
			end
		end
		if (sub == 1'b1) begin
			if (a[numwidth] != b[numwidth]) begin
				sum[numwidth] <= a[numwidth];
				sum[numwidth-1:0] <= a[numwidth-1:0] + b[numwidth-1:0];
			end
			if ((b[numwidth-1:0] > a[numwidth-1:0]) && (a[numwidth] == b[numwidth])) begin
				sum[numwidth] <= ~a[numwidth];
				sum[numwidth-1:0] <= ~a[numwidth-1:0] + b[numwidth-1:0] + 1'b1;
			end
			if ((a[numwidth-1:0] > b[numwidth-1:0]) && (a[numwidth] == b[numwidth])) begin
				sum[numwidth] <= a[numwidth];
				sum[numwidth-1:0] <= a[numwidth-1:0] + ~b[numwidth-1:0] + 1'b1;
			end
			if ((a[numwidth-1:0] == b[numwidth-1:0]) && (a[numwidth] == b[numwidth])) begin
				sum[numwidth] <= 1'b0;
				sum[numwidth-1:0] <= 0;
			end
		end
	end

endmodule