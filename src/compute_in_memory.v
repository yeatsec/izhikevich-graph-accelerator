// Eric Yeats / Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Compute in-memory

// Testing out the idea of throwing ALU's at the NxN connectivity complexity.



module compute_in_memory(clk, reset, read_en, swap, fifo_empty, busy, req_deq, fired_tag, i_tag, i_out, state_out);
    parameter numwidth = 16;
    parameter tagbits = 2;
    parameter numneurons = 2**tagbits;

    parameter WAIT_TAG = 2'b00;
    parameter FETCH_WEIGHT = 2'b01;
    parameter COMPUTE_I_NEXT = 2'b11;
    parameter SWAP = 2'b10;


    input clk, reset, swap, fifo_empty, read_en;
    input [tagbits-1:0] fired_tag, i_tag;

    output req_deq, busy;
    output [1:0] state_out;
    output [numwidth:0] i_out;

    reg [tagbits-1:0] fired_tag_reg, i_tag_reg;
    wire req_deq, busy;
    wire [numwidth:0] i_out;
    wire [1:0] state_out;

    reg [numwidth:0] i_out_reg;
       
    reg [numwidth:0] i_next [0:numneurons-1];
    reg [numwidth:0] i [0:numneurons-1];
    reg [tagbits:0] j, j2;
    reg [1:0] i_next_state; 

    
    reg [numwidth:0] eff_syn_reg [0:numneurons-1];
    
    wire [numwidth:0] i_next_result [0:numneurons-1];

    // i_next_arr is a numneurons*numwidth wire from contents of i_next
    // eff_syn_reg is the numneurons*numwidth row of synaptic weights from the efferent_weight_matrix
    // i_next_result will be inserted back into i_next when the time's right

    generate
    genvar k;
    for (k=0; k<numneurons; k=k+1) begin : adders
        just_add k_just_add(
        .a(i_next[k])
        ,.b(eff_syn_reg[k])
        ,.sum(i_next_result[k])
        );
    end
    endgenerate

    assign i_out = i_out_reg; // always put up the value in reg
    assign req_deq = (i_next_state == FETCH_WEIGHT);
    assign busy = (i_next_state != WAIT_TAG);
    assign state_out = i_next_state;
		

    // efferent weight matrix [src_tag][dst_tag]. row-addressable read
    // weight-addressable (src & dst) write
    reg [numwidth:0] mem [0:numneurons-1][0:numneurons-1];

    always @(posedge clk)
    begin
        if (reset) begin
            i_next_state <= 2'b00;
            for (j=0; j<numneurons; j=j+1)
                    i_next[j][numwidth:0] <= 17'b0_0000_0000_0000_0000;
            for (j=0; j<numneurons; j=j+1)
                    i[j][numwidth:0] <= 17'b0_0000_0000_0000_0000; 
            for (j=0; j<numneurons; j=j+1) begin
					for (j2=0; j2<numneurons; j2=j2+1) begin
						mem[j][j2] <= 17'b0_0000_0001_0000_0000; // FOR TESTING
					end
				end
			end else begin
            case (i_next_state)
                WAIT_TAG: begin
                    if (!fifo_empty) begin
                        i_next_state <= FETCH_WEIGHT;
                        fired_tag_reg <= fired_tag;
                    end else if (swap) begin
                        i_next_state <= SWAP;
                    end else begin
                        i_next_state <= WAIT_TAG;
                    end
                end
                FETCH_WEIGHT: begin
                    i_next_state <= COMPUTE_I_NEXT;
                    for (j=0; j<numneurons; j=j+1) begin
                        eff_syn_reg[j] <= mem[fired_tag_reg][j];
                    end	
                end
                COMPUTE_I_NEXT: begin
                    if (fifo_empty)
                        i_next_state <= WAIT_TAG; // go home
                    else begin
                        i_next_state <= FETCH_WEIGHT; // more work to do
                        fired_tag_reg <= fired_tag;
                    end
                    for (j=0; j<numneurons; j=j+1) begin
                        i_next[j] <= i_next_result[j]; // latch the computed addition
                    end
                end
                SWAP: begin
                    i_next_state <= WAIT_TAG;
                    for (j=0; j<numneurons; j=j+1)
            	       i[j][numwidth:0] <= i_next[j][numwidth:0];
                    for (j=0; j<numneurons; j=j+1) begin
                            i_next[j][numwidth-2:0] <= i_next[j][numwidth-1:1];
                            i_next[j][numwidth-1] <= 1'b0; // slip in a zero for right shift
	                end
                end
            endcase
	    end
    end 

    // process to assign i_out_reg
    always @(posedge clk) begin
		if (reset) begin
			i_tag_reg <= 0;
			i_out_reg <= i[0];
		end else begin
			if (read_en)
				i_tag_reg <= i_tag; // added for testing
			i_out_reg <= i[i_tag_reg];
		end   
	 end
endmodule