`timescale 1ns / 1ns


module tb_cpu;

	// Inputs
	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;

		#100;
      
		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_10_0000;      // ADD R1, R0, R2
		#20;
		instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_10_0010;      // SUB R8, R4, R4
		#20;
		instruction_initialize_address = 8;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0101;      // OR R7, R5, R6
		#20;
		instruction_initialize_address = 12;
		instruction_initialize_data = 32'b101011_00000_01001_00000_00000_00_1100;      // SW R9, 12(R0)
		#20;
		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b100011_00000_01100_00000_00000_00_1100;      // LW R12, 12(R0)
		#20	
		instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000000_00000_00001_00110_00000_10_0100;      // AND R6, R0, R1
		#20	
		instruction_initialize_address = 24;
		instruction_initialize_data = 32'b001000_01110_01111_00000_00000_00_0100;      // ADDI R15, R14, 4
		#20	
		instruction_initialize_address = 28;
		instruction_initialize_data = 32'b001101_10001_10000_11111_11111_11_1111;      // ORI R16, R17, 0
		#20	
		instruction_initialize_address = 32;
		instruction_initialize_data = 32'b001111_00000_10010_00000_00000_00_0001;      // LUI R18, 1;
		#20
		instruction_initialize_address = 36;
		instruction_initialize_data = 32'b000010_00000_00000_00000_00000_00_1011;      // J to beq instruction     to instruction 44
		
		#20;
		instruction_initialize_address = 40;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_10_0000;      // ADD R1, R0, R2    //skipped over
		
		#20
		instruction_initialize_address = 44;
		instruction_initialize_data = 32'b000000_00111_00101_00110_00000_10_0111;      // NOR R6, R7, R5
		#20
		instruction_initialize_address = 48;
		instruction_initialize_data = 32'b000000_00011_00010_00100_00000_10_0110;      // XOR R4, R2, R3
		#20
		instruction_initialize_address = 52;
		instruction_initialize_data = 32'b000000_00011_00010_00100_00000_10_1010;      // SLT R4, R2, R3
		
		#20
		instruction_initialize_address = 56;
		instruction_initialize_data = 32'b000101_00001_00000_00000_00000_00_0001;      // BNQ R0, R1, 16  branching to instruction 64
		
		#20
		instruction_initialize_address = 60;
		instruction_initialize_data = 32'b000000_00011_00010_00100_00000_10_1010;      // SLT R4, R2, R3    skipped over

		#20	
		instruction_initialize_address = 64;
		instruction_initialize_data = 32'b001000_01110_01111_00000_00000_00_0100;      // ADDI R15, R14, 4		
		
		#20
		instruction_initialize_address = 68;
		instruction_initialize_data = 32'b000100_00000_00000_11111_11111_11_1111;      // BEQ R0, R1, -1   ending program
		#20;
		
		initialize = 0;
		rst = 0;
		
	end
      
always
#5 clk = ~clk;
endmodule

