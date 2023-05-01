#ifndef MMAP_H
#define MMAP_H

#define mmap_ptr volatile unsigned char

// How they are defined in Verilog
/*
	 localparam ADDR_GRAPH_MMAP      = 32'hfffed400; // fffed400 - ffffffff
	 localparam ADDR_TEXT_MMAP       = 32'hfffec140; // fffec140 - fffed3ff size 4800 (80*30*2)
	 localparam ADDR_PS2_CHAR_MMAP   = 32'hfffec13c; // all 4 byte words
	 localparam ADDR_PS2_STATUS_MMAP = 32'hfffec138;
	 localparam ADDR_VGA_CONFIG_MMAP = 32'hfffec134;
	 localparam ADDR_TIMER_MMAP      = 32'hfffec130;
*/

// all byte addressable 
mmap_ptr *VGA_GRAPH_BUFFER  = (mmap_ptr*)0xfffed400;
mmap_ptr *VGA_TEXT_BUFFER   = (mmap_ptr*)0xfffec140;
mmap_ptr *PS2_KEY           = (mmap_ptr*)0xfffec13c;
mmap_ptr *PS2_STATUS        = (mmap_ptr*)0xfffec138;
mmap_ptr *VGA_CONFIG        = (mmap_ptr*)0xfffec134;
mmap_ptr *TIMER             = (mmap_ptr*)0xfffec130;

// additionally, bitflags / bitmask for *PS2_STATUS are defined here
// assign PS2_status_o = {24h'000000, shf, enter, alt, ctrl, esc, tab, fn (4 bits)};
// in the top level the 10th bit is set as PS2_RDY (a character is ready to be read)
// shf    enter   alt    ctrl   esc    tab    fn
// 9      8       7      6      5      4      3 - 0
unsigned int MASK_FN_KEY = 0x0000000F;
unsigned int MASK_TAB    = 0x00000010;
unsigned int MASK_ESC    = 0x00000020;
unsigned int MASK_CTRL   = 0x00000040;
unsigned int MASK_ALT    = 0x00000080;
unsigned int MASK_ENTER  = 0x00000100;
unsigned int MASK_SHIFT  = 0x00000200;
unsigned int MASK_BACK   = 0x00000400;
unsigned int MASK_RDY    = 0x40000000;
unsigned int MASK_CC     = 0x40000000;  // ANY CC bit set that isn't PS2_RDY

#endif