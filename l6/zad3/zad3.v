
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module zad3(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

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




//=======================================================
//  Structural coding
//=======================================================

Memory_test system(
	.clk_clk(CLOCK_50),
	.reset_reset_n(|KEY),
	.world_hex_screen({HEX5,HEX4,HEX3,HEX2,HEX1,HEX0}),
	.world_ledr(LEDR),
	.world_key_input(KEY),
	.world_switches(SW));	

endmodule
