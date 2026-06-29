`timescale 1ns / 1ps

module alu(

input [15:0] A,
input [15:0] B,
input [2:0] ALU_Sel,

output reg [15:0] Result,
output Zero
);

always @(*)
begin

case(ALU_Sel)

3'b000: Result = A + B;
3'b001: Result = A - B;
3'b010: Result = A & B;
3'b011: Result = A | B;
3'b100: Result = A ^ B;
3'b101: Result = ~A;
3'b110: Result = A << 1;
3'b111: Result = A >> 1;

default: Result = 16'd0;

endcase
end

assign Zero = (Result==16'd0);

endmodule