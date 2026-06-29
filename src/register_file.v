`timescale 1ns / 1ps

module register_file(

input clk,
input RegWrite,
input [2:0] ReadReg1,
input [2:0] ReadReg2,
input [2:0] WriteReg,
input [15:0] WriteData,

output [15:0] ReadData1,
output [15:0] ReadData2
);

reg [15:0] registers [0:7];

integer i;
initial begin
    for(i=0;i<8;i=i+1)
        registers[i]=0;

    registers[0]=16'd5;
    registers[1]=16'd10;
    registers[2]=16'd15;
    registers[3]=16'd20;
    registers[4]=16'd25;
    registers[5]=16'd30;
    registers[6]=16'd35;
    registers[7]=16'd40;
end

always @(posedge clk)
begin
    if(RegWrite)
        registers[WriteReg] <= WriteData;
end

assign ReadData1 = registers[ReadReg1];
assign ReadData2 = registers[ReadReg2];

endmodule