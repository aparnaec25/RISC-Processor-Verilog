`timescale 1ns / 1ps

module data_memory(

input clk,
input MemWrite,
input MemRead,
input [15:0] address,
input [15:0] write_data,

output reg [15:0] read_data
);

reg [15:0] memory [0:255];
always @(posedge clk)
begin
if(MemWrite)
memory[address[7:0]] <= write_data;
end

always @(*)
begin

if(MemRead)
read_data = memory[address[7:0]];

else
read_data = 16'd0;

end
endmodule