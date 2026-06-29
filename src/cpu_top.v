`timescale 1ns / 1ps

module cpu_top(

input clk,
input reset
);

//Wires

wire [15:0] pc;
wire [15:0] instruction;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;

wire [2:0] ALU_Control;
wire [15:0] ReadData1;
wire [15:0] ReadData2;
wire [15:0] ALU_Result;
wire [15:0] Memory_Data;
wire Zero;

//Program Counter

program_counter PC(
.clk(clk),
.reset(reset),
.pc(pc)
);

//Instruction Memory

instruction_memory IM(
.address(pc),
.instruction(instruction)
);


//Control Unit

control_unit CU(
.opcode(instruction[15:12]),
.RegWrite(RegWrite),
.MemRead(MemRead),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.ALU_Control(ALU_Control)
);

//Register File

register_file RF(
.clk(clk),
.RegWrite(RegWrite),
.ReadReg1(instruction[11:9]),
.ReadReg2(instruction[8:6]),
.WriteReg(instruction[5:3]),
.WriteData(ALU_Result),
.ReadData1(ReadData1),
.ReadData2(ReadData2)
);


//ALU

alu ALU(
.A(ReadData1),
.B(ReadData2),
.ALU_Sel(ALU_Control),
.Result(ALU_Result),
.Zero(Zero)
);

// Data Memory

data_memory DM(
.clk(clk),
.MemWrite(MemWrite),
.MemRead(MemRead),
.address(ALU_Result),
.write_data(ReadData2),
.read_data(Memory_Data)
);

endmodule