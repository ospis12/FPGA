// Memory_test.v

// Generated using ACDS version 19.1 670

`timescale 1 ps / 1 ps
module Memory_test (
		input  wire        clk_clk,             //   clk.clk
		input  wire        reset_reset_n,       // reset.reset_n
		output wire [9:0]  world_id10xled,      // world.id10xled
		output wire [41:0] world_id6xhexscreen, //      .id6xhexscreen
		input  wire [9:0]  world_id10xswitch,   //      .id10xswitch
		input  wire [3:0]  world_id4xkey        //      .id4xkey
	);

	wire         avalon_master_memory_0_avalon_master_chipselect;  // Avalon_Master_Memory_0:avalon_master_chipselect -> mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_chipselect
	wire   [7:0] avalon_master_memory_0_avalon_master_readdata;    // mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_readdata -> Avalon_Master_Memory_0:avalon_master_readdata
	wire         avalon_master_memory_0_avalon_master_waitrequest; // mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_waitrequest -> Avalon_Master_Memory_0:avalon_master_waitrequest
	wire   [9:0] avalon_master_memory_0_avalon_master_address;     // Avalon_Master_Memory_0:avalon_master_address -> mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_address
	wire         avalon_master_memory_0_avalon_master_read;        // Avalon_Master_Memory_0:avalon_master_read -> mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_read
	wire         avalon_master_memory_0_avalon_master_write;       // Avalon_Master_Memory_0:avalon_master_write -> mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_write
	wire   [7:0] avalon_master_memory_0_avalon_master_writedata;   // Avalon_Master_Memory_0:avalon_master_writedata -> mm_interconnect_0:Avalon_Master_Memory_0_avalon_master_writedata
	wire  [31:0] master_0_master_readdata;                         // mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	wire         master_0_master_waitrequest;                      // mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	wire  [31:0] master_0_master_address;                          // master_0:master_address -> mm_interconnect_0:master_0_master_address
	wire         master_0_master_read;                             // master_0:master_read -> mm_interconnect_0:master_0_master_read
	wire   [3:0] master_0_master_byteenable;                       // master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	wire         master_0_master_readdatavalid;                    // mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	wire         master_0_master_write;                            // master_0:master_write -> mm_interconnect_0:master_0_master_write
	wire  [31:0] master_0_master_writedata;                        // master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_chipselect; // mm_interconnect_0:onchip_memory2_0_s1_chipselect -> onchip_memory2_0:chipselect
	wire   [7:0] mm_interconnect_0_onchip_memory2_0_s1_readdata;   // onchip_memory2_0:readdata -> mm_interconnect_0:onchip_memory2_0_s1_readdata
	wire   [9:0] mm_interconnect_0_onchip_memory2_0_s1_address;    // mm_interconnect_0:onchip_memory2_0_s1_address -> onchip_memory2_0:address
	wire         mm_interconnect_0_onchip_memory2_0_s1_write;      // mm_interconnect_0:onchip_memory2_0_s1_write -> onchip_memory2_0:write
	wire   [7:0] mm_interconnect_0_onchip_memory2_0_s1_writedata;  // mm_interconnect_0:onchip_memory2_0_s1_writedata -> onchip_memory2_0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_clken;      // mm_interconnect_0:onchip_memory2_0_s1_clken -> onchip_memory2_0:clken

	Memory_test_Avalon_Master_Memory_0 avalon_master_memory_0 (
		.avalon_master_address     (avalon_master_memory_0_avalon_master_address),     // avalon_master.address
		.avalon_master_read        (avalon_master_memory_0_avalon_master_read),        //              .read
		.avalon_master_readdata    (avalon_master_memory_0_avalon_master_readdata),    //              .readdata
		.avalon_master_write       (avalon_master_memory_0_avalon_master_write),       //              .write
		.avalon_master_writedata   (avalon_master_memory_0_avalon_master_writedata),   //              .writedata
		.avalon_master_chipselect  (avalon_master_memory_0_avalon_master_chipselect),  //              .chipselect
		.avalon_master_waitrequest (avalon_master_memory_0_avalon_master_waitrequest), //              .waitrequest
		.clock_sink_clk            (clk_clk),                                          //    clock_sink.clk
		.reset_sink_reset          (~reset_reset_n),                                   //    reset_sink.reset
		.LEDR                      (world_id10xled),                                   //   conduit_end.id10xled
		.HEXes                     (world_id6xhexscreen),                              //              .id6xhexscreen
		.Switches                  (world_id10xswitch),                                //              .id10xswitch
		.Keys                      (world_id4xkey)                                     //              .id4xkey
	);

	Memory_test_master_0 #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) master_0 (
		.clk_clk              (clk_clk),                       //          clk.clk
		.clk_reset_reset      (~reset_reset_n),                //    clk_reset.reset
		.master_address       (master_0_master_address),       //       master.address
		.master_readdata      (master_0_master_readdata),      //             .readdata
		.master_read          (master_0_master_read),          //             .read
		.master_write         (master_0_master_write),         //             .write
		.master_writedata     (master_0_master_writedata),     //             .writedata
		.master_waitrequest   (master_0_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (master_0_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (master_0_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                               // master_reset.reset
	);

	Memory_test_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                          //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_0_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_0_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_0_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //       .writedata
		.reset      (~reset_reset_n),                                   // reset1.reset
		.reset_req  (1'b0),                                             // (terminated)
		.freeze     (1'b0)                                              // (terminated)
	);

	Memory_test_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                                 (clk_clk),                                          //                                               clk_0_clk.clk
		.Avalon_Master_Memory_0_reset_sink_reset_bridge_in_reset_reset (~reset_reset_n),                                   // Avalon_Master_Memory_0_reset_sink_reset_bridge_in_reset.reset
		.master_0_clk_reset_reset_bridge_in_reset_reset                (~reset_reset_n),                                   //                master_0_clk_reset_reset_bridge_in_reset.reset
		.Avalon_Master_Memory_0_avalon_master_address                  (avalon_master_memory_0_avalon_master_address),     //                    Avalon_Master_Memory_0_avalon_master.address
		.Avalon_Master_Memory_0_avalon_master_waitrequest              (avalon_master_memory_0_avalon_master_waitrequest), //                                                        .waitrequest
		.Avalon_Master_Memory_0_avalon_master_chipselect               (avalon_master_memory_0_avalon_master_chipselect),  //                                                        .chipselect
		.Avalon_Master_Memory_0_avalon_master_read                     (avalon_master_memory_0_avalon_master_read),        //                                                        .read
		.Avalon_Master_Memory_0_avalon_master_readdata                 (avalon_master_memory_0_avalon_master_readdata),    //                                                        .readdata
		.Avalon_Master_Memory_0_avalon_master_write                    (avalon_master_memory_0_avalon_master_write),       //                                                        .write
		.Avalon_Master_Memory_0_avalon_master_writedata                (avalon_master_memory_0_avalon_master_writedata),   //                                                        .writedata
		.master_0_master_address                                       (master_0_master_address),                          //                                         master_0_master.address
		.master_0_master_waitrequest                                   (master_0_master_waitrequest),                      //                                                        .waitrequest
		.master_0_master_byteenable                                    (master_0_master_byteenable),                       //                                                        .byteenable
		.master_0_master_read                                          (master_0_master_read),                             //                                                        .read
		.master_0_master_readdata                                      (master_0_master_readdata),                         //                                                        .readdata
		.master_0_master_readdatavalid                                 (master_0_master_readdatavalid),                    //                                                        .readdatavalid
		.master_0_master_write                                         (master_0_master_write),                            //                                                        .write
		.master_0_master_writedata                                     (master_0_master_writedata),                        //                                                        .writedata
		.onchip_memory2_0_s1_address                                   (mm_interconnect_0_onchip_memory2_0_s1_address),    //                                     onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_write                                     (mm_interconnect_0_onchip_memory2_0_s1_write),      //                                                        .write
		.onchip_memory2_0_s1_readdata                                  (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //                                                        .readdata
		.onchip_memory2_0_s1_writedata                                 (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //                                                        .writedata
		.onchip_memory2_0_s1_chipselect                                (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //                                                        .chipselect
		.onchip_memory2_0_s1_clken                                     (mm_interconnect_0_onchip_memory2_0_s1_clken)       //                                                        .clken
	);

endmodule
