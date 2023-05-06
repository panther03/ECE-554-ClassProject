// Contains the ROM for translating keycodes
// to ascii data
module PS2_scan_trans(
    input wire clk,
    input wire rst_n,
    input wire [7:0] addr_i,
    input wire mem_kb_shift_i,
    // signals out
    output reg [7:0] char_o,
    output reg cc_shift_o,
    output reg cc_enter_o,
    output reg cc_alt_o,
    output reg cc_ctrl_o,
    output reg cc_esc_o,
    output reg cc_back_o,
    output reg cc_tab_o,
    output reg [3:0] cc_fn_o
  );
  
  localparam NKEY_SIZE = 8'h84;
  
  // For converting to codepage hex values
  reg [7:0]  lc_rom[0:NKEY_SIZE-1];  // lowercase
  reg [7:0]  uc_rom[0:NKEY_SIZE-1];  // uppercase
  reg [7:0] mod_rom[0:NKEY_SIZE-1];  // modcode
  
  // Read the ROM for translation
  initial begin
    $readmemh("PS2_SCAN_TRANS_LOWER.hex",lc_rom);
    $readmemh("PS2_SCAN_TRANS_UPPER.hex",uc_rom);
    $readmemh("PS2_SCAN_TRANS_MODCODES.hex",mod_rom);
  end
  
  // shift should stay high until deasserted
  
  always @(posedge clk) begin
    // lowercase and uppercase characters are in different romsets
    // this is because the upper chars are NOT uniformly at a constant offset
    
    // do offset checking
    if (addr_i < NKEY_SIZE & rst_n) begin
      // if shift is held...
      if (!mem_kb_shift_i)
        char_o <= lc_rom[addr_i];
      else
        char_o <= uc_rom[addr_i];
      cc_shift_o <= (mod_rom[addr_i] == 8'h01);
      cc_enter_o <= (mod_rom[addr_i] == 8'h04);
      cc_alt_o   <= (mod_rom[addr_i] == 8'h03);
      cc_ctrl_o  <= 0;
      cc_esc_o   <= 0;
      cc_back_o  <= (mod_rom[addr_i] == 8'h05);
      cc_tab_o   <= (mod_rom[addr_i] == 8'h08);
      cc_fn_o    <= (mod_rom[addr_i][7:4]);
    end
    else begin
      char_o     <= 8'h00;
      cc_shift_o <= 0;
      cc_enter_o <= 0;
      cc_alt_o   <= 0;
      cc_ctrl_o  <= 0;
      cc_esc_o   <= 0;
      cc_back_o  <= 0;
      cc_tab_o   <= 0;
      cc_fn_o    <= 4'h0;
    end
  end

endmodule