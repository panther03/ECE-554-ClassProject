import wi23_defs::*;
module char_queue(
  input clk,
  input rst_n,
  input write_i,
  input read_i,
  input make_i,
  input [17:0] entry_i,
  output wire [DATA_WIDTH-1:0] entry_o,
  output wire char_queue_empty_o,
  output wire char_queue_full_o
);
  
  localparam QUEUE_DEPTH = 2;
  // circular buffer implementation
  reg [QUEUE_DEPTH:0] read_ptr, write_ptr;
  reg read_ptr_inc, write_ptr_inc;
  
  assign char_queue_full_o  = (read_ptr[QUEUE_DEPTH-1:0] == write_ptr[QUEUE_DEPTH-1:0] && read_ptr != write_ptr);
  assign char_queue_empty_o = (read_ptr[QUEUE_DEPTH-1:0] == write_ptr[QUEUE_DEPTH-1:0] && read_ptr == write_ptr);
  
  // only do a write when we HAVE a character!
  // (ccs dont count)
  reg can_write_to_q;
  wire [DATA_WIDTH-1:0] queue_data;
  reg  [DATA_WIDTH-1:0] sustain_data;
  
  reg attempt_read_empty;
  
  reg set_output;
  
  queue iQUEUE (
    .clk(clk),
    .enable(can_write_to_q),
    .raddr(read_ptr),
    .waddr(write_ptr),
    .wdata({13'h0, make_i, entry_i}),
    .rdata(queue_data)
  );
  
  typedef enum reg [1:0] {IDLE, PUSH, POP} Q_state_t;
  Q_state_t state, nxt_state;
  
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
      state <= IDLE;
    else
      state <= nxt_state;
  
  // increment / decrement read and write pointers
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n) begin
      read_ptr  <= 0;
      write_ptr <= 0;
    end
    else begin
      read_ptr  <= read_ptr_inc  ? read_ptr + 3'b001 : read_ptr;
      write_ptr <= write_ptr_inc ? write_ptr + 3'b001 : write_ptr; 
    end
    
  // ff for sustaining output
  always_ff @(posedge clk, negedge rst_n, posedge set_output)
    if (!rst_n)
      sustain_data <= 0;
    else if(set_output)
      sustain_data <= queue_data;
  
  
  // output proper
  assign entry_o = !attempt_read_empty ? sustain_data : 0;
  
  always_comb begin
    can_write_to_q = 0;
    read_ptr_inc = 0;
    write_ptr_inc = 0;
    set_output = 0;
    attempt_read_empty = 0;
     
    nxt_state = IDLE;
    
    case(state)
      default: begin // idle
        if (write_i) begin
          // can't push onto a full stack
			 // don't push an entry if it has no status bits AND no ascii data
			 // push an entry on make AND break, up to the user to determine how to use this info
			 // the conditional term is & !make if you wish to revert this behavior
          if (!char_queue_full_o & !(&entry_i)) begin
            nxt_state = PUSH;
          end else begin
            nxt_state = IDLE;
          end
        end
        
        else if (read_i) begin
          // can't pop off an empty stack
          if (!char_queue_empty_o) begin
            read_ptr_inc = 1;
            set_output = 1;
            nxt_state = POP;
          end else begin
            attempt_read_empty = 1;
            nxt_state = IDLE;
          end
        end
      end
      
      PUSH: begin
        // write to queue,
        // ptr will be inc'd next cycle
        can_write_to_q = 1;
        write_ptr_inc = 1;
        // go back to idle once we get a negedge
        if (!write_i)
          nxt_state = IDLE;
        else
          nxt_state = PUSH;
      end
      POP: begin
        // if this is the last entry don't decrement
        if (!read_i)
          nxt_state = IDLE;
        else
          nxt_state = POP;
      end
    endcase
  end

endmodule