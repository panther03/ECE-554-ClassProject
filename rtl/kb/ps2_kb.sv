/*
PS/2 Keyboard Device Driver
Aidan McEllistrem
3/30/23

Reads in PS/2 key presses
and transmits them to the
*/

module PS2_kb(
    input clk,                   
    input rst_n,
    input PS2_CLK_i,               // The PS/2 KB has a clock of its own
    input PS2_DAT_i,               // Serial line in from the KB
    output wire [7:0] PS2_CHAR_o,  // Last key pressed
    output reg PS2_rdy_o,          // signal that a key code is available       
    output wire [31:0] PS2_status_o  // special case bitflags (FN, tab, shift, alt, etc)
  );
  
  // Previously a UART based approach was used,
  // but let's just count clock cycles :)
  
  // 1 - 8 - 1 - 1
  // 1 Start bit (LOW)
  // 8 data bits (LSB first)
  // 1 parity bit (odd parity)
  // 1 stop bit (must be 1)
  
  // read on LOW line!
  reg [7:0] rx_data;
  reg [3:0] shift_cnt;
  reg shift;
  reg start;
  reg last_ps2_clk, ps2_clk;
  wire ps2_clk_negedge;
  
  reg rdy_lo, rdy_hi;
  
  always_ff @(posedge clk, negedge rst_n, posedge rdy_lo, posedge rdy_hi)
    if (!rst_n)
		PS2_rdy_o <= 0;
	 else if (rdy_lo)
	   PS2_rdy_o <= 0;
	 else if (rdy_hi)
	   PS2_rdy_o <= 1;
	 else
	   PS2_rdy_o <= PS2_rdy_o;
  
  typedef enum reg [1:0] {IDLE, RECV, PAR, STOP} PS2_state_t;
  PS2_state_t state, nxt_state;

  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
      state <= IDLE;
    else
      state <= nxt_state;
  
  // record negedges of PS2_CLK_i
  always_ff @(posedge clk, negedge rst_n)
	if (!rst_n) begin
		ps2_clk <= 0;
		last_ps2_clk <= 0;
	end
	else begin
		ps2_clk <= PS2_CLK_i;
		last_ps2_clk <= ps2_clk;
	end
	
	assign ps2_clk_negedge = (ps2_clk == 0 && last_ps2_clk == 1) ? 1 : 0;
	
		
  // shifting mechanism
  always_ff @(posedge clk,negedge rst_n)
    if (!rst_n) begin
      rx_data <= 0;
	 end
    else
      case ({start,shift})
		  2'b00:   rx_data <= rx_data;
        2'b01:   rx_data <= {PS2_DAT_i,rx_data[7:1]};
		  default: rx_data <= 0;
      endcase
  
  
  // count shift bits
  always_ff @(posedge clk, negedge rst_n) 
    if (!rst_n) begin
      shift_cnt <= 0;
	 end
    else
	   case ({start,shift})
        2'b00 :   shift_cnt <= shift_cnt;
        2'b01 :   shift_cnt <= shift_cnt + 1;
		  default:  shift_cnt <= 0;
      endcase
  
  always_comb begin
    nxt_state = IDLE;
	 shift = 0;
	 start = 0;
	 rdy_lo = 0;
	 rdy_hi = 0;

    case (state) 
      IDLE: begin
			// clock went low, go to start state
			if (ps2_clk_negedge) begin
			  rdy_lo = 1;
			  start = 1;
			  nxt_state = RECV;
			end
			else nxt_state = IDLE;
	   end
		
      RECV: begin
         if (ps2_clk_negedge) begin
			  shift = 1;
			  if (shift_cnt == 4'b0111) begin
			    nxt_state = PAR;
			  end
			  else begin
			    nxt_state = RECV;
			  end
         end 
			else nxt_state = RECV;
      end
		
		PAR: begin
		  if (ps2_clk_negedge) begin
			  nxt_state = STOP;
		  end
		  else nxt_state = PAR;
	   end 
		
		STOP: begin 
			if (ps2_clk_negedge) begin
			   // done!
				rdy_hi = 1;
				nxt_state = IDLE;
			end
			else nxt_state = STOP;
	   end
		
      default: nxt_state = IDLE;
		
    endcase
  end
  
  reg shf, enter, alt, ctrl, esc, tab;
  reg [3:0] fn;
  
  // The PS2 outputs a series of arbitrary keycodes that don't map easily to ASCII.
  // We translate from keycode to ASCII using this module,
  // and denote if any keys were pressed that are important to the programmer.
  PS2_scan_trans iPS2_SCT(
    .clk(clk),
	 .rst_n(rst_n),
    .addr(rx_data),
    .char_o(PS2_CHAR_o),
	 .kb_shift_o(shf),
	 .kb_enter_o(enter),
	 .kb_alt_o(alt),
	 .kb_ctrl_o(ctrl),
	 .kb_esc_o(esc),
	 .kb_tab_o(tab),
	 .kb_fn_o(fn)
  );
  
  // 10 bit wide vector of signals
  assign PS2_status_o = {24'h000000, shf, enter, alt, ctrl, esc, tab, fn};

endmodule