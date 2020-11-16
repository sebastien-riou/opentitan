// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class ipc_common_vseq extends ipc_base_vseq;
  `uvm_object_utils(ipc_common_vseq)
  `uvm_object_new

  constraint num_trans_c {
    num_trans inside {[1:3]};
  }

  virtual task dut_init(string reset_kind = "HARD");
    super.dut_init(reset_kind);
  endtask: dut_init

  virtual task body();
    run_common_vseq_wrapper(num_trans);
  endtask : body

endclass
