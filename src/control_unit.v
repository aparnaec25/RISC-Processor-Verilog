`timescale 1ns / 1ps

module control_unit(

input [3:0] opcode,

output reg RegWrite,
output reg MemRead,
output reg MemWrite,
output reg ALUSrc,
output reg [2:0] ALU_Control
);

always @(*)
begin

RegWrite=0;
MemRead=0;
MemWrite=0;
ALUSrc=0;
ALU_Control=3'b000;

case(opcode)

4'b0000:
begin
RegWrite=1;
ALU_Control=3'b000;
end

4'b0001:
begin
RegWrite=1;
ALU_Control=3'b001;
end

4'b0010:
begin
RegWrite=1;
ALU_Control=3'b010;
end

4'b0011:
begin
RegWrite=1;
ALU_Control=3'b011;
end

4'b0100:
begin
RegWrite=1;
MemRead=1;
end

4'b0101:
begin
MemWrite=1;
end

default:
begin
RegWrite=0;
MemRead=0;
MemWrite=0;
end

endcase
end

endmodule