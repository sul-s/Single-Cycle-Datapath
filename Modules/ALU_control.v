`timescale 1ns / 1ns

module ALU_control(
     input [5:0] instruction_immediate,
	 input [5:0] instruction,
	 input [1:0] ALUOp,
	 output reg [3:0] func
    );

 always @(*) begin
	if (ALUOp == 2'b00) begin  	//Rtype
		if (instruction == 6'h20 || instruction_immediate == 6'b001000) 
		func = 4'd0;
		else if (instruction == 6'h22)
		func = 4'd1;
		else if (instruction == 6'h24)
		func = 4'd2;
		else if (instruction == 6'h25 || instruction_immediate == 6'b001101)
		func = 4'd3;
		else if (instruction == 6'h27)
		func = 4'd4;
		else if (instruction == 6'b100110)
		func = 4'd5;
		else if (instruction == 6'b101010)
		func = 4'd6;
		else
		func = 4'd8;
	end else if (ALUOp == 2'b01) begin 		//branch
	    if(instruction_immediate == 6'b000100)
		func = 4'd1;
		else if (instruction_immediate == 6'b000101)
		func = 4'd8;
	end else if (ALUOp == 2'b10) begin  //SW, LW, LUI
	    if(instruction_immediate == 6'b101011 || instruction_immediate == 6'b100011)
		func = 4'd0;
		else if (instruction_immediate == 6'b001111)
		func = 4'd7;
	end else begin
		func = 4'd9;
	end
   end


endmodule
