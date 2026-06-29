`timescale 1ns / 1ps

module mux(

input sel,
input [15:0] A,
input [15:0] B,

output [15:0] Y
);

assign Y = sel ? B : A;
endmodule