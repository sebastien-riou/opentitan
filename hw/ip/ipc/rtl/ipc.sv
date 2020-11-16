// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// General Purpose Input/Output module

`include "prim_assert.sv"

module ipc (
  input clk_i,
  input rst_ni,

  // Below Register interface can be changed
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o
);

  import ipc_reg_pkg::* ;

  //ipc_reg2hw_t reg2hw;
  //ipc_hw2reg_t hw2reg;


  // Register module
  ipc_reg_top u_reg (
    .clk_i,
    .rst_ni,

    .tl_i,
    .tl_o,

    //.reg2hw,
    //.hw2reg,

    .devmode_i  (1'b1)
  );

endmodule
