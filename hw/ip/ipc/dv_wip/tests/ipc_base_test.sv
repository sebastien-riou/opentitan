// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class ipc_base_test extends cip_base_test #(.ENV_T(ipc_env), .CFG_T(ipc_env_cfg));
  `uvm_component_utils(ipc_base_test)
  `uvm_component_new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase

endclass : ipc_base_test
