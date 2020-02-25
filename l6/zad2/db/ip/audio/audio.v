// audio.v

// Generated using ACDS version 19.1 670

`timescale 1 ps / 1 ps
module audio (
		input  wire  audio_ADCDAT,  //     audio.ADCDAT
		input  wire  audio_ADCLRCK, //          .ADCLRCK
		input  wire  audio_BCLK,    //          .BCLK
		output wire  audio_DACDAT,  //          .DACDAT
		input  wire  audio_DACLRCK, //          .DACLRCK
		output wire  audio_clk_clk, // audio_clk.clk
		inout  wire  av_i2c_SDAT,   //    av_i2c.SDAT
		output wire  av_i2c_SCLK,   //          .SCLK
		input  wire  clk_clk,       //       clk.clk
		input  wire  reset_reset_n  //     reset.reset_n
	);

	wire         audio_0_avalon_left_channel_source_valid;                                      // audio_0:from_adc_left_channel_valid -> audio_lower_left:sink_valid
	wire  [23:0] audio_0_avalon_left_channel_source_data;                                       // audio_0:from_adc_left_channel_data -> audio_lower_left:sink_data
	wire         audio_0_avalon_left_channel_source_ready;                                      // audio_lower_left:sink_ready -> audio_0:from_adc_left_channel_ready
	wire         audio_0_avalon_right_channel_source_valid;                                     // audio_0:from_adc_right_channel_valid -> audio_lower_right:sink_valid
	wire  [23:0] audio_0_avalon_right_channel_source_data;                                      // audio_0:from_adc_right_channel_data -> audio_lower_right:sink_data
	wire         audio_0_avalon_right_channel_source_ready;                                     // audio_lower_right:sink_ready -> audio_0:from_adc_right_channel_ready
	wire         audio_lower_left_source_valid;                                                 // audio_lower_left:source_valid -> audio_0:to_dac_left_channel_valid
	wire  [23:0] audio_lower_left_source_data;                                                  // audio_lower_left:source_data -> audio_0:to_dac_left_channel_data
	wire         audio_lower_left_source_ready;                                                 // audio_0:to_dac_left_channel_ready -> audio_lower_left:source_ready
	wire         audio_lower_right_source_valid;                                                // audio_lower_right:source_valid -> audio_0:to_dac_right_channel_valid
	wire  [23:0] audio_lower_right_source_data;                                                 // audio_lower_right:source_data -> audio_0:to_dac_right_channel_data
	wire         audio_lower_right_source_ready;                                                // audio_0:to_dac_right_channel_ready -> audio_lower_right:source_ready
	wire  [31:0] master_0_master_readdata;                                                      // mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	wire         master_0_master_waitrequest;                                                   // mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	wire  [31:0] master_0_master_address;                                                       // master_0:master_address -> mm_interconnect_0:master_0_master_address
	wire         master_0_master_read;                                                          // master_0:master_read -> mm_interconnect_0:master_0_master_read
	wire   [3:0] master_0_master_byteenable;                                                    // master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	wire         master_0_master_readdatavalid;                                                 // mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	wire         master_0_master_write;                                                         // master_0:master_write -> mm_interconnect_0:master_0_master_write
	wire  [31:0] master_0_master_writedata;                                                     // master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	wire  [31:0] mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_readdata;    // audio_and_video_config_0:readdata -> mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_readdata
	wire         mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_waitrequest; // audio_and_video_config_0:waitrequest -> mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_waitrequest
	wire   [1:0] mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_address;     // mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_address -> audio_and_video_config_0:address
	wire         mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_read;        // mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_read -> audio_and_video_config_0:read
	wire   [3:0] mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_byteenable;  // mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_byteenable -> audio_and_video_config_0:byteenable
	wire         mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_write;       // mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_write -> audio_and_video_config_0:write
	wire  [31:0] mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_writedata;   // mm_interconnect_0:audio_and_video_config_0_avalon_av_config_slave_writedata -> audio_and_video_config_0:writedata
	wire   [7:0] mm_interconnect_0_audio_lower_right_avalon_slave_readdata;                     // audio_lower_right:avalon_slave_readdata -> mm_interconnect_0:audio_lower_right_avalon_slave_readdata
	wire         mm_interconnect_0_audio_lower_right_avalon_slave_write;                        // mm_interconnect_0:audio_lower_right_avalon_slave_write -> audio_lower_right:avalon_slave_write
	wire   [7:0] mm_interconnect_0_audio_lower_right_avalon_slave_writedata;                    // mm_interconnect_0:audio_lower_right_avalon_slave_writedata -> audio_lower_right:avalon_slave_writedata
	wire   [7:0] mm_interconnect_0_audio_lower_left_avalon_slave_readdata;                      // audio_lower_left:avalon_slave_readdata -> mm_interconnect_0:audio_lower_left_avalon_slave_readdata
	wire         mm_interconnect_0_audio_lower_left_avalon_slave_write;                         // mm_interconnect_0:audio_lower_left_avalon_slave_write -> audio_lower_left:avalon_slave_write
	wire   [7:0] mm_interconnect_0_audio_lower_left_avalon_slave_writedata;                     // mm_interconnect_0:audio_lower_left_avalon_slave_writedata -> audio_lower_left:avalon_slave_writedata
	wire         rst_controller_reset_out_reset;                                                // rst_controller:reset_out -> [audio_0:reset, audio_and_video_config_0:reset, audio_lower_left:reset, audio_lower_right:reset, mm_interconnect_0:audio_and_video_config_0_reset_reset_bridge_in_reset_reset, mm_interconnect_0:master_0_clk_reset_reset_bridge_in_reset_reset]

	audio_audio_0 audio_0 (
		.clk                          (clk_clk),                                   //                         clk.clk
		.reset                        (rst_controller_reset_out_reset),            //                       reset.reset
		.from_adc_left_channel_ready  (audio_0_avalon_left_channel_source_ready),  //  avalon_left_channel_source.ready
		.from_adc_left_channel_data   (audio_0_avalon_left_channel_source_data),   //                            .data
		.from_adc_left_channel_valid  (audio_0_avalon_left_channel_source_valid),  //                            .valid
		.from_adc_right_channel_ready (audio_0_avalon_right_channel_source_ready), // avalon_right_channel_source.ready
		.from_adc_right_channel_data  (audio_0_avalon_right_channel_source_data),  //                            .data
		.from_adc_right_channel_valid (audio_0_avalon_right_channel_source_valid), //                            .valid
		.to_dac_left_channel_data     (audio_lower_left_source_data),              //    avalon_left_channel_sink.data
		.to_dac_left_channel_valid    (audio_lower_left_source_valid),             //                            .valid
		.to_dac_left_channel_ready    (audio_lower_left_source_ready),             //                            .ready
		.to_dac_right_channel_data    (audio_lower_right_source_data),             //   avalon_right_channel_sink.data
		.to_dac_right_channel_valid   (audio_lower_right_source_valid),            //                            .valid
		.to_dac_right_channel_ready   (audio_lower_right_source_ready),            //                            .ready
		.AUD_ADCDAT                   (audio_ADCDAT),                              //          external_interface.export
		.AUD_ADCLRCK                  (audio_ADCLRCK),                             //                            .export
		.AUD_BCLK                     (audio_BCLK),                                //                            .export
		.AUD_DACDAT                   (audio_DACDAT),                              //                            .export
		.AUD_DACLRCK                  (audio_DACLRCK)                              //                            .export
	);

	audio_audio_and_video_config_0 audio_and_video_config_0 (
		.clk         (clk_clk),                                                                       //                    clk.clk
		.reset       (rst_controller_reset_out_reset),                                                //                  reset.reset
		.address     (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_address),     // avalon_av_config_slave.address
		.byteenable  (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_byteenable),  //                       .byteenable
		.read        (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_read),        //                       .read
		.write       (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_write),       //                       .write
		.writedata   (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_writedata),   //                       .writedata
		.readdata    (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_readdata),    //                       .readdata
		.waitrequest (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_waitrequest), //                       .waitrequest
		.I2C_SDAT    (av_i2c_SDAT),                                                                   //     external_interface.export
		.I2C_SCLK    (av_i2c_SCLK)                                                                    //                       .export
	);

	audio_lower audio_lower_left (
		.clock_sink_clk         (clk_clk),                                                   //        clock.clk
		.reset                  (rst_controller_reset_out_reset),                            //        reset.reset
		.sink_data              (audio_0_avalon_left_channel_source_data),                   //         sink.data
		.sink_ready             (audio_0_avalon_left_channel_source_ready),                  //             .ready
		.sink_valid             (audio_0_avalon_left_channel_source_valid),                  //             .valid
		.source_data            (audio_lower_left_source_data),                              //       source.data
		.source_ready           (audio_lower_left_source_ready),                             //             .ready
		.source_valid           (audio_lower_left_source_valid),                             //             .valid
		.avalon_slave_readdata  (mm_interconnect_0_audio_lower_left_avalon_slave_readdata),  // avalon_slave.readdata
		.avalon_slave_write     (mm_interconnect_0_audio_lower_left_avalon_slave_write),     //             .write
		.avalon_slave_writedata (mm_interconnect_0_audio_lower_left_avalon_slave_writedata)  //             .writedata
	);

	audio_lower audio_lower_right (
		.clock_sink_clk         (clk_clk),                                                    //        clock.clk
		.reset                  (rst_controller_reset_out_reset),                             //        reset.reset
		.sink_data              (audio_0_avalon_right_channel_source_data),                   //         sink.data
		.sink_ready             (audio_0_avalon_right_channel_source_ready),                  //             .ready
		.sink_valid             (audio_0_avalon_right_channel_source_valid),                  //             .valid
		.source_data            (audio_lower_right_source_data),                              //       source.data
		.source_ready           (audio_lower_right_source_ready),                             //             .ready
		.source_valid           (audio_lower_right_source_valid),                             //             .valid
		.avalon_slave_readdata  (mm_interconnect_0_audio_lower_right_avalon_slave_readdata),  // avalon_slave.readdata
		.avalon_slave_write     (mm_interconnect_0_audio_lower_right_avalon_slave_write),     //             .write
		.avalon_slave_writedata (mm_interconnect_0_audio_lower_right_avalon_slave_writedata)  //             .writedata
	);

	audio_audio_pll_0 audio_pll_0 (
		.ref_clk_clk        (clk_clk),        //      ref_clk.clk
		.ref_reset_reset    (~reset_reset_n), //    ref_reset.reset
		.audio_clk_clk      (audio_clk_clk),  //    audio_clk.clk
		.reset_source_reset ()                // reset_source.reset
	);

	audio_master_0 #(
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

	audio_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                               (clk_clk),                                                                       //                                            clk_0_clk.clk
		.audio_and_video_config_0_reset_reset_bridge_in_reset_reset  (rst_controller_reset_out_reset),                                                // audio_and_video_config_0_reset_reset_bridge_in_reset.reset
		.master_0_clk_reset_reset_bridge_in_reset_reset              (rst_controller_reset_out_reset),                                                //             master_0_clk_reset_reset_bridge_in_reset.reset
		.master_0_master_address                                     (master_0_master_address),                                                       //                                      master_0_master.address
		.master_0_master_waitrequest                                 (master_0_master_waitrequest),                                                   //                                                     .waitrequest
		.master_0_master_byteenable                                  (master_0_master_byteenable),                                                    //                                                     .byteenable
		.master_0_master_read                                        (master_0_master_read),                                                          //                                                     .read
		.master_0_master_readdata                                    (master_0_master_readdata),                                                      //                                                     .readdata
		.master_0_master_readdatavalid                               (master_0_master_readdatavalid),                                                 //                                                     .readdatavalid
		.master_0_master_write                                       (master_0_master_write),                                                         //                                                     .write
		.master_0_master_writedata                                   (master_0_master_writedata),                                                     //                                                     .writedata
		.audio_and_video_config_0_avalon_av_config_slave_address     (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_address),     //      audio_and_video_config_0_avalon_av_config_slave.address
		.audio_and_video_config_0_avalon_av_config_slave_write       (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_write),       //                                                     .write
		.audio_and_video_config_0_avalon_av_config_slave_read        (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_read),        //                                                     .read
		.audio_and_video_config_0_avalon_av_config_slave_readdata    (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_readdata),    //                                                     .readdata
		.audio_and_video_config_0_avalon_av_config_slave_writedata   (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_writedata),   //                                                     .writedata
		.audio_and_video_config_0_avalon_av_config_slave_byteenable  (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_byteenable),  //                                                     .byteenable
		.audio_and_video_config_0_avalon_av_config_slave_waitrequest (mm_interconnect_0_audio_and_video_config_0_avalon_av_config_slave_waitrequest), //                                                     .waitrequest
		.audio_lower_left_avalon_slave_write                         (mm_interconnect_0_audio_lower_left_avalon_slave_write),                         //                        audio_lower_left_avalon_slave.write
		.audio_lower_left_avalon_slave_readdata                      (mm_interconnect_0_audio_lower_left_avalon_slave_readdata),                      //                                                     .readdata
		.audio_lower_left_avalon_slave_writedata                     (mm_interconnect_0_audio_lower_left_avalon_slave_writedata),                     //                                                     .writedata
		.audio_lower_right_avalon_slave_write                        (mm_interconnect_0_audio_lower_right_avalon_slave_write),                        //                       audio_lower_right_avalon_slave.write
		.audio_lower_right_avalon_slave_readdata                     (mm_interconnect_0_audio_lower_right_avalon_slave_readdata),                     //                                                     .readdata
		.audio_lower_right_avalon_slave_writedata                    (mm_interconnect_0_audio_lower_right_avalon_slave_writedata)                     //                                                     .writedata
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
