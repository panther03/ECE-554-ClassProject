module UART_rx (
    input clk, rst_n,
    input RX,
    input [12:0] baud,
    output [MSG_LEN-1:0] rx_data,
    output reg rdy
  );
  
  // Number of message bits not including 
  // START and STOP
  parameter MSG_LEN = 9;
  
  // metastability prevention
  logic RX_flop1,RX_flop2,RX_ms;
  always_ff @(posedge clk,negedge rst_n)
    if (!rst_n) begin 
      RX_flop1 <= 1;
      RX_flop2 <= 1;
    end else begin
      RX_flop1 <= RX;
      RX_flop2 <= RX_flop1;
    end

  assign RX_ms = RX_flop2;

  logic [3:0] bit_cnt;
  logic unsigned [12:0] baud_cnt;
  logic [MSG_LEN:0] rx_shift_reg;

  // SM/control signals
  logic start, shift, receiving, set_done;

  // bit counter (counts to 10), increments after every bit
  always_ff @(posedge clk) 
    case ({start,shift})
      2'b00 : bit_cnt <= bit_cnt;
      2'b01 : bit_cnt <= bit_cnt + 1;
      default : bit_cnt <= 4'h0; // 10 or 11
    endcase
      
  // count bauds down from baud/2 to 0 initially, then
  // set back to baud for rest of transmission cycle
  // this is so we are always reading a bit in the middle of the cycle
  always_ff @(posedge clk) 
    case ({start|shift,receiving})
      2'b00 : baud_cnt <= baud_cnt;
      2'b01 : baud_cnt <= baud_cnt - 1;
      default : baud_cnt <= (start ? ({1'b0, baud[12:1]}) : baud); // 10 or 11 - divide by 2 if start set
    endcase

  // shift in new bits from RX until a byte is formed
  always_ff @(posedge clk,negedge rst_n)
    if (!rst_n)
      rx_shift_reg <= 9'h0;
    else
      case (shift)
        1'b1 : rx_shift_reg <= {RX_ms,rx_shift_reg[MSG_LEN:1]};
        default : rx_shift_reg <= rx_shift_reg; // 0
      endcase

  // synchronous SR flop logic for rdy signal
  always_ff @(posedge clk,negedge rst_n)
    if (!rst_n)
      rdy <= 1'b0;
    else if (set_done)
      rdy <= 1'b1;
    else
      rdy <= 1'b0; 

  // shift goes high when baud cnts down to 0
  assign shift = (baud_cnt == 0);
  // infer output from shift register
  assign rx_data = rx_shift_reg[MSG_LEN-1:0];

  typedef enum reg {IDLE, RECV} RX_state_t;
  RX_state_t state, nxt_state;

  // sequential logic
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
      state <= IDLE;
    else
      state <= nxt_state;

  // combinational logic (next state and output ctrl)
  always_comb begin
    nxt_state = IDLE;
    start = 0;
    receiving = 0;
    set_done = 0;

    case (state) 
      IDLE:
      if (!RX_ms) begin
        // RX has gone low which indicates start of transmission
        // start receiving bits
        nxt_state = RECV;
        start = 1;
      end
      RECV: begin
        // once (MSG_LEN + 2) bits have been observed (the +2 includes start & stop)
        // move back to IDLE and set done
        if (bit_cnt == (MSG_LEN+2)) begin
          nxt_state = IDLE;
          set_done = 1;
        end 
        else begin
          nxt_state = RECV;
          receiving = 1;
        end
      end
      default: nxt_state = IDLE;
    endcase
  end
    
endmodule
