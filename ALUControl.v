/******************************************************************
* Description
*	This is the control unit for the ALU. It receves an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module ALUControl
(
	input [2:0] ALUOp,
	input [5:0] ALUFunction,
	output [3:0] ALUOperation, //to alu
	output reg Jr

);


localparam R_Type_AND    = 9'b111_100100; //aluop/alufunct, source is control
localparam R_Type_OR     = 9'b111_100101;
localparam R_Type_NOR    = 9'b111_100111;
localparam R_Type_ADD    = 9'b111_100000; //add/addi both have the same alucont val
localparam R_Type_SUB    = 9'b111_100010; 

localparam R_Type_SLL    = 9'b111_000000;
localparam R_Type_SRL    = 9'b111_000010;


localparam I_Type_ADDI   = 9'b100_xxxxxx;
localparam I_Type_ORI    = 9'b101_xxxxxx; //funct_xxxx means they don´t matter
localparam I_Type_ANDI   = 9'b000_xxxxxx;
localparam I_Type_LUI    = 9'b010_xxxxxx;

localparam I_Type_BEQ	 = 9'b001_xxxxxx; //branches both share code
localparam I_Type_SW_LW  = 9'b110_xxxxxx; //s/w both share code
localparam R_Type_JR	 = 9'b111_001000; 


reg [3:0] ALUControlValues;
wire [8:0] Selector;

assign Selector = {ALUOp, ALUFunction}; //bit concatenation

always@(Selector)begin
	casex(Selector)
		R_Type_AND:		ALUControlValues = 4'b0000; //goes to alu to select op, some share code
		R_Type_OR:		ALUControlValues = 4'b0001;

		R_Type_ADD:		ALUControlValues = 4'b0011;
		R_Type_SUB:		ALUControlValues = 4'b0100;

		R_Type_NOR:    ALUControlValues = 4'b0010;
		R_Type_SLL:	   ALUControlValues = 4'b1000;
		R_Type_SRL:	   ALUControlValues = 4'b1001;

		I_Type_ADDI:	ALUControlValues = 4'b0011;
		I_Type_ORI:		ALUControlValues = 4'b0001;
		I_Type_ANDI:	ALUControlValues = 4'b0000;
		I_Type_LUI:		ALUControlValues = 4'b1110;

		R_Type_JR: 		ALUControlValues = 4'b1011;
		I_Type_BEQ:  	ALUControlValues = 4'b1100; 
		I_Type_SW_LW:	ALUControlValues = 4'b1010;
		
		default: ALUControlValues = 4'b1111;
	endcase
		Jr =(ALUControlValues == 4'b1011) ? 1'b1:1'b0; 
end


assign ALUOperation = ALUControlValues;

endmodule
//alucontrol//