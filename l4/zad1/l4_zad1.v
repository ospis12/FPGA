
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module l4_zad1(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,


	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


wire pwm_out;
reg buf1;
reg [9:0] b1,b2;

always @(posedge CLOCK_50) begin
	b1 <= SW;
	b2 <= b1;
end

//=======================================================
//  Structural coding
//=======================================================


_PWM o(pwm_out,10'b1111111111,b2,CLOCK_50);

assign LEDR={pwm_out,pwm_out,pwm_out,pwm_out,pwm_out,pwm_out,pwm_out,pwm_out,pwm_out,pwm_out};

endmodule
