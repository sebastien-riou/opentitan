// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class ipc_env extends cip_base_env #(
        .CFG_T               (ipc_env_cfg),
        .COV_T               (ipc_env_cov),
        .VIRTUAL_SEQUENCER_T (ipc_virtual_sequencer),
        .SCOREBOARD_T        (ipc_scoreboard)
    );
  `uvm_component_utils(ipc_env)

  `uvm_component_new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

endclass
