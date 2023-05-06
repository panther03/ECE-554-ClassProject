module fifo
#(DATA_WIDTH = 8, FIFO_DEPTH = 8)
(
   // Inputs
   input logic clk, 
   input logic rst_n, 
   input logic [DATA_WIDTH-1:0] in_data, 
   input logic re, 
   input logic we, 

   // Outputs
   output logic [DATA_WIDTH-1:0] out_data, 
   output logic [$clog2(FIFO_DEPTH):0] free_entries, 
   output logic [$clog2(FIFO_DEPTH):0] filled_entries, 
   output logic empty, 
   output logic full
);

parameter PTR_OVR = $clog2(FIFO_DEPTH);
parameter PTR_MSB = $clog2(FIFO_DEPTH)-1;

// FIFO buffer
logic [DATA_WIDTH-1:0] buffer [FIFO_DEPTH-1:0];

// pointers for where to write data and where to read
logic [PTR_MSB:0] new_ptr, old_ptr;  // new = where to write, old = where to read

// continuous assign for out_data from wherever old_ptr is pointing
assign out_data = buffer[old_ptr[PTR_MSB:0]];
   
// Buffer empty when the pointers are equal (also the MSB)
assign empty = old_ptr == new_ptr;

// Buffer is full when the pointers are equal (and there is a overflow)
assign full = new_ptr[PTR_MSB:0] == old_ptr[PTR_MSB:0] && old_ptr[PTR_OVR] != new_ptr[PTR_OVR];

// Free entries and filled entries calculation
assign free_entries = new_ptr[PTR_OVR] == old_ptr[PTR_OVR] ? FIFO_DEPTH - (new_ptr[PTR_MSB:0] - old_ptr[PTR_MSB:0]) : old_ptr[PTR_MSB:0] - new_ptr[PTR_MSB:0];
assign filled_entries = FIFO_DEPTH - free_entries;

// logic for maintaining old_ptr
always_ff @(posedge clk, negedge rst_n)
	if (~rst_n) // reset
		old_ptr <= 4'b0000;
	else if (re & !empty) // increment old_ptr only if there is data to be read and read is enabled
		old_ptr <= old_ptr + 4'b0001;
	
// logic for maintaining new_ptr		
always_ff @(posedge clk, negedge rst_n)
	if (~rst_n)
		new_ptr <= 4'b0000;
	else if (we && ~full) // increment only if write is enable and queue not full
		new_ptr <= new_ptr + 4'b0001;

// Write to the buffer when write enable and not full
always_ff @(posedge clk, negedge rst_n)
	if (we && ~full)
		buffer[new_ptr[PTR_MSB:0]] <= in_data;
	
endmodule
