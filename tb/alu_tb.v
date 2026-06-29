`timescale 1ns / 1ps

module alu_tb;

reg [15:0] A;
reg [15:0] B;
reg [2:0] ALU_Sel;

wire [15:0] Result;
wire Zero;

alu uut(
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Zero(Zero)
);

initial
begin

A = 16'd10;
B = 16'd5;

ALU_Sel = 3'b000;
#20;

ALU_Sel = 3'b001;
#20;

ALU_Sel = 3'b010;
#20;

ALU_Sel = 3'b011;
#20;

ALU_Sel = 3'b100;
#20;

ALU_Sel = 3'b101;
#20;

ALU_Sel = 3'b110;
#20;

ALU_Sel = 3'b111;
#20;

$finish;

end
endmodule