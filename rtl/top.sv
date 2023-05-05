// This is a top-level module which only exists to run on hardware, 
// since the PLL can't be simulated, and the reset synchronizer isn't necessary.
module top
(
  input        REF_CLK,
  input        RST_n,
  output       halt,
  // Peripherals
  // Switches and LEDs
  input  [9:0] SW,
  output [9:0] LEDR,
  // PS/2
  input        PS2_CLK,
  input        PS2_DAT,
  // UART
  input        RX,
  output       TX,
  // VGA
  output       VGA_BLANK_N,
  output [7:0] VGA_B,
  output       VGA_CLK,
  output [7:0] VGA_G,
  output       VGA_HS,
  output [7:0] VGA_R,
  output       VGA_SYNC_N,
  output       VGA_VS
);

//////////////////////
// instantiate pll //
////////////////////
wire pll_locked;
wire clk;
PLL iPLL(
  .refclk(REF_CLK),
  .rst(~RST_n),
  .outclk_0(clk), // 50Mhz 
  .outclk_1(VGA_CLK), // 25MHz
  .locked(pll_locked)
);

/////////////////////////
// reset synchronizer //
///////////////////////
// This is the synchronized reset we will feed to the rest of our FPGA
wire rst_n;
rst_synch RST (
  .clk(clk),
  .RST_n_i(RST_n),
  .PLL_locked_i(pll_locked),
  .rst_n_o(rst_n)
);

///////////////////////
// instantiate wi23 //
/////////////////////
wi23 iWI23 
(
  .clk(clk),
  .rst_n(rst_n),
  .halt(halt),
  // Switches and LEDs
  .SW(SW),
  .LEDR(LEDR),
  // UART
  .RX(RX),
  .TX(TX),
  // PS2
  .PS2_CLK(PS2_CLK),
  .PS2_DAT(PS2_DAT),
  // VGA
  .VGA_CLK(VGA_CLK),
  .VGA_BLANK_N(VGA_BLANK_N),
  .VGA_B(VGA_B),
  .VGA_G(VGA_G),
  .VGA_HS(VGA_HS),
  .VGA_R(VGA_R),
  .VGA_SYNC_N(VGA_SYNC_N),
  .VGA_VS(VGA_VS)
);

endmodule
