// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

package ipc_env_pkg;
  // dep packages
  import uvm_pkg::*;
  import top_pkg::*;
  import dv_utils_pkg::*;
  import csr_utils_pkg::*;
  import tl_agent_pkg::*;
  import dv_lib_pkg::*;
  import cip_base_pkg::*;
  import ipc_ral_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  typedef class ipc_env_cfg;
  typedef class ipc_env_cov;
  typedef cip_base_virtual_sequencer #(ipc_env_cfg, ipc_env_cov) ipc_virtual_sequencer;

  // structure to indicate ipc pin transition and type of transition
  // transition_occurred: 1-yes, 0-no
  // is_rising_edge: 1-rising edge transition, 0-falling edge transition
  typedef struct packed {
    bit transition_occurred;
    bit is_rising_edge;
  } ipc_transition_t;

  // structure to indicate whether or not register update is due for particular ipc register
  // needs_update: 1-update is due, 0-update is not due
  // reg_value: value to be updated when update is due
  // eval_time: time stamp of event, which triggered interrupt update
  typedef struct packed {
    bit needs_update;
    bit [TL_DW-1:0] reg_value;
    time eval_time;
  } ipc_reg_update_due_t;

  // package sources
  `include "ipc_env_cfg.sv"
  `include "ipc_env_cov.sv"
  `include "ipc_scoreboard.sv"
  `include "ipc_env.sv"
  `include "ipc_vseq_list.sv"
endpackage
