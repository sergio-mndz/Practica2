/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add
*		sub
*		or
*		and
*		nor
* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/

module ALU 
(
	input [3:0] ALUOperation,
	input [31:0] A,
	input [31:0] B,
	output reg Zero,
	output reg [31:0]ALUResult,

	input [4:0] Shamt //5 bits? (clase)
);

localparam ADD = 4'b0011; //clase
localparam SUB = 4'b0100; //

localparam AND = 4'b0000; //aluoperation codes are user-defined  
localparam OR  = 4'b0001;
localparam NOR = 4'b0010;

localparam LUI = 4'b1110;
localparam SLL = 4'b1000;
localparam SRL = 4'b1001;

localparam BEQ = 4'b1100; //for both beq/bneq
localparam MEM = 4'b1010; //new op alu op for final aluresult on sw/lw
localparam JR  = 4'b1011; //jump register
//
   
   always @ (A or B or ALUOperation or Shamt) //shamt fixed/added
     begin
		case (ALUOperation)
			ADD:
				ALUResult=A + B;
			SUB: 
				ALUResult=A - B; //on BasicMIPS Verano
	
			AND:
				ALUResult = A & B;
			OR: 
				ALUResult = A | B; 
			NOR: 
				ALUResult = ~(A|B);
			   
			LUI: 
				ALUResult={B[15:0],16'b0}; //bits go from lower to upper part
			SLL:
				ALUResult = B << Shamt;
			SRL:
				ALUResult = B >> Shamt;
				
			BEQ:
				ALUResult = A - B; //to figure sign out
			MEM:
				ALUResult = (A + B - 268500992) / 4; //sw/lw: for memory address offset
		  	JR:
				ALUResult = A; 
			
			//branches???
			//b-offset de memoria 

		default:
			ALUResult= 0;
		endcase // case(control)
		Zero = (ALUResult==0) ? 1'b1 : 1'b0;
     end // always @ (A or B or control)
endmodule 
// alu//