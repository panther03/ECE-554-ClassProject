/*
PS/2 Keyboard Device Driver
Aidan McEllistrem
3/30/23

Reads in PS/2 key presses
and transmits them to the top level.
*/

module PS2_kb(
    input clk,                   
    input rst_n,
    input PS2_CLK_i,                  // The PS/2 KB has a clock of its own
    input PS2_DAT_i,                  // Serial line in from the KB
    output wire [7:0] PS2_CHAR_o,     // Last key pressed
    output reg PS2_rdy_o,             // signal that a key code is available for reading,
                                      // intended to be used by the programmer   
    output reg PS2_make_o,            // 1: pressed, 0: released                              
    output wire [10:0] PS2_status_o   // special case bitflags (FN, tab, shift, alt, etc)
  );
  
  // Previously a UART based approach was used,
  // but let's just count clock cycles :)
  
  // 1 - 8 - 1 - 1
  // 1 Start bit (LOW)
  // 8 data bits (LSB first)
  // 1 parity bit (odd parity)
  // 1 stop bit (must be 1)
  
  // you would CORRECTLY assume an erronous signal with a wrong amount of clock edges messes up timing
  // until it is reset. however, old PS/2 drivers also made the same assumptions as I did.
  
  // read on LOW line!
  reg [7:0] rx_data;
  reg [3:0] kb_shift_cnt;
  reg shift;
  reg start;
  reg last_ps2_clk, ps2_clk;
  wire ps2_clk_negedge;
  
  reg data_rdy;
  
  // SET/RESET vars
  reg make_code, break_code;
  reg last_code;
  
  reg kb_shift_hi, kb_shift_lo;
  reg kb_shift_key;
  
  // What PS2 scan translation outputs
  // in terms of special flags
  reg shf, enter, alt, ctrl, esc, tab;
  reg [3:0] fn;
  
  // make or break always equal to 
  // the last set of keycodes processed
  assign PS2_make_o = last_code;
  
  ///////////////////////////////
  // SET/RESET flip flop pairs //
  ///////////////////////////////
  
  always_ff @(posedge clk, negedge rst_n, posedge make_code, posedge break_code)
    if (!rst_n)
      last_code <= 0;
    else if (make_code)
      last_code <= 1;
    else if (break_code)
      last_code <= 0;
  
  
  always_ff @(posedge clk, negedge rst_n, posedge kb_shift_hi, posedge kb_shift_lo)
    if (!rst_n)
      kb_shift_key <= 0;
    else if (kb_shift_hi)
      kb_shift_key <= 1;
    else if (kb_shift_lo)
      kb_shift_key <= 0;
  
  
  /////////////////////
  // SM Declarations //
  /////////////////////
  
  // one SM for checking PS2 data...
  typedef enum reg [1:0] {DATA_IDLE, RECV, PAR, STOP} PS2_data_state_t;
  PS2_data_state_t data_state, data_nxt_state;
  
  // ...and another for checking make or break codes
  // (distinguishes key presses from key releases)
  typedef enum reg [1:0] {TYPE_IDLE, EXT, MAKE, BREAK} PS2_type_state_t;
  PS2_type_state_t type_state, type_nxt_state;

  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
      data_state <= DATA_IDLE;
    else
      data_state <= data_nxt_state;
  
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
      type_state <= TYPE_IDLE;
    else
      type_state <= type_nxt_state;
  
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
	
	assign ps2_clk_negedge = (ps2_clk == 0 && last_ps2_clk == 1) ? 1'b1 : 1'b0;
	
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
      kb_shift_cnt <= 0;
    end
    else
      case ({start,shift})
        2'b00 :   kb_shift_cnt <= kb_shift_cnt;
        2'b01 :   kb_shift_cnt <= kb_shift_cnt + 4'h1;
        default:  kb_shift_cnt <= 0;
      endcase
  
  
  ////////////////////
  // STATE MACHINES //
  ////////////////////
  
  // entirely built on counting clock edges,
  // following the assumption the signal we get will have a
  // 1 - 8 - 1 - 1 = 11 negedge count.
  always_comb begin
    data_nxt_state = DATA_IDLE;
    shift = 0;
    start = 0;
    data_rdy = 0;

    case (data_state) 
      DATA_IDLE: begin
        // clock went low, go to start state
        if (ps2_clk_negedge) begin
          start = 1;
          data_nxt_state = RECV;
        end
        else data_nxt_state = DATA_IDLE;
	    end
		
      RECV: begin
        if (ps2_clk_negedge) begin
          shift = 1;
          // did we get all the data bits?
          if (kb_shift_cnt == 4'b0111) begin
            data_nxt_state = PAR;
          end
          else begin
            data_nxt_state = RECV;
          end
        end 
        else data_nxt_state = RECV;
      end
		  
      // we don't really NEED to do parity checks,
      // but it's reserved so we have a state for it
		  PAR: begin
        if (ps2_clk_negedge) begin
          data_nxt_state = STOP;
        end
        else data_nxt_state = PAR;
      end 
		  
      // we always have a stop bit.
      STOP: begin 
        if (ps2_clk_negedge) begin
          // done! signal to the other SM
          // that we have a new keycode to read
          data_rdy = 1;
          data_nxt_state = DATA_IDLE;
        end
        else data_nxt_state = STOP;
      end
    endcase
  end
  
  // this SM determines the type of code
  // via reading subsequent key presses
  always_comb begin
  
    make_code = 0;
    break_code = 0;
    // we handle shift here in the SM
    // instead of in SCT because it's more convenient
    kb_shift_hi = 0;
    kb_shift_lo = 0;
    // pulse for 1 clock when ready
    PS2_rdy_o = 0;
    
    case (type_state) 
      TYPE_IDLE: begin
        if (data_rdy) begin
          // is extended code (E0)?
          if (rx_data == 8'hE0) begin
            type_nxt_state = EXT;
          end
          // is break code?
          else if (rx_data == 8'hF0) begin
            break_code = 1;
            type_nxt_state = BREAK;
          end
          // ok, it must be an ASCII char then
          else begin
            make_code = 1;
            type_nxt_state = MAKE;
          end
        end
        else
          type_nxt_state = TYPE_IDLE;
      end
      
      EXT: begin
        if (data_rdy) begin
          // we should get either a key
          // or another break code
          if (rx_data == 8'hF0) begin
            break_code = 1;
            type_nxt_state = BREAK;
          end
          else
            type_nxt_state = MAKE;
        end
        else
          type_nxt_state = EXT;
      end
      
      MAKE: begin
        // we got the ASCII char!
        PS2_rdy_o = 1;
        // got shift (and its a break key?)
        // assert shift in memory
        if (shf)
          kb_shift_hi = 1;
        type_nxt_state = TYPE_IDLE;
      end
      
      BREAK: begin
        // wait until we get the char
        if (data_rdy) begin
          PS2_rdy_o = 1;
          // got shift (and its a break key?)
          // deassert shift in memory
          if (shf)
            kb_shift_lo = 1;
          type_nxt_state = TYPE_IDLE;
        end
        else begin
          type_nxt_state = BREAK;
        end
      end
      
      
    endcase
  end
  
  // The PS2 outputs a series of arbitrary keycodes that don't map easily to ASCII.
  // We translate from keycode to ASCII using this module,
  // and denote if any keys were pressed that are important to the programmer.
  PS2_scan_trans iPS2_SCT(
    .clk(clk),
    .rst_n(rst_n),
    .addr_i(rx_data),
    .mem_kb_shift_i(kb_shift_key),
    
    .char_o(PS2_CHAR_o),
    .cc_shift_o(shf),
    .cc_enter_o(enter),
    .cc_alt_o(alt),
    .cc_ctrl_o(ctrl),
    .cc_esc_o(esc),
    .cc_back_o(back),
    .cc_tab_o(tab),
    .cc_fn_o(fn)
  );
  
  // 10 bit wide vector of signals,
  // directly mirrors the 32-bit integer the programmer
  // may access and check for status codes.
  assign PS2_status_o = {back, shf, enter, alt, ctrl, esc, tab, fn};

endmodule