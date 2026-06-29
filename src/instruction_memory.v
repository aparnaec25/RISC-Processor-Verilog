`timescale 1ns / 1ps

module instruction_memory(

    input  [15:0] address,
    output [15:0] instruction

);

reg [15:0] memory [0:255];
integer i;

initial begin
    memory[0] = 16'b0000000100100011;
    memory[1] = 16'b0001000100100011;
    memory[2] = 16'b0010000100100011;
    memory[3] = 16'b0011000100100011;
    memory[4] = 16'b0100000100100011;

    for(i = 5; i < 256; i = i + 1)
        memory[i] = 16'h0000;
end

assign instruction = memory[address];

endmodule