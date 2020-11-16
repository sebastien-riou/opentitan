// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class ipc_base_vseq extends cip_base_vseq #(
        .CFG_T               (ipc_env_cfg),
        .RAL_T               (ipc_reg_block),
        .COV_T               (ipc_env_cov),
        .VIRTUAL_SEQUENCER_T (ipc_virtual_sequencer)
    );

  // Delay between consecutive transactions
  rand uint delay;
  bit  do_init_reset = 1;

  constraint delay_c {
    delay dist {0 :/ 20, [1:5] :/ 40, [6:15] :/ 30, [20:25] :/ 10};
  }
  constraint num_trans_c {
    num_trans inside {[20:200]};
  }

  `uvm_object_utils(ipc_base_vseq)
  `uvm_object_new

  virtual task dut_init(string reset_kind = "HARD");
    if (do_init_reset) begin
      super.dut_init(reset_kind);
    end else begin

    end
  endtask : dut_init

  task pre_start();
    super.pre_start();
  endtask

endclass : ipc_base_vseq
