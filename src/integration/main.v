// Eric Yeats /// Brady Taylor
// ECE 552 Advanced Computer Architecture I
// Final Project
// Main Module

module main(
    input clk,
    input aclr,
    input load,
    // simulation input
    input [9:0] size,
    input [9:0] timesteps,
    input [15:0] aIn,
    input [15:0] bIn,
    input [15:0] cIn,
    input [15:0] dIn,
    input [15:0] wgtMatIn,
    // FSM input
    input start,
    // FSM output
    output finished,
    // simulation output
    output [9:0] curTimestep,
    output
);