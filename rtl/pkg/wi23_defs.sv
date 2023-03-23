package wi23_defs;

    /////////////
    // MEMORY ///
    /////////////

    // IMEM = 32kB
    localparam IMEM_DEPTH = 13;
    localparam IMEM_WIDTH = 32;

    // DMEM = 16kB
    localparam DMEM_DEPTH = 12;
    localparam DMEM_WIDTH = 32;

    // REGFILE - 32-bit Width, 32 Registers
    localparam REGFILE_DEPTH = 5;
    localparam REGFILE_WIDTH = 32;

    /////////////
    /// SPART ///
    /////////////
    typedef enum logic [1:0] {
        ADDR_DBUF = 2'b00,
        ADDR_SREG = 2'b01,
        ADDR_DBL  = 2'b10,
        ADDR_DBH  = 2'b11
    } spart_ioaddr_t;

    /////////////////
    // MEMORY MAP //
    ///////////////
    // TODO - put addresses of memory map here

endpackage