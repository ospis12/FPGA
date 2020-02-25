
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module zad1(

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

reg [9:0]address,sw1,sw2;
reg [3:0]key1,key2;
wire key0_edge,key1_edge,key2_edge,key3_edge;
wire [7:0]mem_out;

//=======================================================
//  Structural coding
//=======================================================

always @(posedge CLOCK_50)begin
	sw1 <= SW;
	key1 <= ~KEY;
	sw2 <= sw1;
	key2 <= key1;
end

_edge_detector det0(key0_edge,CLOCK_50,key2[0]),det1(key1_edge,CLOCK_50,key2[1]),
					det2(key2_edge,CLOCK_50,key2[2]),det3(key3_edge,CLOCK_50,key2[3]);

assign LEDR[9] = address[9];
assign LEDR[8] = address[8];
assign LEDR[0+:8] = mem_out;
_HEX_screen hex0(HEX0,address[0+:4]),hex1(HEX1,address[4+:4]);
_HEX_screen hex2(HEX2,mem_out[0+:4]),hex3(HEX3,mem_out[4+:4]);
_HEX_screen hex4(HEX4,sw2[0+:4]),hex5(HEX5,sw2[4+:4]);

always @(posedge CLOCK_50) begin
	if(key0_edge) address <= address + 1;
	else if(key1_edge) address <= address - 1;
	else if(key3_edge) address <= sw2;
end

_ram RAM(mem_out,CLOCK_50,key2_edge,address,sw2[0+:8]);


endmodule
