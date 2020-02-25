
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module zad2(

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
	input 		     [3:0]		KEY
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire nKEY0,nKEY1;
wire clk1Hz;
wire [7:0]min,sec;
reg b00,b01,b10,b11;
reg start_stop;

//=======================================================
//  Structural coding
//=======================================================

always @(posedge CLOCK_50) begin
	b00 <= !KEY[0];
	b10 <= !KEY[1];
	b01 <= b00;
	b11 <= b10;
end

always @(posedge b11) begin
		start_stop <= ~start_stop;
end

count_sec c0(clk1Hz,CLOCK_50,start_stop);

assign HEX4[0]=clk1Hz;

BCD_timer tim(min,sec,b01,clk1Hz);

BCD_to_HEX_screen s0(HEX0,sec[0+:4]),s1(HEX1,sec[4+:4]),
						s2(HEX2,min[0+:4]),s3(HEX3,min[4+:4]);

endmodule
