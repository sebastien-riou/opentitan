// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class ipc_env_cfg extends cip_base_env_cfg #(.RAL_T(ipc_reg_block));

  `uvm_object_utils(ipc_env_cfg)
  `uvm_object_new

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    super.initialize(csr_base_addr);
  endfunction : initialize

endclass
