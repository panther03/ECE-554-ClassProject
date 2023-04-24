package wi23_defs;

    /////////////
    // MEMORY ///
    /////////////

    // IMEM = 32kB
    localparam IMEM_DEPTH = 13;
    localparam IMEM_WIDTH = 32;
    
    // PC
    localparam PC_WIDTH = IMEM_WIDTH;

    // DMEM = 16kB
    localparam DMEM_DEPTH = 14;
    localparam DMEM_WIDTH = 8;

    // DATA
    localparam DATA_WIDTH = 32;

    // REGFILE - 32-bit Width, 32 Registers
    localparam REGFILE_DEPTH = 5;
    localparam REGFILE_WIDTH = 32;

    //////////////////
    /// MEMORY MAP ///
    //////////////////

	localparam ADDR_GRAPH_MMAP      = 32'hfffed400; // fffed400 - ffffffff
	localparam ADDR_TEXT_MMAP       = 32'hfffec140; // fffec140 - fffed3ff size 4800 (80*30*2)
	localparam ADDR_PS2_CHAR_MMAP   = 32'hfffec13c; // all 4 byte words
	localparam ADDR_PS2_STATUS_MMAP = 32'hfffec138;
	localparam ADDR_VGA_CONFIG_MMAP = 32'hfffec134;
	localparam ADDR_TIMER_MMAP      = 32'hfffec130;

endpackage
