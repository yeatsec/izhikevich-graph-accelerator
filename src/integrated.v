

module integrated (in_clk, in_asyn_reset, in_swap, in_tag, out_busy, out_i_out, out_v_prime);
parameter numwidth = 16;
parameter tagbits = 1;
parameter numneurons = 2**tagbits;
input in_clk, in_asyn_reset, in_swap, in_tag;
//reg in_clk, in_asyn_reset, in_swap, in_tag;

output out_busy;
wire out_busy;
output [numwidth:0] out_i_out, out_v_prime;
wire [numwidth:0] out_i_out, out_v_prime;

// SR wires
wire [numwidth:0] sr_v, sr_u;
// IPU wires
wire [numwidth:0] ipu_v_prime, ipu_u_prime;
wire ipu_fired;
// FIFO wires
wire [tagbits-1:0] fifo_out_tag;
wire fifo_full, fifo_empty;
// CIM wires
wire cim_busy, cim_req_deq;
wire [1:0] cim_state_out;
wire [numwidth:0] cim_i_out;

assign out_busy = (fifo_empty && !cim_busy);
assign out_i_out = cim_i_out;
assign out_v_prime = ipu_v_prime;


state_register #(.numneurons(numneurons), .tagbits(tagbits)) SR(in_clk,          // clk
                    1'b0,   // write_en
                    in_asyn_reset, // asyn_reset
                    ipu_v_prime, // v_new
                    ipu_u_prime, // u_new
                    in_tag, // tag
                    sr_v,  // v
                    sr_u); // u

izhikevich_pipeline IPU (in_clk, // clk
                            17'b0_0000_0000_0000_0101, // a
                            17'b0_0000_0000_0011_0011, // b
                            17'b1_0011_0000_0000_0000, // c
                            17'b0_0000_0010_0000_0000, // d
                            sr_v, // v
                            sr_u, // u
                            cim_i_out, // i
                            ipu_v_prime, // v_prime
                            ipu_u_prime, // u_prime
                            ipu_fired); // fired

fifo #(.numneurons(numneurons), .tagbits(tagbits)) FIFO (in_clk, // clk
                ipu_fired, // enq
                cim_req_deq, // deq
                in_asyn_reset, // asyn_reset
                in_tag,  // in_tag
                fifo_out_tag, // out_tag
                fifo_full, // full
                fifo_empty); // empty

compute_in_memory #(.numneurons(numneurons), .tagbits(tagbits)) CIM (in_clk, // clk
								in_asyn_reset, // asyn_reset
                                in_swap, // swap
                                fifo_empty, // fifo_empty
                                cim_busy, // out_busy
                                cim_req_deq, // req_deq
                                fifo_out_tag, // fired_tag
                                in_tag, // i_tag
                                cim_i_out, // i_out
                                cim_state_out); // state_out
										  
										  
endmodule