/*
PS/2 Keyboard Device Driver
Aidan McEllistrem
3/30/23

Reads in PS/2 key presses
and transmits them to the
*/

module PS2_kb(
    input clk,                   // Will need to be divided to between 10kHz - 16kHz 
                                 // (so 12.5 is OK -- 50MHz / 12.5kHz = 4000 divisor)
    input rst_n,
    input PS2_CLK_i,             // The PS/2 KB has a clock of its own
    input PS2_DAT_i,             // Serial line in from the KB
    output wire [7:0] PS2_CHAR_o, // Last key pressed
	 output wire [9:0] LED_r_o,
    output reg PS2_rdy_o         // signal that a key code is available         
  );
  
  /*// Divided clock for reading PS/2 clk in
  reg [11:0] PS2_read_clk_timer;
  reg PS2_read_clk;
  
  always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
      PS2_read_clk_timer <= 12'h000;
    else if (PS2_read_clk_timer < 12'd4000) begin
      PS2_read_clk_timer <= PS2_read_clk_timer + 1;
      PS2_read_clk <= PS2_read_clk;
    end
    else begin
      PS2_read_clk_timer <= 0;
      PS2_read_clk <= ~PS2_read_clk;
    end
  end*/
  
  reg [8:0] rx_data;
  wire rdy;
  
  typedef enum reg {IDLE, RECV} PS2_state_t;
  PS2_state_t state, nxt_state;

  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
      state <= IDLE;
    else
      state <= nxt_state;
  
  reg use_PS2_clk;
  
  always_comb begin
    nxt_state = IDLE;
    use_PS2_clk = 0;

    case (state) 
      IDLE:
		// clock went low
      if (!PS2_CLK_i) begin
        nxt_state = RECV;
      end
      RECV: begin
        if (rdy) begin
          nxt_state = IDLE;
        end 
        else begin
		    // transmission is happening
          nxt_state = RECV;
          use_PS2_clk = 1;
        end
      end
      default: nxt_state = IDLE;
    endcase
  end
  
  
  UART_rx iPS2_UART_RX(
      .clk(clk), .rst_n(rst_n),
      .RX(PS2_DAT_i),
      .baud(13'd4000),
      .rx_data(rx_data),
      .rdy(rdy)
  );
  
  
  reg [7:0] PS2_SCAN;
  
  always @(posedge clk) begin
    if (rdy) begin
      // check parity bit to the data
      // parity bit should be odd!
		//  && ~^rx_data[7:0] == rx_data[8]
      if (rx_data[7:0] != 8'h00) begin
        // transfer on success
        PS2_SCAN <= rx_data[7:0];
        PS2_rdy_o  <= 1;
      end
      // otherwise drop the packet
      else
        PS2_rdy_o <= 0;
    end
    else begin
      PS2_rdy_o <= 0;
    end
  end
  
  PS2_scan_trans iPS2_SCT(
    .clk(clk),
    .addr(PS2_SCAN),
    .char_o(PS2_CHAR_o)
  );
  
  assign LED_r_o = {rx_data[7:0], PS2_rdy_o, rdy}; 

endmodule