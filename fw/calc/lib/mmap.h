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
volatile unsigned int *PS2_KEY    = (volatile unsigned int*)0xfffec13c;
volatile unsigned int *PS2_STATUS = (volatile unsigned int*)0xfffec138;
mmap_ptr *VGA_CONFIG        = (mmap_ptr*)0xfffec134;
mmap_ptr *TIMER             = (mmap_ptr*)0xfffec130;

// additionally, bitflags / bitmask for *PS2_STATUS are defined here
// assign PS2_status_o = {24h'000000, shf, enter, alt, ctrl, esc, tab, fn (4 bits)};
// in the top level the 10th bit is set as PS2_RDY (a character is ready to be read)
// make/break   back   shf    enter   alt    ctrl   esc    tab    fn
// 11           10     9      8       7      6      5      4      3 - 0
int MASK_FN_KEY = 0x0000000F;
int MASK_TAB    = 0x00000010;
int MASK_ESC    = 0x00000020;
int MASK_CTRL   = 0x00000040;
int MASK_ALT    = 0x00000080;
int MASK_ENTER  = 0x00000100;
int MASK_SHIFT  = 0x00000200;
int MASK_BACK   = 0x00000400;
int MASK_MAKE   = 0x00000800;
int MASK_RDY    = 0x40000000;
int MASK_CC     = 0x40000000;  // ANY CC bit set that isn't PS2_RDY

#endif