// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// class : ipc_sanity_vseq
// This is a sanity test sequence for ipc.
// This sequence does following:
// (i) drives random ipc input data with ipc outputs disabled
// (ii) programs random values of ipc output data and output enable
class ipc_sanity_vseq extends ipc_base_vseq;
  `uvm_object_utils(ipc_sanity_vseq)

  `uvm_object_new

  virtual task dut_init(string reset_kind = "HARD");
    super.dut_init(reset_kind);
  endtask: dut_init

  task body();

    // test ipc inputs
    `DV_CHECK_MEMBER_RANDOMIZE_FATAL(num_trans)
    `uvm_info(`gfn, $sformatf("No. of transactions (ipc_i) = %0d", num_trans), UVM_HIGH)
    for (uint tr_num = 0; tr_num < num_trans; tr_num++) begin
      bit [TL_DW-1:0] csr_rd_val;
      string msg_id = {`gfn, $sformatf(" Transaction-%0d: ", tr_num)};
      `DV_CHECK_MEMBER_RANDOMIZE_FATAL(ipc_i)
      `uvm_info(msg_id, $sformatf("ipc_i = %0h", ipc_i), UVM_HIGH)
      `DV_CHECK_MEMBER_RANDOMIZE_FATAL(delay)
      cfg.clk_rst_vif.wait_clks(delay);
      // Reading data_in will trigger a check inside scoreboard
      csr_rd(.ptr(ral.data_in), .value(csr_rd_val));
      `uvm_info(msg_id, {$sformatf("reading data_in after %0d clock cycles ", delay),
                         $sformatf("csr_rd_val = %0h", csr_rd_val)}, UVM_HIGH)
    end

  endtask : body

endclass : ipc_sanity_vseq
