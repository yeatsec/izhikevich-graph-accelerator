// Synaptic Processing Unit 2
module synaptic_processing_unit2(clk, asyn_reset, fifo_empty, weight_in, i_next_in, src_tag_in, state, req_write_i_next, req_deq, busy, i_next_out, src_tag_out, dst_tag_out);

	parameter numneurons = 2;
	parameter numwidth = 16;
	parameter tagbits = 1;

	input clk, asyn_reset, fifo_empty;
	input [numwidth:0] weight_in, i_next_in;
	input [tagbits-1:0] src_tag_in;

	output req_write_i_next, req_deq, busy;
	output [numwidth:0] i_next_out;
	output [tagbits-1:0] src_tag_out, dst_tag_out;
	output [4:0] state;

	wire clk, asyn_reset, fifo_empty;
	wire [tagbits-1:0] src_tag_in;
	wire [numwidth:0] weight_in, i_next_in;
	
	wire req_write_i_next, req_deq, busy;
	reg [numwidth:0] i_next_reg, weight_reg;
	reg [tagbits-1:0] src_tag_out, dst_tag_out;
	reg [numwidth:0] i_next_out;

	wire [numwidth:0] add1;
	fixed_adder2 U1(weight_reg, i_next_reg, 1'b0, add1);

	wire [4:0] next_state;
	reg [4:0] state;
	parameter wait_src = 5'b00001;
	parameter fetch_src = 5'b00010;
	parameter fetch_dst_wgt_inext = 5'b00100;
	parameter add_wgt_inext = 5'b01000;
	parameter write_inext = 5'b10000;

	wire [tagbits-1:0] dst, src;
	wire [numwidth:0] next_out;
	wire [tagbits-1:0] dst_tag_next;

	// Wire Assignment
	// State Change
	assign next_out = i_next_out;
	assign next_state = my_fsm(state, fifo_empty, dst_tag_next);
	assign dst_tag_next = dst_tag_out + 1;
	// Moore Outputs
	assign busy = (state != wait_src);
	assign req_deq = (state == fetch_src);
	assign req_write_i_next = (state == write_inext);

	function [4:0] my_fsm;
		input [4:0] state;
		input fifo_empty;
		input [tagbits-1:0] dst_tag_next;
		case(state)
			wait_src: begin
				if (!fifo_empty)
					my_fsm = fetch_src;
				else
					my_fsm = wait_src;
			end
			fetch_src: begin
				my_fsm = fetch_dst_wgt_inext;
			end
			fetch_dst_wgt_inext: begin
				my_fsm = add_wgt_inext;
			end
			add_wgt_inext: begin
				my_fsm = write_inext;
			end
			write_inext: begin
				if (dst_tag_next == 0)
					my_fsm = wait_src;
				else
					my_fsm = fetch_dst_wgt_inext;
			end
		endcase
	endfunction


	always @(posedge clk, posedge asyn_reset) begin // FSM
		if (asyn_reset) begin
			state <= wait_src;
			i_next_out <= 0;
			dst_tag_out <= 0;
			src_tag_out <= 0;
			weight_reg <= 0;
			i_next_reg <= 0;
		end
		else begin
			state <= next_state;
		end
	end

	always @(posedge state[1]) begin // fetch_src
		dst_tag_out <= 0;
		src_tag_out <= src_tag_in;
	end

	always @(posedge state[2]) begin // fetch_dst_wgt_inext
		i_next_reg <= i_next_in;
		weight_reg <= weight_in;
	end

	always @(posedge state[3]) begin // perform addition
		i_next_out <= add1;
	end

	// peep the negedge
	// works in functional simulation, worried about timing
	always @(negedge state[4]) begin // writeout, next dst
		dst_tag_out <= dst_tag_next;
	end

endmodule