// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

`include "prim_assert.sv"

/**
 * OTBN Controller
 */
module otbn_controller
  import otbn_pkg::*;
#(
  // Size of the instruction memory, in bytes
  parameter int ImemSizeByte = 4096,
  // Size of the data memory, in bytes
  parameter int DmemSizeByte = 4096,

  localparam int ImemAddrWidth = prim_util_pkg::vbits(ImemSizeByte),
  localparam int DmemAddrWidth = prim_util_pkg::vbits(DmemSizeByte)
) (
  input  logic  clk_i,
  input  logic  rst_ni,

  input  logic                     start_i, // start the processing at start_addr_i
  output logic                     done_o,  // processing done, signaled by ECALL
  input  logic [ImemAddrWidth-1:0] start_addr_i,

  // Next instruction selection (to instruction fetch)
  output logic                     insn_fetch_req_valid_o,
  output logic [ImemAddrWidth-1:0] insn_fetch_req_addr_o,

  // Fetched/decoded instruction
  input  logic                     insn_valid_i,
  input  logic [ImemAddrWidth-1:0] insn_addr_i,

  // Decoded instruction data, matching the "Decoding" section of the specification.
  input insn_dec_base_t       insn_dec_base_i,
  input insn_dec_bignum_t     insn_dec_bignum_i,
  input insn_dec_shared_t     insn_dec_shared_i,

  // Base register file
  output logic [4:0]   rf_base_wr_addr_o,
  output logic         rf_base_wr_en_o,
  output logic [31:0]  rf_base_wr_data_o,

  output logic [4:0]   rf_base_rd_addr_a_o,
  output logic         rf_base_rd_en_a_o,
  input  logic [31:0]  rf_base_rd_data_a_i,

  output logic [4:0]   rf_base_rd_addr_b_o,
  output logic         rf_base_rd_en_b_o,
  input  logic [31:0]  rf_base_rd_data_b_i,

  // Bignum register file (WDRs)
  output logic [4:0]      rf_bignum_wr_addr_o,
  output logic [1:0]      rf_bignum_wr_en_o,
  output logic [WLEN-1:0] rf_bignum_wr_data_o,

  output logic [4:0]      rf_bignum_rd_addr_a_o,
  input  logic [WLEN-1:0] rf_bignum_rd_data_a_i,

  output logic [4:0]      rf_bignum_rd_addr_b_o,
  input  logic [WLEN-1:0] rf_bignum_rd_data_b_i,

  // Execution units

  // Base ALU
  output alu_base_operation_t  alu_base_operation_o,
  output alu_base_comparison_t alu_base_comparison_o,
  input  logic [31:0]          alu_base_operation_result_i,
  input  logic                 alu_base_comparison_result_i,

  // Bignum ALU
  output alu_bignum_operation_t alu_bignum_operation_o,
  input  logic [WLEN-1:0]       alu_bignum_operation_result_i,

  // Bignum MAC
  output mac_bignum_operation_t mac_bignum_operation_o,
  input  logic [WLEN-1:0]       mac_bignum_operation_result_i,
  output logic                  mac_bignum_en_o,

  // LSU
  output logic                     lsu_load_req_o,
  output logic                     lsu_store_req_o,
  output insn_subset_e             lsu_req_subset_o,
  output logic [DmemAddrWidth-1:0] lsu_addr_o,

  output logic [31:0]              lsu_base_wdata_o,
  output logic [WLEN-1:0]          lsu_bignum_wdata_o,

  input  logic [31:0]              lsu_base_rdata_i,
  input  logic [WLEN-1:0]          lsu_bignum_rdata_i,
  input  logic [1:0]               lsu_rdata_err_i, // Bit1: Uncorrectable, Bit0: Correctable

  // Internal Special-Purpose Registers (ISPRs)
  output ispr_e                       ispr_addr_o,
  output logic [31:0]                 ispr_base_wdata_o,
  output logic [BaseWordsPerWLEN-1:0] ispr_base_wr_en_o,
  output logic [WLEN-1:0]             ispr_bignum_wdata_o,
  output logic                        ispr_bignum_wr_en_o,
  input  logic [WLEN-1:0]             ispr_rdata_i
);

  logic done_d, done_q;

  typedef enum logic [1:0] {
    OtbnStateHalt,
    OtbnStateRun,
    OtbnStateStall
  } otbn_state_e;

  otbn_state_e state_q, state_d;

  logic stall;
  logic mem_stall;
  logic branch_taken;
  logic [ImemAddrWidth-1:0] branch_target;
  logic [ImemAddrWidth-1:0] next_insn_addr;

  csr_e                                csr_addr;
  logic [31:0]                         csr_rdata;
  logic [BaseWordsPerWLEN-1:0]         csr_rdata_mux [32];
  logic [31:0]                         csr_wdata;

  wsr_e                                wsr_addr;
  logic [WLEN-1:0]                     wsr_wdata;

  ispr_e                               ispr_addr_base;
  logic [$clog2(BaseWordsPerWLEN)-1:0] ispr_word_addr_base;
  logic [BaseWordsPerWLEN-1:0]         ispr_word_sel_base;

  ispr_e                               ispr_addr_bignum;

  logic                                ispr_wr_insn;

  // Computed increments for indirect register index and memory address in BN.LID/BN.SID/BN.MOVR
  // instructions.
  logic [4:0]               rf_base_rd_data_a_inc;
  logic [4:0]               rf_base_rd_data_b_inc;
  logic [DmemAddrWidth-1:0] rf_base_rd_data_a_wlen_word_inc;

  // Output of mux taking the above increments as inputs and choosing one to write back to base
  // register file with appropriate zero extension and padding to give a 32-bit result.
  logic [31:0]              increment_out;

  // Loop control, used to start a new loop
  logic        loop_start;
  logic [11:0] loop_bodysize;
  logic [31:0] loop_iterations;

  // Loop generated jumps. The loop controller asks to jump when execution reaches the end of a loop
  // body that hasn't completed all of its iterations.
  logic                     loop_jump;
  logic [ImemAddrWidth-1:0] loop_jump_addr;

  logic [WLEN-1:0] mac_bignum_rf_wr_data;

  // Stall a cycle on loads to allow load data writeback to happen the following cycle. Stall not
  // required on stores as there is no response to deal with.
  // TODO: Possibility of error response on store? Probably still don't need to stall in that case
  // just ensure incoming store error stops anything else happening.
  assign mem_stall = lsu_load_req_o;

  assign stall = mem_stall;
  assign done_d = insn_valid_i && insn_dec_shared_i.ecall_insn;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      done_q <= 1'b0;
    end else begin
      done_q <= done_d;
    end
  end

  assign done_o = done_q;

  // Branch taken when there is a valid branch instruction and comparison passes or a valid jump
  // instruction (which is always taken)
  assign branch_taken = insn_valid_i & ((insn_dec_shared_i.branch_insn & alu_base_comparison_result_i) |
                                        insn_dec_shared_i.jump_insn);
  // Branch target computed by base ALU (PC + imm)
  // TODO: Implement error on branch out of range
  assign branch_target = alu_base_operation_result_i[ImemAddrWidth-1:0];

  assign next_insn_addr = insn_addr_i + 'd4;

  always_comb begin
    state_d                = state_q;
    insn_fetch_req_valid_o = 1'b0;
    insn_fetch_req_addr_o  = start_addr_i;

    // TODO: Harden state machine
    // TODO: Jumps/branches
    unique case (state_q)
      OtbnStateHalt: begin
        if (start_i) begin
          state_d = OtbnStateRun;
          insn_fetch_req_addr_o  = start_addr_i;
          insn_fetch_req_valid_o = 1'b1;
        end
      end
      OtbnStateRun: begin
        insn_fetch_req_valid_o = 1'b1;

        if (done_d) begin
          state_d                = OtbnStateHalt;
          insn_fetch_req_valid_o = 1'b0;
        end else begin
          // When stalling refetch the same instruction to keep decode inputs constant
          if (stall) begin
            state_d               = OtbnStateStall;
            insn_fetch_req_addr_o = insn_addr_i;
          end else begin
            if (branch_taken) begin
              insn_fetch_req_addr_o = branch_target;
            end else if (loop_jump) begin
              insn_fetch_req_addr_o = loop_jump_addr;
            end else begin
              insn_fetch_req_addr_o = next_insn_addr;
            end
          end
        end
      end
      OtbnStateStall: begin
        // Only ever stall for a single cycle
        // TODO: Any more than one cycle stall cases?
        insn_fetch_req_valid_o = 1'b1;
        insn_fetch_req_addr_o  = next_insn_addr;
        state_d = OtbnStateRun;
      end
      default: ;
    endcase
  end

  `ASSERT(ControllerStateValid, state_q inside {OtbnStateHalt, OtbnStateRun, OtbnStateStall});
  // Branch only takes effect in OtbnStateRun so must not go into stall state for branch
  // instructions.
  `ASSERT(NoStallOnBranch, insn_valid_i & insn_dec_shared_i.branch_insn |-> state_q != OtbnStateStall);

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state_q <= OtbnStateHalt;
    end else begin
      state_q <= state_d;
    end
  end

  otbn_loop_controller #(
    .ImemAddrWidth(ImemAddrWidth)
  ) u_otbn_loop_controller (
    .clk_i,
    .rst_ni,

    .insn_addr_i,
    .next_insn_addr_i  (next_insn_addr),

    .loop_start_i      (loop_start),
    .loop_bodysize_i   (loop_bodysize),
    .loop_iterations_i (loop_iterations),

    .loop_jump_o       (loop_jump),
    .loop_jump_addr_o  (loop_jump_addr),
    .loop_err_o        ()
  );

  assign loop_start      = insn_valid_i & insn_dec_shared_i.loop_insn;
  assign loop_bodysize   = insn_dec_base_i.loop_bodysize;
  assign loop_iterations = insn_dec_base_i.loop_immediate ? insn_dec_base_i.i : rf_base_rd_data_a_i;

  // Compute increments which can be optionally applied to indirect register accesses and memory
  // addresses in BN.LID/BN.SID/BN.MOVR instructions.
  assign rf_base_rd_data_a_inc           = rf_base_rd_data_a_i[4:0] + 1'b1;
  assign rf_base_rd_data_b_inc           = rf_base_rd_data_b_i[4:0] + 1'b1;
  assign rf_base_rd_data_a_wlen_word_inc = {rf_base_rd_data_a_i[DmemAddrWidth-1:5] + 1'b1, 5'b0};

  // Choose increment to write back to base register file, only one increment can be written as
  // there is only one write port. Note that where an instruction is incrementing the indirect
  // reference to its destination register (insn_dec_bignum_i.d_inc) that reference is read on the
  // B read port so the B increment is written back.
  always_comb begin
    unique case (1'b1)
      insn_dec_bignum_i.a_inc: begin
        increment_out = {27'b0, rf_base_rd_data_a_inc};
      end
      insn_dec_bignum_i.b_inc: begin
        increment_out = {27'b0, rf_base_rd_data_b_inc};
      end
      insn_dec_bignum_i.d_inc: begin
        increment_out = {27'b0, rf_base_rd_data_b_inc};
      end
      insn_dec_bignum_i.a_wlen_word_inc: begin
        increment_out = {{32-DmemAddrWidth{1'b0}}, rf_base_rd_data_a_wlen_word_inc};
      end
      default: begin
        // Whenever increment_out is written back to the register file, exactly one of the
        // increment selector signals is high. To prevent the automatic inference of latches in
        // case nothing is written back (rf_wdata_sel != RfWdSelIncr) and to save logic, we choose
        // a valid output as default.
        increment_out = {27'b0, rf_base_rd_data_a_inc};
      end
    endcase
  end

  always_comb begin
    rf_base_rd_addr_a_o = insn_dec_base_i.a;
    rf_base_rd_en_a_o   = insn_dec_base_i.rf_ren_a;
    rf_base_rd_addr_b_o = insn_dec_base_i.b;
    rf_base_rd_en_b_o   = insn_dec_base_i.rf_ren_b;
    rf_base_wr_addr_o   = insn_dec_base_i.d;

    if (insn_dec_shared_i.subset == InsnSubsetBignum) begin
      unique case (1'b1)
        insn_dec_bignum_i.a_inc,
        insn_dec_bignum_i.a_wlen_word_inc: begin
          rf_base_wr_addr_o = insn_dec_base_i.a;
        end

        insn_dec_bignum_i.b_inc,
        insn_dec_bignum_i.d_inc: begin
          rf_base_wr_addr_o = insn_dec_base_i.b;
        end
        default: ;
      endcase
    end
  end

  // Base ALU Operand A MUX
  always_comb begin
    unique case (insn_dec_base_i.op_a_sel)
      OpASelRegister: alu_base_operation_o.operand_a = rf_base_rd_data_a_i;
      OpASelZero:     alu_base_operation_o.operand_a = '0;
      OpASelCurrPc:   alu_base_operation_o.operand_a = {{(32 - ImemAddrWidth){1'b0}}, insn_addr_i};
      default:        alu_base_operation_o.operand_a = rf_base_rd_data_a_i;
    endcase
  end

  // Base ALU Operand B MUX
  always_comb begin
    unique case (insn_dec_base_i.op_b_sel)
      OpBSelRegister:  alu_base_operation_o.operand_b = rf_base_rd_data_b_i;
      OpBSelImmediate: alu_base_operation_o.operand_b = insn_dec_base_i.i;
      default:         alu_base_operation_o.operand_b = rf_base_rd_data_b_i;
    endcase
  end

  assign alu_base_operation_o.op = insn_dec_base_i.alu_op;

  assign alu_base_comparison_o.operand_a = rf_base_rd_data_a_i;
  assign alu_base_comparison_o.operand_b = rf_base_rd_data_b_i;
  assign alu_base_comparison_o.op = insn_dec_base_i.comparison_op;

  // Register file write MUX
  // Suppress write for loads when controller isn't in stall state as load data for writeback is
  // only available in the stall state.
  assign rf_base_wr_en_o = insn_valid_i & insn_dec_base_i.rf_we &
    ~(insn_dec_shared_i.ld_insn & (state_q != OtbnStateStall));

  always_comb begin
    unique case (insn_dec_base_i.rf_wdata_sel)
      RfWdSelEx:     rf_base_wr_data_o = alu_base_operation_result_i;
      RfWdSelLsu:    rf_base_wr_data_o = lsu_base_rdata_i;
      RfWdSelNextPc: rf_base_wr_data_o = {{(32-ImemAddrWidth){1'b0}}, next_insn_addr};
      RfWdSelIspr:   rf_base_wr_data_o = csr_rdata;
      RfWdSelIncr:   rf_base_wr_data_o = increment_out;
      default:       rf_base_wr_data_o = alu_base_operation_result_i;
    endcase
  end

  assign rf_bignum_rd_addr_a_o = insn_dec_bignum_i.rf_a_indirect ? rf_base_rd_data_a_i[4:0] :
                                                                   insn_dec_bignum_i.a;

  assign rf_bignum_rd_addr_b_o = insn_dec_bignum_i.rf_b_indirect ? rf_base_rd_data_b_i[4:0] :
                                                                   insn_dec_bignum_i.b;

  assign alu_bignum_operation_o.operand_a = rf_bignum_rd_data_a_i;

  // Base ALU Operand B MUX
  always_comb begin
    unique case (insn_dec_bignum_i.alu_op_b_sel)
      OpBSelRegister:  alu_bignum_operation_o.operand_b = rf_bignum_rd_data_b_i;
      OpBSelImmediate: alu_bignum_operation_o.operand_b = insn_dec_bignum_i.i;
      default:         alu_bignum_operation_o.operand_b = rf_bignum_rd_data_b_i;
    endcase
  end

  assign alu_bignum_operation_o.op          = insn_dec_bignum_i.alu_op;
  assign alu_bignum_operation_o.shift_right = insn_dec_bignum_i.alu_shift_right;
  assign alu_bignum_operation_o.shift_amt   = insn_dec_bignum_i.alu_shift_amt;
  assign alu_bignum_operation_o.flag_group  = insn_dec_bignum_i.alu_flag_group;
  assign alu_bignum_operation_o.sel_flag    = insn_dec_bignum_i.alu_sel_flag;
  assign alu_bignum_operation_o.flag_en     = insn_dec_bignum_i.alu_flag_en;

  assign mac_bignum_operation_o.operand_a         = rf_bignum_rd_data_a_i;
  assign mac_bignum_operation_o.operand_b         = rf_bignum_rd_data_b_i;
  assign mac_bignum_operation_o.operand_a_qw_sel  = insn_dec_bignum_i.mac_op_a_qw_sel;
  assign mac_bignum_operation_o.operand_b_qw_sel  = insn_dec_bignum_i.mac_op_b_qw_sel;
  assign mac_bignum_operation_o.pre_acc_shift_imm = insn_dec_bignum_i.mac_pre_acc_shift;
  assign mac_bignum_operation_o.zero_acc          = insn_dec_bignum_i.mac_zero_acc;
  assign mac_bignum_operation_o.shift_acc         = insn_dec_bignum_i.mac_shift_out;

  assign mac_bignum_en_o = insn_dec_bignum_i.mac_en & insn_valid_i;


  // Bignum Register file write control

  always_comb begin
    // By default write nothing
    rf_bignum_wr_en_o = 2'b00;

    // Only write if enabled
    if (insn_valid_i && insn_dec_bignum_i.rf_we) begin
      if (insn_dec_bignum_i.mac_en && insn_dec_bignum_i.mac_shift_out) begin
        // Special handling for BN.MULQACC.SO, only enable upper or lower half depending on
        // mac_wr_hw_sel.
        rf_bignum_wr_en_o = insn_dec_bignum_i.mac_wr_hw_sel ? 2'b10 : 2'b01;
      end else if (insn_dec_shared_i.ld_insn) begin
        // Special handling for BN.LID. Load data is requested in the first cycle of the instruction
        // (where state_q == OtbnStateRun) and is available in the second cycle following the
        // request (where state_q == OtbnStateStall), so only enable writes for BN.LID when in
        // OtbnStateStall.
        if (state_q == OtbnStateStall) begin
          rf_bignum_wr_en_o = 2'b11;
        end
      end else begin
        // For everything else write both halves immediately.
        rf_bignum_wr_en_o = 2'b11;
      end
    end
  end

  assign rf_bignum_wr_addr_o = insn_dec_bignum_i.rf_d_indirect ? rf_base_rd_data_b_i[4:0] :
                                                                 insn_dec_bignum_i.d;

  // For the shift-out variant of BN.MULQACC the bottom half of the MAC result is written to one
  // half of a desintation register specified by the instruction (mac_wr_hw_sel). The bottom half of
  // the MAC result must be placed in the appropriate half of the write data (the RF only accepts
  // write data for the top half in the top half of the write data input). Otherwise (shift-out to
  // bottom half and all other BN.MULQACC instructions) simply pass the MAC result through unchanged
  // as write data.
  assign mac_bignum_rf_wr_data[WLEN-1:WLEN/2] =
    insn_dec_bignum_i.mac_wr_hw_sel &&
    insn_dec_bignum_i.mac_shift_out    ? mac_bignum_operation_result_i[WLEN/2-1:0] :
                                         mac_bignum_operation_result_i[WLEN-1:WLEN/2];

  assign mac_bignum_rf_wr_data[WLEN/2-1:0] = mac_bignum_operation_result_i[WLEN/2-1:0];

  always_comb begin
    unique case (insn_dec_bignum_i.rf_wdata_sel)
      RfWdSelEx:   rf_bignum_wr_data_o = alu_bignum_operation_result_i;
      RfWdSelLsu:  rf_bignum_wr_data_o = lsu_bignum_rdata_i;
      RfWdSelIspr: rf_bignum_wr_data_o = ispr_rdata_i;
      RfWdSelMac:  rf_bignum_wr_data_o = mac_bignum_rf_wr_data;
      default:     rf_bignum_wr_data_o = alu_bignum_operation_result_i;
    endcase
  end

  // CSR/WSR/ISPR handling
  // ISPRs (Internal Special Purpose Registers) are the internal registers. CSRs and WSRs are the
  // ISA visible versions of those registers in the base and bignum ISAs respectively.

  assign csr_addr = csr_e'(insn_dec_base_i.i[11:0]);

  always_comb begin
    ispr_addr_base      = IsprMod;
    ispr_word_addr_base = '0;

    unique case (csr_addr)
      CsrFlags: begin
        ispr_addr_base      = IsprFlags;
        ispr_word_addr_base = '0;
      end
      CsrMod0,CsrMod1,CsrMod2,CsrMod3,CsrMod4,CsrMod5,CsrMod6,CsrMod7: begin
        ispr_addr_base      = IsprMod;
        ispr_word_addr_base = csr_addr[2:0];
      end
      CsrRnd: begin
        ispr_addr_base      = IsprRnd;
        ispr_word_addr_base = '0;
      end
      // TODO: Illegal addr handling
      default: ;
    endcase
  end

  for (genvar i_word = 0; i_word < BaseWordsPerWLEN; i_word++) begin : g_ispr_word_sel_base
    assign ispr_word_sel_base[i_word] = ispr_word_addr_base == i_word;
  end

  for (genvar i_bit = 0; i_bit < 32; i_bit++) begin : g_csr_rdata_mux
    for (genvar i_word = 0; i_word < BaseWordsPerWLEN; i_word++) begin : g_csr_rdata_mux_inner
      assign csr_rdata_mux[i_bit][i_word] = ispr_rdata_i[i_word*32 + i_bit] & ispr_word_sel_base[i_word];
    end

    assign csr_rdata[i_bit] = |csr_rdata_mux[i_bit];
  end

  assign csr_wdata = insn_dec_shared_i.ispr_rs_insn ? csr_rdata | rf_base_rd_data_a_i : rf_base_rd_data_a_i;

  assign wsr_addr = wsr_e'(insn_dec_bignum_i.i[WsrNumWidth-1:0]);

  always_comb begin
    ispr_addr_bignum = IsprMod;

    unique case (wsr_addr)
      WsrMod: ispr_addr_bignum = IsprMod;
      WsrRnd: ispr_addr_bignum = IsprRnd;
      WsrAcc: ispr_addr_bignum = IsprAcc;
      default: ;
    endcase
  end

  assign wsr_wdata = insn_dec_shared_i.ispr_rs_insn ? ispr_rdata_i | rf_bignum_rd_data_a_i : rf_bignum_rd_data_a_i;

  assign ispr_wr_insn = insn_dec_shared_i.ispr_rw_insn | insn_dec_shared_i.ispr_rs_insn;

  assign ispr_addr_o         = insn_dec_shared_i.subset == InsnSubsetBase ? ispr_addr_base : ispr_addr_bignum;
  assign ispr_base_wdata_o   = csr_wdata;
  assign ispr_base_wr_en_o   =
    {BaseWordsPerWLEN{(insn_dec_shared_i.subset == InsnSubsetBase) & ispr_wr_insn & insn_valid_i}}
    & ispr_word_sel_base;

  assign ispr_bignum_wdata_o = wsr_wdata;
  assign ispr_bignum_wr_en_o = (insn_dec_shared_i.subset == InsnSubsetBignum) & ispr_wr_insn
    & insn_valid_i;

  // TODO: Add error on unaligned/out of bounds
  assign lsu_load_req_o   = insn_valid_i & insn_dec_shared_i.ld_insn & (state_q == OtbnStateRun);
  assign lsu_store_req_o  = insn_valid_i & insn_dec_shared_i.st_insn & (state_q == OtbnStateRun);
  assign lsu_req_subset_o = insn_dec_shared_i.subset;

  assign lsu_addr_o         = alu_base_operation_result_i[DmemAddrWidth-1:0];
  assign lsu_base_wdata_o   = rf_base_rd_data_b_i;
  assign lsu_bignum_wdata_o = rf_bignum_rd_data_b_i;

  // RF Read enables for bignum RF are unused for now. Future security hardening work may make use
  // of them.
  logic unused_rf_ren_a_bignum;
  logic unused_rf_ren_b_bignum;

  assign unused_rf_ren_a_bignum = insn_dec_bignum_i.rf_ren_a;
  assign unused_rf_ren_b_bignum = insn_dec_bignum_i.rf_ren_b;

  // TODO: Implement error handling
  logic [1:0] unused_lsu_rdata_err;
  assign unused_lsu_rdata_err = lsu_rdata_err_i;

endmodule
