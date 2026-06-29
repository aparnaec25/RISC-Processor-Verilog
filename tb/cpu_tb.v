`timescale 1ns / 1ps

module cpu_tb;

reg clk;
reg reset;

//Instantiate CPU
cpu_top uut (
    .clk(clk),
    .reset(reset)
);

//Clock Generation
always #5 clk = ~clk;

//Test Sequence
initial begin
    clk = 0;
    reset = 1;

    #20;
    reset = 0;
    
    #200;

    $finish;
end

endmodule