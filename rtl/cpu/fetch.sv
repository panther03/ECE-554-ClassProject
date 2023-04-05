module fetch
import wi23_defs::*;
(
    // Inputs
	input logic         clk,
    input logic         rst_n,
    
    //////////////////////
    // control signals //
    ////////////////////
    input logic [REGFILE_WIDTH-1:0]  reg1, 
    input logic [REGFILE_WIDTH-1:0]  imm, 
    input logic [REGFILE_WIDTH-1:0]  ofs,
    input logic [PC_WIDTH-1:0]    pc_inc_in,
    input logic         stall,
    
    /////////////////////////
    // comparator section //
    ///////////////////////
    input logic         Halt, 
    input logic         Rtn, 
    input logic         Exc,
    input logic [1:0]   JType, 
    input logic [1:0]   CondOp,

    // Outputs
    output logic [PC_WIDTH-1:0] iaddr,  // Output full 32-bit address
    output logic [PC_WIDTH-1:0] pc_inc_out,
    output logic        flush,
    output logic        fetch_err
);

    reg CmpOut;

    always @* case (CondOp)
        2'b00 : CmpOut = ~|reg1;
        2'b01 : CmpOut = |reg1;
        2'b10 : CmpOut = reg1[REGFILE_WIDTH-1];
        default : CmpOut = ~reg1[REGFILE_WIDTH-1]; // 2'b11
    endcase

    // Only flush if we are doing a branch and it's taken
    // Since we assumed that a branch would not be taken
    // Or if we're doing a jump (Like a branch that is always taken)
    assign flush = (CmpOut & (JType == 2'b11)) | (^JType) | Exc | Rtn;

    ///////////////////////////////////////
    // branch address calculation logic //
    /////////////////////////////////////

    wire [PC_WIDTH-1:0] addr_base, addr_ofs, addr;

    assign addr_base = JType[1] ? pc_inc_in : reg1;
    assign addr_ofs = JType[0] ? imm : ofs;
    assign addr = addr_base + addr_ofs;

    reg [PC_WIDTH-1:0] pc_target;

    always @* case (JType)
        2'b00 : pc_target = pc_inc_out;
        2'b01 : pc_target = addr;
        2'b10 : pc_target = addr;
        default : pc_target = CmpOut ? addr : pc_inc_out; // 2'b11
    endcase

    ////////////////////////
    // PC & EPC register //
    //////////////////////

    reg [PC_WIDTH-1:0] pc, epc;

    wire [PC_WIDTH-1:0] pc_exc;
    assign pc_exc = Exc ? 16'h1 : (Rtn ? epc : (stall ? pc : pc_target));

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            pc <= 0;
            epc <= 0;
        end else begin
            pc <= pc_exc;
            epc <= Exc ? pc : epc;
        end
    end

    assign iaddr = pc;

    ///////////////////////////
    // pc_inc (adder) logic //
    /////////////////////////

	assign pc_inc_out = pc + (Halt ? 16'h0 : 16'h1);

	// we don't consider an error case for fetch,
   	// so err is tied low.
	assign fetch_err = 1'b0;

endmodule