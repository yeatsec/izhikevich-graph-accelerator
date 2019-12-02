// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// State Register


// This module will store the v, u state for each
// neuron in the simulation. The state information
// will be addressable by neuron tag.

module state_register(clk, read_en, write_en, asyn_reset, v_new, u_new, tag, v, u);

	parameter numwidth = 16; // 1 sign + 8 int + 8 frac, 0-based
	parameter tagbits = 6;
	parameter numneurons = 2**tagbits; // should be a power of two
	parameter memcols = 2*numwidth+1;
parameter memrows = numneurons-1;
    input clk, read_en, write_en, asyn_reset;
    input [numwidth:0] v_new, u_new;
    input [tagbits-1:0] tag; // only one bit in 2-neuron case
	 wire [tagbits-1:0] tag;
	 reg [tagbits-1:0] tag_reg;
    output [numwidth:0] v, u;
	 wire [numwidth:0] v, u;
	 reg [numwidth:0] v_reg, u_reg;
	 reg [tagbits:0] j;

    reg [memcols:0] mem [0:memrows]; // store v, u together

    always @(posedge clk, posedge asyn_reset)
    begin
        if (asyn_reset) begin // preference to asyn_reset
            // set to default values -- zero
				tag_reg <= 0;
				v_reg <= 0;
				u_reg <= 0;
				for (j=0; j<numneurons; j=j+1)
					mem[j][memcols:0] <= 0; // set everything to zero
        end else begin // concurrent read/write
            if (write_en) begin
                mem[tag][memcols:numwidth+1] <= v_new;
                mem[tag][numwidth:0] <= u_new;
            end
				if (read_en)
					tag_reg <= tag;
				v_reg <= mem[tag_reg][memcols:numwidth+1];
				u_reg <= mem[tag_reg][numwidth:0];
				
			end
    end
    assign v = v_reg;
    assign u = u_reg;
endmodule