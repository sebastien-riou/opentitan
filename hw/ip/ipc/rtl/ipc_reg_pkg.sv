// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package ipc_reg_pkg;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////


  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////

  // Register Address
  parameter logic [2:0] IPC_DATA0_OFFSET = 3'h 0;
  parameter logic [2:0] IPC_DATA1_OFFSET = 3'h 4;


  // Register Index
  typedef enum int {
    IPC_DATA0,
    IPC_DATA1
  } ipc_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] IPC_PERMIT [2] = '{
    4'b 1111, // index[0] IPC_DATA0
    4'b 1111  // index[1] IPC_DATA1
  };
endpackage

