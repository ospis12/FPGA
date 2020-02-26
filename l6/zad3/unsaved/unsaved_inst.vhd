	component unsaved is
		port (
			clk_clk                                          : in  std_logic                     := 'X';             -- clk
			reset_reset_n                                    : in  std_logic                     := 'X';             -- reset_n
			avalon_master_memory_0_conduit_end_id10xled      : out std_logic_vector(9 downto 0);                     -- id10xled
			avalon_master_memory_0_conduit_end_id6xhexscreen : out std_logic_vector(41 downto 0);                    -- id6xhexscreen
			avalon_master_memory_0_conduit_end_id10xswitch   : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- id10xswitch
			avalon_master_memory_0_conduit_end_id4xkey       : in  std_logic_vector(3 downto 0)  := (others => 'X')  -- id4xkey
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk                                          => CONNECTED_TO_clk_clk,                                          --                                clk.clk
			reset_reset_n                                    => CONNECTED_TO_reset_reset_n,                                    --                              reset.reset_n
			avalon_master_memory_0_conduit_end_id10xled      => CONNECTED_TO_avalon_master_memory_0_conduit_end_id10xled,      -- avalon_master_memory_0_conduit_end.id10xled
			avalon_master_memory_0_conduit_end_id6xhexscreen => CONNECTED_TO_avalon_master_memory_0_conduit_end_id6xhexscreen, --                                   .id6xhexscreen
			avalon_master_memory_0_conduit_end_id10xswitch   => CONNECTED_TO_avalon_master_memory_0_conduit_end_id10xswitch,   --                                   .id10xswitch
			avalon_master_memory_0_conduit_end_id4xkey       => CONNECTED_TO_avalon_master_memory_0_conduit_end_id4xkey        --                                   .id4xkey
		);

